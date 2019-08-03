# Julia wrapper for header: laszip_api.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

const laszip = replace(liblaszip, "_api" => "")
@info "Using laszip library at $liblaszip"

# function renameat(arg1::Cint, arg2, arg3::Cint, arg4)
#     ccall((:renameat, laszip), Cint, (Cint, Cstring, Cint, Cstring), arg1, arg2, arg3, arg4)
# end

# function renamex_np(arg1, arg2, arg3::UInt32)
#     ccall((:renamex_np, laszip), Cint, (Cstring, Cstring, UInt32), arg1, arg2, arg3)
# end

# function renameatx_np(arg1::Cint, arg2, arg3::Cint, arg4, arg5::UInt32)
#     ccall((:renameatx_np, laszip), Cint, (Cint, Cstring, Cint, Cstring, UInt32), arg1, arg2, arg3, arg4, arg5)
# end

# function clearerr(arg1)
#     ccall((:clearerr, laszip), Nothing, (Ptr{Cvoid},), arg1)
# end

# function fclose(arg1)
#     ccall((:fclose, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function feof(arg1)
#     ccall((:feof, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function ferror(arg1)
#     ccall((:ferror, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function fflush(arg1)
#     ccall((:fflush, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function fgetc(arg1)
#     ccall((:fgetc, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function fgetpos(arg1, arg2)
#     ccall((:fgetpos, laszip), Cint, (Ptr{Cvoid}, Ptr{Int64}), arg1, arg2)
# end

# function fgets(arg1, arg2::Cint, arg3)
#     ccall((:fgets, laszip), Cstring, (Cstring, Cint, Ptr{Cvoid}), arg1, arg2, arg3)
# end

# function fopen(__filename, __mode)
#     ccall((:fopen, laszip), Ptr{Cvoid}, (Cstring, Cstring), __filename, __mode)
# end

# function fputc(arg1::Cint, arg2)
#     ccall((:fputc, laszip), Cint, (Cint, Ptr{Cvoid}), arg1, arg2)
# end

# function fputs(arg1, arg2)
#     ccall((:fputs, laszip), Cint, (Cstring, Ptr{Cvoid}), arg1, arg2)
# end

# function fread(__ptr, __size::Csize_t, __nitems::Csize_t, __stream)
#     ccall((:fread, laszip), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Cvoid}), __ptr, __size, __nitems, __stream)
# end

# function freopen(arg1, arg2, arg3)
#     ccall((:freopen, laszip), Ptr{Cvoid}, (Cstring, Cstring, Ptr{Cvoid}), arg1, arg2, arg3)
# end

# function fseek(arg1, arg2::Clong, arg3::Cint)
#     ccall((:fseek, laszip), Cint, (Ptr{Cvoid}, Clong, Cint), arg1, arg2, arg3)
# end

# function fsetpos(arg1, arg2)
#     ccall((:fsetpos, laszip), Cint, (Ptr{Cvoid}, Ptr{Int64}), arg1, arg2)
# end

# function ftell(arg1)
#     ccall((:ftell, laszip), Clong, (Ptr{Cvoid},), arg1)
# end

# function fwrite(__ptr, __size::Csize_t, __nitems::Csize_t, __stream)
#     ccall((:fwrite, laszip), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Cvoid}), __ptr, __size, __nitems, __stream)
# end

# function getc(arg1)
#     ccall((:getc, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function getchar()
#     ccall((:getchar, laszip), Cint, ())
# end

# function gets(arg1)
#     ccall((:gets, laszip), Cstring, (Cstring,), arg1)
# end

# function perror(arg1)
#     ccall((:perror, laszip), Nothing, (Cstring,), arg1)
# end

# function putc(arg1::Cint, arg2)
#     ccall((:putc, laszip), Cint, (Cint, Ptr{Cvoid}), arg1, arg2)
# end

# function putchar(arg1::Cint)
#     ccall((:putchar, laszip), Cint, (Cint,), arg1)
# end

# function puts(arg1)
#     ccall((:puts, laszip), Cint, (Cstring,), arg1)
# end

# function remove(arg1)
#     ccall((:remove, laszip), Cint, (Cstring,), arg1)
# end

