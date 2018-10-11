# File load

load(f::File{format"LAZ_"}; range::Union{UnitRange{T},Integer, Colon, Array{T, 1}} where T<:Integer=:) = load(f.filename, range=range)
loadheader(f::File{format"LAZ_"}) = loadheader(f.filename)

function loadheader(f::String)
    # Setup laszip reader
    laszip_reader = Ref{Ptr{Cvoid}}()
    @check laszip_reader[] laszip_create(laszip_reader)

    # Open lasfile
    is_compressed = Ref{Cint}(0)
    @check laszip_reader[] laszip_open_reader(laszip_reader[], f, is_compressed)
    is_compressed[] == 0 ? nothing : @info "File $f is compressed"

    # Get header
    header_ptr = Ref{Ptr{LazHeader}}()
    @check laszip_reader[] laszip_get_header_pointer(laszip_reader[], header_ptr)
    header = LasHeader(unsafe_load(header_ptr[]))

    # Close the reader
    @check laszip_reader[] laszip_close_reader(laszip_reader[])

    # Destroy the reader
    @check laszip_reader[] laszip_destroy(laszip_reader[])

    header
end

function load(f::String; range::Union{UnitRange{T}, Integer, Colon, Array{T, 1}} where T <:Integer=:)
    version_major = Ref{UInt8}(0)
    version_minor = Ref{UInt8}(0)
    version_revision = Ref{UInt16}(0)
    version_build = Ref{UInt32}(0)
    pfo = pointer_from_objref
    pto = unsafe_pointer_to_objref

    laszip_get_version(version_major, version_minor, version_revision, version_build)
    @info "LASzip DLL $(version_major[]) $(version_minor[]) $(version_revision[]) (build $(version_build[]))"

    # Setup laszip reader
    laszip_reader = Ref{Ptr{Cvoid}}()
    @check laszip_reader[] laszip_create(laszip_reader)

    # Open lasfile
    is_compressed = Ref{Cint}(0)
    @check laszip_reader[] laszip_open_reader(laszip_reader[], f, is_compressed)
    is_compressed[] == 0 ? nothing : @info "File $f is compressed"

    # Get header
    header_ptr = Ref{Ptr{LazHeader}}()
    @check laszip_reader[] laszip_get_header_pointer(laszip_reader[], header_ptr)
    header = LasHeader(unsafe_load(header_ptr[]))

    # Get a pointer to the points that will be read
    point_ptr = Ref{Ptr{LazPoint}}()
    @check laszip_reader[] laszip_get_point_pointer(laszip_reader[], point_ptr)

    n = header.records_count
    r = collect(1:n)[range]
    pointtype = LasIO.pointformat(header)
    pointdata = Vector{pointtype}(undef, length(r))

    pointerindex = 0  # index for point pointer

    @info "Reading $(length(r)) point(s)."
    for (i, ii) in enumerate(r)
        # Requested point not at current pointer
        if ii-1 != pointerindex
            # Seek it and set pointer
            @info "Seeking to point $ii"
            laszip_seek_point(laszip_reader[], Int64(ii-1))
            pointerindex = ii-1
        end
        laszip_read_point(laszip_reader[])
        pointerindex += 1
        pointdata[i] = convert(pointtype, unsafe_load(point_ptr[]))
    end

    # Close the reader
    @check laszip_reader[] laszip_close_reader(laszip_reader[])

    # Destroy the reader
    @check laszip_reader[] laszip_destroy(laszip_reader[])

    header, pointdata
end
