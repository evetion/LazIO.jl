[![Build Status](https://travis-ci.org/evetion/LazIO.jl.svg?branch=master)](https://travis-ci.org/evetion/LazIO.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/ej4vh8243emhg5es/branch/master?svg=true)](https://ci.appveyor.com/project/evetion/lazio-jl/branch/master)
[![codecov](https://codecov.io/gh/evetion/LazIO.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/evetion/LazIO.jl)


# LazIO
Extends LasIO with LASzip integration.

Uses the [LASzip](https://github.com/LASzip/LASzip/) shared library to read compressed las files (\*.laz) into the uncompressed format that [LasIO](https://github.com/visr/LasIO.jl) reads natively.

```julia
using LazIO

# Load header and all points
julia> LazIO.load("test/libLAS_1.2.laz")
(LasHeader with 497536 points.
, Vector{LasIO.LasPoint0} with 497536 points.
)

# Load header and range of points
julia> h, p = LazIO.load("test/libLAS_1.2.laz", range=2:10)
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

# Or use the tables interface
julia> using DataFrames
julia> DataFrame(ds)
497536×19 DataFrame. Omitted printing of 12 columns
│ Row    │ X         │ Y        │ Z     │ intensity │ return_number
│        │ Int32     │ Int32    │ Int32 │ UInt16    │ UInt8
├────────┼───────────┼──────────┼───────┼───────────┼──────────────
│ 1      │ 144013394 │ 37500023 │ 84666 │ 0x00fa    │ 0x00
│ 2      │ 144012426 │ 37500049 │ 84655 │ 0x00f5    │ 0x00
│ 3      │ 144011447 │ 37500077 │ 84644 │ 0x00ef    │ 0x00
│ 4      │ 144010469 │ 37500104 │ 84632 │ 0x00fb    │ 0x00
⋮
```
