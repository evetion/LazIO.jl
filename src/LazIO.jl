module LazIO

using Libdl
using FileIO
using LasIO

# Load in `deps.jl`, complaining if it does not exist
const depsjl_path = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("LazIO not installed properly, run Pkg.build(\"LazIO\"), restart Julia and try again")
end
include(depsjl_path)

# Module initialization function
function __init__()
    # Always check your dependencies from `deps.jl`
    check_deps()
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

end # module