# function rename(__old, __new)
#     ccall((:rename, laszip), Cint, (Cstring, Cstring), __old, __new)
# end

# function rewind(arg1)
#     ccall((:rewind, laszip), Nothing, (Ptr{Cvoid},), arg1)
# end

# function setbuf(arg1, arg2)
#     ccall((:setbuf, laszip), Nothing, (Ptr{Cvoid}, Cstring), arg1, arg2)
# end

# function setvbuf(arg1, arg2, arg3::Cint, arg4::Csize_t)
#     ccall((:setvbuf, laszip), Cint, (Ptr{Cvoid}, Cstring, Cint, Csize_t), arg1, arg2, arg3, arg4)
# end

# function tmpfile()
#     ccall((:tmpfile, laszip), Ptr{Cvoid}, ())
# end

# function tmpnam(arg1)
#     ccall((:tmpnam, laszip), Cstring, (Cstring,), arg1)
# end

# function ungetc(arg1::Cint, arg2)
#     ccall((:ungetc, laszip), Cint, (Cint, Ptr{Cvoid}), arg1, arg2)
# end

# function vfprintf(arg1, arg2, arg3::Cstring)
#     ccall((:vfprintf, laszip), Cint, (Ptr{Cvoid}, Cstring, Cstring), arg1, arg2, arg3)
# end

# function vprintf(arg1, arg2)
#     ccall((:vprintf, laszip), Cint, (Cstring, Ptr{__va_list_tag}), arg1, arg2)
# end

# function vsprintf(arg1, arg2, arg3)
#     ccall((:vsprintf, laszip), Cint, (Cstring, Cstring, Ptr{__va_list_tag}), arg1, arg2, arg3)
# end

# function ctermid(arg1)
#     ccall((:ctermid, laszip), Cstring, (Cstring,), arg1)
# end

# function fdopen(arg1::Cint, arg2)
#     ccall((:fdopen, laszip), Ptr{Cvoid}, (Cint, Cstring), arg1, arg2)
# end

# function fileno(arg1)
#     ccall((:fileno, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function pclose(arg1)
#     ccall((:pclose, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function popen(arg1, arg2)
#     ccall((:popen, laszip), Ptr{Cvoid}, (Cstring, Cstring), arg1, arg2)
# end

# function flockfile(arg1)
#     ccall((:flockfile, laszip), Nothing, (Ptr{Cvoid},), arg1)
# end

# function ftrylockfile(arg1)
#     ccall((:ftrylockfile, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function funlockfile(arg1)
#     ccall((:funlockfile, laszip), Nothing, (Ptr{Cvoid},), arg1)
# end

# function getc_unlocked(arg1)
#     ccall((:getc_unlocked, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function getchar_unlocked()
#     ccall((:getchar_unlocked, laszip), Cint, ())
# end

# function putc_unlocked(arg1::Cint, arg2)
#     ccall((:putc_unlocked, laszip), Cint, (Cint, Ptr{Cvoid}), arg1, arg2)
# end

# function putchar_unlocked(arg1::Cint)
#     ccall((:putchar_unlocked, laszip), Cint, (Cint,), arg1)
# end

# function getw(arg1)
#     ccall((:getw, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function putw(arg1::Cint, arg2)
#     ccall((:putw, laszip), Cint, (Cint, Ptr{Cvoid}), arg1, arg2)
# end

# function tempnam(__dir, __prefix)
#     ccall((:tempnam, laszip), Cstring, (Cstring, Cstring), __dir, __prefix)
# end

# function fseeko(__stream, __offset::Int64, __whence::Cint)
#     ccall((:fseeko, laszip), Cint, (Ptr{Cvoid}, Int64, Cint), __stream, __offset, __whence)
# end

# function ftello(__stream)
#     ccall((:ftello, laszip), Int64, (Ptr{Cvoid},), __stream)
# end

# function vfscanf(__stream, __format, arg1)
#     ccall((:vfscanf, laszip), Cint, (Ptr{Cvoid}, Cstring, Ptr{__va_list_tag}), __stream, __format, arg1)
# end

# function vscanf(__format, arg1)
#     ccall((:vscanf, laszip), Cint, (Cstring, Ptr{__va_list_tag}), __format, arg1)
# end

