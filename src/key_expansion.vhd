LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

-- 
-- A expansão de chave do AES gera uma nova rond key
-- gera 4 * (nº rounds + 1) palavras de 4 bytes a partir da
-- chave inicial. Para AES-128, que tem 10 rondas, são 44 palavras.
--
-- As primeiras 4 palavras são iguais à chave inicial. As restantes
-- são geradas a partir das anteriores, usando a função g:
--    - RotWord: rota os bytes da palavra para a esquerda
--    - SubWord: aplica a S-box a cada byte da palavra
--    - Rcon: aplicar um XOR com um valor constante que depende da ronda
--
-- Nk = número de palavras na chave inicial (4 para AES-128)
--
-- A palavra w[i] é gerada como:
--    - Se i é múltiplo de Nk: w[i] = w[i-Nk] XOR SubWord(RotWord(w[i-1])) XOR Rcon[i/Nk]
--    - Caso contrário: w[i] = w[i-Nk] XOR w[i-1]
--
-- A chave expandida é então a concatenação de todas as palavras w[0]..w[43]
--
-- Rcon é definido como:
-- Rcon[1] = 0x01 00 00 00
-- Rcon[2] = 0x02 00 00 00
-- Rcon[3] = 0x04 00 00 00
-- Rcon[4] = 0x08 00 00 00
-- Rcon[5] = 0x10 00 00 00
-- Rcon[6] = 0x20 00 00 00
-- Rcon[7] = 0x40 00 00 00
-- Rcon[8] = 0x80 00 00 00
-- Rcon[9] = 0x1b 00 00 00
-- Rcon[10]= 0x36 00 00 00
--
-- Aqui só implementamos a geração da próxima
-- rond key a partir da chave atual e do Rcon. Este
-- módulo pode ser usado iterativamente para gerar
-- todas as rond keys necessárias para o AES-128.
--

ENTITY key_expansion IS
    PORT (
        key_in  : IN  block_t;
        rcon    : IN  byte_t;
        key_out : OUT block_t
    );
END key_expansion;

ARCHITECTURE Dataflow OF key_expansion IS
    ALIAS w0 : word_t IS key_in (31 DOWNTO   0);
    ALIAS w1 : word_t IS key_in (63 DOWNTO  32);
    ALIAS w2 : word_t IS key_in (95 DOWNTO  64);
    ALIAS w3 : word_t IS key_in (127 DOWNTO 96);

    SIGNAL w3_rotated : word_t;
    SIGNAL w3_subbed  : word_t;
    SIGNAL  g_result  : word_t;

    SIGNAL nw0, nw1, nw2, nw3 : word_t;
BEGIN
    -- Rotate w3
    w3_rotated <= w3(7 DOWNTO 0) & w3(31 DOWNTO 8);

    -- SubWord: apply S-box to each byte
    sbox_0: ENTITY work.sbox
        PORT MAP (
            input_byte  => w3_rotated(7 DOWNTO 0),
            output_byte =>  w3_subbed(7 DOWNTO 0)
        );
    sbox_1: entity work.sbox                                                          
        PORT MAP (
            input_byte => w3_rotated(15 DOWNTO 8),                              
            output_byte => w3_subbed(15 DOWNTO 8)
        );                             
    sbox_2: entity work.sbox                                                          
        PORT MAP (
            input_byte => w3_rotated(23 DOWNTO 16),                             
            output_byte => w3_subbed(23 DOWNTO 16)
        );                            
    sbox_3: entity work.sbox                                                          
        PORT MAP (
            input_byte => w3_rotated(31 DOWNTO 24),                             
            output_byte => w3_subbed(31 DOWNTO 24)
        );

    -- g(w3) = SubWord(RotWord(w3)) XOR Rcon
    g_result(7 DOWNTO 0)   <= w3_subbed(7 DOWNTO 0) XOR rcon;
    g_result(31 DOWNTO 8)  <= w3_subbed(31 DOWNTO 8);

    -- Generate new words
    nw0 <= w0 XOR g_result;
    nw1 <= nw0 XOR w1;
    nw2 <= nw1 XOR w2;
    nw3 <= nw2 XOR w3;
                    
    -- Concatenate new words into output key
    key_out <= nw3 & nw2 & nw1 & nw0;
END Dataflow;