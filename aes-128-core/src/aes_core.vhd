LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY aes_core IS
    PORT (
        clk        : IN STD_LOGIC;
        rst        : IN STD_LOGIC;
        start      : IN STD_LOGIC;
        key        : IN block_t;
        plaintext  : IN block_t;
        ciphertext : OUT block_t;
        done       : OUT STD_LOGIC
    );
END aes_core;

ARCHITECTURE Behavioral OF aes_core IS
    TYPE state_t IS (IDLE, ROUNDS, FINAL, DONE_ST);

    -- Internal registers
    SIGNAL fsm_state     : state_t := IDLE;
    SIGNAL key_reg       : block_t;
    SIGNAL state_reg     : block_t;

    -- Round signals
    SIGNAL round_counter : INTEGER RANGE 0 TO 10 := 0;
    SIGNAL round_in  : block_t  ;
    SIGNAL round_key : block_t  ;
    SIGNAL round_out : block_t  ;
    SIGNAL is_last   : std_logic;

    -- Key expansion signals
    SIGNAL key_extension_in  : block_t;
    SIGNAL key_extension_out : block_t;
    SIGNAL rcon_value        :  byte_t;
BEGIN
    RoundInst : ENTITY work.aes_round
        PORT MAP (
            state_in  => round_in,
            round_key => round_key,
            is_last   => is_last,
            state_out => round_out
        );

    KeyExtensionInst : ENTITY work.key_expansion
        PORT MAP (
            key_in  => key_extension_in,
            rcon    => rcon_value,
            key_out => key_extension_out
        );

    rcon_value <= RCON(round_counter) WHEN round_counter >= 1 AND round_counter <= 10 ELSE x"00";
    key_extension_in <= key_reg;

    PROCESS(clk)
    BEGIN
      IF rising_edge(clk) THEN
        IF rst = '1' THEN
          fsm_state     <= IDLE;
          key_reg       <= (OTHERS => '0');
          state_reg     <= (OTHERS => '0');
          round_counter <= 0;
          done          <= '0';
        ELSE
          CASE fsm_state IS
              WHEN IDLE =>
                done <= '0';
                IF start = '1' THEN
                    key_reg   <= key;
                    state_reg <= plaintext XOR key;
                    round_counter <= 1;
                    fsm_state <= ROUNDS;
                END IF;
              WHEN ROUNDS =>
                state_reg <= round_out;
                key_reg   <= key_extension_out;
                round_counter <= round_counter + 1;
                IF round_counter = 9 THEN
                    fsm_state <= FINAL;
                END IF;
              WHEN FINAL =>
                state_reg <= round_out;
                fsm_state <= DONE_ST;
              WHEN DONE_ST =>
                done <= '1';
                fsm_state <= IDLE;
              WHEN OTHERS =>
                fsm_state <= IDLE;
          END CASE;
        END IF;
      END IF;
    END PROCESS;

    round_in  <= state_reg;
    round_key <= key_extension_out WHEN fsm_state = ROUNDS OR fsm_state = FINAL ELSE key_reg;
    is_last   <= '1' WHEN fsm_state = FINAL ELSE '0';

    ciphertext <= state_reg;
END Behavioral;