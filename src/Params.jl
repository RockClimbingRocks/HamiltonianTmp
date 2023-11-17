struct ParamsH
    Type:: Module;
    L:: Int64;
    S:: Float64;
    U:: Array{Float64}; 
    
    function ParamsH(L:: Int64, S::Float64, U::Array{Float64}, type::Module)
        
        new(type,L,S,U);
    end
end
