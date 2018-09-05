using FileIO
using LazIO
using LasIO
using Test

workdir = @__DIR__
lasio_testdir = joinpath(dirname(pathof(LasIO)), "..", "test")
# source: http://www.liblas.org/samples/
fname_las = "libLAS_1.2.las" # point format 0
testfile_str = joinpath(lasio_testdir, fname_las)

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
