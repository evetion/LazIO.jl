# Automatically generated using Clang.jl wrap_c, version 0.0.0

using Compat
using Parameters

# TODO wrap these into enums and change corresponding type signature to expect enum

const RENAME_SECLUDE = 0x00000001
const RENAME_SWAP = 0x00000002
const RENAME_EXCL = 0x00000004

const SEEK_SET = 0
const SEEK_CUR = 1
const SEEK_END = 2

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

# TODO just use the julia types directly?
const laszip_BOOL = Cint
const laszip_CHAR = UInt8

# TODO check if we can just use LasIO.LasVariableLengthRecord
@with_kw mutable struct VariableLengthRecord
    reserved::UInt16 = UInt16(0)
    user_id::NTuple{16, laszip_CHAR} = ntuple(i -> laszip_CHAR(0x0), 16)
    record_id::UInt16 = UInt16(0)
    record_length_after_header::UInt16 = UInt16(0)
    description::NTuple{32, laszip_CHAR} = ntuple(i -> laszip_CHAR(0x0), 32)
    data::Ptr{UInt8} = C_NULL
end

@with_kw mutable struct Header
    file_source_ID::UInt16 = UInt16(0)
    global_encoding::UInt16 = UInt16(0)
    project_ID_GUID_data_1::UInt32 = UInt32(0)
    project_ID_GUID_data_2::UInt16 = UInt16(0)
    project_ID_GUID_data_3::UInt16 = UInt16(0)
    project_ID_GUID_data_4::NTuple{8, laszip_CHAR} = ntuple(i -> laszip_CHAR(20), 8)
    version_major::UInt8 = UInt8(0)
    version_minor::UInt8 = UInt8(0)
    system_identifier::NTuple{32, laszip_CHAR} = ntuple(i -> laszip_CHAR(20), 32)
    generating_software::NTuple{32, laszip_CHAR} = ntuple(i -> laszip_CHAR(20), 32)
    file_creation_day::UInt16 = UInt16(0)
    file_creation_year::UInt16 = UInt16(0)
    header_size::UInt16 = UInt16(0)
    offset_to_point_data::UInt32 = UInt32(0)
    number_of_variable_length_records::UInt32 = UInt32(0)
    point_data_format::UInt8 = UInt8(0)
    point_data_record_length::UInt16 = UInt16(0)
    number_of_point_records::UInt32 = UInt32(0)
    number_of_points_by_return::NTuple{5, UInt32} = ntuple(i -> UInt32(0), 5)
    x_scale_factor::Float64 = Float64(0.0)
    y_scale_factor::Float64 = Float64(0.0)
    z_scale_factor::Float64 = Float64(0.0)
    x_offset::Float64 = Float64(0.0)
    y_offset::Float64 = Float64(0.0)
    z_offset::Float64 = Float64(0.0)
    max_x::Float64 = Float64(0.0)
    min_x::Float64 = Float64(0.0)
    max_y::Float64 = Float64(0.0)
    min_y::Float64 = Float64(0.0)
    max_z::Float64 = Float64(0.0)
    min_z::Float64 = Float64(0.0)
    start_of_waveform_data_packet_record::UInt64  = UInt64(0.0)
    start_of_first_extended_variable_length_record::UInt64 = UInt64(0.0)
    number_of_extended_variable_length_records::UInt32 = UInt32(0)
    extended_number_of_point_records::UInt64 = UInt64(0.0)
    extended_number_of_points_by_return::NTuple{15, UInt64} = ntuple(i -> UInt64(0), 15)
    user_data_in_header_size::UInt32 = UInt32(0)
    user_data_in_header::Ptr{UInt8} = C_NULL
    vlrs::Ptr{Void} = C_NULL
    user_data_after_header_size::UInt32 = UInt32(0)
    user_data_after_header::Ptr{UInt8} = C_NULL
end

# TODO better to use immutable?
@with_kw mutable struct Point
    X::Int32 = Int32(0)
    Y::Int32 = Int32(0)
    Z::Int32 = Int32(0)
    intensity::UInt16 = UInt16(0)
    return_number::UInt8 = UInt8(0)
    number_of_returns::UInt8 = UInt8(0)
    scan_direction_flag::UInt8 = UInt8(0)
    edge_of_flight_line::UInt8 = UInt8(0)
    classification::UInt8 = UInt8(0)
    synthetic_flag::UInt8 = UInt8(0)
    keypoint_flag::UInt8 = UInt8(0)
    withheld_flag::UInt8 = UInt8(0)
    scan_angle_rank::Int8 = Int8(0)
    user_data::UInt8 = UInt8(0)
    point_source_ID::UInt16 = UInt16(0)
    extended_scan_angle::Int16 = Int16(0)
    extended_point_type::UInt8 = UInt8(0)
    extended_scanner_channel::UInt8 = UInt8(0)
    extended_classification_flags::UInt8 = UInt8(0)
    extended_classification::UInt8 = UInt8(0)
    extended_return_number::UInt8 = UInt8(0)
    extended_number_of_returns::UInt8 = UInt8(0)
    dummy::NTuple{7, UInt8} = ntuple(i -> UInt8(0), 7)
    gps_time::Float64 = Float64(0.0)
    rgb::NTuple{4, UInt16} = ntuple(i -> UInt16(0), 4)
    wave_packet::NTuple{29, UInt8} = ntuple(i -> UInt8(0), 29)
    num_extra_bytes::Int32 = Int32(0)
    extra_bytes::Ptr{UInt8} = C_NULL
end
