@setup_workload begin
    table = (geometry=[(1.0, 1.0, 1.0), (2.0, 2.0, 2.0)], intensity=UInt16[1, 2], classification=UInt8[2, 2])
    bbox = (min_x=1.0, max_x=2.0, min_y=1.0, max_y=2.0, min_z=1.0, max_z=2.0)
    @compile_workload begin
        mktempdir() do dir
            fn = joinpath(dir, "precompile.laz")
            write(fn, table, bbox)
            ds = open(fn)
            collect(ds)
            close(ds)
        end
    end
end
