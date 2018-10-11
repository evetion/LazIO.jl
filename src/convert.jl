# Here be all conversions from Laszip C Types to LasIO types

"Conversion to LasIO header"
LasHeader(h::LazHeader) =
    LasIO.LasHeader(
        h.file_source_ID,
        h.global_encoding,
        h.project_ID_GUID_data_1,
        h.project_ID_GUID_data_2,
        h.project_ID_GUID_data_3,
        join(convert(NTuple{8, Char}, h.project_ID_GUID_data_4)),
        h.version_major,
        h.version_minor,
        join(convert(NTuple{32, Char}, h.system_identifier)),
        join(convert(NTuple{32, Char}, h.generating_software)),
        h.file_creation_day,
        h.file_creation_year,
        h.header_size,
        h.offset_to_point_data,
        h.number_of_variable_length_records,
        h.point_data_format,
        h.point_data_record_length,
        h.number_of_point_records,
        [n for n in h.number_of_points_by_return],
        h.x_scale_factor,
        h.y_scale_factor,
        h.z_scale_factor,
        h.x_offset,
        h.y_offset,
        h.z_offset,
        h.max_x,
        h.min_x,
        h.max_y,
        h.min_y,
        h.max_z,
        h.min_z,
        Vector{LasVariableLengthRecord}(),
        Vector{UInt8}()
    )

"ASPRS LAS point data record format 0"
Base.convert(::Type{LasPoint0}, p::LazPoint) =
    LasPoint0(
        p.X,
        p.Y,
        p.Z,
        p.intensity,
        p.return_number,
        p.classification,
        p.scan_angle_rank,
        p.user_data,
        p.point_source_ID
    )

"ASPRS LAS point data record format 1"
Base.convert(::Type{LasPoint1}, p::LazPoint) =
    LasPoint1(
        p.X,
        p.Y,
        p.Z,
        p.intensity,
        p.return_number,
        p.classification,
        p.scan_angle_rank,
        p.user_data,
        p.point_source_ID,
        p.gps_time
    )

"ASPRS LAS point data record format 2"
Base.convert(::Type{LasPoint2}, p::LazPoint) =
    LasPoint2(
        p.X,
        p.Y,
        p.Z,
        p.intensity,
        p.return_number,
        p.classification,
        p.scan_angle_rank,
        p.user_data,
        p.point_source_ID,
        p.rgb[1],
        p.rgb[2],
        p.rgb[3]
    )

"ASPRS LAS point data record format 3"
Base.convert(::Type{LasPoint3}, p::LazPoint) =
    LasPoint3(
        p.X,
        p.Y,
        p.Z,
        p.intensity,
        p.return_number,
        p.classification,
        p.scan_angle_rank,
        p.user_data,
        p.point_source_ID,
        p.gps_time,
        p.rgb[1],
        p.rgb[2],
        p.rgb[3]
    )
