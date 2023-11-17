using Distributions;
# include("../../Params.jl");

function Define_SYK2LOC(L:: Int64, S:: Float64 = 1/2; a::Float64=0., b::Float64=1.)
    t = Array{Float64, 2}(undef, (L,L));
    for i=1:L, j=1:i
        t[i,j] = rand(Normal(0, 1)) / (1 + (abs(i-j)/b)^(2*a))^1/2;
        
        if i!=j
            t[j,i] = t[i,j];
        end
    end

    return ParamsH(L,S,t,@__MODULE__)
end
