# Automatically generated using Clang.jl wrap_c, version 0.0.0

using Parameters

@with_kw mutable struct LazGeoKey
    key_id::UInt16 = UInt16(0)
    tiff_tag_location::UInt16 = UInt16(0)
    count::UInt16 = UInt16(0)
    value_offset::UInt16 = UInt16(0)
end

@with_kw mutable struct LazVLR
    reserved::UInt16 = UInt16(0)
    user_id::NTuple{16, UInt8} = ntuple(i -> UInt8(0x0), 16)
    record_id::UInt16 = UInt16(0)
    record_length_after_header::UInt16 = UInt16(0)
    description::NTuple{32, UInt8} = ntuple(i -> UInt8(0x0), 32)
    data::Ptr{UInt8} = pointer("")
end

@with_kw mutable struct LazHeader
    file_source_ID::UInt16 = UInt16(0)
    global_encoding::UInt16 = UInt16(0)
    project_ID_GUID_data_1::UInt32 = UInt32(0)
    project_ID_GUID_data_2::UInt16 = UInt16(0)
    project_ID_GUID_data_3::UInt16 = UInt16(0)
    project_ID_GUID_data_4::NTuple{8, UInt8} = ntuple(i -> UInt8(20), 8)
    # project_ID_GUID_data_4::Array{UInt8, 1} = Array{UInt8, 1}(zeros(0, 8))
    version_major::UInt8 = UInt8(0)
    version_minor::UInt8 = UInt8(0)
    system_identifier::NTuple{32, UInt8} = ntuple(i -> UInt8(20), 32)
    # system_identifier::Array{UInt8} = Array{UInt8}(32)
    generating_software::NTuple{32, UInt8} = ntuple(i -> UInt8(20), 32)
    # generating_software::Array{UInt8, 1} = Array{UInt8, 1}(zeros(0, 32))
    file_creation_day::UInt16 = UInt16(0)
    file_creation_year::UInt16 = UInt16(0)
    header_size::UInt16 = UInt16(0)
    offset_to_point_data::UInt32 = UInt32(0)
    number_of_variable_length_records::UInt32 = UInt32(0)
    point_data_format::UInt8 = UInt8(0)
    point_data_record_length::UInt16 = UInt16(0)
    number_of_point_records::UInt32 = UInt32(0)
    number_of_points_by_return::NTuple{5, UInt32} = ntuple(i -> UInt32(0), 5)
    # number_of_points_by_return::Array{UInt32, 1} = Array{UInt32, 1}(zeros(0, 5))
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
    start_of_waveform_data_packet_record::UInt64  = UInt64(0)
    start_of_first_extended_variable_length_record::UInt64 = UInt64(0)
    number_of_extended_variable_length_records::UInt32 = UInt32(0)
    extended_number_of_point_records::UInt64 = UInt64(0)
    extended_number_of_points_by_return::NTuple{15, UInt64} = ntuple(i -> UInt64(0), 15)
    # extended_number_of_points_by_return::Array{UInt64, 1} = Array{UInt64, 1}(zeros(0, 15))
    user_data_in_header_size::UInt32 = UInt32(0)
    user_data_in_header::Ptr{UInt8} = pointer("")
    vlrs::Ptr{Cvoid} = pointer("")
    user_data_after_header_size::UInt32 = UInt32(0)
    user_data_after_header::Ptr{UInt8} = pointer("")
end

@with_kw mutable struct LazPoint
    X::Int32 = Int32(0)
    Y::Int32 = Int32(0)
    Z::Int32 = Int32(0)
    intensity::UInt16 = UInt16(0)

    # Evil types
    # U8 return_number : 3;
    # U8 number_of_returns : 3;
    # U8 scan_direction_flag : 1;
    # U8 edge_of_flight_line : 1;  8
    # U8 classification : 5;
    # U8 synthetic_flag : 1;
    # U8 keypoint_flag  : 1;
    # U8 withheld_flag : 1;      8
    return_number::UInt8 = UInt8(0)
    # number_of_returns::UInt8 = UInt8(0)
    # scan_direction_flag::UInt8 = UInt8(0)
    # edge_of_flight_line::UInt8 = UInt8(0)
    classification::UInt8 = UInt8(0)
    # synthetic_flag::UInt8 = UInt8(0)
    # keypoint_flag::UInt8 = UInt8(0)
    # withheld_flag::UInt8 = UInt8(0)
    scan_angle_rank::Int8 = Int8(0)
    user_data::UInt8 = UInt8(0)
    point_source_ID::UInt16 = UInt16(0)


    # Another evil type
    # I16 extended_scan_angle;
    # U8 extended_point_type : 2;
    # U8 extended_scanner_channel : 2;
    # U8 extended_classification_flags : 4;  8
    # U8 extended_classification;
    # U8 extended_return_number : 4;
    # U8 extended_number_of_returns : 4;  8
    extended_scan_angle::Int16 = Int16(0)
    extended_point_type::UInt8 = UInt8(0)
    # extended_scanner_channel::UInt8 = UInt8(0)
    # extended_classification_flags::UInt8 = UInt8(0)
    extended_classification::UInt8 = UInt8(0)
    extended_return_number::UInt8 = UInt8(0)
    # extended_number_of_returns::UInt8 = UInt8(0)
    dummy::NTuple{7, UInt8} = ntuple(i -> UInt8(0), 7)
    gps_time::Float64 = Float64(0.0)
    rgb::NTuple{4, UInt16} = ntuple(i -> UInt16(0), 4)
    wave_packet::NTuple{29, UInt8} = ntuple(i -> UInt8(0), 29)
    num_extra_bytes::Int32 = Int32(0)
    extra_bytes::Ptr{UInt8} = pointer("")
end

return_number(p::LazIO.LazPoint) = (p.return_number & 0b00000111)
number_of_returns(p::LazIO.LazPoint) = (p.return_number & 0b00111000) >> 3
scan_direction(p::LazIO.LazPoint) = Bool((p.return_number & 0b01000000) >> 6)
edge_of_flight_line(p::LazIO.LazPoint) = Bool((p.return_number & 0b10000000) >> 7)
