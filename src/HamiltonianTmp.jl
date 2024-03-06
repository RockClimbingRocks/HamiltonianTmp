module HamiltonianTmp

using SparseArrays;
include("CreateHamiltonian/CreateHamiltonian.jl");
include("DefineHamiltonian/DefineHamiltonian.jl");
include("CreateHamiltonian/FermionAlgebra.jl");


export c⁺c⁺c⁻c⁻, c⁺c⁻, DefineH;

function hello()
    return "hello world"
end


function c⁺c⁺c⁻c⁻(model:: ParamsH, isSparse:: Bool = true)
    return  c⁺c⁺c⁻c⁻_create(model, isSparse)
end

function c⁺c⁻(model:: ParamsH, isSparse:: Bool = true)
    return  c⁺c⁻_create(model, isSparse)
end



function DefineH(typeInString:: String, L::Int64, S::Float64 = 1/2; kwargs:: Dict{Symbol, Float64})
    return DefineHamiltonian(typeInString, L, S; kwargs)
end


end # module Hamiltonian

