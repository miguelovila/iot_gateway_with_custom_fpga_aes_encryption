// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Thu Jan 29 00:03:17 2026
// Host        : gapapaio running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/miguelovila/SimplifiedIotGateway/SimplifiedIotGateway.gen/sources_1/bd/design_1/ip/design_1_axi_ethernet_0_0/bd_0/ip/ip_2/bd_929b_c_shift_ram_0_0_sim_netlist.v
// Design      : bd_929b_c_shift_ram_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_929b_c_shift_ram_0_0,c_shift_ram_v12_0_19,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_19,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module bd_929b_c_shift_ram_0_0
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
  bd_929b_c_shift_ram_0_0_c_shift_ram_v12_0_19 U0
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
Zhud
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
c/rxI2yOZFb25EE2L8G6z5wS5/uo5NQTkvpU+4l8xrd6CS35nXu7a/WuBeMFVL1ooEMBalwzvP1g
lJPMVVJXOvBipiIlHYXXWY2ODS3aicERKWtn8xNqi4qBebyKOVXTYCLpFHxGMXAQ5qhB7M3TuuH8
Vecv3l5Q/S9Xl/JPeJG8LxbnrhDGWV648ZdroeAzS6BtyXvt2ncWnxH0aupu0A6o0HUKXprsCEM3
TSHCH7UeRrGAIzZPNpyehG1xMpa2gvwncW8NX1s97sywiLxbGKP+QiBN/XfOLyGfGxKOu0ENB76A
5Unfe2Mkm3m5rUa3/DCrDJlh2FSQHsfqw9YrRQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TRqS1rFlh8obUlSX9cicnEej8vIESX3iBokj8ve0N1eWoq3zFuFDmYwijda2B4PeYzbg/K/SmvJZ
rjHYidcBod4j+oySr1M/XxOrQddwTHAGCoKQSMtiFgZn3aVBlTRMyQYIT/gfKqS4jhN/Xd0iVRjM
C1KTlJPl1nyYgzP768VcNaRPtKgWdhqvjNFFlB7eYua4y4RQy8oRtJkyxJGNniw4+fWqIhATK0kA
BEyYekjEIWBspugp6KBUOKIucG2VVYqE4yErYN2jbeJAF3RJWf1L4H+XXREO+bAj/SoHhlmzE5l8
+1AURKb5heQ0zCOoUJvKE3Wg7KuMlW6QCguB2A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 4128)
`pragma protect data_block
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
1Y9NEMf4V70iPZLljU85yNf1x2SNHqyh
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 752)
`pragma protect data_block
EG5JT8tlljLEwjmMHrWGtFl3jjvEfnqtrgtA7StvJ83VGlWfLFSWUsi8JjS+7Uj5jlhO33ZsDEqn
EyPBwaapcJSfNzKnbhi5IqY6oj+KOgO+vdEZPseint94rJfwUVJg6RxjH2j1RycHZu0CJKpZ+a20
Cd5bLeKK8jbtaZJo4uybmBI4K7uSFfPGCP2+ICPc43+tOSxRT88tVJjoXCGiO/lxFt1uYFCo6qo7
HhYLVjl+Ufvh9PkvLqZpk9tyPs8Lfh9j8+RhUb4i9OESn2COHHao0p2odT3ASa8Io0HQVoNuI0QP
4Djz+3l0Uc67Qjrb1Q2xo5MRsnrNmU/bY0P7pSEREQCaoStp2PXAWFtwCilIjwqGtOyuDaoBtrAf
Uncxktv+F4R0osFW3Pt3AGL1Y2Cyl8wry/1Ha3sE6iK9sfJaM/oZI0U8AQtKbpg9A/3T7LiJpEIk
Sz+/U8IZ6LNHwurpAUBL0RW3i6fhzsrXcibssWWLVMek8LbnpQb2gSsaVybBQQEZ5nvwgP+Hl4+3
22yLykCwUay371FttDiWBRFSmz4fXQbcPmKZE1MtuTO7h6GCrH/lc5n2J/ELDXNXYrBc7rnlgN3o
wq78XrKk/7DeP/aolG/acDuAHrwMGeAwAE0b8RMUhU9iXZ548jHKCQDUCrspErCTGofTFAXRtMjw
XAoP7dFpYTdC3xdJX8KS33Drt6Msxc0+6zcWfm4EqFpmpVENfWgC5iqKoIG2/puJG1e1p8aO8nFJ
lQk85PrUz3EwAVw3qSvFSeEFd1JuhbOXOy9xBkj+tSrbDplaRBcdF7rAedPyA5IW90uh4VOYhdaZ
9B67gWIDNJ1wBemBejtG4480ba0+btG5iCLkavYhqgUjL1nuzpVmcimZYiYv0PrJ4G2lwbMwgum+
oAiPQ9Hf2g6g3DRFO9/pj7qMYgcFGHAuQRssgDYUImgIxXqjfnBrHrRZuiW58a456jruvCIDcALW
DKg6uEi1hqwyzto=
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
