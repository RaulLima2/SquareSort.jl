module JuntarSqrtSort

using DataStructures

@inline function juntar(tamanho_vetor::Int64, vetor_solucao::Vector{Int64}, vetor_particionado::Vector{Vector{Int64}})
    maximo::Int64 = 0
    indice_conjunto::Int64 = 0
    indice_particao::Int64 = 0
    @simd for _ = 1:tamanho_vetor # c n
        @simd for k in vetor_particionado # c n^0.5 de 1 até n
            if !isempty(k)
                @inbounds if maximo < k[length(k)] # c n^0.5
                    indice_particao = length(k) # c sum n^{5}
                    @inbounds maximo = k[indice_particao] #c 1
                    @inbounds indice_conjunto = findall(x->x==k, vetor_particionado)[1] # c n^0.5 - 1
                end
            end
        end
        @inbounds pushfirst!(vetor_solucao, maximo) # c n - 1
        if !isempty(vetor_particionado[indice_conjunto])
            @inbounds deleteat!(vetor_particionado[indice_conjunto], indice_particao) # c n - 1
        end
        maximo = -2^(63)
    end
    return vetor_solucao
end

function juntar!(tamanho_vetor::Int64, vetor_solucao::Vector{Int64}, particionado::BinaryMaxHeap{Vector{Int64}})
    maximo::Int64 = 0
    indice_particao::Int64 = 0
    particao_maximo::Vector{Int64} = []
    @simd for _ = 1:tamanho_vetor # c n
         @inbounds particao_maximo = pop!(particionado) # remocao do elemento mais alto da arvore binaria heap
        if !isempty(particao_maximo)
                @inbounds indice_particao = 1
                @inbounds maximo = particao_maximo[1]
                @inbounds deleteat!(particao_maximo, indice_particao)
                @inbounds push!(particionado, particao_maximo) # c n^0.5
        end
        @inbounds pushfirst!(vetor_solucao, maximo) # insercao do elemento mais alto da arvore binaria heap na solucao
    end
    return vetor_solucao
end

end