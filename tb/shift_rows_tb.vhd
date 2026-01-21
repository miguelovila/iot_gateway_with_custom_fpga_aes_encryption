LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY shift_rows_tb IS
END shift_rows_tb;

-- Diagrama do state array
--
-- | 07..00 | 39..32 | 71..64 | 103..096 |
-- | 15..08 | 47..40 | 79..72 | 111..104 |
-- | 23..16 | 55..48 | 87..80 | 119..112 |
-- | 31..24 | 63..56 | 95..88 | 127..120 |
--
-- Com StateIn assim: (x"A0A1A2A3B0B1B2B3C0C1C2C3D0D1D2D3")
-- 
-- | D3 | C3 | B3 | A3 |
-- | D2 | C2 | B2 | A2 |
-- | D1 | C1 | B1 | A1 |
-- | D0 | C0 | B0 | A0 |
--
-- Espera-se StateOut assim: (x"B0C1D2A3C0D1A2B3D0A1B2C3A0B1C2D3")
-- | D3 | C3 | B3 | A3 |
-- | C2 | B2 | A2 | D2 |
-- | B1 | A1 | D1 | C1 |
-- | A0 | D0 | C0 | B0 |

ARCHITECTURE Sim OF shift_rows_tb IS
    SIGNAL state_in : block_t;
    SIGNAL state_out : block_t;
BEGIN
    uut : ENTITY work.shift_rows
        PORT MAP(
            state_in => state_in,
            state_out => state_out
        );

    stim_proc : PROCESS
    BEGIN
        state_in <= x"A0A1A2A3B0B1B2B3C0C1C2C3D0D1D2D3";
        WAIT FOR 10 ns;
        ASSERT state_out = x"B0C1D2A3C0D1A2B3D0A1B2C3A0B1C2D3"
        REPORT "FAIL: shift_rows did not produce expected output" SEVERITY error;

        REPORT "SUCCESS: shift_rows produced expected output" SEVERITY note;
        WAIT FOR 10 ns;
        ASSERT false REPORT "Simulation finished" SEVERITY failure;
    END PROCESS;
END Sim;