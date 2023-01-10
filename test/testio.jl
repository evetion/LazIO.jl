using Dates
using FileIO
using GeoInterface
using LasIO
using LazIO
using Tables
using Test

workdir = @__DIR__
lasio_testdir = joinpath(dirname(pathof(LasIO)), "..", "test")
# source: http://www.liblas.org/samples/
fname_las = "libLAS_1.2.las" # point format 0
testfile_str = joinpath(lasio_testdir, fname_las)
laz_out = joinpath(workdir, "out.laz")
testfile = File{format"LAZ_"}(testfile_str)

header, pointdata_all = load(testfile)
@testset "Header" begin
    @test header.version_major == 1
    @test header.version_minor == 2
    @test header.data_format_id == 0
    @test header.records_count == 497536
    @test header.x_scale == 0.01
    @test header.y_max == 379999.99
    @test header.header_size == 227
    @test LazIO.boundingbox(header) == (xmin=1.44e6, ymin=375000.03, zmin=832.1800000000001, xmax=1.44499996e6, ymax=379999.99, zmax=972.6700000000001)
    @test LazIO.loadheader(testfile) isa LasIO.LasHeader
end

@testset "Range indexing" begin
    _, pointdata_276 = load(testfile, range=276)
    _, pointdata_array = load(testfile, range=[1, 276, 277, 497536])
    _, pointdata_colon = load(testfile, range=:)

    @test pointdata_all[1] == pointdata_colon[1] == pointdata_array[1]
    @test pointdata_276[1] == pointdata_colon[276] == pointdata_array[2]
    @test pointdata_all[end] == pointdata_colon[end] == pointdata_array[end]
end

@testset "Dataset" begin
    ds = LazIO.open(testfile_str)
    @test ds isa LazIO.Dataset
    @test first(ds) isa LazIO.Point0
    @inferred first(ds)
    @inferred ds[1]
    @inferred collect(ds)
    @test LazIO.boundingbox(ds) == (xmin=1.44e6, ymin=375000.03, zmin=832.1800000000001, xmax=1.44499996e6, ymax=379999.99, zmax=972.6700000000001)
    @test first(ds).return_number == 0x00
    @test first(ds).number_of_returns == 0x00
    @test first(ds).scan_direction == false
    @test first(ds).edge_of_flight_line == false
    close(ds)
end

@testset "Point unpacking" begin
    ds = LazIO.open(testfile_str)
    p = first(ds)

    @test p.return_number == 0
    @test p.number_of_returns == 0
    @test p.scan_direction == 0
    @test p.edge_of_flight_line == 0

    @test p.classification == 2
    @test p.synthetic == false
    @test p.key_point == false
    @test p.withheld == false
end

@testset "Table interface" begin
    ds = LazIO.open(testfile_str)
    @test Tables.istable(LazIO.Dataset)
    @test Tables.rowaccess(LazIO.Dataset)
    @test first(ds) isa LazIO.Point0
    @inferred first(Tables.rows(ds))

    LazIO.write("test_table.laz", ds, LazIO.bounds(ds), scalex=0.1)
    close(ds)

    manual_fn = "test_table_manual.laz"
    table = (x=[11000.01, 12000.0, 32000.0],
        y=[11000.0, 12000.0, 32000.0],
        z=[11000.0, 12000.0, 32000.01],
        classification=["ground", "test", "unclassified"],
        gps_time=fill(now(), 3),
        return_number=[1, 2, 1],
        number_of_returns=[1, 2, 3])
    bounds = (min_x=11000.01, max_x=32000.0, min_y=11000.0, max_y=32000.0, min_z=11000.0, max_z=32000.01)
    LazIO.write(manual_fn, table, bounds, scalex=0.01, system_identifier=LazIO.writestring("Laser shooter, pew pew!", 32))

    ds = LazIO.open(manual_fn)

    @test LazIO.readstring(ds.header.system_identifier) == "Laser shooter, pew pew!"
    @test length(ds) == 3
    @test first(ds).x == 11000.01
    @test first(ds).classification == LazIO.classes.ground
end

