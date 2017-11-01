# Automatically generated using Clang.jl wrap_c, version 0.0.0

using Compat
using Parameters

const OBJC_NEW_PROPERTIES = 1
const NULL = 0x0
const RENAME_SECLUDE = 0x00000001
const RENAME_SWAP = 0x00000002
const RENAME_EXCL = 0x00000004
const BUFSIZ = 1024

# Skipping MacroDefinition: EOF ( - 1 ) /* must be == _POSIX_STREAM_MAX <limits.h> */

const FOPEN_MAX = 20
const FILENAME_MAX = 1024
const P_tmpdir = "/var/tmp/"
const L_tmpnam = 1024
const TMP_MAX = 308915776
const SEEK_SET = 0
const SEEK_CUR = 1
const SEEK_END = 2
# const stdin = __stdinp
# const stdout = __stdoutp
# const stderr = __stderrp
const L_ctermid = 1024

# Skipping MacroDefinition: getc_unlocked ( fp ) __sgetc ( fp ) #
# Skipping MacroDefinition: putc_unlocked ( x , fp ) __sputc ( x , fp ) #
# Skipping MacroDefinition: getchar_unlocked ( ) getc_unlocked ( stdin ) #
# Skipping MacroDefinition: putchar_unlocked ( x ) putc_unlocked ( x , stdout ) #
# Skipping MacroDefinition: fropen ( cookie , fn ) funopen ( cookie , fn , 0 , 0 , 0 ) #
# Skipping MacroDefinition: fwopen ( cookie , fn ) funopen ( cookie , 0 , fn , 0 , 0 ) #
# Skipping MacroDefinition: feof_unlocked ( p ) __sfeof ( p ) #
# Skipping MacroDefinition: ferror_unlocked ( p ) __sferror ( p ) #
# Skipping MacroDefinition: clearerr_unlocked ( p ) __sclearerr ( p ) #
# Skipping MacroDefinition: fileno_unlocked ( p ) __sfileno ( p ) #
# Skipping MacroDefinition: sprintf ( str , ... ) __builtin___sprintf_chk ( str , 0 , __darwin_obsz ( str ) , __VA_ARGS__ ) #
# Skipping MacroDefinition: snprintf ( str , len , ... ) __builtin___snprintf_chk ( str , len , 0 , __darwin_obsz ( str ) , __VA_ARGS__ ) #
# Skipping MacroDefinition: vsprintf ( str , format , ap ) __builtin___vsprintf_chk ( str , 0 , __darwin_obsz ( str ) , format , ap ) #
# Skipping MacroDefinition: vsnprintf ( str , len , format , ap ) __builtin___vsnprintf_chk ( str , len , 0 , __darwin_obsz ( str ) , format , ap ) #

const INT8_MAX = 127
const INT16_MAX = 32767
const INT32_MAX = 2147483647
const INT64_MAX = Int64(9223372036854775807)
const INT8_MIN = -128
const INT16_MIN = -32768
const INT32_MIN = -2147483648
const INT64_MIN = Int64(-9223372036854775808)

# Skipping MacroDefinition: INT32_MIN ( - INT32_MAX - 1 ) #
# Skipping MacroDefinition: INT64_MIN ( - INT64_MAX - 1 ) #

const UINT8_MAX = 255
const UINT16_MAX = 65535
const UINT32_MAX = UInt32(4294967295)
const UINT64_MAX = UInt64(@int128_str("18446744073709551615"))
const INT_LEAST8_MIN = INT8_MIN
const INT_LEAST16_MIN = INT16_MIN
const INT_LEAST32_MIN = INT32_MIN
const INT_LEAST64_MIN = INT64_MIN
const INT_LEAST8_MAX = INT8_MAX
const INT_LEAST16_MAX = INT16_MAX
const INT_LEAST32_MAX = INT32_MAX
const INT_LEAST64_MAX = INT64_MAX
const UINT_LEAST8_MAX = UINT8_MAX
const UINT_LEAST16_MAX = UINT16_MAX
const UINT_LEAST32_MAX = UINT32_MAX
const UINT_LEAST64_MAX = UINT64_MAX
const INT_FAST8_MIN = INT8_MIN
const INT_FAST16_MIN = INT16_MIN
const INT_FAST32_MIN = INT32_MIN
const INT_FAST64_MIN = INT64_MIN
const INT_FAST8_MAX = INT8_MAX
const INT_FAST16_MAX = INT16_MAX
const INT_FAST32_MAX = INT32_MAX
const INT_FAST64_MAX = INT64_MAX
const UINT_FAST8_MAX = UINT8_MAX
const UINT_FAST16_MAX = UINT16_MAX
const UINT_FAST32_MAX = UINT32_MAX
const UINT_FAST64_MAX = UINT64_MAX
const INTPTR_MIN = INT64_MIN
const INTPTR_MAX = INT64_MAX
const UINTPTR_MAX = UINT64_MAX
const INTMAX_MIN = INT64_MIN
const INTMAX_MAX = INT64_MAX
const UINTMAX_MAX = UINT64_MAX
const PTRDIFF_MIN = INT64_MIN
const PTRDIFF_MAX = INT64_MAX
const SIZE_MAX = UINT64_MAX

