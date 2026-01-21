LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY aes_core_tb IS
END aes_core_tb;

--
-- O que não faltam são vetores de teste NIST para AES ehehe
-- https://csrc.nist.gov/CSRC/media/Projects/Cryptographic-Standards-and-Guidelines/documents/examples/AES_Core128.pdf
--

ARCHITECTURE Sim OF aes_core_tb IS
    SIGNAL clk        : std_logic := '0';
    SIGNAL rst        : std_logic := '0';
    SIGNAL start      : std_logic := '0';
    SIGNAL key        : block_t;
    SIGNAL plaintext  : block_t;
    SIGNAL ciphertext : block_t;
    SIGNAL done       : std_logic;

    -- Clock period
    CONSTANT CLK_PERIOD : time := 10 ns;

    -- ANSI color codes
    CONSTANT C_RED    : STRING := character'val(27) & "[31m";
    CONSTANT C_GREEN  : STRING := character'val(27) & "[32m";
    CONSTANT C_RESET  : STRING := character'val(27) & "[0m";

BEGIN
    uut : ENTITY work.aes_core
        PORT MAP (
            clk        => clk,
            rst        => rst,
            start      => start,
            key        => key,
            plaintext  => plaintext,
            ciphertext => ciphertext,
            done       => done
        );

    -- Clock Generator
    clk <= NOT clk AFTER CLK_PERIOD / 2;

    stim_proc : PROCESS
    BEGIN
        -- Reset
        rst <= '1';
        WAIT FOR CLK_PERIOD * 2;
        rst <= '0';
        WAIT FOR CLK_PERIOD;

        -- Test 1: NIST FIPS-197 Appendix B
        key       <= x"2B7E151628AED2A6ABF7158809CF4F3C";
        plaintext <= x"3243F6A8885A308D313198A2E0370734";
        start     <= '1';
        WAIT FOR CLK_PERIOD;
        start     <= '0';
        WAIT UNTIL done = '1'; -- Wait for done
        WAIT FOR CLK_PERIOD / 2;  -- Sample in middle of done cycle
        ASSERT ciphertext = x"3925841D02DC09FBDC118597196A0B32"
        REPORT C_RED & "[TEST 1] FAILED: NIST FIPS-197 Appendix B" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 1] PASSED: NIST FIPS-197 Appendix B" & C_RESET SEVERITY note;

        WAIT FOR CLK_PERIOD * 2;

        -- Test 2: All-zero key and plaintext
        key       <= x"00000000000000000000000000000000";
        plaintext <= x"00000000000000000000000000000000";
        start     <= '1';
        WAIT FOR CLK_PERIOD;
        start     <= '0';
        WAIT UNTIL done = '1';
        WAIT FOR CLK_PERIOD / 2;
        ASSERT ciphertext = x"66E94BD4EF8A2C3B884CFA59CA342B2E"
        REPORT C_RED & "[TEST 2] FAILED: All-zero test" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 2] PASSED: All-zero test" & C_RESET SEVERITY note;

        WAIT FOR CLK_PERIOD * 2;

        -- Test 3
        key       <= x"000102030405060708090A0B0C0D0E0F";
        plaintext <= x"00112233445566778899AABBCCDDEEFF";
        start     <= '1';
        WAIT FOR CLK_PERIOD;
        start     <= '0';
        WAIT UNTIL done = '1';
        WAIT FOR CLK_PERIOD / 2;
        ASSERT ciphertext = x"69C4E0D86A7B0430D8CDB78070B4C55A"
        REPORT C_RED & "[TEST 3] FAILED: NIST key schedule test" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 3] PASSED: NIST key schedule test" & C_RESET SEVERITY note;

        WAIT FOR CLK_PERIOD * 2;

        -- Test 4
        key       <= x"2B7E151628AED2A6ABF7158809CF4F3C";
        plaintext <= x"6BC1BEE22E409F96E93D7E117393172A";
        start     <= '1';
        WAIT FOR CLK_PERIOD;
        start     <= '0';
        WAIT UNTIL done = '1';
        WAIT FOR CLK_PERIOD / 2;
        ASSERT ciphertext = x"3AD77BB40D7A3660A89ECAF32466EF97"
        REPORT C_RED & "[TEST 4] FAILED: NIST examples" & C_RESET SEVERITY failure;
        REPORT C_GREEN & "[TEST 4] PASSED: NIST examples" & C_RESET SEVERITY note;

        REPORT C_GREEN & "All AES Core tests passed!" & C_RESET SEVERITY note;
        std.env.stop;
        WAIT;
    END PROCESS;
END Sim;
