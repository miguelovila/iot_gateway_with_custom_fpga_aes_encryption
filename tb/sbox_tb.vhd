LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY sbox_tb IS
END sbox_tb;

ARCHITECTURE Sim OF sbox_tb IS
    SIGNAL input_byte  : byte_t;
    SIGNAL output_byte : byte_t;
BEGIN                                                                                                                                                 
    uut : ENTITY work.sbox
        PORT MAP(
            input_byte  => input_byte,
            output_byte => output_byte
        );

    stim_proc : PROCESS
    BEGIN
        -- Test vector 1: 0x00 -> 0x63                                                                                                                                                      
        input_byte <= x"00";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"63"
        REPORT "FAIL: sbox(0x00) should be 0x63" SEVERITY failure;

        -- Test vector 2: 0x01 -> 0x7C                                                                                                                                                      
        input_byte <= x"01";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"7C"
        REPORT "FAIL: sbox(0x01) should be 0x7C" SEVERITY failure;

        -- Test vector 3: 0x53 -> 0xED                                                                                                                                                      
        input_byte <= x"53";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"ED"
        REPORT "FAIL: sbox(0x53) should be 0xED" SEVERITY failure;

        -- Test vector 4: 0xFF -> 0x16                                                                                                                                                      
        input_byte <= x"FF";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"16"
        REPORT "FAIL: sbox(0xFF) should be 0x16" SEVERITY failure;

        -- Test vector 5: 0x2B -> 0xF1 (from NIST example)                                                                                                                                  
        input_byte <= x"2B";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"F1"
        REPORT "FAIL: sbox(0x2B) should be 0xF1" SEVERITY failure;

        -- Test vector 6: 0x7E -> 0xF3                                                                                                                                                      
        input_byte <= x"7E";
        WAIT FOR 10 ns;
        ASSERT output_byte = x"F3"
        REPORT "FAIL: sbox(0x7E) should be 0xF3" SEVERITY failure;
                                                                                                                                                             
        -- End simulation
        REPORT "SUCCESS: All S-Box tests passed!" SEVERITY note;
        WAIT;
    END PROCESS;
END Sim;