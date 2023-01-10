abstract type Point end
struct Point0 <: Point
    x::Float64
    y::Float64
    z::Float64
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
    x, y, z = am((rp.X, rp.Y, rp.Z))
    Point0(
        x, y, z, rp.intensity,
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
    x::Float64
    y::Float64
    z::Float64
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
    x, y, z = am((rp.X, rp.Y, rp.Z))
    Point1(
        x, y, z, rp.intensity,
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
    x::Float64
    y::Float64
    z::Float64
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
    x, y, z = am((rp.X, rp.Y, rp.Z))
    Point2(
        x, y, z, rp.intensity,
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
    x::Float64
    y::Float64
    z::Float64
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
    x, y, z = am((rp.X, rp.Y, rp.Z))
    Point3(
        x, y, z, rp.intensity,
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
