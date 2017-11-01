using LazIO
using Base.Test

workdir = @__DIR__

# source: http://www.liblas.org/samples/
filename = "libLAS_1.2.laz" # point format 0
testfile = joinpath(workdir, filename)

header, pointdata_all = LazIO.load(testfile)
# @show header

@test header.version_major == 1
@test header.version_minor == 2
@test header.data_format_id == 0
@test header.records_count == 497536
@test header.x_scale == 0.01
@test header.y_max == 379999.99
@test header.header_size == 227

# Test ranges
_, pointdata_276 = LazIO.load(testfile, range=276)
_, pointdata_array = LazIO.load(testfile, range=[1,276,277,497536])
_, pointdata_colon = LazIO.load(testfile, range=:)

@test pointdata_all[1] == pointdata_colon[1] == pointdata_array[1]
@test pointdata_276[1] == pointdata_colon[276] == pointdata_array[2]
@test pointdata_all[end] == pointdata_colon[end] == pointdata_array[end]
