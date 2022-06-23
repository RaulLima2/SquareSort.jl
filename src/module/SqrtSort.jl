using Random

using DataStructures

include("JuntarSqrtSort.jl")
include("ParticionarSqrtSort.jl")

function sqrtSort(vetor::Vector{Int64}) where {Int64}
    tamanho_vetor::Int64 = 0
    enesima_particao::Int64 = 0
    tamanho_particao::Int64 = 0
    vetor_solucao::Vector{Int64} = Vector{Int64}(undef,0)
    vetor_particionado::Vector{Vector{Int64}} = Vector{Vector{Int64}}(undef, 0)

    tamanho_vetor = length(vetor)
    tamanho_particao = Int(trunc(sqrt(tamanho_vetor)))
    enesima_particao = rem(tamanho_vetor, tamanho_particao)
    
        
    vetor_particionado = ParticionarSqrtSort.particionar(
            enesima_particao,
            tamanho_particao,
            tamanho_vetor, 
            vetor,
            vetor_particionado
    )
    
    JuntarSqrtSort.juntar(
        tamanho_vetor,
        vetor_solucao,
        vetor_particionado
    )
    
    return vetor_solucao
end

function sqrtSort!(vetor::Vector{Int64}) where {Int64}
    tamanho_vetor::Int64 = 0
    enesima_particao::Int64 = 0
    tamanho_particao::Int64 = 0
    vetor_solucao::Vector{Int64} = []
    binary_maxheap::BinaryMaxHeap{Vector{Int64}} = BinaryMaxHeap{Vector{Int64}}()

    tamanho_vetor = length(vetor)
    tamanho_particao = Int(trunc(sqrt(tamanho_vetor)))
    enesima_particao = rem(tamanho_vetor, tamanho_particao)
    
    # Particiona o vetor original e ordena com HeapSort
    ParticionarSqrtSort.particionar!(
        enesima_particao,
        tamanho_particao,
        tamanho_vetor, 
        vetor,
        binary_maxheap
    )

    JuntarSqrtSort.juntar!(
        tamanho_vetor,
        vetor_solucao,
        binary_maxheap
    )

    return vetor_solucao
end
