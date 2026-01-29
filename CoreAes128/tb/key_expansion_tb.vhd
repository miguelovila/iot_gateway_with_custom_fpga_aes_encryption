LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY key_expansion_tb IS
END key_expansion_tb;

ARCHITECTURE Sim OF key_expansion_tb IS
    SIGNAL key_in : block_t;
    SIGNAL rcon : byte_t;
    SIGNAL key_out : block_t;

    -- ANSI color codes
    CONSTANT C_RED    : STRING := character'val(27) & "[31m";
    CONSTANT C_GREEN  : STRING := character'val(27) & "[32m";
    CONSTANT C_RESET  : STRING := character'val(27) & "[0m";
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
        key_in <= x"2b7e151628aed2a6abf7158809cf4f3C";
        rcon <= x"01";
        WAIT FOR 10 ns;
        ASSERT key_out = x"a0fafe1788542cb123a339392a6c7605"
        REPORT C_RED & "[TEST 1] FAILED: Round 0->1 key incorrect" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 1] PASSED" & C_RESET SEVERITY note;

        -- Test 2: Round 1 -> Round 2
        -- Expected Round 2 key: f2c295f2 7a96b943 5935807a 7359f67f
        key_in <= x"a0fafe1788542cb123a339392a6c7605";
        rcon <= x"02";
        WAIT FOR 10 ns;
        ASSERT key_out = x"f2c295f27a96b9435935807a7359f67f"
        REPORT C_RED & "[TEST 2] FAILED: Round 1->2 key incorrect" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 2] PASSED" & C_RESET SEVERITY note;

        -- Test 3: Round 2 -> Round 3
        -- Expected Round 3 key: 3d80477d 4716fe3e 1e237e44 6d7a883b
        key_in <= x"f2c295f27a96b9435935807a7359f67f";
        rcon <= x"04";
        WAIT FOR 10 ns;
        ASSERT key_out = x"3d80477d4716fe3e1e237e446d7a883b"
        REPORT C_RED & "[TEST 3] FAILED: Round 2->3 key incorrect" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 3] PASSED" & C_RESET SEVERITY note;

        REPORT C_GREEN & "All key expansion tests passed!" & C_RESET SEVERITY note;
        WAIT;
    END PROCESS;

END Sim;