# function vsnprintf(__str, __size::Culong, __format, arg1)
#     ccall((:vsnprintf, laszip), Cint, (Cstring, Culong, Cstring, Ptr{__va_list_tag}), __str, __size, __format, arg1)
# end

# function vsscanf(__str, __format, arg1)
#     ccall((:vsscanf, laszip), Cint, (Cstring, Cstring, Ptr{__va_list_tag}), __str, __format, arg1)
# end

# function vdprintf(arg1::Cint, arg2, arg3::Cstring)
#     ccall((:vdprintf, laszip), Cint, (Cint, Cstring, Cstring), arg1, arg2, arg3)
# end

# function getdelim(__linep, __linecapp, __delimiter::Cint, __stream)
#     ccall((:getdelim, laszip), Int32, (Ptr{Cstring}, Ptr{Csize_t}, Cint, Ptr{Cvoid}), __linep, __linecapp, __delimiter, __stream)
# end

# function getline(__linep, __linecapp, __stream)
#     ccall((:getline, laszip), Int32, (Ptr{Cstring}, Ptr{Csize_t}, Ptr{Cvoid}), __linep, __linecapp, __stream)
# end

# function ctermid_r(arg1)
#     ccall((:ctermid_r, laszip), Cstring, (Cstring,), arg1)
# end

# function fgetln(arg1, arg2)
#     ccall((:fgetln, laszip), Cstring, (Ptr{Cvoid}, Ptr{Csize_t}), arg1, arg2)
# end

# function fmtcheck(arg1, arg2)
#     ccall((:fmtcheck, laszip), Cstring, (Cstring, Cstring), arg1, arg2)
# end

# function fpurge(arg1)
#     ccall((:fpurge, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function setbuffer(arg1, arg2, arg3::Cint)
#     ccall((:setbuffer, laszip), Nothing, (Ptr{Cvoid}, Cstring, Cint), arg1, arg2, arg3)
# end

# function setlinebuf(arg1)
#     ccall((:setlinebuf, laszip), Cint, (Ptr{Cvoid},), arg1)
# end

# function vasprintf(arg1, arg2, arg3::Cstring)
#     ccall((:vasprintf, laszip), Cint, (Ptr{Cstring}, Cstring, Cstring), arg1, arg2, arg3)
# end

# function zopen(arg1, arg2, arg3::Cint)
#     ccall((:zopen, laszip), Ptr{Cvoid}, (Cstring, Cstring, Cint), arg1, arg2, arg3)
# end

# function funopen(arg1, arg2, arg3, arg4, arg5)
#     ccall((:funopen, laszip), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5)
# end

function laszip_get_version(version_major, version_minor, version_revision, version_build)
    ccall((:laszip_get_version, laszip), Int32, (Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt16}, Ptr{UInt32}), version_major, version_minor, version_revision, version_build)
end

function laszip_create(pointer::Ref{Ptr{Cvoid}})
    ccall((:laszip_create, laszip), Int32, (Ptr{Ptr{Cvoid}},), pointer)
end

function laszip_get_error(pointer::Ptr{Cvoid}, error)
    ccall((:laszip_get_error, laszip), Int32, (Ptr{Cvoid}, Ptr{Cstring}), pointer, error)
end

function laszip_get_warning(pointer::Ptr{Cvoid}, warning)
    ccall((:laszip_get_warning, laszip), Int32, (Ptr{Cvoid}, Ptr{Cstring}), pointer, warning)
end

function laszip_clean(pointer::Ptr{Cvoid})
    ccall((:laszip_clean, laszip), Int32, (Ptr{Cvoid},), pointer)
end

function laszip_destroy(pointer::Ptr{Cvoid})
    ccall((:laszip_destroy, laszip), Int32, (Ptr{Cvoid},), pointer)
end

function laszip_get_header_pointer(pointer::Ptr{Cvoid}, header_pointer)
    ccall((:laszip_get_header_pointer, laszip), Int32, (Ptr{Cvoid}, Ref{Ptr{LazHeader}}), pointer, header_pointer)
end

function laszip_get_point_pointer(pointer::Ptr{Cvoid}, point_pointer)
    ccall((:laszip_get_point_pointer, laszip), Int32, (Ptr{Cvoid}, Ref{Ptr{LazPoint}}), pointer, point_pointer)
