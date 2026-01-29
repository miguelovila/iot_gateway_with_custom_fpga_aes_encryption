// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Thu Jan 29 00:02:45 2026
// Host        : gapapaio running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/miguelovila/SimplifiedIotGateway/SimplifiedIotGateway.gen/sources_1/bd/design_1/ip/design_1_axi_ethernet_0_0/bd_0/ip/ip_3/bd_929b_c_counter_binary_0_0_sim_netlist.v
// Design      : bd_929b_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_929b_c_counter_binary_0_0,c_counter_binary_v12_0_21,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_21,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module bd_929b_c_counter_binary_0_0
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
  bd_929b_c_counter_binary_0_0_c_counter_binary_v12_0_21 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2416)
`pragma protect data_block
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
bp0mftFzShdmnIExWwSrexMdOrXmBg==
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12688)
`pragma protect data_block
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
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
