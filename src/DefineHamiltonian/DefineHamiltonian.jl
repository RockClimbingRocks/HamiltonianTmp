
include("2pointOperator/SYK2.jl");
include("2pointOperator/SYK2LOC.jl");
include("4pointOperator/SYK4.jl");
include("4pointOperator/SYK4LOC_CM.jl");
include("4pointOperator/SYK4LOC_MINMAX.jl");
include("4pointOperator/SYK4LOC_ROK.jl");


getFunctionToDefineModel = Dict{String, Function}(
    "SYK2" => Define_SYK2,
    "SYK2LOC" => Define_SYK2LOC,
    "SYK4" => Define_SYK4,
    "SYK4LOC_CM" => Define_SYK4LOC_CM,
    "SYK4LOC_MINMAX" => Define_SYK4LOC_MINMAX,
    "SYK4LOC_ROK" => Define_SYK4LOC_ROK
)

function DefineHamiltonian(typeInString:: String, L::Int64, S::Float64; kwargs:: Dict{Symbol, Float64})
    Define:: Function = getFunctionToDefineModel[typeInString];

    return Define(L, S; kwargs...);
end

