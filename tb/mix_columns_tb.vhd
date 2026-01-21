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

        state_in <= x"E598271EF11141B8AE52B4E0305DBFD4";
        WAIT FOR 10 ns;
        ASSERT state_out = x"4C2606287AD3F8489A19CBE0E5816604"
        REPORT "FAIL: MixColumns test 1 (NIST) failed" SEVERITY
            error;

        -- Test vector 2: Zeros deve ser zeros
        state_in <= x"00000000000000000000000000000000";
        WAIT FOR 10 ns;
        ASSERT state_out = x"00000000000000000000000000000000"
        REPORT "FAIL: MixColumns test 2 (all zeros) failed" SEVERITY
            error;

        -- Test vector 3: Mais um input retirado do apendice B do NIST
        state_in <= x"95C3EC97D84A904D8CE74CF2A6466E87";
        WAIT FOR 10 ns;
        ASSERT state_out = x"BC429F4CA63A70A3A5E4D440ED943747"
        REPORT "FAIL: MixColumns test 3 failed" SEVERITY
            error;

        REPORT "SUCCESS: All MixColumns tests passed!" SEVERITY note;

        WAIT FOR 10 ns;
        ASSERT false REPORT "Simulation finished" SEVERITY failure;
    END PROCESS;

END Sim;