# Skipping MacroDefinition: RSIZE_MAX ( SIZE_MAX >> 1 ) #

# const WCHAR_MAX = __WCHAR_MAX__

# Skipping MacroDefinition: WCHAR_MIN ( - WCHAR_MAX - 1 ) #

const WINT_MIN = INT32_MIN
const WINT_MAX = INT32_MAX
const SIG_ATOMIC_MIN = INT32_MIN
const SIG_ATOMIC_MAX = INT32_MAX

# Skipping MacroDefinition: INT8_C ( v ) ( v ) #
# Skipping MacroDefinition: INT16_C ( v ) ( v ) #
# Skipping MacroDefinition: INT32_C ( v ) ( v ) #
# Skipping MacroDefinition: INT64_C ( v ) ( v ## LL ) #
# Skipping MacroDefinition: UINT8_C ( v ) ( v ## U ) #
# Skipping MacroDefinition: UINT16_C ( v ) ( v ## U ) #
# Skipping MacroDefinition: UINT32_C ( v ) ( v ## U ) #
# Skipping MacroDefinition: UINT64_C ( v ) ( v ## ULL ) #
# Skipping MacroDefinition: INTMAX_C ( v ) ( v ## L ) #
# Skipping MacroDefinition: UINTMAX_C ( v ) ( v ## UL ) #

const laszip_DECOMPRESS_SELECTIVE_ALL = Float32(0x0fffffff)
const laszip_DECOMPRESS_SELECTIVE_CHANNEL_RETURNS_XY = 0x00000000
const laszip_DECOMPRESS_SELECTIVE_Z = 0x00000001
const laszip_DECOMPRESS_SELECTIVE_CLASSIFICATION = 0x00000002
const laszip_DECOMPRESS_SELECTIVE_FLAGS = 0x00000004
const laszip_DECOMPRESS_SELECTIVE_INTENSITY = 0x00000008
const laszip_DECOMPRESS_SELECTIVE_SCAN_ANGLE = 0x00000010
const laszip_DECOMPRESS_SELECTIVE_USER_DATA = 0x00000020
const laszip_DECOMPRESS_SELECTIVE_POINT_SOURCE = 0x00000040
const laszip_DECOMPRESS_SELECTIVE_GPS_TIME = 0x00000080
const laszip_DECOMPRESS_SELECTIVE_RGB = 0x00000100
const laszip_DECOMPRESS_SELECTIVE_NIR = 0x00000200
const laszip_DECOMPRESS_SELECTIVE_WAVEPACKET = 0x00000400
const laszip_DECOMPRESS_SELECTIVE_BYTE0 = 0x00010000
const laszip_DECOMPRESS_SELECTIVE_BYTE1 = 0x00020000
const laszip_DECOMPRESS_SELECTIVE_BYTE2 = 0x00040000
const laszip_DECOMPRESS_SELECTIVE_BYTE3 = 0x00080000
const laszip_DECOMPRESS_SELECTIVE_BYTE4 = 0x00100000
const laszip_DECOMPRESS_SELECTIVE_BYTE5 = 0x00200000
const laszip_DECOMPRESS_SELECTIVE_BYTE6 = 0x00400000
const laszip_DECOMPRESS_SELECTIVE_BYTE7 = 0x00800000
const laszip_DECOMPRESS_SELECTIVE_EXTRA_BYTES = 0xfff00000

mutable struct _opaque_pthread_attr_t
    __sig::Clong
    __opaque::NTuple{56, UInt8}
end

mutable struct _opaque_pthread_cond_t
    __sig::Clong
    __opaque::NTuple{40, UInt8}
end

mutable struct _opaque_pthread_condattr_t
    __sig::Clong
    __opaque::NTuple{8, UInt8}
end

mutable struct _opaque_pthread_mutex_t
    __sig::Clong
    __opaque::NTuple{56, UInt8}
end

mutable struct _opaque_pthread_mutexattr_t
    __sig::Clong
    __opaque::NTuple{8, UInt8}
