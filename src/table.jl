using Tables

Tables.istable(::Type{<:LazDataset}) = true
Tables.rowaccess(::Type{<:LazDataset}) = true
Tables.rows(ds::LazDataset) = ds
# TODO Only support fields that are there based on las version
Tables.schema(ds::LazDataset) = Tables.Schema(map(Symbol, fieldnames(LazIO.LazPoint)), Tuple{fieldtypes(LazIO.LazPoint)...})

const column_names = (fieldnames(LazPoint)..., :number_of_returns)


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
function Base.setproperty!(p::LazPoint, name, value, header)
    if name == :X && typeof(value) != Int32
        p.X = round(Int32, (value - header.x_offset) / header.x_scale_factor)
    elseif name == :Y && typeof(value) != Int32
        p.Y = round(Int32, (value - header.y_offset) / header.y_scale_factor)
    elseif name == :Z && typeof(value) != Int32
        p.Z = round(Int32, (value - header.z_offset) / header.z_scale_factor)
    elseif name == :classification && typeof(value) != UInt8
        classid = get(classes, Symbol(value), user_defined_class)
        p.classification = UInt8(LasIO.withheld(p)) << 7 | UInt8(LasIO.key_point(p)) << 6 | UInt8(LasIO.synthetic(p)) << 5 | UInt8(classid)
    elseif name == :gps_time && typeof(value) != Float64
        p.gps_time = LasIO.gps_time(value)
    elseif name == :return_number
        p.return_number = UInt8(LasIO.edge_of_flight_line(p)) << 7 | UInt8(LasIO.scan_direction(p)) << 6 | LasIO.number_of_returns(p) << 3 | UInt8(value)
    elseif name == :number_of_returns
        p.return_number = UInt8(LasIO.edge_of_flight_line(p)) << 7 | UInt8(LasIO.scan_direction(p)) << 6 | UInt8(value) << 3 | LasIO.return_number(p)
    else
        setproperty!(p, name, value)
    end
end

function write(fn::AbstractString, table, bbox; scale=0.01, kwargs...)

    schema = Tables.schema(table)
    isnothing(schema) && error("A Schema is required")
    all(name in column_names for name in schema.names) || error("Can't map all columns to LazPoint")

    rows = Tables.rows(table)

    header = LazHeader(;kwargs...)
    header.x_offset = determine_offset(bbox.min_x, bbox.max_x, scale)
    header.y_offset = determine_offset(bbox.min_y, bbox.max_y, scale)
    header.z_offset = determine_offset(bbox.min_z, bbox.max_z, scale)
    header.x_scale_factor = scale
    header.y_scale_factor = scale
    header.z_scale_factor = scale

    p = LazPoint()

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
