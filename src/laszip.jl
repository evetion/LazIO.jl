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
#     ccall((:clearerr, laszip), Nothing, (Ptr{FILE},), arg1)
# end

# function fclose(arg1)
#     ccall((:fclose, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function feof(arg1)
#     ccall((:feof, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function ferror(arg1)
#     ccall((:ferror, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function fflush(arg1)
#     ccall((:fflush, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function fgetc(arg1)
#     ccall((:fgetc, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function fgetpos(arg1, arg2)
#     ccall((:fgetpos, laszip), Cint, (Ptr{FILE}, Ptr{fpos_t}), arg1, arg2)
# end

# function fgets(arg1, arg2::Cint, arg3)
#     ccall((:fgets, laszip), Cstring, (Cstring, Cint, Ptr{FILE}), arg1, arg2, arg3)
# end

# function fopen(__filename, __mode)
#     ccall((:fopen, laszip), Ptr{FILE}, (Cstring, Cstring), __filename, __mode)
# end

# function fputc(arg1::Cint, arg2)
#     ccall((:fputc, laszip), Cint, (Cint, Ptr{FILE}), arg1, arg2)
# end

# function fputs(arg1, arg2)
#     ccall((:fputs, laszip), Cint, (Cstring, Ptr{FILE}), arg1, arg2)
# end

# function fread(__ptr, __size::Csize_t, __nitems::Csize_t, __stream)
#     ccall((:fread, laszip), Csize_t, (Ptr{Nothing}, Csize_t, Csize_t, Ptr{FILE}), __ptr, __size, __nitems, __stream)
# end

# function freopen(arg1, arg2, arg3)
#     ccall((:freopen, laszip), Ptr{FILE}, (Cstring, Cstring, Ptr{FILE}), arg1, arg2, arg3)
# end

# function fseek(arg1, arg2::Clong, arg3::Cint)
#     ccall((:fseek, laszip), Cint, (Ptr{FILE}, Clong, Cint), arg1, arg2, arg3)
# end

# function fsetpos(arg1, arg2)
#     ccall((:fsetpos, laszip), Cint, (Ptr{FILE}, Ptr{fpos_t}), arg1, arg2)
# end

# function ftell(arg1)
#     ccall((:ftell, laszip), Clong, (Ptr{FILE},), arg1)
# end

# function fwrite(__ptr, __size::Csize_t, __nitems::Csize_t, __stream)
#     ccall((:fwrite, laszip), Csize_t, (Ptr{Nothing}, Csize_t, Csize_t, Ptr{FILE}), __ptr, __size, __nitems, __stream)
# end

# function getc(arg1)
#     ccall((:getc, laszip), Cint, (Ptr{FILE},), arg1)
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
#     ccall((:putc, laszip), Cint, (Cint, Ptr{FILE}), arg1, arg2)
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
#     ccall((:rewind, laszip), Nothing, (Ptr{FILE},), arg1)
# end

# function setbuf(arg1, arg2)
#     ccall((:setbuf, laszip), Nothing, (Ptr{FILE}, Cstring), arg1, arg2)
# end

# function setvbuf(arg1, arg2, arg3::Cint, arg4::Csize_t)
#     ccall((:setvbuf, laszip), Cint, (Ptr{FILE}, Cstring, Cint, Csize_t), arg1, arg2, arg3, arg4)
# end

# function tmpfile()
#     ccall((:tmpfile, laszip), Ptr{FILE}, ())
# end

# function tmpnam(arg1)
#     ccall((:tmpnam, laszip), Cstring, (Cstring,), arg1)
# end

# function ungetc(arg1::Cint, arg2)
#     ccall((:ungetc, laszip), Cint, (Cint, Ptr{FILE}), arg1, arg2)
# end

# function vfprintf(arg1, arg2, arg3::va_list)
#     ccall((:vfprintf, laszip), Cint, (Ptr{FILE}, Cstring, va_list), arg1, arg2, arg3)
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
#     ccall((:fdopen, laszip), Ptr{FILE}, (Cint, Cstring), arg1, arg2)
# end

# function fileno(arg1)
#     ccall((:fileno, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function pclose(arg1)
#     ccall((:pclose, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function popen(arg1, arg2)
#     ccall((:popen, laszip), Ptr{FILE}, (Cstring, Cstring), arg1, arg2)
# end

# function flockfile(arg1)
#     ccall((:flockfile, laszip), Nothing, (Ptr{FILE},), arg1)
# end

# function ftrylockfile(arg1)
#     ccall((:ftrylockfile, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function funlockfile(arg1)
#     ccall((:funlockfile, laszip), Nothing, (Ptr{FILE},), arg1)
# end

