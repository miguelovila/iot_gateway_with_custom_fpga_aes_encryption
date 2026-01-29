LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

--
-- Galois Field multiplication by 2
--
-- Isto vindo diretamente do manuals do AES do NIST. (Página 8)
-- Conceptually, this multiplication is defned in two steps:
-- 1) the two polynomials that represent the bytes are multiplied as polynomials
-- 2) the resulting polynomial is reduced modulo the following fixed polynomial
--    m(x) = x^8 + x^4 + x^3 + x + 1
--
-- Este m(x) pode ser representado como o byte 0x1B (0001 1011).
--
-- A multiplicação por 2 pode ser implementada como um shift left seguido de um XOR
-- condicional com 0x1B (o byte que representa o polinômio de redução sem o termo x^8)
-- se o bit mais significativo do byte original for 1 (deu overflow), ou um XOR com 0x00
-- (nenhuma mudança) se for 0.
--
-- Exemplo (1): Quero multiplicar 0x57 por 2
-- 
-- byte_in  = 0x57 = 0101 0111
-- shifted_byte_in = 0xAE = 1010 1110
--
-- Como o MSB de byte_in é 0, não houve overflow, então:
-- byte_out = shifted_byte_in XOR 0x00 = 0xAE
--
-- Exemplo (2): Quero multiplicar 0x83 por 2
-- 
-- byte_in  = 0x83 = 1000 0011
-- shifted_byte_in = 0x06 = 0000 0110
--
-- Como o MSB de byte_in é 1, houve overflow, então:
-- byte_out = shifted_byte_in XOR 0x1B = 0x1D
--

ENTITY gf_mult_by2 IS
    PORT (
        byte_in : IN byte_t;
        byte_out : OUT byte_t
    );
END gf_mult_by2;

ARCHITECTURE Dataflow OF gf_mult_by2 IS
    SIGNAL shifted, mask : byte_t;
BEGIN
    shifted <= byte_in(6 DOWNTO 0) & '0';

    -- If MSB was 1, we need to XOR with 0x1B (reduction polynomial)                       
    -- Otherwise XOR with 0x00 (no change)                                                 
    mask <= x"1B" WHEN byte_in(7) = '1' ELSE
        x"00";
    
    -- Apply reduction                                                                     
    byte_out <= shifted XOR mask;
END Dataflow;