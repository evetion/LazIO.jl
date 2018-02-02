[![Build Status](https://travis-ci.org/evetion/LazIO.jl.svg?branch=master)](https://travis-ci.org/evetion/LazIO.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/ej4vh8243emhg5es/branch/master?svg=true)](https://ci.appveyor.com/project/evetion/lazio-jl/branch/master)
[![codecov](https://codecov.io/gh/evetion/LazIO.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/evetion/LazIO.jl)


# LazIO
Extends LasIO with Laszip integration.

Uses the [LASzip](https://github.com/LASzip/LASzip/) shared library to read compressed las files (*.laz) into the uncompressed format that [LasIO](https://github.com/visr/LasIO.jl) reads natively.

```julia
using LazIO
LazIO.load("test/libLAS_1.2.laz")
INFO: LASzip DLL 3 1 0 (build 170823)
INFO: File test/libLAS_1.2.laz is compressed
INFO: Reading 497536 point(s).
(LasHeader with 497536 points.
, Vector{LasIO.LasPoint0} with 497536 points.
)

h, p = LazIO.load("test/libLAS_1.2.laz", range=2:10)
INFO: LASzip DLL 3 1 0 (build 170823)
INFO: File test/libLAS_1.2.laz is compressed
INFO: Reading 9 point(s).
INFO: Seeking to point 2
(LasHeader with 497536 points.
, Vector{LasIO.LasPoint0} with 9 points.
)

```

For the moment this wrapper only supports reading.

*credits to joa-quim for another, older implementation of the laszip library in Julia*
