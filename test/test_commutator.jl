using QuantumSymbolics
using Test

A = SOperator(:A, SpinBasis(1//2))
B = SOperator(:B, SpinBasis(1//2))

@testset "symbolic commutator tests" begin
    @test isequal(commutator(2*A, B), commutator(A, 2*B)) && isequal(2*commutator(A, B), commutator(2*A, B)) && isequal(commutator(A, 2*B), 2*commutator(A, B))
    @test commutator(A, A) == 0
end

@testset "commutator Pauli tests" begin
    @test isequal(qsimplify(commutator(X, Y), rewriter=qsimplify_commutator), 2*im*Z)
    @test isequal(qsimplify(commutator(Y, X), rewriter=qsimplify_commutator), -2*im*Z)
    @test isequal(qsimplify(commutator(Y, Z), rewriter=qsimplify_commutator), 2*im*X)
    @test isequal(qsimplify(commutator(Z, Y), rewriter=qsimplify_commutator), -2*im*X)
    @test isequal(qsimplify(commutator(Z, X), rewriter=qsimplify_commutator), 2*im*Y)
    @test isequal(qsimplify(commutator(X, Z), rewriter=qsimplify_commutator), -2*im*Y)
end