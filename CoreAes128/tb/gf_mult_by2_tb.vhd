LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY gf_mult_by2_tb IS
END gf_mult_by2_tb;

ARCHITECTURE Sim OF gf_mult_by2_tb IS
    SIGNAL byte_in : byte_t;
    SIGNAL byte_out : byte_t;

    -- ANSI color codes
    CONSTANT C_RED    : STRING := character'val(27) & "[31m";
    CONSTANT C_GREEN  : STRING := character'val(27) & "[32m";
    CONSTANT C_RESET  : STRING := character'val(27) & "[0m";
BEGIN
    uut : ENTITY work.gf_mult_by2
        PORT MAP(
            byte_in => byte_in,
            byte_out => byte_out
        );

    stim_proc : PROCESS
    BEGIN
        -- Test 1: 0x57 x 2 = 0xAE (no reduction, MSB=0)
        byte_in <= x"57";
        WAIT FOR 10 ns;
        ASSERT byte_out = x"AE"
        REPORT C_RED & "[TEST 1] FAILED: 0x57 x 2 should be 0xAE" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 1] PASSED" & C_RESET SEVERITY note;

        -- Test 2: 0xAE x 2 = 0x47 (with reduction, MSB=1)
        byte_in <= x"AE";
        WAIT FOR 10 ns;
        ASSERT byte_out = x"47"
        REPORT C_RED & "[TEST 2] FAILED: 0xAE x 2 should be 0x47" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 2] PASSED" & C_RESET SEVERITY note;

        -- Test 3: 0x47 x 2 = 0x8E
        byte_in <= x"47";
        WAIT FOR 10 ns;
        ASSERT byte_out = x"8E"
        REPORT C_RED & "[TEST 3] FAILED: 0x47 x 2 should be 0x8E" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 3] PASSED" & C_RESET SEVERITY note;

        -- Test 4: 0x83 x 2 = 0x1D (shift gives 0x00, then XOR 0x1B)
        byte_in <= x"83";
        WAIT FOR 10 ns;
        ASSERT byte_out = x"1D"
        REPORT C_RED & "[TEST 4] FAILED: 0x83 x 2 should be 0x1D" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 4] PASSED" & C_RESET SEVERITY note;

        -- Test 5: 0xFF x 2 = 0xE5
        byte_in <= x"FF";
        WAIT FOR 10 ns;
        ASSERT byte_out = x"E5"
        REPORT C_RED & "[TEST 5] FAILED: 0xFF x 2 should be 0xE5" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 5] PASSED" & C_RESET SEVERITY note;

        -- Test 6: 0x00 x 2 = 0x00
        byte_in <= x"00";
        WAIT FOR 10 ns;
        ASSERT byte_out = x"00"
        REPORT C_RED & "[TEST 6] FAILED: 0x00 x 2 should be 0x00" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 6] PASSED" & C_RESET SEVERITY note;

        REPORT C_GREEN & "All GF multiply by 2 tests passed!" & C_RESET SEVERITY note;
        WAIT;
    END PROCESS;
END Sim;
