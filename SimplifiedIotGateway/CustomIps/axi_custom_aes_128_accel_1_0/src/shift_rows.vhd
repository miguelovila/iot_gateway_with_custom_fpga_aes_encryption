LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

--
-- Diagrama do state array
--
-- 127..120 | 95..88 | 63..56 | 31..24 |  (Row 0)
-- 119..112 | 87..80 | 55..48 | 23..16 |  (Row 1)
-- 111..104 | 79..72 | 47..40 | 15..08 |  (Row 2)
-- 103..096 | 71..64 | 39..32 | 07..00 |  (Row 3)
--

ENTITY shift_rows IS
    PORT (
        state_in  : IN  block_t;
        state_out : OUT block_t
    );
END ENTITY shift_rows;

ARCHITECTURE Behavior OF shift_rows IS
BEGIN
    -- Row 0: Sem shift
    state_out(127 downto 120) <= state_in(127 downto 120);
    state_out(95  downto 88 ) <= state_in(95  downto 88 );
    state_out(63  downto 56 ) <= state_in(63  downto 56 );
    state_out(31  downto 24 ) <= state_in(31  downto 24 );

    -- Row 1: 1 shift left
    state_out(119 downto 112) <= state_in(87  downto 80 );
    state_out(87  downto 80 ) <= state_in(55  downto 48 );
    state_out(55  downto 48 ) <= state_in(23  downto 16 );
    state_out(23  downto 16 ) <= state_in(119 downto 112);

    -- Row 2: 2 shifts left
    state_out(111 downto 104) <= state_in(47  downto 40 );
    state_out(79  downto 72 ) <= state_in(15  downto 8  );
    state_out(47  downto 40 ) <= state_in(111 downto 104);
    state_out(15  downto 8  ) <= state_in(79  downto 72 );

    -- Row 3: 3 shifts left
    state_out(103 downto 96 ) <= state_in(7   downto 0  );
    state_out(71  downto 64 ) <= state_in(103 downto 96 );
    state_out(39  downto 32 ) <= state_in(71  downto 64 );
    state_out(7   downto 0  ) <= state_in(39  downto 32 );
END Behavior;