LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

--
-- state_in → SubBytes → ShiftRows → [MixColumns if not last] → AddRoundKey → state_out
--

ENTITY aes_round IS
    PORT (
        state_in  : IN  block_t;
        round_key : IN  block_t;
        is_last   : IN  std_logic;
        state_out : OUT block_t
    );
END aes_round;

ARCHITECTURE Dataflow OF aes_round IS
    SIGNAL after_subbytes : block_t;
    SIGNAL after_shiftrows : block_t;
    SIGNAL after_mixcolumns : block_t;
    SIGNAL before_addroundkey : block_t;
BEGIN
    SubBytes : ENTITY work.sub_bytes
    PORT MAP(
        state_in => state_in,
        state_out => after_subbytes
    );

    ShiftRows : ENTITY work.shift_rows
    PORT MAP(
        state_in => after_subbytes,
        state_out => after_shiftrows
    );

    MixColumns : ENTITY work.mix_columns
    PORT MAP(
        state_in => after_shiftrows,
        state_out => after_mixcolumns
    );

    before_addroundkey <= after_mixcolumns WHEN is_last = '0' ELSE after_shiftrows;

    AddRoundKey : ENTITY work.add_round_key
    PORT MAP(
        state_in  => before_addroundkey,
        round_key => round_key,
        state_out => state_out
    );
END Dataflow;