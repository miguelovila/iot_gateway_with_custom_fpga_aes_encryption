LIBRARY Ieee;
USE Ieee.Std_logic_1164.ALL;

USE work.aes_pkg.ALL;

--
-- Tal como manda a biblia do NIST, o MixColumns opera em colunas
-- do state, que é representado como uma matriz 4x4 de bytes. Aqui,
-- será interessante começar por separar a matriz em colunas para podermos
-- operar nelas individualmente.
--
-- Para cada coluna do state in, vamos multiplicá-la pela matriz fixa definida
-- pelo AES: (c é a coluna do state)
--
-- | S'(0,c) |   | 2 | 3 | 1 | 1 |   | S(0,c) |
-- | S'(1,c) | = | 1 | 2 | 3 | 1 | * | S(1,c) |
-- | S'(2,c) |   | 1 | 1 | 2 | 3 |   | S(2,c) |
-- | S'(3,c) |   | 3 | 1 | 1 | 2 |   | S(3,c) |
--
-- No fundo estas são operações em GF(2^8), que podem ser implementadas
-- com shifts e XORs:
--     - A multiplicação por 1 é a identidade;
--     - A multiplicação por 2 pode ser implementada como um shift à esquerda,
--       com um XOR por 0x1b se o byte mais significativo for 1; (melhor explicado em
--       gf_mult_by2.vhd)
--     - A multiplicação por 3 pode ser implementada como a multiplicação por 2
--       seguida de um XOR com o valor original.
--
-- S'(0,c) = (2 * S(0,c)) XOR (3 * S(1,c)) XOR S(2,c) XOR S(3,c)
-- S'(1,c) = S(0,c) XOR (2 * S(1,c)) XOR (3 * S(2,c)) XOR S(3,c)
-- S'(2,c) = S(0,c) XOR S(1,c) XOR (2 * S(2,c)) XOR (3 * S(3,c))
-- S'(3,c) = (3 * S(0,c)) XOR S(1,c) XOR S(2,c) XOR (2 * S(3,c))
--
-- Tendo em conta que 3*x em GF(2^8) é igual a (2*x) XOR x, podemos reescrever:
--
-- S'(0,c) = (2 * S(0,c)) XOR ((2 * S(1,c)) XOR S(1,c)) XOR S(2,c) XOR S(3,c)
-- ... e assim por diante.
--

ENTITY mix_columns IS
    PORT (
        state_in : IN block_t;
        state_out : OUT block_t
    );
END ENTITY mix_columns;

ARCHITECTURE Structural OF mix_columns IS
    -- Função auxiliar para extrair um byte específico do state
    FUNCTION get_byte(state : block_t; index : INTEGER) RETURN byte_t IS
    BEGIN
        RETURN state((index + 1) * 8 - 1 DOWNTO index * 8);
    END FUNCTION;

    -- Separamos o state_in em colunas para facilitar a manipulação
    -- e ainda criamos sinais auxiliares para armazenar os resultados
    -- da multiplicação por 2 de cada byte já que é usado várias vezes.
    SIGNAL col0_in, col1_in, col2_in, col3_in : column_t;
    SIGNAL col0_x2, col1_x2, col2_x2, col3_x2 : column_t;
    SIGNAL col0_out, col1_out, col2_out, col3_out : column_t;
