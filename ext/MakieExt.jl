module MakieExt

using LazIO: Dataset, Point
import Makie

# Workaround Makie bug #4644
Makie.plottype(::AbstractVector{<:Point}) = Makie.Plot{Makie.plot}

Makie.preferred_axis_type(plot::Makie.Plot(AbstractVector{<:Point})) = Makie.LScene
Makie.preferred_axis_type(plot::Makie.Plot(Dataset)) = Makie.LScene

Makie.used_attributes(::Type{<:Makie.Scatter}, ::Dataset) = (:zscale,)
Makie.used_attributes(::Type{<:Makie.Scatter}, ::AbstractVector{<:Point}) = (:zscale,)


function Makie.convert_arguments(p::Type{<:Makie.Scatter}, geoms::AbstractVector{<:Point}; zscale=1, kwargs...)
    Makie.convert_arguments(p, [geom.geometry .* (1, 1, zscale) for geom in geoms])
end

# Keyword arguments for scatter, from the user keywords in `plot.kw`.
# Passing them explicitly works both before and after the Makie 0.24 attribute changes.
function scatter_kwargs(plot, points)
    kw = Dict{Symbol,Any}(plot.kw)
    field = Makie.to_value(pop!(kw, :attribute, :intensity))
    pop!(kw, :max_points, nothing)
    haskey(kw, :color) || (kw[:color] = Float32.(getfield.(points, field)))
    get!(kw, :fxaa, true)
    get!(kw, :ssao, true)
    return kw
end

function Makie.plot!(plot::Makie.Plot(Dataset))
    max_points = Makie.to_value(get(plot.kw, :max_points, 1_000_000))

    ds = plot[1][]
    step = max(1, round(Int, length(ds) / max_points))
    points = ds[1:step:end]

    Makie.scatter!(plot, points; scatter_kwargs(plot, points)...)
    plot
end

function Makie.plot!(plot::Makie.Plot{Makie.plot,<:Tuple{Vector{<:Point}}})
    points = plot[1][]
    Makie.scatter!(plot, points; scatter_kwargs(plot, points)...)
    plot
end

end
