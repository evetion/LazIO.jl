# File load

function laszip_error(laszip_obj::Ptr{Void})
    errstr = Ref{Ptr{laszip_CHAR}}()
    laszip_get_error(laszip_obj, errstr)
    error(unsafe_string(errstr[]))
end

macro check(obj, ex)
    return :( $(esc(ex)) == 0 ? nothing : laszip_error($(esc(obj))) )
end


function load(f::File{format"LAZ"})
    version_major = Ref{laszip_U8}(0)
    version_minor = Ref{laszip_U8}(0)
    version_revision = Ref{laszip_U16}(0)
    version_build = Ref{laszip_U32}(0)
    pfo = pointer_from_objref
    pto = unsafe_pointer_to_objref

    laszip_get_version(version_major, version_minor, version_revision, version_build)
    info("LASzip DLL $(version_major[]) $(version_minor[]) $(version_revision[]) (build $(version_build[]))")

    # Setup laszip reader
    laszip_reader = Ref{Ptr{Void}}()
    @check laszip_reader[] laszip_create(laszip_reader)

    # Open lasfile
    is_compressed = Ref{Cint}(0)
    @check laszip_reader[] laszip_open_reader(laszip_reader[], f.filename, is_compressed)
    is_compressed[] == 0 ? nothing : info("File $f is compressed")

    # Get header
    header_ptr = Ref{Ptr{laszip_header}}()
    @check laszip_reader[] laszip_get_header_pointer(laszip_reader[], header_ptr)
    header = LasHeader(unsafe_load(header_ptr[]))

    # Get a pointer to the points that will be read
    point_ptr = Ref{Ptr{laszip_point}}()
    @check laszip_reader[] laszip_get_point_pointer(laszip_reader[], point_ptr)

    n = header.records_count
    pointtype = LasIO.pointformat(header)
    pointdata = Vector{pointtype}(n)

    for i=1:n
        laszip_read_point(laszip_reader[])
        pointdata[i] = convert(pointtype, unsafe_load(point_ptr[]))
    end

    # Close the reader
    @check laszip_reader[] laszip_close_reader(laszip_reader[])

    # Destroy the reader
    @check laszip_reader[] laszip_destroy(laszip_reader[])

    header, pointdata
end