# function getc_unlocked(arg1)
#     ccall((:getc_unlocked, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function getchar_unlocked()
#     ccall((:getchar_unlocked, laszip), Cint, ())
# end

# function putc_unlocked(arg1::Cint, arg2)
#     ccall((:putc_unlocked, laszip), Cint, (Cint, Ptr{FILE}), arg1, arg2)
# end

# function putchar_unlocked(arg1::Cint)
#     ccall((:putchar_unlocked, laszip), Cint, (Cint,), arg1)
# end

# function getw(arg1)
#     ccall((:getw, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function putw(arg1::Cint, arg2)
#     ccall((:putw, laszip), Cint, (Cint, Ptr{FILE}), arg1, arg2)
# end

# function tempnam(__dir, __prefix)
#     ccall((:tempnam, laszip), Cstring, (Cstring, Cstring), __dir, __prefix)
# end

# function fseeko(__stream, __offset::off_t, __whence::Cint)
#     ccall((:fseeko, laszip), Cint, (Ptr{FILE}, off_t, Cint), __stream, __offset, __whence)
# end

# function ftello(__stream)
#     ccall((:ftello, laszip), off_t, (Ptr{FILE},), __stream)
# end

# function vfscanf(__stream, __format, arg1)
#     ccall((:vfscanf, laszip), Cint, (Ptr{FILE}, Cstring, Ptr{__va_list_tag}), __stream, __format, arg1)
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

# function vdprintf(arg1::Cint, arg2, arg3::va_list)
#     ccall((:vdprintf, laszip), Cint, (Cint, Cstring, va_list), arg1, arg2, arg3)
# end

# function getdelim(__linep, __linecapp, __delimiter::Cint, __stream)
#     ccall((:getdelim, laszip), ssize_t, (Ptr{Cstring}, Ptr{Csize_t}, Cint, Ptr{FILE}), __linep, __linecapp, __delimiter, __stream)
# end

# function getline(__linep, __linecapp, __stream)
#     ccall((:getline, laszip), ssize_t, (Ptr{Cstring}, Ptr{Csize_t}, Ptr{FILE}), __linep, __linecapp, __stream)
# end

# function ctermid_r(arg1)
#     ccall((:ctermid_r, laszip), Cstring, (Cstring,), arg1)
# end

# function fgetln(arg1, arg2)
#     ccall((:fgetln, laszip), Cstring, (Ptr{FILE}, Ptr{Csize_t}), arg1, arg2)
# end

# function fmtcheck(arg1, arg2)
#     ccall((:fmtcheck, laszip), Cstring, (Cstring, Cstring), arg1, arg2)
# end

# function fpurge(arg1)
#     ccall((:fpurge, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function setbuffer(arg1, arg2, arg3::Cint)
#     ccall((:setbuffer, laszip), Nothing, (Ptr{FILE}, Cstring, Cint), arg1, arg2, arg3)
# end

# function setlinebuf(arg1)
#     ccall((:setlinebuf, laszip), Cint, (Ptr{FILE},), arg1)
# end

# function vasprintf(arg1, arg2, arg3::va_list)
#     ccall((:vasprintf, laszip), Cint, (Ptr{Cstring}, Cstring, va_list), arg1, arg2, arg3)
# end

# function zopen(arg1, arg2, arg3::Cint)
#     ccall((:zopen, laszip), Ptr{FILE}, (Cstring, Cstring, Cint), arg1, arg2, arg3)
# end

# function funopen(arg1, arg2, arg3, arg4, arg5)
#     ccall((:funopen, laszip), Ptr{FILE}, (Ptr{Nothing}, Ptr{Nothing}, Ptr{Nothing}, Ptr{Nothing}, Ptr{Nothing}), arg1, arg2, arg3, arg4, arg5)
# end

function laszip_get_version(version_major, version_minor, version_revision, version_build)
    ccall((:laszip_get_version, laszip), laszip_I32, (Ptr{laszip_U8}, Ptr{laszip_U8}, Ptr{laszip_U16}, Ptr{laszip_U32}), version_major, version_minor, version_revision, version_build)
end

function laszip_create(pointer::Ref{laszip_POINTER})
    ccall((:laszip_create, laszip), laszip_I32, (Ptr{laszip_POINTER},), pointer)
end

function laszip_get_error(pointer::laszip_POINTER, error)
    ccall((:laszip_get_error, laszip), laszip_I32, (laszip_POINTER, Ptr{Cstring}), pointer, error)
end

function laszip_get_warning(pointer::laszip_POINTER, warning)
    ccall((:laszip_get_warning, laszip), laszip_I32, (laszip_POINTER, Ptr{Cstring}), pointer, warning)
end

