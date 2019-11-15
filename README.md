[![Build Status](https://travis-ci.org/evetion/LazIO.jl.svg?branch=master)](https://travis-ci.org/evetion/LazIO.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/ej4vh8243emhg5es/branch/master?svg=true)](https://ci.appveyor.com/project/evetion/lazio-jl/branch/master)
[![codecov](https://codecov.io/gh/evetion/LazIO.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/evetion/LazIO.jl)


# LazIO
Extends LasIO with LASzip integration.

Uses the [LASzip](https://github.com/LASzip/LASzip/) shared library to read compressed las files (\*.laz) into the uncompressed format that [LasIO](https://github.com/visr/LasIO.jl) reads natively.

```julia
julia> using LazIO

# Load header and all points
julia> LazIO.load("test/libLAS_1.2.laz")
INFO: LASzip DLL 3 1 0 (build 170823)
INFO: File test/libLAS_1.2.laz is compressed
INFO: Reading 497536 point(s).
(LasHeader with 497536 points.
, Vector{LasIO.LasPoint0} with 497536 points.
)

# Load header and range of points
julia> h, p = LazIO.load("test/libLAS_1.2.laz", range=2:10)
INFO: LASzip DLL 3 1 0 (build 170823)
INFO: File test/libLAS_1.2.laz is compressed
INFO: Reading 9 point(s).
INFO: Seeking to point 2
(LasHeader with 497536 points.
, Vector{LasIO.LasPoint0} with 9 points.
)

# Open file and iterate over points (streaming)
julia> ds = LazIO.open("test/libLAS_1.2.laz")
LazDataset of test/libLAS_1.2.laz with 497536 points.
julia> sum = map(Int32, (0,0,0))  # Int32, not yet scaled and offset
julia> for p in ds
         global sum = sum .+ (p.X, p.Y, p.Z)
       end
julia> sum ./ ds.header.number_of_point_records
(3497.988658107152, 3741.789882541163, -164.49942114741447)
```
