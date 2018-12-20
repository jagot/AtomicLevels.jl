@testset "CSFs" begin
    @testset "Construction" begin
        csf = CSF(rc"1s2 2p- 2p", [0, 1//2, 3//2], [0, 1//2, 2])
        @test typeof(csf) === CSF{RelativisticOrbital{Int},HalfInteger}
        @test csf == csf
        @test csf != CSF(rc"1s2 2p- 2p", [0, 1//2, 3//2], [0, 1//2, 1])
    end

    @testset "CSF list generation" begin
        # These are not real tests, they only make sure that the
        # generation does not crash.
        sort(vcat(csfs(rc"3s 3p2")..., csfs(rc"3s 3p- 3p")...))
        csfs(rc"[Kr] 5s2 5p-2 5p3 6s")
        csfs(rc"1s kp")

        @test string(CSF(rc"[Kr] 5s2 5p- 5p4 kd", [0//1, 1//2, 0//1, 5//2], [0//1, 1//2, 1//2, 3//1])) == "[Kr]ᶜ 5s²(0|0) 5p⁻(1/2|1/2) 5p⁴(0|1/2) kd(5/2|3)-"
    end
end
