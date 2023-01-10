import GeoInterface as GI

GeoInterface.isgeometry(::Type{<:Point}) = true
GeoInterface.geomtrait(::Point) = PointTrait()
# GeoInterface.trait(::Point) = FeatureTrait()

GeoInterface.ncoord(::PointTrait, p::Point) = 3
GeoInterface.getcoord(::PointTrait, p::Point) = [p.x, p.y, p.z]
GeoInterface.getcoord(::PointTrait, p::Point, i) = getfield(p, i)

GeoInterface.x(::PointTrait, p::Point) = p.x
GeoInterface.y(::PointTrait, p::Point) = p.y
GeoInterface.z(::PointTrait, p::Point) = p.z

GeoInterface.isfeature(feat::Type{<:Point}) = true
GeoInterface.properties(feat::T) where {T<:Point} = NamedTuple(zip(fieldnames(T), getfield(feat, n) for n in fieldnames(T)))
GeoInterface.geometry(feat::Point) = feat

GeoInterface.isgeometry(::Type{<:Dataset}) = true
GeoInterface.geomtrait(::Dataset) = MultiPointTrait()
# GeoInterface.trait(::Dataset) = FeatureCollectionTrait()
GeoInterface.ngeom(::MultiPointTrait, ds::Dataset) = length(ds)
GeoInterface.getgeom(::MultiPointTrait, ds::Dataset) = ds
GeoInterface.getgeom(::MultiPointTrait, ds::Dataset, i) = ds[i]

# GeoInterface.crs(geomtrait(geom), geom::customgeom)::GeoFormatTypes.GeoFormat}
GeoInterface.extent(::MultiPointTrait, ds::Dataset) = Extent(X=(ds.header.min_x, ds.header.max_x), Y=(ds.header.min_y, ds.header.max_y), Z=(ds.header.min_z, ds.header.max_z))

GeoInterface.isfeaturecollection(::Type{Dataset}) = true
GeoInterface.getfeature(::MultiPointTrait, ds::Dataset, i) = ds[i]
GeoInterface.getfeature(::MultiPointTrait, ds::Dataset) = ds
GeoInterface.nfeature(::MultiPointTrait, ds::Dataset) = length(ds)
GeoInterface.geometrycolumns(::Dataset) = ()
