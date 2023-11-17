using Distributions;
# include("../../Params.jl");


function Define_SYK4LOC_CM(L:: Int64, S:: Float64; a::Float64=0., b::Float64=1.)
    U = zeros(Float64, (L,L,L,L))

    for i=1:L, j=i+1:L, k=1:L, l=k+1:L
        if U[i,j,k,l] == 0 && i!=j && k!=L
            rcm = (i+j+k+l)/4;
            r̄ = (abs(rcm-i) + abs(rcm-j) + abs(rcm-k) + abs(rcm-l))/4;

            U[i,j,k,l] = rand(Normal(0, 1)) / (1 + (r̄/b)^(2*a))^1/2;
            U[j,i,l,k] = U[k,l,i,j] = U[l,k,j,i] = U[i,j,k,l];
            U[i,j,l,k] = U[j,i,k,l] = U[k,l,j,i] = U[l,k,i,j] = -U[i,j,k,l];
        end
    end
    
    return ParamsH(L,S,U, @__MODULE__);
end
