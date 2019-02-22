using FileIO
using LazIO
using LasIO
using Test

workdir = @__DIR__
lasio_testdir = joinpath(dirname(pathof(LasIO)), "..", "test")
# source: http://www.liblas.org/samples/
fname_las = "libLAS_1.2.las" # point format 0
testfile_str = joinpath(lasio_testdir, fname_las)
laz_out = joinpath(workdir, "out.laz")
testfile = File{format"LAZ_"}(testfile_str)

header, pointdata_all = load(testfile)
@testset "header" begin
    @test header.version_major == 1
    @test header.version_minor == 2
    @test header.data_format_id == 0
    @test header.records_count == 497536
    @test header.x_scale == 0.01
    @test header.y_max == 379999.99
    @test header.header_size == 227
end

@testset "ranges" begin
    _, pointdata_276 = load(testfile, range=276)
    _, pointdata_array = load(testfile, range=[1,276,277,497536])
    _, pointdata_colon = load(testfile, range=:)

    @test pointdata_all[1] == pointdata_colon[1] == pointdata_array[1]
    @test pointdata_276[1] == pointdata_colon[276] == pointdata_array[2]
    @test pointdata_all[end] == pointdata_colon[end] == pointdata_array[end]
end

@testset "LazDataSet" begin
    ds = LazIO.open(testfile_str)
    @test ds isa LazIO.LazDataset
    @test first(ds) isa LazIO.LazPoint
    @inferred first(ds)
    close(ds)
end

@testset "read, modify then write a single point to a new LAZ" begin
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
    point_ptr = Ref{Ptr{LazIO.LazPoint}}(C_NULL)
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
    @test first(ds).classification === 0x05
    close(ds)
    rm(laz_out)
end

@testset "stream LazDataSet to LAZ" begin
    ds = LazIO.open(testfile_str)
    laz_stream_out = joinpath(workdir, "out-stream.laz")

    LazIO.write(laz_stream_out, ds) do io
        for p in ds
            LazIO.writepoint(io, p)
        end
    end

    ds_out = LazIO.open(laz_stream_out)

    # TODO write a method such that we can check point equality
    p1 = first(ds)
    p2 = first(ds_out)
    header1 = ds.header
    header2 = ds_out.header
    @test p1.X === p2.X
    @test p1.Y === p2.Y
    @test p1.Z === p2.Z
    @test p1.intensity === p2.intensity
    @test header1.number_of_point_records === header2.number_of_point_records

    close(ds)
    close(ds_out)
    rm(laz_stream_out)
end

@testset "stream to LAZ" begin
    ds = LazIO.open(testfile_str)
    laz_stream_out = joinpath(workdir, "out-stream2.laz")

    LazIO.write(laz_stream_out, ds.header) do io
        for p in ds
            LazIO.writepoint(io, p)
        end
    end

    ds_out = LazIO.open(laz_stream_out)

    # TODO write a method such that we can check point equality
    p1 = first(ds)
    p2 = first(ds_out)
    header1 = ds.header
    header2 = ds_out.header
    @test p1.X === p2.X
    @test p1.Y === p2.Y
    @test p1.Z === p2.Z
    @test p1.intensity === p2.intensity
    @test header1.number_of_point_records === header2.number_of_point_records

    close(ds)
    close(ds_out)
    rm(laz_stream_out)
end
