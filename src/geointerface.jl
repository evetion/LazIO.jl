import GeoInterface as GI

GeoInterface.isgeometry(::Type{<:Point}) = true
GeoInterface.geomtrait(::Point) = PointTrait()
GeoInterface.trait(::Point) = FeatureTrait()

GeoInterface.ncoord(::PointTrait, p::Point) = 3
GeoInterface.getcoord(::PointTrait, p::Point) = p.geometry
GeoInterface.getcoord(::PointTrait, p::Point, i) = p.geometry[i]
GeoInterface.coordinates(::PointTrait, p::Point) = p.geometry

GeoInterface.x(::PointTrait, p::Point) = p.geometry[1]
GeoInterface.y(::PointTrait, p::Point) = p.geometry[2]
GeoInterface.z(::PointTrait, p::Point) = p.geometry[3]

GeoInterface.isfeature(feat::Type{<:Point}) = true
GeoInterface.properties(feat::T) where {T<:Point} = NamedTuple(zip(fieldnames(T), getfield(feat, n) for n in fieldnames(T)))
GeoInterface.geometry(feat::Point) = feat.geometry

GeoInterface.isgeometry(::Type{<:Dataset}) = true
GeoInterface.geomtrait(::Dataset) = MultiPointTrait()
GeoInterface.trait(::Dataset) = FeatureCollectionTrait()
GeoInterface.ncoord(::MultiPointTrait, ::LazIO.Dataset) = 3
GeoInterface.ngeom(::MultiPointTrait, ds::Dataset) = length(ds)
GeoInterface.getgeom(::MultiPointTrait, ds::Dataset) = ds
GeoInterface.getgeom(::MultiPointTrait, ds::Dataset, i) = ds[i]
GeoInterface.coordinates(::MultiPointTrait, ds::Dataset) = (p.geometry for p in ds)

# GeoInterface.crs(geomtrait(geom), geom::customgeom)::GeoFormatTypes.GeoFormat
GeoInterface.extent(::MultiPointTrait, ds::Dataset) = Extent(X=(ds.header.min_x, ds.header.max_x), Y=(ds.header.min_y, ds.header.max_y), Z=(ds.header.min_z, ds.header.max_z))
GeoInterface.extent(::FeatureCollectionTrait, ds::Dataset) = Extent(X=(ds.header.min_x, ds.header.max_x), Y=(ds.header.min_y, ds.header.max_y), Z=(ds.header.min_z, ds.header.max_z))

GeoInterface.isfeaturecollection(::Type{Dataset}) = true
GeoInterface.nfeature(::FeatureCollectionTrait, ds::Dataset) = length(ds)
GeoInterface.getfeature(::FeatureCollectionTrait, ds::Dataset) = ds
GeoInterface.getfeature(::FeatureCollectionTrait, ds::Dataset, i) = ds[i]
GeoInterface.geometrycolumns(::Dataset) = (:geometry,)

GeoInterface.isgeometry(::Type{<:AbstractVector{<:Point}}) = true
GeoInterface.geomtrait(::AbstractVector{<:Point}) = MultiPointTrait()
GeoInterface.ncoord(::MultiPointTrait, ::AbstractVector{<:Point}) = 3
GeoInterface.ngeom(::MultiPointTrait, ds::AbstractVector{<:Point}) = length(ds)
GeoInterface.getgeom(::MultiPointTrait, ds::AbstractVector{<:Point}) = ds
GeoInterface.getgeom(::MultiPointTrait, ds::AbstractVector{<:Point}, i) = ds[i]
