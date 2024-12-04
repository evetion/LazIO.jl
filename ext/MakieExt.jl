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

function Makie.plot!(plot::Makie.Plot(Dataset))
    field = pop!(plot.attributes, :attribute, Makie.Observable(:intensity))[]
    max_points = pop!(plot.attributes, :max_points, Makie.Observable(1_000_000))[]

    ds = plot[1][]
    step = max(1, round(Int, length(ds) / max_points))
    points = ds[1:step:end]

    if !haskey(plot.attributes, :color)
        plot.attributes[:color] = Float32.(getfield.(points, field))
    end

    get!(plot.attributes, :fxaa, true)
    get!(plot.attributes, :ssao, true)

    valid_attributes = Makie.shared_attributes(plot, Makie.Scatter)
    valid_attributes[:zscale] = get(plot.attributes, :zscale, Makie.Observable(1))[]
    Makie.scatter!(plot, valid_attributes, points)
    plot
end

function Makie.plot!(plot::Makie.Plot{Makie.plot,<:Tuple{Vector{<:Point}}})
    field = pop!(plot.attributes, :attribute, Makie.Observable(:intensity))[]

    points = plot[1][]

    if !haskey(plot.attributes, :color)
        plot.attributes[:color] = Float32.(getfield.(points, field))
    end

    get!(plot.attributes, :fxaa, true)
    get!(plot.attributes, :ssao, true)

    valid_attributes = Makie.shared_attributes(plot, Makie.Scatter)
    valid_attributes[:zscale] = get(plot.attributes, :zscale, Makie.Observable(1))[]
    Makie.scatter!(plot, valid_attributes, points)
    plot
end

end
