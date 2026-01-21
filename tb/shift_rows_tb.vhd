LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY shift_rows_tb IS
END shift_rows_tb;

-- Diagrama do state array
--
-- | 127..120 | 95..88 | 63..56 | 31..24 |  (Row 0)
-- | 119..112 | 87..80 | 55..48 | 23..16 |  (Row 1)
-- | 111..104 | 79..72 | 47..40 | 15..08 |  (Row 2)
-- | 103..096 | 71..64 | 39..32 | 07..00 |  (Row 3)
--
-- Com StateIn assim: (x"A0A1A2A3B0B1B2B3C0C1C2C3D0D1D2D3")
--
-- | A0 | B0 | C0 | D0 |
-- | A1 | B1 | C1 | D1 |
-- | A2 | B2 | C2 | D2 |
-- | A3 | B3 | C3 | D3 |
--
-- Espera-se StateOut assim: (x"A0B1C2D3B0C1D2A3C0D1A2B3D0A1B2C3")
-- | A0 | B0 | C0 | D0 |  (Row 0: no shift)
-- | B1 | C1 | D1 | A1 |  (Row 1: 1 shift left)
-- | C2 | D2 | A2 | B2 |  (Row 2: 2 shifts left)
-- | D3 | A3 | B3 | C3 |  (Row 3: 3 shifts left)

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
        -- Test vector 1
        state_in <= x"A0A1A2A3B0B1B2B3C0C1C2C3D0D1D2D3";
        WAIT FOR 10 ns;
        ASSERT state_out = x"A0B1C2D3B0C1D2A3C0D1A2B3D0A1B2C3"
        REPORT "FAIL: shift_rows did not produce expected output" SEVERITY error;

        --Test vector 2: NIST, appendix B, round 1
        state_in <= x"D42711AEE0BF98F1B8B45DE51E415230";
        WAIT FOR 10 ns;
        ASSERT state_out = x"D4BF5D30E0B452AEB84111F11E2798E5"
        REPORT "FAIL: shift_rows did not produce expected output" SEVERITY error;

        -- Test vector 3: NIST, appendix B, round 9
        state_in <= x"87EC4A8CF26EC3D84D4C46959790E7A6";
        WAIT FOR 10 ns;
        ASSERT state_out = x"876E46A6F24CE78C4D904AD897ECC395"
        REPORT "FAIL: shift_rows did not produce expected output" SEVERITY error;

        REPORT "SUCCESS: shift_rows produced expected output" SEVERITY note;
        WAIT FOR 10 ns;
        ASSERT false REPORT "Simulation finished" SEVERITY failure;
    END PROCESS;
END Sim;