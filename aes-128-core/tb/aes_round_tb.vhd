LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY aes_round_tb IS
END aes_round_tb;

ARCHITECTURE Sim OF aes_round_tb IS
    SIGNAL state_in : block_t;
    SIGNAL round_key : block_t;
    SIGNAL is_last : std_logic;
    SIGNAL state_out : block_t;

    -- ANSI color codes
    CONSTANT C_RED    : STRING := character'val(27) & "[31m";
    CONSTANT C_GREEN  : STRING := character'val(27) & "[32m";
    CONSTANT C_RESET  : STRING := character'val(27) & "[0m";
BEGIN

    uut : ENTITY work.aes_round
        PORT MAP(
            state_in => state_in,
            round_key => round_key,
            is_last => is_last,
            state_out => state_out
        );

    stim_proc : PROCESS
    BEGIN

        -- Test 1: NIST Appendix B Round 1
        state_in <= x"193DE3BEA0F4E22B9AC68D2AE9F84808";
        round_key <= x"A0FAFE1788542CB123A339392A6C7605";
        is_last <= '0';
        WAIT FOR 10 ns;
        ASSERT state_out = x"A49C7FF2689F352B6B5BEA43026A5049"
        REPORT C_RED & "[TEST 1] FAILED: NIST round 1 incorrect" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 1] PASSED" & C_RESET SEVERITY note;

        -- Test 2: NIST Appendix B Round 2
        state_in <= x"A49C7FF2689F352B6B5BEA43026A5049";
        round_key <= x"F2C295F27A96B9435935807A7359F67F";
        is_last <= '0';
        WAIT FOR 10 ns;
        ASSERT state_out = x"AA8F5F0361DDE3EF82D24AD26832469A"
        REPORT C_RED & "[TEST 2] FAILED: NIST round 2 incorrect" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 2] PASSED" & C_RESET SEVERITY note;

        -- Test 3: NIST Appendix B Final Round
        state_in <= x"EB40F21E592E38848BA113E71BC342D2";
        round_key <= x"D014F9A8C9EE2589E13F0CC8B6630CA6";
        is_last <= '1';
        WAIT FOR 10 ns;
        ASSERT state_out = x"3925841D02DC09FBDC118597196A0B32"
        REPORT C_RED & "[TEST 3] FAILED: NIST final round incorrect" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 3] PASSED" & C_RESET SEVERITY note;

        REPORT C_GREEN & "All AES_Round tests passed!" & C_RESET SEVERITY note;
        WAIT;
    END PROCESS;

END Sim;