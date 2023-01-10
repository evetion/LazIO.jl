struct Dataset{Version}
    filename::String
    filehandle::Ptr{Cvoid}
    header::LazHeader  # this enables iterating without unsafe_load everytime
    point::Ptr{RawPoint}
end

function Base.show(io::IO, ds::Dataset{Version}) where {Version}
    println(io, "LazIO Dataset of $(ds.filename) with $(length(ds)) points of version $Version.")
end

function header(ds::Dataset)
    ds.header
end

function bounds(ds::Dataset)
    bounds(header(ds))
end

function open(f::AbstractString)
    # Setup laszip reader
    laszip_reader = Ref{Ptr{Cvoid}}()
    @check laszip_reader[] laszip_create(laszip_reader)

    # Open lasfile
    @check laszip_reader[] laszip_open_reader(laszip_reader[], f, Ref{Cint}(0))

    # Get a pointer to the header
    header_ptr = Ref{Ptr{LazHeader}}()
    @check laszip_reader[] laszip_get_header_pointer(laszip_reader[], header_ptr)
    header = unsafe_load(header_ptr[])

    # Get a pointer to the points that will be read
    point_ptr = Ref{Ptr{RawPoint}}()
    @check laszip_reader[] laszip_get_point_pointer(laszip_reader[], point_ptr)

    Dataset{header.point_data_format}(f, laszip_reader[], header, point_ptr[])
end

function CoordinateTransformations.AffineMap(ds::Dataset)
    CoordinateTransformations.AffineMap(Diagonal(SA_F64[ds.header.x_scale_factor 0 0; 0 ds.header.y_scale_factor 0; 0 0 ds.header.z_scale_factor]), SA_F64[ds.header.x_offset, ds.header.y_offset, ds.header.z_offset])
end

"""Iteration of LAZ file."""
function Base.iterate(ds::Dataset, state::Int)
    if state >= length(ds)
        return nothing
    else
        laszip_read_point(ds.filehandle)
        return eltype(ds)(unsafe_load(ds.point), CoordinateTransformations.AffineMap(ds)), state + 1
    end
end

function Base.iterate(ds::Dataset)
    # Be sure to seek to 0 at begin of iteration
    if length(ds) == 0
        nothing
    else
        laszip_seek_point(ds.filehandle, 0)
        laszip_read_point(ds.filehandle)
        eltype(ds)(unsafe_load(ds.point), CoordinateTransformations.AffineMap(ds)), 1
    end
end

function Base.getindex(ds::Dataset, i::Integer)
    (1 <= i <= length(ds)) || throw(BoundsError(ds, i))
    laszip_seek_point(ds.filehandle, i - 1)
    laszip_read_point(ds.filehandle)
    eltype(ds)(unsafe_load(ds.point), CoordinateTransformations.AffineMap(ds))
end

Base.eltype(::Dataset{0x00}) = Point0
Base.eltype(::Dataset{0x01}) = Point1
Base.eltype(::Dataset{0x02}) = Point2
Base.eltype(::Dataset{0x03}) = Point3
Base.length(ds::Dataset) = Int(max(ds.header.number_of_point_records, ds.header.extended_number_of_point_records))

function Base.close(ds::Dataset)
    reader = ds.filehandle
    LazIO.@check reader LazIO.laszip_close_reader(reader)
    LazIO.@check reader LazIO.laszip_destroy(reader)
end

function LasIO.boundingbox(h::LazHeader)
    (xmin=h.min_x, ymin=h.min_y, zmin=h.min_z, xmax=h.max_x, ymax=h.max_y, zmax=h.max_z)
end
LasIO.boundingbox(ds::Dataset) = boundingbox(ds.header)
