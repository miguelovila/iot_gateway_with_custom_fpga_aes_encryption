LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY mix_columns_tb IS
END mix_columns_tb;

ARCHITECTURE Sim OF mix_columns_tb IS
    SIGNAL state_in : block_t;
    SIGNAL state_out : block_t;

    -- ANSI color codes
    CONSTANT C_RED    : STRING := character'val(27) & "[31m";
    CONSTANT C_GREEN  : STRING := character'val(27) & "[32m";
    CONSTANT C_RESET  : STRING := character'val(27) & "[0m";
BEGIN

    uut : ENTITY work.mix_columns
        PORT MAP(
            state_in => state_in,
            state_out => state_out
        );

    stim_proc : PROCESS
    BEGIN
        -- Retirado do NIST, Appendix B
        -- Aplicar à matrix After ShiftRows os MixColumns
        -- Input:
        -- | D4 | E0 | B8 | 1E |
        -- | BF | B4 | 41 | 27 |
        -- | 5D | 52 | 11 | 98 |
        -- | 30 | AE | F1 | E5 |
        --
        -- Expected output:
        -- | 04 | E0 | 48 | 28 |
        -- | 66 | CB | F8 | 06 |
        -- | 81 | 19 | D3 | 26 |
        -- | E5 | 9A | 7A | 4C |

        -- Test 1: NIST Appendix B Round 1
        state_in <= x"D4BF5D30E0B452AEB84111F11E2798E5";
        WAIT FOR 10 ns;
        ASSERT state_out = x"046681E5E0CB199A48F8D37A2806264C"
        REPORT C_RED & "[TEST 1] FAILED: NIST round 1 incorrect" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 1] PASSED" & C_RESET SEVERITY note;

        -- Test 2: Zeros deve ser zeros
        state_in <= x"00000000000000000000000000000000";
        WAIT FOR 10 ns;
        ASSERT state_out = x"00000000000000000000000000000000"
        REPORT C_RED & "[TEST 2] FAILED: All zeros should produce all zeros" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 2] PASSED" & C_RESET SEVERITY note;

        -- Test 3: NIST Appendix B Round 3
        state_in <= x"ACC1D6B8EFB55A7B1323CFDF457311B5";
        WAIT FOR 10 ns;
        ASSERT state_out = x"75EC0993200B633353C0CF7CBB25D0DC"
        REPORT C_RED & "[TEST 3] FAILED: NIST round 3 incorrect" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 3] PASSED" & C_RESET SEVERITY note;

        REPORT C_GREEN & "All MixColumns tests passed!" & C_RESET SEVERITY note;
        WAIT;
    END PROCESS;

END Sim;
