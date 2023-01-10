abstract type Point end
struct Point0 <: Point
    geometry::SVector{3,Float64}
    intensity::UInt16
    return_number::UInt8
    number_of_returns::UInt8
    scan_direction::UInt8
    edge_of_flight_line::Bool
    classification::Int8
    synthetic::Bool
    key_point::Bool
    withheld::Bool
    user_data::UInt8
    point_source_id::UInt16
end

function Point0(rp, am)
    Point0(
        am((rp.X, rp.Y, rp.Z)), rp.intensity,
        return_number(rp),
        number_of_returns(rp),
        scan_direction(rp),
        edge_of_flight_line(rp),
        classification(rp),
        synthetic(rp),
        key_point(rp),
        withheld(rp),
        rp.user_data, rp.point_source_ID
    )
end

struct Point1 <: Point
    geometry::SVector{3,Float64}
    intensity::UInt16
    return_number::UInt8
    number_of_returns::UInt8
    scan_direction::UInt8
    edge_of_flight_line::Bool
    classification::Int8
    synthetic::Bool
    key_point::Bool
    withheld::Bool
    user_data::UInt8
    point_source_id::UInt16
    gps_time::Dates.DateTime
end

function Point1(rp, am)
    Point1(
        am((rp.X, rp.Y, rp.Z)), rp.intensity,
        return_number(rp),
        number_of_returns(rp),
        scan_direction(rp),
        edge_of_flight_line(rp),
        classification(rp),
        synthetic(rp),
        key_point(rp),
        withheld(rp),
        rp.user_data, rp.point_source_ID,
        Dates.DateTime(rp)
    )
end

struct Point2 <: Point
    geometry::SVector{3,Float64}
    intensity::UInt16
    return_number::UInt8
    number_of_returns::UInt8
    scan_direction::UInt8
    edge_of_flight_line::Bool
    classification::Int8
    synthetic::Bool
    key_point::Bool
    withheld::Bool
    user_data::UInt8
    point_source_id::UInt16
    r::N0f16
    g::N0f16
    b::N0f16
end

function Point2(rp, am)
    Point2(
        am((rp.X, rp.Y, rp.Z)), rp.intensity,
        return_number(rp),
        number_of_returns(rp),
        scan_direction(rp),
        edge_of_flight_line(rp),
        classification(rp),
        synthetic(rp),
        key_point(rp),
        withheld(rp),
        rp.user_data, rp.point_source_ID,
        reinterpret(N0f16, rp.rgb[1]),
        reinterpret(N0f16, rp.rgb[2]),
        reinterpret(N0f16, rp.rgb[3])
    )
end


struct Point3 <: Point
    geometry::SVector{3,Float64}
    intensity::UInt16
    return_number::UInt8
    number_of_returns::UInt8
    scan_direction::UInt8
    edge_of_flight_line::Bool
    classification::Int8
    synthetic::Bool
    key_point::Bool
    withheld::Bool
    user_data::UInt8
    point_source_id::UInt16
    gps_time::Dates.DateTime
    r::N0f16
    g::N0f16
    b::N0f16
end

function Point3(rp, am)
    Point3(
        am((rp.X, rp.Y, rp.Z)), rp.intensity,
        return_number(rp),
        number_of_returns(rp),
        scan_direction(rp),
        edge_of_flight_line(rp),
        classification(rp),
        synthetic(rp),
        key_point(rp),
        withheld(rp),
        rp.user_data, rp.point_source_ID,
        Dates.DateTime(rp),
        reinterpret(N0f16, rp.rgb[1]),
        reinterpret(N0f16, rp.rgb[2]),
        reinterpret(N0f16, rp.rgb[3])
    )
end