end

mutable struct _opaque_pthread_once_t
    __sig::Clong
    __opaque::NTuple{8, UInt8}
end

mutable struct _opaque_pthread_rwlock_t
    __sig::Clong
    __opaque::NTuple{192, UInt8}
end

mutable struct _opaque_pthread_rwlockattr_t
    __sig::Clong
    __opaque::NTuple{16, UInt8}
end

mutable struct _opaque_pthread_t
    __sig::Clong
    __cleanup_stack::Ptr{Void}
    __opaque::NTuple{8176, UInt8}
end

const __darwin_va_list = Cstring
const __darwin_off_t = Int64
const __darwin_size_t = Culong
const __darwin_ssize_t = Clong
const __darwin_intptr_t = Clong
const size_t = __darwin_size_t
const fpos_t = __darwin_off_t
const FILE = Void
const va_list = __darwin_va_list
const off_t = __darwin_off_t
const ssize_t = __darwin_ssize_t
const int8_t = UInt8
const int16_t = Int16
const int32_t = Cint
const int64_t = Clonglong
const uint8_t = Cuchar
const uint16_t = UInt16
const uint32_t = UInt32
const uint64_t = Culonglong
const int_least8_t = Int8
const int_least16_t = Int16
const int_least32_t = Int32
const int_least64_t = Int64
const uint_least8_t = UInt8
const uint_least16_t = UInt16
const uint_least32_t = UInt32
const uint_least64_t = UInt64
const int_fast8_t = Int8
const int_fast16_t = Int16
const int_fast32_t = Int32
const int_fast64_t = Int64
const uint_fast8_t = UInt8
const uint_fast16_t = UInt16
const uint_fast32_t = UInt32
const uint_fast64_t = UInt64
const intptr_t = __darwin_intptr_t
const uintptr_t = Culong
const intmax_t = Clong
const uintmax_t = Culong
const laszip_BOOL = Cint
const laszip_U8 = UInt8
const laszip_U16 = UInt16
const laszip_U32 = UInt32
const laszip_U64 = UInt64
const laszip_I8 = Int8
const laszip_I16 = Int16
const laszip_I32 = Int32
const laszip_I64 = Int64
const laszip_CHAR = UInt8
const laszip_F32 = Cfloat
const laszip_F64 = Cdouble
const laszip_POINTER = Ptr{Void}

@with_kw mutable struct laszip_geokey
    key_id::laszip_U16 = laszip_U16(0)
    tiff_tag_location::laszip_U16 = laszip_U16(0)
    count::laszip_U16 = laszip_U16(0)
    value_offset::laszip_U16 = laszip_U16(0)
end

const laszip_geokey_struct = Void

@with_kw mutable struct laszip_vlr
    reserved::laszip_U16 = laszip_U16(0)
    user_id::NTuple{16, laszip_CHAR} = ntuple(i -> laszip_CHAR(0x0), 16)
    record_id::laszip_U16 = laszip_U16(0)
    record_length_after_header::laszip_U16 = laszip_U16(0)
    description::NTuple{32, laszip_CHAR} = ntuple(i -> laszip_CHAR(0x0), 32)
    data::Ptr{laszip_U8} = pointer("")
end

const laszip_vlr_struct = Void

