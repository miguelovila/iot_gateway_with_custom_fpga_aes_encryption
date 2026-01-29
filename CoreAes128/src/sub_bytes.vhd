LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

--
-- SubBytes transformation
-- 
-- Substitui cada byte do state array por um byte correspondente
-- da S-Box que nada mais é do que uma lookup table tirada
-- diretamente do manual do AES do NIST.
--

ENTITY sub_bytes IS
    PORT (
        state_in : IN block_t;
        state_out : OUT block_t
    );
END sub_bytes;

ARCHITECTURE Structural OF sub_bytes IS
BEGIN
    gen_sboxes : FOR i IN 0 TO 15 GENERATE
        sbox_inst : ENTITY work.sbox
            PORT MAP(
                input_byte => state_in(127 - i * 8 DOWNTO 120 - i * 8),
                output_byte => state_out(127 - i * 8 DOWNTO 120 - i * 8)
            );
    END GENERATE;
END Structural;