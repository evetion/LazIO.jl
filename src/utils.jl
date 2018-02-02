function laszip_error(laszip_obj::Ptr{Void})
    errstr = Ref{Ptr{UInt8}}()
    laszip_get_error(laszip_obj, errstr)
    error(unsafe_string(errstr[]))
end

macro check(obj, ex)
    return :( $(esc(ex)) == 0 ? nothing : laszip_error($(esc(obj))) )
end
