__precompile__()

module LazIO

using FileIO
using LasIO

include("laszip_h.jl")
include("laszip.jl")
include("fileio.jl")
include("convert.jl")


function __init__()
    add_format(format"LAZ", (), ".laz", [:LazIO])
    laszip_load_dll()
    atexit(laszip_unload_dll)
end


end # module