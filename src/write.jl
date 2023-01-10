function write(f::Function, path::AbstractString, ds::LazIO.Dataset)
    reader = ds.filehandle
    # create writer
    writer = Ref{Ptr{Cvoid}}(C_NULL)
    LazIO.@check writer[] LazIO.laszip_create(writer)
    # copy header from reader to writer (to be updated later)
    LazIO.@check writer[] LazIO.laszip_set_header(writer[], Ref(ds.header))
    # open writer
    LazIO.@check writer[] LazIO.laszip_open_writer(writer[], path, Cint(1))
    try
        f(writer[])
    finally
        # close files and destroy pointers
        LazIO.@check writer[] LazIO.laszip_close_writer(writer[])
        LazIO.@check writer[] LazIO.laszip_destroy(writer[])
    end
end

function write(f::Function, path::AbstractString, header::LazIO.LazHeader)
    # create writer
    writer = Ref{Ptr{Cvoid}}(C_NULL)
    LazIO.@check writer[] LazIO.laszip_create(writer)
    # copy header to writer (to be updated later)
    LazIO.@check writer[] LazIO.laszip_set_header(writer[], Ref(header))
    # open writer
    LazIO.@check writer[] LazIO.laszip_open_writer(writer[], path, Cint(1))
    try
        f(writer[])
    finally
        # close files and destroy pointers
        LazIO.@check writer[] LazIO.laszip_close_writer(writer[])
        LazIO.@check writer[] LazIO.laszip_destroy(writer[])
    end
end

function writepoint(writer::Ptr{Cvoid}, p::LazIO.RawPoint)
    LazIO.@check writer LazIO.laszip_set_point(writer, Ref(p))
    LazIO.@check writer LazIO.laszip_write_point(writer)
    LazIO.@check writer LazIO.laszip_update_inventory(writer)
end

function writepoint(writer::Ptr{Cvoid}, p::LazIO.Point, header)
    rp = LazIO.RawPoint()
    for key in fieldnames(typeof(p))
        setproperty!(rp, key, getfield(p, key), header)
    end
    writepoint(writer, rp)
end
