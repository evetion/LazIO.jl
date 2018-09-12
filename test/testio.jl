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
laz_stream_out = joinpath(workdir, "out-stream.laz")

testfile = File{format"LAZ_"}(testfile_str)

header, pointdata_all = load(testfile)
# @show header

@test header.version_major == 1
@test header.version_minor == 2
@test header.data_format_id == 0
@test header.records_count == 497536
@test header.x_scale == 0.01
@test header.y_max == 379999.99
@test header.header_size == 227

# Test ranges
_, pointdata_276 = load(testfile, range=276)
_, pointdata_array = load(testfile, range=[1,276,277,497536])
_, pointdata_colon = load(testfile, range=:)

@test pointdata_all[1] == pointdata_colon[1] == pointdata_array[1]
@test pointdata_276[1] == pointdata_colon[276] == pointdata_array[2]
@test pointdata_all[end] == pointdata_colon[end] == pointdata_array[end]

# Test LazDataSet
ds = LazIO.open(testfile_str)
@test ds isa LazIO.LazDataset
@test first(ds) isa LazIO.laszip_point
@inferred first(ds)

function it(ds)
    ztot = Int32(0)
    for p in ds
        ztot += p.Z
    end
    ztot
end


# open reader
reader = Ref{Ptr{Cvoid}}(C_NULL)
LazIO.@check reader[] LazIO.laszip_create(reader)
LazIO.@check reader[] LazIO.laszip_open_reader(reader[], testfile_str, Ref(Cint(0)))

# create writer
writer = Ref{Ptr{Cvoid}}(C_NULL)
LazIO.@check writer[] LazIO.laszip_create(writer)

# copy header from reader to writer (to be updated later)
header_ptr = Ref{Ptr{LazIO.laszip_header}}(C_NULL)
LazIO.@check header_ptr[] LazIO.laszip_get_header_pointer(reader[], header_ptr)
LazIO.@check writer[] LazIO.laszip_set_header(writer[], header_ptr[])

# open writer
LazIO.@check writer[] LazIO.laszip_open_writer(writer[], laz_out, Cint(1))

# read the first point
point_ptr = Ref{Ptr{LazIO.laszip_point}}(C_NULL)
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

# update the header
LazIO.@check writer[] LazIO.laszip_update_inventory(writer[])

# close files and destroy pointers
LazIO.@check reader[] LazIO.laszip_close_reader(reader[])
LazIO.@check writer[] LazIO.laszip_close_writer(writer[])
LazIO.@check reader[] LazIO.laszip_destroy(reader[])
LazIO.@check writer[] LazIO.laszip_destroy(writer[])

rm(laz_out)

function write(f::Function, path::AbstractString, ds::LazIO.LazDataset)
    reader = ds.filehandle
    # create writer
    writer = Ref{Ptr{Cvoid}}(C_NULL)
    LazIO.@check writer[] LazIO.laszip_create(writer)
    # copy header from reader to writer (to be updated later)
    LazIO.@check writer[] LazIO.laszip_set_header(writer[], Ref(ds.header))
    # open writer
    LazIO.@check writer[] LazIO.laszip_open_writer(writer[], path, Cint(1))
    try
        f(writer[])
    finally
        # close files and destroy pointers
        LazIO.@check writer[] LazIO.laszip_close_writer(writer[])
        LazIO.@check writer[] LazIO.laszip_destroy(writer[])
    end
end

function writepoint(writer::Ptr{Cvoid}, p::LazIO.laszip_point)
    LazIO.@check writer LazIO.laszip_set_point(writer, Ref(p))
    LazIO.@check writer LazIO.laszip_write_point(writer)
    LazIO.@check writer LazIO.laszip_update_inventory(writer)
end

write(laz_stream_out, ds) do io
    @info laz_stream_out ds io first(ds)
    for p in ds
        writepoint(io, p)
    end
end
