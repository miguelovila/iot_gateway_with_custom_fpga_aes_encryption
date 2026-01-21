LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY gf_mult_by2_tb IS
END gf_mult_by2_tb;

ARCHITECTURE Sim OF gf_mult_by2_tb IS
    SIGNAL byte_in : byte_t;
    SIGNAL byte_out : byte_t;
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
        REPORT "FAIL: 0x57 x 2 should be 0xAE" SEVERITY failure;

        -- Test 2: 0xAE x 2 = 0x47 (with reduction, MSB=1)
        byte_in <= x"AE";
        WAIT FOR 10 ns;
        ASSERT byte_out = x"47"
        REPORT "FAIL: 0xAE x 2 should be 0x47" SEVERITY failure;

        -- Test 3: 0x47 x 2 = 0x8E
        byte_in <= x"47";
        WAIT FOR 10 ns;
        ASSERT byte_out = x"8E"
        REPORT "FAIL: 0x47 x 2 should be 0x8E" SEVERITY failure;

        -- Test 4: 0x83 x 2 = 0x1D (shift gives 0x00, then XOR 0x1B)
        byte_in <= x"83";
        WAIT FOR 10 ns;
        ASSERT byte_out = x"1D"
        REPORT "FAIL: 0x83 x 2 should be 0x1D" SEVERITY failure;
        -- Test 5: 0xFF x 2 = 0xE5
        byte_in <= x"FF";
        WAIT FOR 10 ns;
        ASSERT byte_out = x"E5"
        REPORT "FAIL: 0xFF x 2 should be 0xE5" SEVERITY failure;

        -- Test 6: 0x00 x 2 = 0x00                                  
        byte_in <= x"00";
        WAIT FOR 10 ns;
        ASSERT byte_out = x"00"
        REPORT "FAIL: 0x00 x 2 should be 0x00" SEVERITY failure;

        REPORT "SUCCESS: All GF multiply by 2 tests passed!" SEVERITY note;
        WAIT;
    END PROCESS;
END Sim;