end

function laszip_get_point_count(pointer::Ptr{Cvoid}, count)
    ccall((:laszip_get_point_count, laszip), Int32, (Ptr{Cvoid}, Ptr{Int64}), pointer, count)
end

function laszip_set_header(pointer::Ptr{Cvoid}, header)
    ccall((:laszip_set_header, laszip), Int32, (Ptr{Cvoid}, Ptr{LazHeader}), pointer, header)
end

# function laszip_set_point_type_and_size(pointer::Ptr{Cvoid}, point_type::UInt8, point_size::UInt16)
#     ccall((:laszip_set_point_type_and_size, laszip), Int32, (Ptr{Cvoid}, UInt8, UInt16), pointer, point_type, point_size)
# end

# function laszip_check_for_integer_overflow(pointer::Ptr{Cvoid})
#     ccall((:laszip_check_for_integer_overflow, laszip), Int32, (Ptr{Cvoid},), pointer)
# end

# function laszip_auto_offset(pointer::Ptr{Cvoid})
#     ccall((:laszip_auto_offset, laszip), Int32, (Ptr{Cvoid},), pointer)
# end

function laszip_set_point(pointer::Ptr{Cvoid}, point)
    ccall((:laszip_set_point, laszip), Int32, (Ptr{Cvoid}, Ptr{LazPoint}), pointer, point)
end

# function laszip_set_coordinates(pointer::Ptr{Cvoid}, coordinates)
#     ccall((:laszip_set_coordinates, laszip), Int32, (Ptr{Cvoid}, Ptr{Float64}), pointer, coordinates)
# end

# function laszip_get_coordinates(pointer::Ptr{Cvoid}, coordinates)
#     ccall((:laszip_get_coordinates, laszip), Int32, (Ptr{Cvoid}, Ptr{Float64}), pointer, coordinates)
# end

# function laszip_set_geokeys(pointer::Ptr{Cvoid}, number::UInt32, key_entries)
#     ccall((:laszip_set_geokeys, laszip), Int32, (Ptr{Cvoid}, UInt32, Ptr{Cvoid}), pointer, number, key_entries)
# end

# function laszip_set_geodouble_params(pointer::Ptr{Cvoid}, number::UInt32, geodouble_params)
#     ccall((:laszip_set_geodouble_params, laszip), Int32, (Ptr{Cvoid}, UInt32, Ptr{Float64}), pointer, number, geodouble_params)
# end

# function laszip_set_geoascii_params(pointer::Ptr{Cvoid}, number::UInt32, geoascii_params)
#     ccall((:laszip_set_geoascii_params, laszip), Int32, (Ptr{Cvoid}, UInt32, Ptr{UInt8}), pointer, number, geoascii_params)
# end

# function laszip_add_attribute(pointer::Ptr{Cvoid}, _type::UInt32, name, description, scale::Float64, offset::Float64)
#     ccall((:laszip_add_attribute, laszip), Int32, (Ptr{Cvoid}, UInt32, Ptr{UInt8}, Ptr{UInt8}, Float64, Float64), pointer, _type, name, description, scale, offset)
# end

# function laszip_add_vlr(pointer::Ptr{Cvoid}, user_id, record_id::UInt16, record_length_after_header::UInt16, description, data)
#     ccall((:laszip_add_vlr, laszip), Int32, (Ptr{Cvoid}, Ptr{UInt8}, UInt16, UInt16, Ptr{UInt8}, Ptr{UInt8}), pointer, user_id, record_id, record_length_after_header, description, data)
# end

# function laszip_remove_vlr(pointer::Ptr{Cvoid}, user_id, record_id::UInt16)
#     ccall((:laszip_remove_vlr, laszip), Int32, (Ptr{Cvoid}, Ptr{UInt8}, UInt16), pointer, user_id, record_id)
# end

# function laszip_create_spatial_index(pointer::Ptr{Cvoid}, create::Cint, append::Cint)
#     ccall((:laszip_create_spatial_index, laszip), Int32, (Ptr{Cvoid}, Cint, Cint), pointer, create, append)
# end

