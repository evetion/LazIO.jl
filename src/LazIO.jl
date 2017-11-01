__precompile__()

module LazIO

using LasIO

include("laszip_h.jl")
include("laszip.jl")
include("fileio.jl")
include("convert.jl")

# sure this is needed? runs fine without on windows LASzip DLL 2 2 0 (build 130917)
# function __init__()
#     laszip_load_dll()
#     atexit(laszip_unload_dll)
# end


end # module
