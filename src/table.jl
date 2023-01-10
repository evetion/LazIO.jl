using Tables

Tables.istable(::Type{<:Dataset}) = true
Tables.rowaccess(::Type{<:Dataset}) = true
Tables.rows(ds::Dataset) = ds
# TODO Only support fields that are there based on las version
Tables.schema(ds::Dataset) = Tables.Schema(map(Symbol, fieldnames(eltype(ds))), Tuple{fieldtypes(eltype(ds))...})

const column_names = fieldnames(Point3)


"""Determine offset as implemented by LasTools."""
function determine_offset(min_value, max_value, scale; threshold=10^7)
    s = round(Int64, ((min_value + max_value) / 2) / scale / threshold)
    s *= threshold * scale
    # Try to convert back and forth and check overflow
    (muladd(round(Int32, (min_value - s) / scale), scale, s) > 0) == (min_value > 0) || error("Can't fit offset for min with this scale, try to coarsen it.")
    (muladd(round(Int32, (max_value - s) / scale), scale, s) > 0) == (max_value > 0) || error("Can't fit offset for max with this scale, try to coarsen it.")
    s
end

"""Correctly set fields that require conversion or packing."""
function Base.setproperty!(p::RawPoint, name, value, header)
    if name == :x && typeof(value) != Int32
        p.X = round(Int32, (value - header.x_offset) / header.x_scale_factor)
    elseif name == :y && typeof(value) != Int32
        p.Y = round(Int32, (value - header.y_offset) / header.y_scale_factor)
    elseif name == :z && typeof(value) != Int32
        p.Z = round(Int32, (value - header.z_offset) / header.z_scale_factor)
    elseif name == :classification && typeof(value) != UInt8
        classid = get(classes, Symbol(value), user_defined_class)
        p.classification = UInt8(LasIO.withheld(p)) << 7 | UInt8(LasIO.key_point(p)) << 6 | UInt8(LasIO.synthetic(p)) << 5 | UInt8(classid)
    elseif name == :withheld
        p.classification = UInt8(value) << 7 | UInt8(LasIO.key_point(p)) << 6 | UInt8(LasIO.synthetic(p)) << 5 | LasIO.classification(p)
    elseif name == :key_point
        p.classification = UInt8(LasIO.withheld(p)) << 7 | UInt8(value) << 6 | UInt8(LasIO.synthetic(p)) << 5 | LasIO.classification(p)
    elseif name == :synthetic
        p.classification = UInt8(LasIO.withheld(p)) << 7 | UInt8(LasIO.key_point(p)) << 6 | UInt8(value) << 5 | LasIO.classification(p)
    elseif name == :gps_time && typeof(value) != Float64
        p.gps_time = LasIO.gps_time(value)
    elseif name == :return_number
        p.return_number = UInt8(LasIO.edge_of_flight_line(p)) << 7 | UInt8(LasIO.scan_direction(p)) << 6 | LasIO.number_of_returns(p) << 3 | UInt8(value)
    elseif name == :number_of_returns
        p.return_number = UInt8(LasIO.edge_of_flight_line(p)) << 7 | UInt8(LasIO.scan_direction(p)) << 6 | UInt8(value) << 3 | LasIO.return_number(p)
    elseif name == :scan_direction
        p.return_number = UInt8(LasIO.edge_of_flight_line(p)) << 7 | UInt8(value) << 6 | LasIO.number_of_returns(p) << 3 | LasIO.return_number(p)
    elseif name == :edge_of_flight_line
        p.return_number = UInt8(value) << 7 | UInt8(LasIO.scan_direction(p)) << 6 | LasIO.number_of_returns(p) << 3 | LasIO.return_number(p)
    elseif name == :point_source_id
        p.point_source_ID = value
    else
        setproperty!(p, name, value)
    end
end

# TODO Implement GeoInterface
function write(fn::AbstractString, table, bbox; scalex=0.01, scaley=0.01, scalez=0.01, kwargs...)

    schema = Tables.schema(table)
    isnothing(schema) && error("A Schema is required")
    all(name in column_names for name in schema.names) || error("Can't map all columns to RawPoint")

    rows = Tables.rows(table)

    header = LazHeader(; kwargs...)
    header.x_offset = determine_offset(bbox.min_x, bbox.max_x, scalex)
    header.y_offset = determine_offset(bbox.min_y, bbox.max_y, scaley)
    header.z_offset = determine_offset(bbox.min_z, bbox.max_z, scalez)
    header.x_scale_factor = scalex
    header.y_scale_factor = scaley
    header.z_scale_factor = scalez

    p = RawPoint()

    LazIO.write(fn, header) do io
        for row in rows
            Tables.eachcolumn(schema, row) do value, i, name
                setproperty!(p, name, value, header)
            end
            LazIO.writepoint(io, p)
        end
    end
    fn
end
