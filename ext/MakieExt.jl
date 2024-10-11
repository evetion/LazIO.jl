module MakieExt

using LazIO: Dataset, Point
import Makie

Makie.preferred_axis_type(plot::Makie.Plot(Dataset)) = Makie.LScene
Makie.used_attributes(::Type{<:Makie.Scatter}, ::Dataset) = (:max_points,)

function Makie.convert_arguments(p::Type{<:Makie.Scatter}, geoms::AbstractVector{<:Point})
    Makie.convert_arguments(p, [geom.geometry for geom in geoms])
end

function Makie.plot!(plot::Makie.Plot(Dataset))
    field = pop!(plot.attributes, :attribute, :intensity)
    max_points = pop!(plot.attributes, :max_points, 1_000_000)[]

    ds = plot[1][]
    step = max(1, round(Int, length(ds) / max_points))
    points = ds[1:step:end]

    if !haskey(plot.attributes, :color)
        plot.attributes[:color] = Float32.(getfield.(points, field))
    end

    get!(plot.attributes, :fxaa, true)
    get!(plot.attributes, :ssao, true)

    valid_attributes = Makie.shared_attributes(plot, Makie.Scatter)
    Makie.scatter!(plot, valid_attributes, points)
    plot
end

end
