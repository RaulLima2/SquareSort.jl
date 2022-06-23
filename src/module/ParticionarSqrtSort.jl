module ParticionarSqrtSort

using DataStructures
using SortingAlgorithms

@inline function particionar(enesima_particao::Int64, tamanho_particao::Int64, tamanho_vetor::Int64, vetor::Vector{Int64}, vetor_particionado::Vector{Vector{Int64}})
    k::Int64 = 0
    j::Int64 = 0

    @simd for k = tamanho_particao:tamanho_particao:tamanho_vetor # c n^0.5
        @inbounds vetor[j+1:k] = sort(vetor[j + 1:k], alg=InsertionSort) # c sum n^0.5 até n + n
        @inbounds push!(vetor_particionado, vetor[j+1:k]) # c sum n^0.5 até n + n
        if (enesima_particao != 0 && k == tamanho_vetor - enesima_particao)
            @inbounds vetor[k+enesima_particao:k+enesima_particao] = sort(vetor[k + enesima_particao:k + enesima_particao], alg=InsertionSort) #c n mod n^0.5 + c
            @inbounds push!(vetor_particionado, vetor[k+enesima_particao:k+enesima_particao]) # c n mod n^0.5
        end
        j = k # c n^{0.5}
    end
    return vetor_particionado
end


@inline function particionar!(enesima_particao::Int64, tamanho_particao::Int64, tamanho_vetor::Int64, vetor::Vector{Int64}, particionado::BinaryMaxHeap{Vector{Int64}})
    k::Int64 = 0
    j::Int64 = 0
    @simd for k = tamanho_particao:tamanho_particao:tamanho_vetor 
        @inbounds vetor[j+1:k] = sort!(vetor[j+1:k], alg=HeapSort, rev=true)
        @inbounds push!(particionado, vetor[j+1:k])   
        if (enesima_particao != 0 && k == tamanho_vetor - enesima_particao)
            @inbounds vetor[k+enesima_particao:k+enesima_particao] = sort!(vetor[k+enesima_particao:k+enesima_particao], alg=HeapSort, rev=true)
            @inbounds push!(particionado, vetor[k+enesima_particao:k+enesima_particao])
        end
        j = k
    end
    return particionado
end

end