function laszip_clean(pointer::laszip_POINTER)
    ccall((:laszip_clean, laszip), laszip_I32, (laszip_POINTER,), pointer)
end

function laszip_destroy(pointer::laszip_POINTER)
    ccall((:laszip_destroy, laszip), laszip_I32, (laszip_POINTER,), pointer)
end

function laszip_get_header_pointer(pointer::laszip_POINTER, header_pointer)
    ccall((:laszip_get_header_pointer, laszip), laszip_I32, (laszip_POINTER, Ref{Ptr{laszip_header}}), pointer, header_pointer)
end

function laszip_get_point_pointer(pointer::laszip_POINTER, point_pointer)
    ccall((:laszip_get_point_pointer, laszip), laszip_I32, (laszip_POINTER, Ref{Ptr{laszip_point}}), pointer, point_pointer)
end

function laszip_get_point_count(pointer::laszip_POINTER, count)
    ccall((:laszip_get_point_count, laszip), laszip_I32, (laszip_POINTER, Ptr{laszip_I64}), pointer, count)
end

function laszip_set_header(pointer::laszip_POINTER, header)
    ccall((:laszip_set_header, laszip), laszip_I32, (laszip_POINTER, Ptr{laszip_header}), pointer, header)
end

# function laszip_set_point_type_and_size(pointer::laszip_POINTER, point_type::laszip_U8, point_size::laszip_U16)
#     ccall((:laszip_set_point_type_and_size, laszip), laszip_I32, (laszip_POINTER, laszip_U8, laszip_U16), pointer, point_type, point_size)
# end

# function laszip_check_for_integer_overflow(pointer::laszip_POINTER)
#     ccall((:laszip_check_for_integer_overflow, laszip), laszip_I32, (laszip_POINTER,), pointer)
# end

# function laszip_auto_offset(pointer::laszip_POINTER)
#     ccall((:laszip_auto_offset, laszip), laszip_I32, (laszip_POINTER,), pointer)
# end

function laszip_set_point(pointer::laszip_POINTER, point)
    ccall((:laszip_set_point, laszip), laszip_I32, (laszip_POINTER, Ptr{laszip_point}), pointer, point)
end

# function laszip_set_coordinates(pointer::laszip_POINTER, coordinates)
#     ccall((:laszip_set_coordinates, laszip), laszip_I32, (laszip_POINTER, Ptr{laszip_F64}), pointer, coordinates)
# end

# function laszip_get_coordinates(pointer::laszip_POINTER, coordinates)
#     ccall((:laszip_get_coordinates, laszip), laszip_I32, (laszip_POINTER, Ptr{laszip_F64}), pointer, coordinates)
# end

# function laszip_set_geokeys(pointer::laszip_POINTER, number::laszip_U32, key_entries)
#     ccall((:laszip_set_geokeys, laszip), laszip_I32, (laszip_POINTER, laszip_U32, Ptr{laszip_geokey_struct}), pointer, number, key_entries)
# end

# function laszip_set_geodouble_params(pointer::laszip_POINTER, number::laszip_U32, geodouble_params)
#     ccall((:laszip_set_geodouble_params, laszip), laszip_I32, (laszip_POINTER, laszip_U32, Ptr{laszip_F64}), pointer, number, geodouble_params)
# end

# function laszip_set_geoascii_params(pointer::laszip_POINTER, number::laszip_U32, geoascii_params)
#     ccall((:laszip_set_geoascii_params, laszip), laszip_I32, (laszip_POINTER, laszip_U32, Ptr{laszip_CHAR}), pointer, number, geoascii_params)
# end

# function laszip_add_attribute(pointer::laszip_POINTER, _type::laszip_U32, name, description, scale::laszip_F64, offset::laszip_F64)
#     ccall((:laszip_add_attribute, laszip), laszip_I32, (laszip_POINTER, laszip_U32, Ptr{laszip_CHAR}, Ptr{laszip_CHAR}, laszip_F64, laszip_F64), pointer, _type, name, description, scale, offset)
# end

# function laszip_add_vlr(pointer::laszip_POINTER, user_id, record_id::laszip_U16, record_length_after_header::laszip_U16, description, data)
#     ccall((:laszip_add_vlr, laszip), laszip_I32, (laszip_POINTER, Ptr{laszip_CHAR}, laszip_U16, laszip_U16, Ptr{laszip_CHAR}, Ptr{laszip_U8}), pointer, user_id, record_id, record_length_after_header, description, data)
# end

# function laszip_remove_vlr(pointer::laszip_POINTER, user_id, record_id::laszip_U16)
#     ccall((:laszip_remove_vlr, laszip), laszip_I32, (laszip_POINTER, Ptr{laszip_CHAR}, laszip_U16), pointer, user_id, record_id)
# end

