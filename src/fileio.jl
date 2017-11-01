# File load

function laszip_error(laszip_obj::Ptr{Void})
    errstr = Ref{Ptr{laszip_CHAR}}()
    laszip_get_error(laszip_obj, errstr)
    error(unsafe_string(errstr[]))
end

macro check(obj, ex)
    return :( $(esc(ex)) == 0 ? nothing : laszip_error($(esc(obj))) )
end

function loadheader(f::String)
    # Setup laszip reader
    laszip_reader = Ref{Ptr{Void}}()
    @check laszip_reader[] laszip_create(laszip_reader)

    # Open lasfile
    is_compressed = Ref{Cint}(0)
    @check laszip_reader[] laszip_open_reader(laszip_reader[], f, is_compressed)
    is_compressed[] == 0 ? nothing : info("File $f is compressed")

    # Get header
    header_ptr = Ref{Ptr{Header}}()
    @check laszip_reader[] laszip_get_header_pointer(laszip_reader[], header_ptr)
    header = LasHeader(unsafe_load(header_ptr[]))

    # Close the reader
    @check laszip_reader[] laszip_close_reader(laszip_reader[])

    # Destroy the reader
    @check laszip_reader[] laszip_destroy(laszip_reader[])

    header
end

function load(f::String; range::Union{UnitRange{Integer},Integer, Colon, Array{Int64, 1}}=:)
    version_major = Ref{laszip_U8}(0)
    version_minor = Ref{laszip_U8}(0)
    version_revision = Ref{laszip_U16}(0)
    version_build = Ref{laszip_U32}(0)
    pfo = pointer_from_objref
    pto = unsafe_pointer_to_objref

    # TODO make a separate function that returns a VersionNumber
    # plus set a const in init? https://github.com/visr/GDAL.jl/blob/54160bbd0f49f7f1f80c33947b0016d7d19c4314/src/GDAL.jl#L89
    laszip_get_version(version_major, version_minor, version_revision, version_build)
    info("LASzip DLL $(version_major[]) $(version_minor[]) $(version_revision[]) (build $(version_build[]))")

    # Setup laszip reader
    laszip_reader = Ref{Ptr{Void}}()
    @check laszip_reader[] laszip_create(laszip_reader)

    # Open lasfile
    is_compressed = Ref{Cint}(0)
    @check laszip_reader[] laszip_open_reader(laszip_reader[], f, is_compressed)
    is_compressed[] == 0 ? nothing : info("File $f is compressed")

    # Get header
    header_ptr = Ref{Ptr{Header}}()
    @check laszip_reader[] laszip_get_header_pointer(laszip_reader[], header_ptr)
    header = LasHeader(unsafe_load(header_ptr[]))

    # Get a pointer to the points that will be read
    point_ptr = Ref{Ptr{Point}}()
    @check laszip_reader[] laszip_get_point_pointer(laszip_reader[], point_ptr)

    n = header.records_count
    r = collect(1:n)[range]
    pointtype = LasIO.pointformat(header)
    pointdata = Vector{pointtype}(length(r))

    pointerindex = 0  # index for point pointer

    info("Reading $(length(r)) point(s).")
    for (i, ii) in enumerate(r)
        # Requested point not at current pointer
        if ii-1 != pointerindex
            # Seek it and set pointer
            info("Seeking to point $ii")
            laszip_seek_point(laszip_reader[], ii-1)
            pointerindex = ii
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
