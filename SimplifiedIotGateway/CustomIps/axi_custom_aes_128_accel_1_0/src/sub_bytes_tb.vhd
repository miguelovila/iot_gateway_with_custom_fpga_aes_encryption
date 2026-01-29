LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY sub_bytes_tb IS
END sub_bytes_tb;

ARCHITECTURE Sim OF sub_bytes_tb IS
    SIGNAL input_block : block_t;
    SIGNAL output_block : block_t;

    -- ANSI color codes
    CONSTANT C_RED    : STRING := character'val(27) & "[31m";
    CONSTANT C_GREEN  : STRING := character'val(27) & "[32m";
    CONSTANT C_RESET  : STRING := character'val(27) & "[0m";
BEGIN
    uut : ENTITY work.sub_bytes
        PORT MAP(
            state_in => input_block,
            state_out => output_block
        );

    stim_proc : PROCESS
    BEGIN
        -- Test 1: All bytes 0x00 -> All bytes 0x63
        input_block <= x"00000000000000000000000000000000";
        WAIT FOR 10 ns;
        ASSERT output_block = x"63636363636363636363636363636363"
        REPORT C_RED & "[TEST 1] FAILED: sub_bytes(all 0x00) should be all 0x63" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 1] PASSED" & C_RESET SEVERITY note;

        -- Test 2: Incrementing bytes 0x00 to 0x0F
        input_block <= x"000102030405060708090A0B0C0D0E0F";
        WAIT FOR 10 ns;
        ASSERT output_block = x"637C777BF26B6FC53001672BFED7AB76"
        REPORT C_RED & "[TEST 2] FAILED: sub_bytes(0x00..0x0F) incorrect" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 2] PASSED" & C_RESET SEVERITY note;

        -- Test 3: All bytes 0xFF -> All bytes 0x16
        input_block <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
        WAIT FOR 10 ns;
        ASSERT output_block = x"16161616161616161616161616161616"
        REPORT C_RED & "[TEST 3] FAILED: sub_bytes(all 0xFF) should be all 0x16" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 3] PASSED" & C_RESET SEVERITY note;

        REPORT C_GREEN & "All SubBytes tests passed!" & C_RESET SEVERITY note;
        WAIT;
    END PROCESS;
END Sim;
