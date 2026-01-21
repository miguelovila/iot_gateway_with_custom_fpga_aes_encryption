LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY key_expansion_tb IS
END key_expansion_tb;

ARCHITECTURE Sim OF key_expansion_tb IS
    SIGNAL key_in : block_t;
    SIGNAL rcon : byte_t;
    SIGNAL key_out : block_t;
BEGIN

    uut : ENTITY work.key_expansion
        PORT MAP(
            key_in => key_in,
            rcon => rcon,
            key_out => key_out
        );

    stim_proc : PROCESS
    BEGIN
        -- NIST FIPS-197 Appendix A.1 Key Expansion Example              
        -- Cipher Key: 2b7e1516 28aed2a6 abf71588 09cf4f3c               
        --                                                               
        -- In our byte ordering (byte 0 at LSB):                         
        -- Key bytes: [2b,7e,15,16, 28,ae,d2,a6, ab,f7,15,88, 09, cf, 4f, 3c]
        -- 128-bit:   3c4fcf09 8815f7ab a6d2ae28 16157e2b (MSB to LSB)   

        -- Test 1: Round 0 -> Round 1                                    
        -- Expected Round 1 key: a0fafe17 88542cb1 23a33939 2a6c7605     
        -- Key bytes: [a0,fa,fe,17, 88,54,2c,b1, 23,a3,39,39, 2a, 6c, 76, 05]
        -- 128-bit:   05766c2a 3939a323 b12c5488 17fefaa0                
        key_in <= x"3c4fcf098815f7aba6d2ae2816157e2b";
        rcon <= x"01";
        WAIT FOR 10 ns;
        ASSERT key_out = x"05766c2a3939a323b12c548817fefaa0"
        REPORT "FAIL: Key expansion round 0->1 failed" SEVERITY
            error;

        -- Test 2: Round 1 -> Round 2                                    
        -- Expected Round 2 key: f2c295f2 7a96b943 5935807a 7359f67f     
        -- Key bytes: [f2,c2,95,f2, 7a,96,b9,43, 59,35,80,7a, 73, 59, f6, 7f]
        -- 128-bit:   7ff65973 7a803559 43b9967a f295c2f2                
        key_in <= x"05766c2a3939a323b12c548817fefaa0";
        rcon <= x"02";
        WAIT FOR 10 ns;
        ASSERT key_out = x"7ff659737a80355943b9967af295c2f2"
        REPORT "FAIL: Key expansion round 1->2 failed" SEVERITY
            error;

        -- Test 3: Round 2 -> Round 3                                    
        -- Expected Round 3 key: 3d80477d 4716fe3e 1e237e44 6d7a883b     
        -- Key bytes: [3d,80,47,7d, 47,16,fe,3e, 1e,23,7e,44, 6d,7a,88,3b]                                                             
        -- 128-bit:   3b887a6d 447e231e 3efe1647 7d47803d                
        key_in <= x"7ff659737a80355943b9967af295c2f2";
        rcon <= x"04";
        WAIT FOR 10 ns;
        ASSERT key_out = x"3b887a6d447e231e3efe16477d47803d"
        REPORT "FAIL: Key expansion round 2->3 failed" SEVERITY
            error;

        REPORT "SUCCESS: All key expansion tests passed!" SEVERITY note;

        WAIT FOR 10 ns;
        ASSERT false REPORT "Simulation finished" SEVERITY failure;
    END PROCESS;

END Sim;