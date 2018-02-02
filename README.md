[![Build Status](https://travis-ci.org/evetion/LazIO.jl.svg?branch=master)](https://travis-ci.org/evetion/LazIO.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/ej4vh8243emhg5es/branch/master?svg=true)](https://ci.appveyor.com/project/evetion/lazio-jl/branch/master)
[![codecov](https://codecov.io/gh/evetion/LazIO.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/evetion/LazIO.jl)


# LazIO
Extends LasIO with Laszip integration

Uses the laszip shared library to read compressed las files (*.laz) into the uncompressed format that LasIO reads natively.

At the moment this is read-only. 

## TODO
- Write
- Selections and filters 

*credits to joa-quim for another, older implementation of the laszip library in Julia*