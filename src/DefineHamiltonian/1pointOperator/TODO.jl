# module SYK2
# using Distributions;

# include("../Params.jl");
# using .Params;


# function DefineIt(L:: Int64, S::Float64; )
#     t = Array{Float64, 2}(undef, (L,L));
#     for i=1:L, j=1:i
#         t[i,j] = rand(Normal(0, 1));
        
#         if i!=j
#             t[j,i] = t[i,j];
#         end
#     end

#     return Params.PO2(L,S,t,@__MODULE__)
# end


# end



