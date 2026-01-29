LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE aes_pkg IS
    CONSTANT NR : INTEGER := 10;

    SUBTYPE byte_t   IS STD_LOGIC_VECTOR(7 DOWNTO 0);
    SUBTYPE word_t   IS STD_LOGIC_VECTOR(31 DOWNTO 0);
    SUBTYPE block_t  IS STD_LOGIC_VECTOR(127 DOWNTO 0);
    TYPE    column_t IS ARRAY(0 TO 3) OF byte_t;

    -- Round constants (Rcon) for key expansion (NIST 5.2 KEYEXPANSION)
    -- Rcon[i] = x^(i-1) in GF(2^8), only the first byte matters   
    TYPE rcon_array_t IS ARRAY (1 TO 10) OF byte_t;
    CONSTANT RCON : rcon_array_t := (
        x"01", x"02", x"04", x"08", x"10",
        x"20", x"40", x"80", x"1B", x"36"
    );
END PACKAGE aes_pkg;