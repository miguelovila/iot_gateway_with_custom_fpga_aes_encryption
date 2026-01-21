LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY mix_columns_tb IS
END mix_columns_tb;

ARCHITECTURE Sim OF mix_columns_tb IS
    SIGNAL state_in : block_t;
    SIGNAL state_out : block_t;
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

        -- Test vector 1: NIST Appendix B Round 1
        state_in <= x"D4BF5D30E0B452AEB84111F11E2798E5";
        WAIT FOR 10 ns;
        ASSERT state_out = x"046681E5E0CB199A48F8D37A2806264C"
        REPORT "FAIL: MixColumns test 1 failed" SEVERITY
            error;

        -- Test vector 2: Zeros deve ser zeros
        state_in <= x"00000000000000000000000000000000";
        WAIT FOR 10 ns;
        ASSERT state_out = x"00000000000000000000000000000000"
        REPORT "FAIL: MixColumns test 2 (all zeros) failed" SEVERITY
            error;

        -- Test vector 3: NIST Appendix B Round 3
        state_in <= x"ACC1D6B8EFB55A7B1323CFDF457311B5";
        WAIT FOR 10 ns;
        ASSERT state_out = x"75EC0993200B633353C0CF7CBB25D0DC"
        REPORT "FAIL: MixColumns test 3 failed" SEVERITY
            error;

        REPORT "SUCCESS: All MixColumns tests passed!" SEVERITY note;

        WAIT FOR 10 ns;
        ASSERT false REPORT "Simulation finished" SEVERITY failure;
    END PROCESS;

END Sim;