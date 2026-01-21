LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY sub_bytes_tb IS
END sub_bytes_tb;

ARCHITECTURE Sim OF sub_bytes_tb IS
    SIGNAL input_block : block_t;
    SIGNAL output_block : block_t;
BEGIN
    uut : ENTITY work.sub_bytes
        PORT MAP(
            state_in => input_block,
            state_out => output_block
        );

    stim_proc : PROCESS
    BEGIN
        -- Test vector 1: All bytes 0x00 -> All bytes 0x63                                                                                                                                  
        input_block <= x"00000000000000000000000000000000";
        WAIT FOR 10 ns;
        ASSERT output_block = x"63636363636363636363636363636363"
        REPORT "FAIL: sub_bytes(all 0x00) should be all 0x63" SEVERITY failure;

        -- Test vector 2: Incrementing bytes 0x00 to 0x0F                                                                                                                                  
        input_block <= x"000102030405060708090A0B0C0D0E0F";
        WAIT FOR 10 ns;
        ASSERT output_block = x"637C777BF26B6FC53001672BFED7AB76"
        REPORT "FAIL: sub_bytes(0x00..0x0F) incorrect" SEVERITY failure;

        -- Test vector 4: All bytes 0xFF -> All bytes 0x16                                                                                                                                  
        input_block <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
        WAIT FOR 10 ns;
        ASSERT output_block = x"16161616161616161616161616161616"
        REPORT "FAIL: sub_bytes(all 0xFF) should be all 0x16" SEVERITY failure;

        -- End simulation
        REPORT "SUCCESS: All SubBytes tests passed!" SEVERITY note;
        WAIT;
    END PROCESS;
END Sim;