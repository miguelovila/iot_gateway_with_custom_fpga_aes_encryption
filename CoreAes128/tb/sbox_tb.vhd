LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY sbox_tb IS
END sbox_tb;

ARCHITECTURE Sim OF sbox_tb IS
    SIGNAL input_byte  : byte_t;
    SIGNAL output_byte : byte_t;

    -- ANSI color codes
    CONSTANT C_RED    : STRING := character'val(27) & "[31m";
    CONSTANT C_GREEN  : STRING := character'val(27) & "[32m";
    CONSTANT C_RESET  : STRING := character'val(27) & "[0m";
BEGIN
    uut : ENTITY work.sbox
        PORT MAP(
            input_byte  => input_byte,
            output_byte => output_byte
        );

    stim_proc : PROCESS
    BEGIN
        -- Test 1: 0x00 -> 0x63
        input_byte <= x"00";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"63"
        REPORT C_RED & "[TEST 1] FAILED: sbox(0x00) should be 0x63" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 1] PASSED" & C_RESET SEVERITY note;

        -- Test 2: 0x01 -> 0x7C
        input_byte <= x"01";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"7C"
        REPORT C_RED & "[TEST 2] FAILED: sbox(0x01) should be 0x7C" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 2] PASSED" & C_RESET SEVERITY note;

        -- Test 3: 0x53 -> 0xED
        input_byte <= x"53";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"ED"
        REPORT C_RED & "[TEST 3] FAILED: sbox(0x53) should be 0xED" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 3] PASSED" & C_RESET SEVERITY note;

        -- Test 4: 0xFF -> 0x16
        input_byte <= x"FF";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"16"
        REPORT C_RED & "[TEST 4] FAILED: sbox(0xFF) should be 0x16" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 4] PASSED" & C_RESET SEVERITY note;

        -- Test 5: 0x2B -> 0xF1 (from NIST example)
        input_byte <= x"2B";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"F1"
        REPORT C_RED & "[TEST 5] FAILED: sbox(0x2B) should be 0xF1" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 5] PASSED" & C_RESET SEVERITY note;

        -- Test 6: 0x7E -> 0xF3
        input_byte <= x"7E";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"F3"
        REPORT C_RED & "[TEST 6] FAILED: sbox(0x7E) should be 0xF3" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 6] PASSED" & C_RESET SEVERITY note;

        REPORT C_GREEN & "All S-Box tests passed!" & C_RESET SEVERITY note;
        WAIT;
    END PROCESS;
END Sim;
