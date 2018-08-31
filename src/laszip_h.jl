# Automatically generated using Clang.jl wrap_c, version 0.0.0

using Compat
using Parameters

const __darwin_va_list = Cstring
const __darwin_off_t = Int64
const __darwin_size_t = Culong
const __darwin_ssize_t = Clong
const __darwin_intptr_t = Clong
const size_t = __darwin_size_t
const fpos_t = __darwin_off_t
const FILE = Nothing
const va_list = __darwin_va_list
const off_t = __darwin_off_t
const ssize_t = __darwin_ssize_t

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
const laszip_POINTER = Ptr{Nothing}

@with_kw mutable struct laszip_geokey
    key_id::laszip_U16 = laszip_U16(0)
    tiff_tag_location::laszip_U16 = laszip_U16(0)
    count::laszip_U16 = laszip_U16(0)
    value_offset::laszip_U16 = laszip_U16(0)
end

const laszip_geokey_struct = Nothing

@with_kw mutable struct laszip_vlr
    reserved::laszip_U16 = laszip_U16(0)
    user_id::NTuple{16, laszip_CHAR} = ntuple(i -> laszip_CHAR(0x0), 16)
    record_id::laszip_U16 = laszip_U16(0)
    record_length_after_header::laszip_U16 = laszip_U16(0)
    description::NTuple{32, laszip_CHAR} = ntuple(i -> laszip_CHAR(0x0), 32)
    data::Ptr{laszip_U8} = pointer("")
end

const laszip_vlr_struct = Nothing

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
    start_of_waveform_data_packet_record::laszip_U64  = laszip_U64(0)
    start_of_first_extended_variable_length_record::laszip_U64 = laszip_U64(0)
    number_of_extended_variable_length_records::laszip_U32 = laszip_U32(0)
    extended_number_of_point_records::laszip_U64 = laszip_U64(0)
    extended_number_of_points_by_return::NTuple{15, laszip_U64} = ntuple(i -> laszip_U64(0), 15)
    # extended_number_of_points_by_return::Array{laszip_U64, 1} = Array{laszip_U64, 1}(zeros(0, 15))
    user_data_in_header_size::laszip_U32 = laszip_U32(0)
    user_data_in_header::Ptr{laszip_U8} = pointer("")
    vlrs::Ptr{laszip_vlr_struct} = pointer("")
    user_data_after_header_size::laszip_U32 = laszip_U32(0)
    user_data_after_header::Ptr{laszip_U8} = pointer("")
end

const laszip_header_struct = Nothing

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

const laszip_point_struct = Nothing