# function laszip_create_spatial_index(pointer::laszip_POINTER, create::laszip_BOOL, append::laszip_BOOL)
#     ccall((:laszip_create_spatial_index, laszip), laszip_I32, (laszip_POINTER, laszip_BOOL, laszip_BOOL), pointer, create, append)
# end

# function laszip_preserve_generating_software(pointer::laszip_POINTER, preserve::laszip_BOOL)
#     ccall((:laszip_preserve_generating_software, laszip), laszip_I32, (laszip_POINTER, laszip_BOOL), pointer, preserve)
# end

# function laszip_request_native_extension(pointer::laszip_POINTER, request::laszip_BOOL)
#     ccall((:laszip_request_native_extension, laszip), laszip_I32, (laszip_POINTER, laszip_BOOL), pointer, request)
# end

# function laszip_request_compatibility_mode(pointer::laszip_POINTER, request::laszip_BOOL)
#     ccall((:laszip_request_compatibility_mode, laszip), laszip_I32, (laszip_POINTER, laszip_BOOL), pointer, request)
# end

# function laszip_set_chunk_size(pointer::laszip_POINTER, chunk_size::laszip_U32)
#     ccall((:laszip_set_chunk_size, laszip), laszip_I32, (laszip_POINTER, laszip_U32), pointer, chunk_size)
# end

function laszip_open_writer(pointer::laszip_POINTER, file_name, compress::laszip_BOOL)
    ccall((:laszip_open_writer, laszip), laszip_I32, (laszip_POINTER, Ptr{laszip_CHAR}, laszip_BOOL), pointer, file_name, compress)
end

function laszip_write_point(pointer::laszip_POINTER)
    ccall((:laszip_write_point, laszip), laszip_I32, (laszip_POINTER,), pointer)
end

# function laszip_write_indexed_point(pointer::laszip_POINTER)
#     ccall((:laszip_write_indexed_point, laszip), laszip_I32, (laszip_POINTER,), pointer)
# end

function laszip_update_inventory(pointer::laszip_POINTER)
    ccall((:laszip_update_inventory, laszip), laszip_I32, (laszip_POINTER,), pointer)
end

function laszip_close_writer(pointer::laszip_POINTER)
    ccall((:laszip_close_writer, laszip), laszip_I32, (laszip_POINTER,), pointer)
end

# function laszip_exploit_spatial_index(pointer::laszip_POINTER, exploit::laszip_BOOL)
#     ccall((:laszip_exploit_spatial_index, laszip), laszip_I32, (laszip_POINTER, laszip_BOOL), pointer, exploit)
# end

# function laszip_decompress_selective(pointer::laszip_POINTER, decompress_selective::laszip_U32)
#     ccall((:laszip_decompress_selective, laszip), laszip_I32, (laszip_POINTER, laszip_U32), pointer, decompress_selective)
# end

function laszip_open_reader(pointer::laszip_POINTER, file_name, is_compressed)
    ccall((:laszip_open_reader, laszip), laszip_I32, (laszip_POINTER, Ptr{laszip_CHAR}, Ptr{laszip_BOOL}), pointer, file_name, is_compressed)
end

# function laszip_has_spatial_index(pointer::laszip_POINTER, is_indexed, is_appended)
#     ccall((:laszip_has_spatial_index, laszip), laszip_I32, (laszip_POINTER, Ptr{laszip_BOOL}, Ptr{laszip_BOOL}), pointer, is_indexed, is_appended)
# end

# function laszip_inside_rectangle(pointer::laszip_POINTER, min_x::laszip_F64, min_y::laszip_F64, max_x::laszip_F64, max_y::laszip_F64, is_empty)
#     ccall((:laszip_inside_rectangle, laszip), laszip_I32, (laszip_POINTER, laszip_F64, laszip_F64, laszip_F64, laszip_F64, Ptr{laszip_BOOL}), pointer, min_x, min_y, max_x, max_y, is_empty)
# end

function laszip_seek_point(pointer::laszip_POINTER, index::laszip_I64)
    ccall((:laszip_seek_point, laszip), laszip_I32, (laszip_POINTER, laszip_I64), pointer, index)
end

function laszip_read_point(pointer::laszip_POINTER)
    ccall((:laszip_read_point, laszip), laszip_I32, (laszip_POINTER,), pointer)
end

# function laszip_read_inside_point(pointer::laszip_POINTER, is_done)
#     ccall((:laszip_read_inside_point, laszip), laszip_I32, (laszip_POINTER, Ptr{laszip_BOOL}), pointer, is_done)
# end

function laszip_close_reader(pointer::laszip_POINTER)
    ccall((:laszip_close_reader, laszip), laszip_I32, (laszip_POINTER,), pointer)
end
