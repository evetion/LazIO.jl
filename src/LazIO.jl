__precompile__()

module LazIO

using FileIO
using LasIO

include("utils.jl")
include("laszip_h.jl")
include("laszip.jl")
include("fileio.jl")
include("convert.jl")


function __init__()
    # temporary _ until LasIO defers this key
    add_format(format"LAZ_", (), ".laz", [:LazIO])
end


end # module