BEGIN
    -- Extrair colunas do state_in
    col0_in <= (get_byte(state_in, 0), get_byte(state_in, 1), get_byte(state_in, 2), get_byte(state_in, 3));
    col1_in <= (get_byte(state_in, 4), get_byte(state_in, 5), get_byte(state_in, 6), get_byte(state_in, 7));
    col2_in <= (get_byte(state_in, 8), get_byte(state_in, 9), get_byte(state_in, 10), get_byte(state_in, 11));
    col3_in <= (get_byte(state_in, 12), get_byte(state_in, 13), get_byte(state_in, 14), get_byte(state_in, 15));

    -- Multiplicação por 2 dos bytes de cada coluna
    gen_col0_x2 : FOR i IN 0 TO 3 GENERATE
        gf_mult_by2_inst : ENTITY work.gf_mult_by2
            PORT MAP(byte_in => col0_in(i), byte_out => col0_x2(i));
    END GENERATE;
    gen_col1_x2 : FOR i IN 0 TO 3 GENERATE
        gf_mult_by2_inst : ENTITY work.gf_mult_by2
            PORT MAP(byte_in => col1_in(i), byte_out => col1_x2(i));
    END GENERATE;
    gen_col2_x2 : FOR i IN 0 TO 3 GENERATE
        gf_mult_by2_inst : ENTITY work.gf_mult_by2
            PORT MAP(byte_in => col2_in(i), byte_out => col2_x2(i));
    END GENERATE;
    gen_col3_x2 : FOR i IN 0 TO 3 GENERATE
        gf_mult_by2_inst : ENTITY work.gf_mult_by2
            PORT MAP(byte_in => col3_in(i), byte_out => col3_x2(i));
    END GENERATE;

    -- Calcular colunas de saída usando as fórmulas do MixColumns
    col0_out(0) <=  col0_x2(0) XOR (col0_x2(1)  XOR  col0_in(1)) XOR  col0_in(2)  XOR col0_in(3);
    col0_out(1) <=  col0_in(0) XOR  col0_x2(1)  XOR (col0_x2(2)  XOR  col0_in(2)) XOR col0_in(3);
    col0_out(2) <=  col0_in(0) XOR  col0_in(1)  XOR  col0_x2(2)  XOR (col0_x2(3)  XOR col0_in(3));
    col0_out(3) <= (col0_x2(0) XOR  col0_in(0)) XOR  col0_in(1)  XOR  col0_in(2)  XOR col0_x2(3);

    col1_out(0) <=  col1_x2(0) XOR (col1_x2(1)  XOR  col1_in(1)) XOR  col1_in(2)  XOR col1_in(3);
    col1_out(1) <=  col1_in(0) XOR  col1_x2(1)  XOR (col1_x2(2)  XOR  col1_in(2)) XOR col1_in(3);
    col1_out(2) <=  col1_in(0) XOR  col1_in(1)  XOR  col1_x2(2)  XOR (col1_x2(3)  XOR col1_in(3));
    col1_out(3) <= (col1_x2(0) XOR  col1_in(0)) XOR  col1_in(1)  XOR  col1_in(2)  XOR col1_x2(3);

    col2_out(0) <=  col2_x2(0) XOR (col2_x2(1)  XOR  col2_in(1)) XOR  col2_in(2)  XOR col2_in(3);
    col2_out(1) <=  col2_in(0) XOR  col2_x2(1)  XOR (col2_x2(2)  XOR  col2_in(2)) XOR col2_in(3);
    col2_out(2) <=  col2_in(0) XOR  col2_in(1)  XOR col2_x2(2)   XOR (col2_x2(3)  XOR col2_in(3));
    col2_out(3) <= (col2_x2(0) XOR  col2_in(0)) XOR col2_in(1)   XOR  col2_in(2)  XOR col2_x2(3);

    col3_out(0) <=  col3_x2(0) XOR (col3_x2(1)  XOR  col3_in(1)) XOR  col3_in(2)  XOR col3_in(3);
    col3_out(1) <=  col3_in(0) XOR  col3_x2(1)  XOR (col3_x2(2)  XOR  col3_in(2)) XOR col3_in(3);
    col3_out(2) <=  col3_in(0) XOR  col3_in(1)  XOR  col3_x2(2)  XOR (col3_x2(3)  XOR col3_in(3));
    col3_out(3) <= (col3_x2(0) XOR  col3_in(0)) XOR  col3_in(1)  XOR  col3_in(2)  XOR col3_x2(3);

    -- Recombinar colunas em state_out
    state_out(  7 DOWNTO   0) <= col0_out(0);
    state_out( 15 DOWNTO   8) <= col0_out(1);
    state_out( 23 DOWNTO  16) <= col0_out(2);
    state_out( 31 DOWNTO  24) <= col0_out(3);

    state_out( 39 DOWNTO  32) <= col1_out(0);
    state_out( 47 DOWNTO  40) <= col1_out(1);
    state_out( 55 DOWNTO  48) <= col1_out(2);
    state_out( 63 DOWNTO  56) <= col1_out(3);

    state_out( 71 DOWNTO  64) <= col2_out(0);
    state_out( 79 DOWNTO  72) <= col2_out(1);
    state_out( 87 DOWNTO  80) <= col2_out(2);
    state_out( 95 DOWNTO  88) <= col2_out(3);

    state_out(103 DOWNTO  96) <= col3_out(0);
    state_out(111 DOWNTO 104) <= col3_out(1);
    state_out(119 DOWNTO 112) <= col3_out(2);
    state_out(127 DOWNTO 120) <= col3_out(3);
END Structural;