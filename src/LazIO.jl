module LazIO

using CoordinateTransformations
using Dates
using Extents
using FileIO
using FixedPointNumbers
using GeoInterface
using GeoInterfaceRecipes
using LasIO
using LASzip_jll
using Libdl
using LinearAlgebra
using StaticArrays
using UUIDs

# Module initialization function
function __init__()
    # temporary _ until LasIO defers this key
    add_format(format"LAZ_", (), ".laz", [:LazIO => UUID("c3605908-9f0f-11e8-0a72-0d361c15a277")])
end

include("utils.jl")
include("laszip_h.jl")
include("point.jl")
include("laszip.jl")
include("fileio.jl")
include("convert.jl")
include("dataset.jl")
include("write.jl")
include("table.jl")
include("geointerface.jl")

export return_number
export number_of_returns
export scan_direction
export edge_of_flight_line
export classification
export synthetic
export key_point
export withheld


end # module
