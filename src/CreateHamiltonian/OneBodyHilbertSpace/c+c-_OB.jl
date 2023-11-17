module c⁺c⁻_OB_create
    using SparseArrays;


    function Ĥ(L::Int64, t::Matrix{Float64}, isSparse:: Bool) 

        return isSparse ? sparse(t) : t;
    end
end
