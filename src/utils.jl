function laszip_error(laszip_obj::Ptr{Cvoid})
    errstr = Ref(Cstring(C_NULL))
    laszip_get_error(laszip_obj, errstr)
    if errstr[] != C_NULL
        error(unsafe_string(errstr[]))
    end
    nothing
end

macro check(obj, ex)
    return :( $(esc(ex)) == 0 ? nothing : laszip_error($(esc(obj))) )
end
