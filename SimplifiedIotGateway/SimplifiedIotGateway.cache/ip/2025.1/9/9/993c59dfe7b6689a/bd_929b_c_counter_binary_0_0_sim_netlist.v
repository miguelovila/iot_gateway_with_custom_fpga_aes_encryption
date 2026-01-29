// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Thu Jan 29 00:02:44 2026
// Host        : gapapaio running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_929b_c_counter_binary_0_0_sim_netlist.v
// Design      : bd_929b_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_929b_c_counter_binary_0_0,c_counter_binary_v12_0_21,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_21,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    SCLR,
    THRESH0,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_mode = "slave clk_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_mode = "slave sclr_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 thresh0_intf DATA" *) (* x_interface_mode = "master thresh0_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME thresh0_intf, LAYERED_METADATA undef" *) output THRESH0;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_mode = "master q_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 24}" *) output [23:0]Q;

  wire CLK;
  wire [23:0]Q;
  wire SCLR;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "24" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1100000000000000000000" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1100000000000000000000" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_21 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b1));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
BzpXTEKA8BVsrspByEDp/11GmM+rxG9XMJJJnmPNjGdQQboQwi++OZU3ieaWxVBebPZFocPwODUK
3YSjgSy7gDq0QaoBQZG6dZMAag7Ne0KGfWsP1RqdsPfVxeH8Qx/6wZgpp78UM9HQGzTHo1GLZBWS
D4wUYwEsU87u9Zpk3qs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vpBJkG8TIIvbLGijR8Bv2vcecc3ZXSLh67+33TG+HIWVhhxrrYg0y/8AvFRWiudkKCNlAbPuc21/
CBoxEnV/LjWMInbIFuSDIvOG8YntNXFMyV5vsO6fmRNacW9hih9Fw2He/tr75B/S25kFdFus6dUq
8UyHbnShYb39EGpaT8QIg/FBg3M4scSnbKUQgZvAjUqPbPp24vO/T8m2aU7Vep++Wl0eSykhEgjW
MjtHYZn7kE2KKNgxYa/KQbvvP0Gf7nFLvEI10dGiGLxPd1u7V370HoIZjYKDtyR0kzX4BKMwwKoS
NulYuGY6BDWl62DKHwhGYkf0IS+HXlSikk4liQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
E48CjVwTRLHIDhOzAwgts1XbVc6DxcxGnoR9OV1zjKj3qFL1M/uWMiuaVq+LhoGPTQ5A4NG56fLV
5VV7/BgXKg/VECNvgEEYeQT/wj1+DvDdp504/7nU3sBA13uhhPSNa7nI0u6LqO2vksEZLQzkRkWh
eiuYdOOIEGb7fsy61HI=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mGOeQ9tc5jI6QAZv7QO4L3cVfVa/LhRQbJW/zRcR+rZXpzRvcDHrXUpbvJJmZiGLu+GO43OagOrs
JJje6ctkHjBbdnaclDtJoVMLYaE/wmkaFn8jO0jKVzfHGwOJ2tex55X80BDpAb6poBcWi5LL2/MV
xkMZZcV65cGDdTRFLmf5M7lifrLkaqOwgdAma9Voud8egHaPwtITXN1T707M5717wNjUoA3xzaNq
SxtdD6rBT/R0rpWqnetxcdcm+cyJtDFAiFXfWYtheZfJQzLzNNr0+gOtIl2Vsj819K1053mMlIIA
7rPm0YsAyCmhhBgGHTJ5hsvbewhsG/oMhPnwyA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ir2SU2p9N+IdgqX22ItQaWq9hixnYLt4vKaB894e/xFxWuXoMzqHcfYR7vBCuujeMXpoSBBVJBEb
aL1CBX494Fct8JbU64s8drP+5zp7Ik5bO/BP6UDP0zR1Lk8gBldA0NhA+4R/NtFKoHBXV9Hyqb4c
eeRiQKbkzwOpniYRNK9KaDFaR6nhBrUIiemCW1UApV1qD7qZSafxFn0I1XFe05NsAyumBdNUFj8N
/AFeTcU7CjC3SR0TehjOq+M4ajm2Eg6C7r7+jIhJqgWudMuX6NhOX9KPvLKao3POKANouaF9rkjY
U4F5L9YRkFYwysEBCskyCWTzM9gmnFEcNtTHjg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qCdZIR2lY555ysNYtBeic8wRf70LXFEa31kdQ5kzdBTiiODubBlmOjZkSwgV2tYDTGtnwtOcvF0s
Elys3IPJllruqyEsPok2IPTWRmwZhhM+jT2m6JHal3xelQUa9aATbp6zuYJOJn1D31DpNoLD1DfZ
AJ2P+MTOyy8gQujheVqkOqmJgl9dQ5ZjrA8GPkJ9UYXWhUlpQvCj6ti6jVbVXZj72iqxdK9GnHk1
nHncVoywR5bxthUHs3N/GYvfrYpt+JEdVOIjkVAiquKOJWaRb7l5XP3P5JaVRnbNQyQdLJ9N5kKL
Dlvam6j2UzbfKWdcZaFoiHHE+Zgccsm1OviOFg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QxSQvBzpc2EEF090FbGf60i+fTpGqmZdwcvY+ujlnv2k4tn/UH5GonGALqhl46o5ss7Gi3/Z7ywi
nHOkluAL7B3eyqfuCiFqVyjpsJBKi1PGbIY5SQeLsEwU3ScOXCqOe4o0e8Ew0CzN2ieBjiRJo8Ci
4a2G7m9qSVvm10eUHWJjk7dBLAv39V1IDpNupW2sc6ExAehKASl2a1UyTfxU5xNcesaw9/ET326O
Ife91Cm76aO/Pnu/pvnAULbURniJRYxzfYzAjdZTF31GZhPmFaXRA/YBNGtjpq3zHk8wrQwLN+N7
j8LFGwUNTUKWqj7ronPDeIxcosTol4FIpCiPYw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gIe/tZRqjW0No3A5MCNWTIBlKvh9R8myhpu8uDYycW7kxN72cZojsq8Of1nYbk8iBoLnq5157CZs
0fBjlhoAzspgFPQV4yMLrZS6TusQ5yKtuqypUAjE7LJQFedz+y9ZETdxdVbOvYtWzKea0U3Fzv1k
tjOq+Cj90aPa3GGDyNfRqYx61Dpi2RHlFaByI/7zxFMWhJGmyMgTWlbwsEwdgHI7k0a7fRC/XY8g
RnZ4JXrhTHxkuK9jvS51fLbz9aaydUJ/XbKyrF1vGgzE4mG+74ggIbKzZ5xQtggLa0hWmCHzpeHp
ufwT86ozoQbfgn7FqbIbsWrG9GEF6TgFxFzBmZ7h5rhU5F6Y0NNtWEP1yVpq1WTsybH1KdfqnRLX
/fUjCypGHbL2vrR99Xa/zKUrEfG+GrGPWhqHX55NLQHuHuoCn6gaQZrG9hvMfqVczMXZxM1922Dd
8HrKwlNCvVtT/3daJVNr7+Tb5Atyq/jFISaNwYMM8xXyJiUIE4Ytd8OJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bM8gxHQieXQanVvZmD3hi66fOv5Uf/ir2vAxD6v2EOriOQSZBYrhXdRSaeTTm2qXbKAnKSsP+a/7
LMXmNnigIUvTNvsbQgr2yJifLo03H1WEwoBJwZIw7sDUSLpnQZx5EWv9XQwlAt2w86uuvWVQr0Tt
iN14uUJYdHV1344RX91A6rlSZ0AKu1CjeJN8t2AQl4IjKke0JQMiimZFuk34xuO0gcNE2YOfiQMS
v4AJOHL2LPEu+7TGgOxT9Uhpp91WdVWcKkPzCK4t41zgP2/8oAUiHhtzKXSnVgPe26RuNX1lsJki
eq9qM846JZxMsSbL8ipW3GG+i5qdsUATs6fzEw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kwJ6Q71uc9bPegeb1ytad4J3iQkoEBblCyV3UQfZOdiW1rDzfyAaVUoa9mS4XrfRsDlQfVRHBhvL
eVMmapH9l6BrSwIhz6DCnoH6W2/NMkL6uqS1cXT9X2xK//t+lUGjPOAH1jE5Fj6T5uQaROacGeeE
nbNfXy9tqV2HZ18qdM68c0xKg0/Qp3Kj7xFF83jUq/nnpQrvsTCEDOyknMjgcHUUgt8AP2oVxRT5
rXvX/2nFBClFCugAdgO+bqY44cr+vQ2qBuPjNCMpoLt7iWFpXzthEaUoJSGPH6QSJLv33c9pwWPU
eib9cnzlx+XNFaLe3i3/3Zp30PPnk0osNkxD4A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ckmb4dWDpAZAGAIVUn02YtfbkK3GxAuwJy6uBEXF8442TvhBd+VebHNHGgYyyNdb7cKMew7Ihod4
NLgbAwZVkdrtd4bHtJVVZeEnGG9+kAbFOzPhSu5wUmCNfLmdMN/2dkUwASCj681QZtR7Y/atMOM+
WMbBEK5ddfXkCLgrAd4FGC1MfGLc0MqY6LUwH9haai4ICPApVdSeuWSMaubHa7KaZtCfOP0XfhuM
gnzZnOb+MUEd2Vhn/OjVESjqW4rYYxu2FSP71dpG5TznpyVHKq+PqZ9z2DnFU1ldoe+zwEosFrx4
oCuFduC9IBNSOgy/Si7ouaDl09xJ/9ZWgQtjSg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2384)
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
Y3ZbCcdv9XasLMSMZW/y3Z6CUzCXNPTE+qdA8rN8R+bY1a3xUH0B/92K6jUJ2s2WEn1REyXOQgu8
z1NEWHIa9nJosDbj+GChjGTQwgXx6hcmrcoPipw89c2yCONv9um/soUaPzysLy4hmmECcp0nEvoo
xPoT9TYqcruYDtIOB7A=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F1IXWdxrPKwvTg8EeMjbKRbOQi8g3pVSNtCuVg69JLgqwWEV5YPJ799e7MoKiqJkPivuLi02N7OR
3hlEAzvBZ3MErCqbvMNQv7w7I1lUx9+PcnD0U7bq/UBNvJ4SM2MbX+zbypLiHoMWr2iJXBO7SNu1
rhAu1lfLAJFTaPeByNUlPrZ+jTO8nFOr63czMGj6idyWroogzVzYRiQWeWA1SPfn2YjH3ZVDvNsY
dvsAdBRES27GYG37D1ugMFri5LGOMaUqSbkct/gJpY9Gl7AtM6juWR9BFN8WcUmDZmrGRv5o8s7v
PvT4locJhONftqZXOCwafp7Nky6jEqmzPaBZTw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
bo7kG4Yo1muXASb3K+dNN076tI4tNFg29R/EzlrphZRJbZpGm/I/tKRbKF4dSppaobE1DPkNCMdc
Lm2HgNApmlQYjDsJNg7t6VPv/GU/DfWQY8Nxjpd1C+3gRDyCuHxYJFJUxCj3lzL31n9zOZ0dgqaM
g68NcofLsns/Jynvhjg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KaN2tJr4q0UNsRnsGonecTlshqKcaOREnPMxRFUF1thLUibwKC1aG9ZHSXnf2CHOj4jLmgT0RGUg
itULJEfsjy/hCOOVf+7cyWU21lL7ciL7Xf8ok2Rb2Co8Jqm8KTyikoWP9sOUZ/NJ6gEUEROrnQlw
uvEdVVmnWmNyJ2sVUmp3Ak7XqUzz+Kay0oDECH3Aat4yC198zQImE4yVhJgy36kw6wnLJmbLY+PX
BCv9k77gpJdX0frge81vAMSP/TAPKHGiqhCBShNIjMRtxL+uqAIO0jKw09FNpy+W6Fj6qowyL9PH
5jqpOMhg8GELaciGksOC/Zl2N4S73OQcbQqcHw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
STxdukJ0Ps7Q/iujvgYoC8IpCWBcTU5Y10ns6ltitMcVdYBmbbE6R7XGL5vuptPIvoGh8S2FGZLi
PBFLfYSAZP4oSXsF/mg/zitHSRxirnd81evlt0p09ZYT77/KV0OEJ8PpEYEb1vY7z1H1T4zlREBF
SdCBGMK8DtSTJX/RjuLQ7xeXVNOp/XBsgPFNnp/rheT/KMHYz8nkBpzuPce0SEgmAVUbp6xA2YHZ
GneJc/7zzuLACPFtpyCDyX7E8ngPZGu0FN6d+AkNnvsHnsMjlC5K+D4cUBRYUiBnL4XDU37xwoz/
1LQ8d+4CniEq+4kw+GWWJLhCoubXH+MZbN/inA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Y33HNuVH8FgqObSFFaKDX0GU3qNTzxgHbhe73nDCX69btae7453IbdcmV7iC/CPzwNp7zYlK03iB
0t+IeFq6WrcoVsF2WTwuv9uM/gBgovGdTEAVm5YSFK1byctgXjg0A0BdYS97jUDaf/4csV+H7ZyC
qvKluzcTGyKvUQnTomYUSQ28kLxqmq1NkJjrQlKtMRmhhI5hJTnsq98nyJ8EegaVWqIgJjqKjUpm
JLrEc0tMzdf/lUeie69ZABMmG0isSqiDk45ei2d1rVg1KNeJ5mLLLr7yD7thbGOBxhSJYebPWl1J
xd8DkEZAKORjNjL9vfNN1VSXbzRcEXSqmXm6Sg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Yw8TgjL3JDLwKvOnWlgfHV7HFJDgumk05JYG6xg+ZEl+tzRZNk2xu0gBOhr7u5/Wl0au++UmGY6i
jNz96oYuX7PeetoiWtoOeGQJxx2KpOlfWeBQo6ZiLOfhxGrZmgQcIxRmJRJgcdWMtlL4Ei/+69GI
dOMD+lhyIZpHEHK/bzB1udA4KYMEzoJpJZ/v1ehra0FwBIh9Gel4Bwg7gd95AbibIn1/dqA4i3Io
eprNWgFJGx7cn6KdT0iM5NWx36OnXFxDlIjBCm7hpEHPfcopQWSzd5V80Jnu4Sl7dwMGvnJMrv3z
tY/52wmL52JCVH9gzS/z6ahAghncs3BHheHS0Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jkfcW/kwccT/pnYgPwCFUAEXPO4w1sIzpMPIKA7oc+rEqJqr1hrOf9Jf2bYsYLtB6LGRcJa21Vmj
wuzdkTVyCAx7I6cfTipcRKP3KEsbEWRD+fkxZOrbtm530q5rDA7P6buM1gfHsBAJA4dyQW4sPWAd
XdThjGiOS5c34Yk1Nku7qda2Ngy72JPWCHZqcjSVcYq3t1Gy+vu/ps9RMROr+YpKxuWKL/TrlLyW
Zh2s1jF/RY+cQnbzAx2zQsuv2ZPwNMayv35zzsH+E2/sdw4gJrfsW/w8xon69M1K3HcyMHXkz1pG
1ARD2+r4X9TrUNmF0tsMGU//Yq8sDKs8tuZLEOMFXqiNt0cSO92lNunfvlgC+6Cj95Gmz5Ish4Ig
r738ysD14QJqX76mKB6uVjoans0SqrslykUdPdXRj20/YDNoBxGuDWORrvw8a+D0ZzLpNcW93Gm/
r4qqEqCyuKWwdue6gTrnRci11oxYSXG2gbTTYyQgn5mTS0RtpPG3q2EK

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LJGqd6SmZEGyn3I/RZHXQDVLBpUYHBXayfZsoC5aqeLzXio9mjP2jJJqiWGIFKE2XwVHURSLgk3G
H6kZmy4xc/KwiCHLNDWfqT6xXQrIiSgtx2D2iQuIyan4ExV7UT3qq4nT3VF8kLCvJmqTccLcd2f+
R+Xf2qDVdUDvGNnlmH41l4y4A/qSyULjdD4vQ5ECMXEvaa8cTlKxZakGA1WiCIfA8uSoTlpjQR0s
iMrT9wUgFuMs8+Dc02CQSSSo4pMYfhhXwronggT6BjjTGXR1+szUNBMU8lXyWTwEGb9cN4SZeasL
Wm0l1nbbrKwTQ730SeohB0aRd3zwOs4F3cHT0g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
2nLT8Zvs6vla9f81jsNW2RPpEaJf9tKjV66ah5MzvkCo0kdwmi/psLyzofjZoAxPTJey7vNkD+OP
ig7ZThoxVTDJVMGERrfG8uaJ+LUCvPiCwnKn73vgpEMD7qP9g1VskXBf6CudHgaap8bDBgfVWITL
QExOCeVFUk9u93wTJdHimIoe6Ebg6RFmktgHJq1nNw6TYsKCwDY4E1Jg3vwGV5uT92yAW4PKYrDN
YGfeq3IIs+jiZrIZs1ffc3SAce6LLc62T3d8XglbzgKthxxcUc6Re4XKxVPp69nMLKsxTcvANNI0
Vgm0AGrkFuF+eBGT4Evi8c2RUBUZur4CgcKCwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bC7WF7hkz2L9eff+WtabxVTqD0ohNl7V54dbTlcmUuGjzlS7+etjYyf1ZmKyTxgZlI8CcGY3aLUm
g4gMZWQTkwQ2EABmYmtgG8B1CQOJdk0H16y1P3Ngef0kUT/4xGcurqPGqt8djCWLAJYHkIS0viNB
1s3Od9+84/L2xjU3GaQhc2e9u2OFVjrPCAKk0Ygmig+kgae5wRHqq16qz/+bWFyJe0O9cHyCjTtn
7/8jzeGuU0eaJfh0NrMBjbYxyV69oQjDU8ns6UMON/gG/Bos1va7j8dyIdYh6IGHeUSqr6LBTN7Q
2R4uEizA0QWc+/BV1v+nRTAIxxrJg5+4QWqljg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12512)
`pragma protect data_block
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
GPVLML7yF7Obd+7zwa00gnFkW1/Axi/ucCvIApU=
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
