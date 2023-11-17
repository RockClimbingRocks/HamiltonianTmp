
using SparseArrays;



function AnaliticalNormOfSYK2Averaged(L:: Int64, N::Int64 = Int(L÷2))
    if N==0 || N==L
        return 1.
    end
    norm = N * (L - N + 1 - N/L);
    # norm = L *(L + 1)/4 ;
    return √(norm);
end

function NumericalNormOfSYK2()
    
end


function GetSignOfOperatorPermutation(i, j, state)
    return isodd(sum(@view(state[i+1 : j-1]))) ? -1 : 1;
end


function sign(ket:: Int64, i:: Int64, j:: Int64, ket_fockSpace::Vector{Int})
    WriteStateInFockSpace!(ket, ket_fockSpace);
    # We need to reverse "ket_fockSpace" because program starts counting postions from left to right 
    reverse!(ket_fockSpace)

    sign = GetSignOfOperatorPermutation(i, j, ket_fockSpace);
    return sign;
end


function c⁺c⁻_create_(L::Int64, t::Matrix{Float64}, isSparse:: Bool) 
    N::Int64 =Int(L÷2)
    D::Int64 = binomial(L,N);

    c⁺ = GetMatrixRepresentationOfOperator("c⁺", isSparse);
    c = GetMatrixRepresentationOfOperator("c", isSparse);
    id = GetMatrixRepresentationOfOperator("id", isSparse);

    ind = IndecesOfSubBlock(L,N);

    rows = Vector{Int64}();
    cols = Vector{Int64}();
    vals = Vector{Float64}();

    tmp_storingVector = Vector{Int}(undef,L);

    # Hopping term
    cᵢ⁺cⱼ= fill(id, L); 
    for i=1:L, j=i:L
        t[L+1-i,L+1-j] ≈ 0 ? continue : nothing; 

        # Order of those products of operators is important so dont change it!
        cᵢ⁺cⱼ[i] *= c⁺;
        cᵢ⁺cⱼ[j] *= c;

        matrixElements = findall(x -> x==1, foldl(kron, cᵢ⁺cⱼ)[ind,ind] );  
        
        rows_ij = map(elm -> elm[1], matrixElements); 
        cols_ij = map(elm -> elm[2], matrixElements); 
        vals_ij = map(elm -> sign(ind[elm[2]]-1, i, j, tmp_storingVector)*t[L+1-i,L+1-j] , matrixElements); 

        append!(rows, i==j ? rows_ij : vcat(rows_ij, cols_ij));
        append!(cols, i==j ? cols_ij : vcat(cols_ij, rows_ij));
        append!(vals, i==j ? vals_ij : vcat(vals_ij, conj.(vals_ij)));

        cᵢ⁺cⱼ[i] = cᵢ⁺cⱼ[j] = id;
    end
    
    normalization = AnaliticalNormOfSYK2Averaged(L, N);
    vals ./= normalization

    return isSparse ? sparse(rows, cols, vals, D, D) : Matrix(sparse(rows, cols, vals, D, D));
end