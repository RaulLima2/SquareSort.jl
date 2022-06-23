include("../src/sort.jl")

using Random

function main(alg::Function)
    vetor::Vector{Int64} = rand(Int64, 10)
    vetor_solucao = alg(vetor)
    return vetor_solucao
end

function test_1(alg::Function)
    vetor::Vector{Int64} = rand(Int64, 10^4)
    vetor_solucao = alg(vetor)
    return vetor_solucao
end

function test_2(alg::Function)
    vetor::Vector{Int64} = rand(Int64, 10^5)
    vetor_solucao = alg(vetor)
    return vetor_solucao
end

function test_3(alg::Function)
    vetor::Vector{Int64} = rand(Int64, 10^6)
    vetor_solucao = alg(vetor)
    return vetor_solucao
end

function test_4(alg::Function)
    vetor::Vector{Int64} = rand(Int64, 10^7)
    vetor_solucao = alg(vetor)
    return vetor_solucao
end

@time @show main(SquareSort.sqrtSort!)

# begin
#     @time test_1(SquareSort.sqrtSort)
#     @time test_2(SquareSort.sqrtSort)
#     @time test_3(SquareSort.sqrtSort)
#     @time test_4(SquareSort.sqrtSort)
# end

#begin
#    @time test_1(SquareSort.sqrtSort!)
#    @time test_2(SquareSort.sqrtSort!)
#    @time test_3(SquareSort.sqrtSort!)
#    @time test_4(SquareSort.sqrtSort!)
#end