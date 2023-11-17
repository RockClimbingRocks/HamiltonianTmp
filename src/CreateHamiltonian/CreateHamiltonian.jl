using SparseArrays;

include("ManyBodyHilbertSpace/c+c+c-c-.jl");
include("ManyBodyHilbertSpace/c+c-.jl");
include("../Params.jl");


function c⁺c⁺c⁻c⁻_create(model:: ParamsH, isSparse:: Bool)
    return  c⁺c⁺c⁻c⁻_create_(model.L, model.U, isSparse)
end

function c⁺c⁻_create(model:: ParamsH, isSparse:: Bool)
    return  c⁺c⁻_create_(model.L, model.U, isSparse)
end
