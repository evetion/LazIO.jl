module LazIO

using Libdl
using FileIO
using LasIO
using FixedPointNumbers
using LASzip_jll

# Module initialization function
function __init__()
    # temporary _ until LasIO defers this key
    add_format(format"LAZ_", (), ".laz", [:LazIO])
end

include("utils.jl")
include("laszip_h.jl")
include("laszip.jl")
include("fileio.jl")
include("convert.jl")
include("dataset.jl")
include("write.jl")
include("table.jl")

end # module