# function laszip_preserve_generating_software(pointer::Ptr{Cvoid}, preserve::Cint)
#     ccall((:laszip_preserve_generating_software, laszip), Int32, (Ptr{Cvoid}, Cint), pointer, preserve)
# end

# function laszip_request_native_extension(pointer::Ptr{Cvoid}, request::Cint)
#     ccall((:laszip_request_native_extension, laszip), Int32, (Ptr{Cvoid}, Cint), pointer, request)
# end

# function laszip_request_compatibility_mode(pointer::Ptr{Cvoid}, request::Cint)
#     ccall((:laszip_request_compatibility_mode, laszip), Int32, (Ptr{Cvoid}, Cint), pointer, request)
# end

# function laszip_set_chunk_size(pointer::Ptr{Cvoid}, chunk_size::UInt32)
#     ccall((:laszip_set_chunk_size, laszip), Int32, (Ptr{Cvoid}, UInt32), pointer, chunk_size)
# end

function laszip_open_writer(pointer::Ptr{Cvoid}, file_name, compress::Cint)
    ccall((:laszip_open_writer, laszip), Int32, (Ptr{Cvoid}, Ptr{UInt8}, Cint), pointer, file_name, compress)
end

function laszip_write_point(pointer::Ptr{Cvoid})
    ccall((:laszip_write_point, laszip), Int32, (Ptr{Cvoid},), pointer)
end

# function laszip_write_indexed_point(pointer::Ptr{Cvoid})
#     ccall((:laszip_write_indexed_point, laszip), Int32, (Ptr{Cvoid},), pointer)
# end

function laszip_update_inventory(pointer::Ptr{Cvoid})
    ccall((:laszip_update_inventory, laszip), Int32, (Ptr{Cvoid},), pointer)
end

function laszip_close_writer(pointer::Ptr{Cvoid})
    ccall((:laszip_close_writer, laszip), Int32, (Ptr{Cvoid},), pointer)
end

# function laszip_exploit_spatial_index(pointer::Ptr{Cvoid}, exploit::Cint)
#     ccall((:laszip_exploit_spatial_index, laszip), Int32, (Ptr{Cvoid}, Cint), pointer, exploit)
# end

# function laszip_decompress_selective(pointer::Ptr{Cvoid}, decompress_selective::UInt32)
#     ccall((:laszip_decompress_selective, laszip), Int32, (Ptr{Cvoid}, UInt32), pointer, decompress_selective)
# end

function laszip_open_reader(pointer::Ptr{Cvoid}, file_name, is_compressed)
    ccall((:laszip_open_reader, laszip), Int32, (Ptr{Cvoid}, Ptr{UInt8}, Ptr{Cint}), pointer, file_name, is_compressed)
end

# function laszip_has_spatial_index(pointer::Ptr{Cvoid}, is_indexed, is_appended)
#     ccall((:laszip_has_spatial_index, laszip), Int32, (Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), pointer, is_indexed, is_appended)
# end

# function laszip_inside_rectangle(pointer::Ptr{Cvoid}, min_x::Float64, min_y::Float64, max_x::Float64, max_y::Float64, is_empty)
#     ccall((:laszip_inside_rectangle, laszip), Int32, (Ptr{Cvoid}, Float64, Float64, Float64, Float64, Ptr{Cint}), pointer, min_x, min_y, max_x, max_y, is_empty)
# end

function laszip_seek_point(pointer::Ptr{Cvoid}, index::Int64)
    ccall((:laszip_seek_point, laszip), Int32, (Ptr{Cvoid}, Int64), pointer, index)
end
laszip_seek_point(pointer::Ptr{Cvoid}, index::Int32) = laszip_seek_point(pointer, convert(Int64, index))

function laszip_read_point(pointer::Ptr{Cvoid})
    ccall((:laszip_read_point, laszip), Int32, (Ptr{Cvoid},), pointer)
end

# function laszip_read_inside_point(pointer::Ptr{Cvoid}, is_done)
#     ccall((:laszip_read_inside_point, laszip), Int32, (Ptr{Cvoid}, Ptr{Cint}), pointer, is_done)
# end

function laszip_close_reader(pointer::Ptr{Cvoid})
    ccall((:laszip_close_reader, laszip), Int32, (Ptr{Cvoid},), pointer)
end
