// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Thu Jan 29 00:03:16 2026
// Host        : gapapaio running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_929b_c_shift_ram_0_0_sim_netlist.v
// Design      : bd_929b_c_shift_ram_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_929b_c_shift_ram_0_0,c_shift_ram_v12_0_19,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_19,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (D,
    CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_mode = "slave d_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [0:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_mode = "slave clk_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_mode = "slave ce_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_mode = "slave sclr_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_mode = "master q_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency data_bitwidth format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} DATA_WIDTH 1}" *) output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_SYNC_ENABLE = "0" *) 
  (* C_SYNC_PRIORITY = "1" *) 
  (* C_WIDTH = "1" *) 
  (* c_addr_width = "4" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_verbosity = "0" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_19 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
p+igLpgrQSRNFTl4O0r1wpr1I/8WGno+i9KKyZJkqaR+jao1ooUOhQ1/Cg95FKx9Sbm1JII7pkpB
l2JG9Q0CAF8DqiFn+IvCIcAu6XArHxFClTJNZAxKh6jGUd5Fi/MY9VqnU9G5W9Pu/a5YSAs1GSZ8
6821TQqhts32lZhV6C4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GpcstpGMFoSsZs1ZYI6FImaQIkeEa77DY1iztjSi1ZBMxoTbE/IAwC1FpFuaQ+eB5tOSQXUxw0ub
ibUyOWC1wtVXI/Hq9mgkGS6q6dgf+LNUFV2UgaSHQniB91j6nV0Q6AcBggL08XdNTjwzv0YeSEw4
gc0fBjSfgU89LMr/8TZUDPXLxSAyAkBD1H23ztSTLH7tjE+FmWeiBKZ6PS4+x4qi5rL3cfHFJGSl
FS0x1xclWPPIUwtdVlZU6325wyN6vuXdCBxRL8Fw0dVSXXza9XXvtTTm9EmFRwJo36x3GavA/rRE
bceVqwGNnF3y1VjAvAh6V7JoTuCLO/siyXp3Rw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
llmbFeOrtg1LG3dUVZb5kOuuejeP51ScMift+ZHeX+mAtdiz3ISSCMzec7AuIsa1Mo2+00y0knDP
vckYe6CAjRqzuHO+E6+kU5BgNpvJxYIEhsFkYOyXSHMUOaeaPWaiXaaXlfVf/1svKcQ9uQ6ssmEk
Cq15e3XNEeh9m1mE/kk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fchoy4N+4Kf7I6tgRr8JAd8vJdoz4r2D1OBxFrD9QVIalTlVtRfs926x5EcgdMm8H9ZP5hUR5mxC
1dM/QoCsGMf6SYM1Nh3hJ0zVb/bCrb4btjc+ovqch8kUmFbqQ7Ot7FiuWgSlJcBYHAQkIL3f2UYz
oOwXdJu+vqeJLFba5HB3tXNn/5TkGScSEJVQGgG5BHY+gbedmABbEBqB06m1BTa44InR8tg577tO
NDwb/k+lQgqEWHi+LLKABKVaYoXVAFPoWBESL9lkRDetFRGev+J3wTGNQsjG+X4d4Tg8VHI6Omq+
Gjb9sn/4jjjiLBSxN9NENGg0NitrBDArJKU9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ccFLQpVi6xVLpdkDx5a/225NcA87ffCcIy+VLbXBKTuHithUkTWxn7u6pkwe08bL755Sxv8LpBCi
/agAtq4zd+EDKy/fQWXPemGoPXvlXd1Vb9uMb090nPVw+1aNVJ7dt/N3HvKFiyjMTUOrxkbW+Txa
v0xve4ubMH7yabGgh5X5wfg03sZ+g/pRhh/GHro2BTssaf7aGhG5LU65Om64gYIzPeVIhOsUpda2
EgS4VvLO8RpYKD5vKTaftPw3TApJ4GxX8X0vfQTU1nsGDHEsfy7qTrbSFsbkz0yac8eciT6TrA97
crvYOV7RGJTHPNB3Y/xDlc05/8e8XBfNWBZD9w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HKO99Gg7uct2CPFfc/ATsWnvNmLaO3HQf6GqKx47OuIo9iq1jE4BshCuEZR1uSzoUTsVqud3PB37
U+FPqOF6LnuXEOwKWKM8nFt0TWvksXKw+Tc6O/nRI/fgLW3s/shPAFDSMOBmk6ifEcWE5vVhGaPs
DoFTs2drXpV0Kx2ovEpjgFPki3iuAR3EyfAh78F82fgpkBu73/7kuAFSp0/160jCPiObFYGUTtAT
wE20ZX5TWTgdmoZRV32NtyWE2vqHRXl3OPFmLHu+zBdzj2jiae6Vwh269qDeerqanInMnyXMgHPQ
Bb1mg/F78ZNRQSd2BAZ+w5iDla4IbMtYVAdrRA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cSdT7HQ4y6MSLB6tuyt1Kl++wwgODBblKwvBpcgt/BUxjBZ6AdlYpihyDYNwRruYOOjnLZl+xWo/
3FFYsT5BLNFq6aXAn/QGIL+TCmY0nTCenq3HkR43lx1zweivNtCaALueuMjtTTll20VN7ejmH5Z6
G6ZW06MtJv6y6LIjSroCCa5+DhGhT/fxtCY+KmpSxzAN7JBEdZZQSyxslmFS+lc9SJtKQQGgkSGn
gTrCwW9//BYx0dyku6lbvXG6AuCMxV5nymjSd0B5Nls8JGBZNWqmHrEa/R3smxW/FtF0f+iJyCEz
btNfkjSnVkucLj7kdQuW4Bf6pv/txUYiOtwVZQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
dzcOoCNNDuSCteVCHmYgNsBhMb1lz9slmG06PHeQH/kVMzLQ/gXi7tvkmQtlthP2mBTxgAxaFcQz
J0RTc/gae1qijbhgvFP0Mi6OJiSDkId73BYyKgZEM1o7yIJ25U8XIBK9bMH/E7taNHgsjtcDtWsR
vtpTWEQT99v4LW6iQh1bSmPf/ijgwoKFbp6hNPo3d23a+sGJnkgDDff2g9YUBOcOn2ky1aIXK+LF
ppive9Lt9n1MHXFovkTbezZBz5jjmrO71US9mqwlKwQHfH86hB07qn69JYS3gcmoIE8D/fCKuHWW
h6sCzEQk6cB2f8us3zeMGsNj9vzvj7nMAnJyFDVODe8J22v/HdQ1vyva7pndWeQoLh37JyqXCNie
O8c4th+OGDhBFT1uc+YLw6k2FykUK7hx0S5qabo0CA7m6fkPfVKkgZOkbe7cUguvZI1SSWTJ9Q3o
MqfDMLhxZ3wPpCKhu3EpswDu3NF2Ie04SX6/jdo3/2YhGf3UKSTkl06o

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jt7+uD/wVxJFPh7hiMQ1k2pWeEekEeeTJxbu8cyfsXW+EflIX7R8vE1lXtU8y9PXlnuqzyZ2TvJw
I/opIjrqjWAEJoksgOzrFqNkAyujBwP4hYipkkwFuQdj1GHyr9e8nvGstzZaEknwAJOltIdwxzzf
GO8EQzeekYXn6Z0PmJZrM7KoE++x9bN+v9qnAwgEFRZ50zzUJvSbYgEQtRyjTqayiLa+6z34FSui
qu87SigZ+WVr3+uTgHxYZpddrsQmirTG1L3ftrNB1xZj0XwMyskt3AwibXWc1mIbw8FzlEq+A/CS
awemGKzr2TaM/EBCm7EL14YXf9sGccwlS4tu1A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2112)
`pragma protect data_block
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
Kfo6
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
p+igLpgrQSRNFTl4O0r1wpr1I/8WGno+i9KKyZJkqaR+jao1ooUOhQ1/Cg95FKx9Sbm1JII7pkpB
l2JG9Q0CAF8DqiFn+IvCIcAu6XArHxFClTJNZAxKh6jGUd5Fi/MY9VqnU9G5W9Pu/a5YSAs1GSZ8
6821TQqhts32lZhV6C4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GpcstpGMFoSsZs1ZYI6FImaQIkeEa77DY1iztjSi1ZBMxoTbE/IAwC1FpFuaQ+eB5tOSQXUxw0ub
ibUyOWC1wtVXI/Hq9mgkGS6q6dgf+LNUFV2UgaSHQniB91j6nV0Q6AcBggL08XdNTjwzv0YeSEw4
gc0fBjSfgU89LMr/8TZUDPXLxSAyAkBD1H23ztSTLH7tjE+FmWeiBKZ6PS4+x4qi5rL3cfHFJGSl
FS0x1xclWPPIUwtdVlZU6325wyN6vuXdCBxRL8Fw0dVSXXza9XXvtTTm9EmFRwJo36x3GavA/rRE
bceVqwGNnF3y1VjAvAh6V7JoTuCLO/siyXp3Rw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
llmbFeOrtg1LG3dUVZb5kOuuejeP51ScMift+ZHeX+mAtdiz3ISSCMzec7AuIsa1Mo2+00y0knDP
vckYe6CAjRqzuHO+E6+kU5BgNpvJxYIEhsFkYOyXSHMUOaeaPWaiXaaXlfVf/1svKcQ9uQ6ssmEk
Cq15e3XNEeh9m1mE/kk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fchoy4N+4Kf7I6tgRr8JAd8vJdoz4r2D1OBxFrD9QVIalTlVtRfs926x5EcgdMm8H9ZP5hUR5mxC
1dM/QoCsGMf6SYM1Nh3hJ0zVb/bCrb4btjc+ovqch8kUmFbqQ7Ot7FiuWgSlJcBYHAQkIL3f2UYz
oOwXdJu+vqeJLFba5HB3tXNn/5TkGScSEJVQGgG5BHY+gbedmABbEBqB06m1BTa44InR8tg577tO
NDwb/k+lQgqEWHi+LLKABKVaYoXVAFPoWBESL9lkRDetFRGev+J3wTGNQsjG+X4d4Tg8VHI6Omq+
Gjb9sn/4jjjiLBSxN9NENGg0NitrBDArJKU9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ccFLQpVi6xVLpdkDx5a/225NcA87ffCcIy+VLbXBKTuHithUkTWxn7u6pkwe08bL755Sxv8LpBCi
/agAtq4zd+EDKy/fQWXPemGoPXvlXd1Vb9uMb090nPVw+1aNVJ7dt/N3HvKFiyjMTUOrxkbW+Txa
v0xve4ubMH7yabGgh5X5wfg03sZ+g/pRhh/GHro2BTssaf7aGhG5LU65Om64gYIzPeVIhOsUpda2
EgS4VvLO8RpYKD5vKTaftPw3TApJ4GxX8X0vfQTU1nsGDHEsfy7qTrbSFsbkz0yac8eciT6TrA97
crvYOV7RGJTHPNB3Y/xDlc05/8e8XBfNWBZD9w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HKO99Gg7uct2CPFfc/ATsWnvNmLaO3HQf6GqKx47OuIo9iq1jE4BshCuEZR1uSzoUTsVqud3PB37
U+FPqOF6LnuXEOwKWKM8nFt0TWvksXKw+Tc6O/nRI/fgLW3s/shPAFDSMOBmk6ifEcWE5vVhGaPs
DoFTs2drXpV0Kx2ovEpjgFPki3iuAR3EyfAh78F82fgpkBu73/7kuAFSp0/160jCPiObFYGUTtAT
wE20ZX5TWTgdmoZRV32NtyWE2vqHRXl3OPFmLHu+zBdzj2jiae6Vwh269qDeerqanInMnyXMgHPQ
Bb1mg/F78ZNRQSd2BAZ+w5iDla4IbMtYVAdrRA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cSdT7HQ4y6MSLB6tuyt1Kl++wwgODBblKwvBpcgt/BUxjBZ6AdlYpihyDYNwRruYOOjnLZl+xWo/
3FFYsT5BLNFq6aXAn/QGIL+TCmY0nTCenq3HkR43lx1zweivNtCaALueuMjtTTll20VN7ejmH5Z6
G6ZW06MtJv6y6LIjSroCCa5+DhGhT/fxtCY+KmpSxzAN7JBEdZZQSyxslmFS+lc9SJtKQQGgkSGn
gTrCwW9//BYx0dyku6lbvXG6AuCMxV5nymjSd0B5Nls8JGBZNWqmHrEa/R3smxW/FtF0f+iJyCEz
btNfkjSnVkucLj7kdQuW4Bf6pv/txUYiOtwVZQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
dzcOoCNNDuSCteVCHmYgNsBhMb1lz9slmG06PHeQH/kVMzLQ/gXi7tvkmQtlthP2mBTxgAxaFcQz
J0RTc/gae1qijbhgvFP0Mi6OJiSDkId73BYyKgZEM1o7yIJ25U8XIBK9bMH/E7taNHgsjtcDtWsR
vtpTWEQT99v4LW6iQh1bSmPf/ijgwoKFbp6hNPo3d23a+sGJnkgDDff2g9YUBOcOn2ky1aIXK+LF
ppive9Lt9n1MHXFovkTbezZBz5jjmrO71US9mqwlKwQHfH86hB07qn69JYS3gcmoIE8D/fCKuHWW
h6sCzEQk6cB2f8us3zeMGsNj9vzvj7nMAnJyFDVODe8J22v/HdQ1vyva7pndWeQoLh37JyqXCNie
O8c4th+OGDhBFT1uc+YLw6k2FykUK7hx0S5qabo0CA7m6fkPfVKkgZOkbe7cUguvZI1SSWTJ9Q3o
MqfDMLhxZ3wPpCKhu3EpswDu3NF2Ie04SX6/jdo3/2YhGf3UKSTkl06o

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jt7+uD/wVxJFPh7hiMQ1k2pWeEekEeeTJxbu8cyfsXW+EflIX7R8vE1lXtU8y9PXlnuqzyZ2TvJw
I/opIjrqjWAEJoksgOzrFqNkAyujBwP4hYipkkwFuQdj1GHyr9e8nvGstzZaEknwAJOltIdwxzzf
GO8EQzeekYXn6Z0PmJZrM7KoE++x9bN+v9qnAwgEFRZ50zzUJvSbYgEQtRyjTqayiLa+6z34FSui
qu87SigZ+WVr3+uTgHxYZpddrsQmirTG1L3ftrNB1xZj0XwMyskt3AwibXWc1mIbw8FzlEq+A/CS
awemGKzr2TaM/EBCm7EL14YXf9sGccwlS4tu1A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L0hPTFq0vRrxk9ckPzuDXhguiy8btzEdWxq3y6ECc25N/r4Ol7j/JuAwzni+dt41AR5/zUmhqAQf
cO1Yj6bU2HK7k/u4y+H5QAXh3MHXeXGaM9L3dUAsDa7hlyTGurBUGfFlBYseEnqUnQbUCSsK+cCR
EOBaTcMPvI7CMcghi94CD7cju4lxT55TU8c/ULD64hh6F9JBnZmJkVrBmrttutVpxQgCeqzA7EMp
PN+HWg6Gwcb7njJ3Dn0WCxhVYTxn0EPSQNyoaPV14C3zqkFj6/476hwuo6yBOVlZUr12GvECRKOX
JwP7//kcl4AzyUUTIrVNKIq0VTp61fa6PSzlLw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
f84AacE8UYtikQOlKrb32SUor7DIg4LDrjY5y6S0GBvgiIH8nf4OCt7thu3W7/7cvtaIqLGhGnQe
DxBVTKPgN5bvAAeB9IrRwMKllISRDSYO21qR+sQNjc2JyKXj0LSgCvGm3aoLJyse+vtbNZrvv/3Z
o3XYu/oIp28MDmnM+MxVvQQh0TmZLiT2lMmL3qrSxIaDf462u4ifGX8X1cw6jB/oZ28gCnEJovxf
q/SQ8fcx1xLaac0oaLCAiscax1zW7ZiCecGFYjIr95twqn2E7cvyHnJQn9D/y/Pzgi/8Kmy0wpG5
WGy24PhWh3LFBkI7Gr0ykWOOaVA4Nr9e4/WzPg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 4096)
`pragma protect data_block
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
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
m6nmT00DSV4viSkuwD81ih0xPRccgwrlHSZOLiPcZWoy2vSmmqzcTLTkDUDrSc1vKwgiLv97jBj2
TjUd/mka7X7geXu8mMJP+o+JK6GwBzaejLAGtIHm7iisC0q4x2VfW8C0qPLpUtsrk/PQMJ5hNZnt
Br/EIDdL/wf5ObS16AU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pd3kKRofUeP5bNPloir/qWrjqJrlrAGmTGvVKC6TxigUNdAdrTPTtf0nRwg0TNGL/mZVKWrF1isZ
dg9py/tHacAOP2xi6xXwZMfLiLuoKB+g373D4Jbz0XgvvKnYLRz1svMOrEH09FBBlkkvSnRuFgm1
U5I4sXc6ImgMuuYMjqowmLe4wxoki70wADfekYuplcMz7R3X3wvGBuIF32EdMyqq6E75ujdEN/Kk
brkThslMhMtbxGU/YDTMUbYwb9W+ZfhiqlSsnMGReaF4QZJISSACSb6XOCybHYEA71KwW/3R+NUu
TMvL9oR0t5AT/0kVC5rQgMoW7xy9YmgiDbNo+g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NXLVavelpfQoP+vfJZT2AqMpQnOy8SmAcemwgG7CV5F+1NtLQTZaaATaBru715PbVp6DgOyggE3l
G7uCqz0/nv1lgL2su2nu3VpDprlpu+CwRg47QWuXkLRwBa8yShksrfDgucUvveEZMi0f07FfqThh
xf4+ZV6SULGv1/3QirE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KMHyzJQESZCL344BOlvu8lduQ8YkAnjcoMli4bv9KDIqsoKZlWKRVTvdBSUUE4KKdy5Zcs6XzB3T
HtNjikdP0ymPP0J5D+LqRB5q9PE0l1m+ps22iFitULmmZ7NFxWx66eoHPPV3q691oBfyCCXUdPxE
riE2IqiP2ruFgP2Y8aLAGxWYga2ySMvSyCB+LMberK5LyZZC9U6PkvthMwICIS4U2M+CZ+wj3ypj
ScLCEeP2fcGEbfmRWKrtKuINrO9Nf8NxrMlxUZcmEAJqlYSNv2FS5ljzRCbN3UiXUhd7pHnxDNp8
ycDVD7ffY9FiH2QmIKiptvMY5BjpI6y757Bq1w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ntUguvfbnc1t+hsau9Gsi/qVrkcLCiox1Ma8fimkcpLFEJktsHaLwj5lfSuEvo7LBhaWkf9zeU7+
HJis9AHP8Msyi5rw+FgrlXGv/GdnRNzXOfwiBXIY3Mq0Ga51pDvRtaptEUlA/JXMknrSurrxTVyK
JeqKkLjnjlVQrKhU2dkQScySCj93b74P4v5jQVpS2CpSCaeF919IF7uSTAXRH8+WlmrFf3R4Yn9R
wYdH4VUE3A6mrWj9VtLLokURR3Omf2WrkAMK9LDjp82eLLii+HpsxVbAsjem9AGhbZOQNm3ZnYeb
iBy7k3RcSgGWPF5MjMBYy6S61TurfZi023lK5A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
m+nm5X+5dhapYzhPNuNnO0INKfGWFuGXOp9ep1r/rhlTPINMnHLmnBJwXg/Mk0YerTIzh6gLZ7yR
AxBPdgpYv2YEbOvb58WwIgcVprFUjrX7zc43A/cstky12LcDKRWc68/4MY9c5liSaeYGuvAsVLz9
otZom/FKWgswyBKoY6q0SYvRobPi884E0M/pvR14qdu6AOKy20uQzYDCyGtZbUt7M4PKGcEiPOrD
X9AqejGjpBYpf4b2Iv2z/orEHggCNVOMlQtGZqJK0Im6CgyX5KDBgmlQoSp+UvnYHwYQ0iDZgHPO
dFezqbCQw7JF3gaq7geiXJU8lUTZ1cOmt3XKjA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WsY11KiKKCpLn5AfjXSUWcmc4OtEjTida5KJ8eix8qUlx0oUL3fhEY+9f6z3LC76WpdJpDYMxRup
611zSKBwBe0RDx9X2gK9gAcWejIGVMFB5l9eBA06UYlkhzI3MxGTjnpuW/HythxK13etBVYLtPD6
V1XCHfy/2kBOFTj3G9ev6PT3NGjOAsSwN36fMyo6ivVs7sHUpnf3W3xXrv/WPYgT2xIxH49i/b85
7SRdjR/VU9k6GG/PgtONhctSXFinHNHp7ujqjui+L0aU5WJc7mSXGjq4PiQZsD73seJIVpk2K2rN
P6vXyormcClKRGXoe+FDMvwPchfkaWsspEe2GA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
v7iU/PIztpN3OTdpYFnhphiIQV3M3Dt7m3Dqy7B9rKwcm1gvQSXKMhyTvoXWuAI9Nfi8s6nuaOox
iGaUXoSQpGnkBgqQrJZt0SBou6b+WWmvf+hDPyqz33WV5Ml/yVhliQt13oWbM6cJE41VeO4pnTug
As3osHQOhcE0uU8XgqR92l+0L7mJbnkaUo9H+b5GuMR41pPN0ZbLDQUr6FUFZ12SRZ4jcyDjLJ1a
kERH7gvuMs49505eUxhhHIMrpY3AdCITyHSYamW703QV0iy3GvcoDfgwDClFnF4jbIH1RKKQdox/
N0hClEzle9NNYLBW2y1MPU2Zh66PSkOqxHvgnbPl5BI4IbN9kDLniupQw8xCPBTu5G3MH6aHiOkk
vsvhFk9u5rZTFxk6HPbO6TB96fu8Ym+0dg0rfNsbbbMBzjNDuFUuG8EKHR4iLpVgkGoExkHjPynk
9yRemZnUyjavUSkGTeqAIIe6q4k5VC3wbURE/ByxQBhI01TwE8wMz+Wf

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
V0uSH2o745bvC40ZceQwJNJ19fx1MvIWvNbhrhJz7opQ9kcA7gUtfhBBuB1Mnq8cVVtE0J5s8PB6
V73kcbIPXrYm12aPqUEpIRkEnK3nDZ1ZZpGIoTlJw/cW0hVkWMhg7/vH1blwX4hxqqe9jm81qMaI
j2IYReSelPKLLj7khdPL/hrmuq9akVqwqOGEd8zNpgsaftdgGAFZQpb9VzYCmw3z8p3FK9hpXf4a
km+T4HEtI08Ct5faNDySPrrXFvTwIWwjg5mVzrGw1xbbKQs3WZXYW/BEG7VP5s/VXmjOPwr+FpW9
iBO5OPSbfWgqZ1aNfN8G5H9OSQBQeKSrVUVKXQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tmbvjK9MX+VZJNTv6Lh+JzC6keEypCtHSNxEg+sIHGBKhstEfaJbhp42EK/w6kB7UE1WE5sQcq7e
6N0TVJLOUawyiG2kTsWlnPPInhdNBjCMt34peLIw4GnmeY4M1hGUlw62n93GnE5QpvuSr0IajkQ/
BMxsLqIXxnq/0pIVmuMYkxOxMNcEGH0xKsuD7BTs/h4ZHIhhgOV/GymerX+MuycZzPPGnLq78nZI
dTn5vPPajASyiJkLnufVPnTAmlU2SD3/Y56XKaNYKlTTDmtj6G4Gy/6QWGkZATFJ225FYZ3Bq+Yl
HMyQ9p4m8NGoRV6Bv70OjI5uhQqNDK9wwTEBZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EjpnV8BwjE0i56yySCzpzPOtQQkSV6F2WHGsUO6X6aEdsVuKart1bCPRul4jAs27hddmYx7HP3h7
KvxovxRq8Ofa/L1Jvn1FAFCevNTsdRNGLNF3A8J48sTLp9uHPp6SVyPA7+1KJMO15RGVjLsYaOvP
5tTVMOnyiaFI5sSHSDdk7fMVVkluAE1GJPxl2SLxivD1Gkh8dLhVFOqzRLM0eh9yJWR/mo2e/vpD
bGPV6xMN0XhW2maeC+LAZo6sE1KUs1yKzomrQzLc5zN7dONvT+o6Xg1gmcgp1JeagfT7KL5TxtPj
f6mMOZgiZg4803EJpI2NqOLz/5MR2uab1ualBA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 720)
`pragma protect data_block
kMhrLHil2oaRgcWvuoyzPRqD7KSPGB9HaOfm77FymOdXs/r6T9Ec55K5Tfdjw2idbibqImfOwAjk
de46NI7fBd+HABvewdSA006a35NY7LZIN9DHpMKfPVk41ky9whqy+404qgQP8HovQVhAHJno3Voq
OJQazs7cME3Ejk7G5XHqo3fGDltTVGF00Vk/mx4+n0JRFQV5J3s+5bUBPaOJbpGPsoiNTbGpmTak
L8km1h3OlU4+F3dRncrVrz/wtoWoujU5MI9irbRLbvPYujeWb513tDcuzpBabgus2TI5kPkF1q7/
/nkNPOjKu9cgYfyc6KpWUQaJLT4tbNFQRlgNuDlXq3iRpRzKp1bdnAbLFdHuPo3U6nwrDeQAE2vt
Xivtd3fIYRGhgReHyHrBfOIuHy6kb2GDZNO6MCINFG1B7+gqdhvQ5Kro+/0Ovt/B6q9GJblST1Zf
/jERyfC42h/5Bo2AlVsS8g74Cy6HrRht2IwiX+PZ81ZZ86lfwpJzvK++wxG0IVOZWGgCPOzP8I2P
O2O7C+cABtb2lZzqZgigw/46uo/SNMsf3OZXTNcEJzLZwhO4hK7eVGSiYOvXkcCKCO8qnZZVsamh
9T6xmXR8+iXIwRzJ0O331eSHrqsgz198yip0GEYHSWbbWG2ZnYtBxmarP54JzEhdDVxFuBYShnV9
5/151YOR8qv0rYzgW98uxnt5YQD5zoWfuzCylQ7MFY8PsLqFm+C6GA2dWUkHthZoMEGLolNCWo+N
Zm9FxuXnx+0PfGTKNZ5wNuzDi1Ot6qRbAG+mrHJjpdB8j1baOlaZuI0IID8kVthgVLSUSh+hEudX
M3iNpUbn86R9JQq+Ut2dj98tGVW1YU6+hrAyFyR4Vblpdy8+WLygZzy3cLvKBd7dHvk/0+id0Zt/
9BG9CUnR+nptLn19lZR8XfKtZyvZDTVK+/9f4faOIg26BlbO
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
