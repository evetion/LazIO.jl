module RecipesBaseExt

using RecipesBase: @recipe
using LazIO: Dataset

@recipe function f(ds::Dataset, color::Symbol=:intensity; max_points=100_000)
    seriestype := :scatter
    label := nothing
    markerstrokewidth := 0
    xlabel := "x"
    ylabel := "y"
    zlabel := "z"
    step = max(1, round(Int, length(ds) / max_points))
    p = ds[1:step:end]
    markerz := getfield.(p, color)
    [p.geometry[1] for p in p], [p.geometry[2] for p in p], [p.geometry[3] for p in p]
end

end
