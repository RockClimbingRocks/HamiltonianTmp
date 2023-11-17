using Distributions;
# include("../../Params.jl");


function Define_SYK4(L:: Int64, S:: Float64 = 1/2; )
    U = zeros(Float64, (L,L,L,L));

    for i=1:L, j=i+1:L, k=1:L, l=k+1:L
        if U[i,j,k,l] == 0 && i!=j && k!=L
            U[i,j,k,l] = rand(Normal(0, 1));
            U[j,i,l,k] = U[k,l,i,j] = U[l,k,j,i] = U[i,j,k,l];
            U[i,j,l,k] = U[j,i,k,l] = U[k,l,j,i] = U[l,k,i,j] = -U[i,j,k,l];
        end
    end
    
    return ParamsH(L,S,U, @__MODULE__);
end
