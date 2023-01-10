function laszip_error(laszip_obj::Ptr{Cvoid})
    errstr = Ref(Cstring(C_NULL))
    laszip_get_error(laszip_obj, errstr)
    if errstr[] != C_NULL
        error(unsafe_string(errstr[]))
    end
    nothing
end

macro check(obj, ex)
    return :($(esc(ex)) == 0 ? nothing : laszip_error($(esc(obj))))
end


function readstring(s::NTuple{T,UInt8}) where {T}
    lastchar = findlast(s .!= 0)
    if isnothing(lastchar)
        return ""
    else
        return join(Char.(s[1:lastchar]))
    end
end

function writestring(str::AbstractString, nb::Integer)
    s = ascii(str)
    n = length(s)
    npad = nb - n
    if npad < 0
        error("string too long")
    elseif npad == 0
        NTuple{nb,UInt8}(codeunits(ascii(s)))
    else
        writestr = string(s * "\0"^npad)
        NTuple{nb,UInt8}(codeunits(ascii(writestr)))
    end
end
