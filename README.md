[![Build Status](https://travis-ci.org/evetion/LazIO.jl.svg?branch=master)](https://travis-ci.org/evetion/LazIO.jl)

# LazIO
Extends LasIO with LASzip integration

Uses the LASzip shared library to read compressed las files (\*.laz) into the uncompressed format that [LasIO](https://github.com/visr/LasIO.jl) reads natively.

At the moment this library only reads .laz, writing in not yet implemented.

## TODO
- Write
- Selections and filters

## Related packages
- [LasIO](https://github.com/visr/LasIO.jl) dependency of this package, only for uncompressed LAS.
- [Laszip](https://github.com/joa-quim/Laszip.jl) older, unregistered wrapper for LASzip. Focused more on conversion to XYZ and DAT format, and no link to LasIO.
