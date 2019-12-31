using Tables

Tables.istable(::Type{<:LazDataset}) = true
Tables.rowaccess(::Type{<:LazDataset}) = true
Tables.rows(ds::LazDataset) = ds
Tables.schema(ds::LazDataset) = Tables.Schema(map(Symbol, fieldnames(LazIO.LazPoint)), Tuple{fieldtypes(LazIO.LazPoint)...})