@testset "Writing" begin
    # open reader
    reader = Ref{Ptr{Cvoid}}(C_NULL)
    LazIO.@check reader[] LazIO.laszip_create(reader)
    LazIO.@check reader[] LazIO.laszip_open_reader(reader[], testfile_str, Ref(Cint(0)))

    # create writer
    writer = Ref{Ptr{Cvoid}}(C_NULL)
    LazIO.@check writer[] LazIO.laszip_create(writer)

    # copy header from reader to writer (to be updated later)
    header_ptr = Ref{Ptr{LazIO.LazHeader}}(C_NULL)
    LazIO.@check header_ptr[] LazIO.laszip_get_header_pointer(reader[], header_ptr)
    LazIO.@check writer[] LazIO.laszip_set_header(writer[], header_ptr[])

    # open writer
    LazIO.@check writer[] LazIO.laszip_open_writer(writer[], laz_out, Cint(1))

    # read the first point
    point_ptr = Ref{Ptr{LazIO.RawPoint}}(C_NULL)
    LazIO.@check point_ptr[] LazIO.laszip_get_point_pointer(reader[], point_ptr)
    LazIO.@check reader[] LazIO.laszip_read_point(reader[])

    # modify point
    p = unsafe_load(point_ptr[])
    p.classification = LasIO.raw_classification(
        0x05,
        Bool((p.classification & 0b00100000) >> 5),
        Bool((p.classification & 0b01000000) >> 6),
        Bool((p.classification & 0b10000000) >> 7),
    )

    # copy the point
    LazIO.@check writer[] LazIO.laszip_set_point(writer[], Ref(p))

    # write it to the writer
    LazIO.@check writer[] LazIO.laszip_write_point(writer[])

    # update the inventory
    LazIO.@check writer[] LazIO.laszip_update_inventory(writer[])

    # close files and destroy pointers
    LazIO.@check reader[] LazIO.laszip_close_reader(reader[])
    LazIO.@check writer[] LazIO.laszip_close_writer(writer[])
    LazIO.@check reader[] LazIO.laszip_destroy(reader[])
    LazIO.@check writer[] LazIO.laszip_destroy(writer[])

    # check the resulting LAZ file
    ds = LazIO.open(laz_out)
    @test ds.header.number_of_point_records === UInt32(1)
    @test length(ds) === 1
    @test first(ds).classification == 5
    close(ds)
    rm(laz_out)
end

@testset "Stream output (dataset)" begin
    ds = LazIO.open(testfile_str)
    laz_stream_out = joinpath(workdir, "out-stream.laz")

    LazIO.write(laz_stream_out, ds) do io
        for p in ds
            LazIO.writepoint(io, p, ds.header)
        end
    end

    ds_out = LazIO.open(laz_stream_out)

    # TODO write a method such that we can check point equality
    p1 = first(ds)
    p2 = first(ds_out)
    header1 = ds.header
    header2 = ds_out.header
    @test p1.x === p2.x
    @test p1.y === p2.y
    @test p1.z === p2.z
    @test p1.intensity === p2.intensity
    @test header1.number_of_point_records === header2.number_of_point_records

    close(ds)
    close(ds_out)
    rm(laz_stream_out)
end

@testset "Stream output (header)" begin
    ds = LazIO.open(testfile_str)
    laz_stream_out = joinpath(workdir, "out-stream2.laz")

    LazIO.write(laz_stream_out, ds.header) do io
        for p in ds
            LazIO.writepoint(io, p, ds.header)
        end
    end

    ds_out = LazIO.open(laz_stream_out)

    # TODO write a method such that we can check point equality
    p1 = first(ds)
    p2 = first(ds_out)
    header1 = ds.header
    header2 = ds_out.header
    @test p1.x === p2.x
    @test p1.y === p2.y
    @test p1.z === p2.z
    @test p1.intensity === p2.intensity
    @test header1.number_of_point_records === header2.number_of_point_records

    close(ds)
    close(ds_out)
    rm(laz_stream_out)
end

@testset "GeoInterface" begin
    ds = LazIO.open(testfile_str)
    GeoInterface.testgeometry(ds)
    GeoInterface.testgeometry(ds[1])
    @test_broken GeoInterface.testfeature(ds[1])
    @test_broken GeoInterface.testfeaturecollection(ds)
end