@with_kw mutable struct laszip_header
    file_source_ID::laszip_U16 = laszip_U16(0)
    global_encoding::laszip_U16 = laszip_U16(0)
    project_ID_GUID_data_1::laszip_U32 = laszip_U32(0)
    project_ID_GUID_data_2::laszip_U16 = laszip_U16(0)
    project_ID_GUID_data_3::laszip_U16 = laszip_U16(0)
    project_ID_GUID_data_4::NTuple{8, laszip_CHAR} = ntuple(i -> laszip_CHAR(20), 8)
    # project_ID_GUID_data_4::Array{laszip_CHAR, 1} = Array{laszip_CHAR, 1}(zeros(0, 8))
    version_major::laszip_U8 = laszip_U8(0)
    version_minor::laszip_U8 = laszip_U8(0)
    system_identifier::NTuple{32, laszip_CHAR} = ntuple(i -> laszip_CHAR(20), 32)
    # system_identifier::Array{laszip_CHAR} = Array{laszip_CHAR}(32)
    generating_software::NTuple{32, laszip_CHAR} = ntuple(i -> laszip_CHAR(20), 32)
    # generating_software::Array{laszip_CHAR, 1} = Array{laszip_CHAR, 1}(zeros(0, 32))
    file_creation_day::laszip_U16 = laszip_U16(0)
    file_creation_year::laszip_U16 = laszip_U16(0)
    header_size::laszip_U16 = laszip_U16(0)
    offset_to_point_data::laszip_U32 = laszip_U32(0)
    number_of_variable_length_records::laszip_U32 = laszip_U32(0)
    point_data_format::laszip_U8 = laszip_U8(0)
    point_data_record_length::laszip_U16 = laszip_U16(0)
    number_of_point_records::laszip_U32 = laszip_U32(0)
    number_of_points_by_return::NTuple{5, laszip_U32} = ntuple(i -> laszip_U32(0), 5)
    # number_of_points_by_return::Array{laszip_U32, 1} = Array{laszip_U32, 1}(zeros(0, 5))
    x_scale_factor::laszip_F64 = laszip_F64(0.0)
    y_scale_factor::laszip_F64 = laszip_F64(0.0)
    z_scale_factor::laszip_F64 = laszip_F64(0.0)
    x_offset::laszip_F64 = laszip_F64(0.0)
    y_offset::laszip_F64 = laszip_F64(0.0)
    z_offset::laszip_F64 = laszip_F64(0.0)
    max_x::laszip_F64 = laszip_F64(0.0)
    min_x::laszip_F64 = laszip_F64(0.0)
    max_y::laszip_F64 = laszip_F64(0.0)
    min_y::laszip_F64 = laszip_F64(0.0)
    max_z::laszip_F64 = laszip_F64(0.0)
    min_z::laszip_F64 = laszip_F64(0.0)
    start_of_waveform_data_packet_record::laszip_U64  = laszip_U64(0.0)
    start_of_first_extended_variable_length_record::laszip_U64 = laszip_U64(0.0)
    number_of_extended_variable_length_records::laszip_U32 = laszip_U32(0)
    extended_number_of_point_records::laszip_U64 = laszip_U64(0.0)
    extended_number_of_points_by_return::NTuple{15, laszip_U64} = ntuple(i -> laszip_U64(0), 15)
    # extended_number_of_points_by_return::Array{laszip_U64, 1} = Array{laszip_U64, 1}(zeros(0, 15))
    user_data_in_header_size::laszip_U32 = laszip_U32(0)
    user_data_in_header::Ptr{laszip_U8} = pointer("")
    vlrs::Ptr{laszip_vlr_struct} = pointer("")
    user_data_after_header_size::laszip_U32 = laszip_U32(0)
    user_data_after_header::Ptr{laszip_U8} = pointer("")
end

const laszip_header_struct = Void

@with_kw mutable struct laszip_point
    X::laszip_I32 = laszip_I32(0)
    Y::laszip_I32 = laszip_I32(0)
    Z::laszip_I32 = laszip_I32(0)
    intensity::laszip_U16 = laszip_U16(0)
    return_number::laszip_U8 = laszip_U8(0)
    number_of_returns::laszip_U8 = laszip_U8(0)
    scan_direction_flag::laszip_U8 = laszip_U8(0)
    edge_of_flight_line::laszip_U8 = laszip_U8(0)
    classification::laszip_U8 = laszip_U8(0)
    synthetic_flag::laszip_U8 = laszip_U8(0)
    keypoint_flag::laszip_U8 = laszip_U8(0)
    withheld_flag::laszip_U8 = laszip_U8(0)
    scan_angle_rank::laszip_I8 = laszip_I8(0)
    user_data::laszip_U8 = laszip_U8(0)
    point_source_ID::laszip_U16 = laszip_U16(0)
    extended_scan_angle::laszip_I16 = laszip_I16(0)
    extended_point_type::laszip_U8 = laszip_U8(0)
    extended_scanner_channel::laszip_U8 = laszip_U8(0)
    extended_classification_flags::laszip_U8 = laszip_U8(0)
    extended_classification::laszip_U8 = laszip_U8(0)
    extended_return_number::laszip_U8 = laszip_U8(0)
    extended_number_of_returns::laszip_U8 = laszip_U8(0)
    dummy::NTuple{7, laszip_U8} = ntuple(i -> laszip_U8(0), 7)
    gps_time::laszip_F64 = laszip_F64(0.0)
    rgb::NTuple{4, laszip_U16} = ntuple(i -> laszip_U16(0), 4)
    wave_packet::NTuple{29, laszip_U8} = ntuple(i -> laszip_U8(0), 29)
    num_extra_bytes::laszip_I32 = laszip_I32(0)
    extra_bytes::Ptr{laszip_U8} = pointer("")
end

const laszip_point_struct = Void
# laszip_point()
# laszip_header()