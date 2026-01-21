LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY add_round_key IS
    PORT (
        state_in  : IN  block_t;
        round_key : IN  block_t;
        state_out : OUT block_t
    );
END add_round_key;

ARCHITECTURE Behaviour OF add_round_key IS
BEGIN
    state_out <= state_in XOR round_key;
END Behaviour;