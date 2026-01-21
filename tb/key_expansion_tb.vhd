LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY key_expansion_tb IS
END key_expansion_tb;

ARCHITECTURE Sim OF key_expansion_tb IS
    SIGNAL key_in : block_t;
    SIGNAL rcon : byte_t;
    SIGNAL key_out : block_t;
BEGIN

    uut : ENTITY work.key_expansion
        PORT MAP(
            key_in => key_in,
            rcon => rcon,
            key_out => key_out
        );

    stim_proc : PROCESS
    BEGIN
        -- NIST Appendix A.1 Key Expansion Example
        -- Cipher Key: 2b7e151628aed2a6abf7158809cf4f3c

        -- Test 1: Round 0 -> Round 1
        -- Expected Round 1 key: a0fafe17 88542cb1 23a33939 2a6c7605
        key_in <= x"2b7e151628aed2a6abf7158809cf4f3c";
        rcon <= x"01";
        WAIT FOR 10 ns;
        ASSERT key_out = x"a0fafe1788542cb123a339392a6c7605"
        REPORT "FAIL: Key expansion round 0->1 failed" SEVERITY
            error;

        -- Test 2: Round 1 -> Round 2
        -- Expected Round 2 key: f2c295f2 7a96b943 5935807a 7359f67f
        key_in <= x"a0fafe1788542cb123a339392a6c7605";
        rcon <= x"02";
        WAIT FOR 10 ns;
        ASSERT key_out = x"f2c295f27a96b9435935807a7359f67f"
        REPORT "FAIL: Key expansion round 1->2 failed" SEVERITY
            error;

        -- Test 3: Round 2 -> Round 3
        -- Expected Round 3 key: 3d80477d 4716fe3e 1e237e44 6d7a883b
        key_in <= x"f2c295f27a96b9435935807a7359f67f";
        rcon <= x"04";
        WAIT FOR 10 ns;
        ASSERT key_out = x"3d80477d4716fe3e1e237e446d7a883b"
        REPORT "FAIL: Key expansion round 2->3 failed" SEVERITY
            error;

        REPORT "SUCCESS: All key expansion tests passed!" SEVERITY note;

        WAIT FOR 10 ns;
        ASSERT false REPORT "Simulation finished" SEVERITY failure;
    END PROCESS;

END Sim;