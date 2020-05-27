using Test
using LazIO

@testset "Conversion" begin
    # test with maximum fields where applicable
    lazp = LazIO.LazPoint(
        X = Int32(5000),
        Y = Int32(6000),
        Z = Int32(7000),
        intensity = UInt16(65535),

        # Evil types
        # U8 return_number : 3;
        # U8 number_of_returns : 3;
        # U8 scan_direction_flag : 1;
        # U8 edge_of_flight_line : 1;  8
        # U8 classification : 5;
        # U8 synthetic_flag : 1;
        # U8 keypoint_flag  : 1;
        # U8 withheld_flag : 1;      8
        return_number = UInt8(255),
        # number_of_returns = UInt8(0),
        # scan_direction_flag = UInt8(0),
        # edge_of_flight_line = UInt8(0),
        classification = UInt8(255),
        # synthetic_flag = UInt8(0),
        # keypoint_flag = UInt8(0),
        # withheld_flag = UInt8(0),
        scan_angle_rank = Int8(127),
        user_data = UInt8(255),
        point_source_ID = UInt16(65535),


        # Another evil type
        # I16 extended_scan_angle;
        # U8 extended_point_type : 2;
        # U8 extended_scanner_channel : 2;
        # U8 extended_classification_flags : 4;  8
        # U8 extended_classification;
        # U8 extended_return_number : 4;
        # U8 extended_number_of_returns : 4;  8
        extended_scan_angle = Int16(32767),
        extended_point_type = UInt8(255),
        # extended_scanner_channel = UInt8(0),
        # extended_classification_flags = UInt8(0),
        extended_classification = UInt8(255),
        extended_return_number = UInt8(25),
        # extended_number_of_returns = UInt8(0),
        dummy = ntuple(i->UInt8(255), 7),
        gps_time = Float64(8791823.25),
        rgb = ntuple(i->UInt16(65535), 4),
        wave_packet = ntuple(i->UInt8(255), 29),
        num_extra_bytes = Int32(24244),
        extra_bytes = pointer("")
    )

    las0 = convert(LazIO.LasPoint0, lazp)
    las1 = convert(LazIO.LasPoint1, lazp)
    las2 = convert(LazIO.LasPoint2, lazp)
    las3 = convert(LazIO.LasPoint3, lazp)

    # test with all zero fields
    lazp = LazIO.LazPoint()
    las0 = convert(LazIO.LasPoint0, lazp)
    las1 = convert(LazIO.LasPoint1, lazp)
    las2 = convert(LazIO.LasPoint2, lazp)
    las3 = convert(LazIO.LasPoint3, lazp)

end
