push!(LOAD_PATH, "../")

using FileIO
using LazIO
using Base.Test

workdir = dirname(@__FILE__)

# source: http://www.liblas.org/samples/
filename = "libLAS_1.2.laz" # point format 0
testfile = joinpath(workdir, filename)

header, pointdata = load(testfile)

@test header.version_major == 1
@test header.version_minor == 2
@test header.data_format_id == 0
@test header.records_count == 497536
@test header.x_scale == 0.01
@test header.y_max == 379999.99
@test header.header_size == 227
