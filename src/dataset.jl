struct LazDataset
    filename::String
    filehandle::Ptr{Cvoid}
    header::LazHeader  # this enables iterating without unsafe_load everytime
    point::Ptr{LazPoint}
end

function Base.show(io::IO, ds::LazDataset)
    n = max(ds.header.number_of_point_records, ds.header.extended_number_of_point_records)
    println(io, "LazDataset of $(ds.filename) with $n points.")
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
    point_ptr = Ref{Ptr{LazPoint}}()
    @check laszip_reader[] laszip_get_point_pointer(laszip_reader[], point_ptr)

    LazDataset(f, laszip_reader[], header, point_ptr[])
end


"""Iteration of LAZ file."""
function Base.iterate(ds::LazDataset, state::Int)
    if state >= length(ds)
        return nothing
    else
        laszip_read_point(ds.filehandle)
        return unsafe_load(ds.point), state + 1
    end
end

function Base.iterate(ds::LazDataset)
    # Be sure to seek to 0 at begin of iteration
    if length(ds) == 0
        nothing
    else
        laszip_seek_point(ds.filehandle, 0)
        laszip_read_point(ds.filehandle)
        unsafe_load(ds.point), 1
    end
end

Base.eltype(::LazDataset) = LazPoint
Base.length(ds::LazDataset) = Int(max(ds.header.number_of_point_records, ds.header.extended_number_of_point_records))

function Base.close(ds::LazDataset)
    reader = ds.filehandle
    LazIO.@check reader LazIO.laszip_close_reader(reader)
    LazIO.@check reader LazIO.laszip_destroy(reader)
end
