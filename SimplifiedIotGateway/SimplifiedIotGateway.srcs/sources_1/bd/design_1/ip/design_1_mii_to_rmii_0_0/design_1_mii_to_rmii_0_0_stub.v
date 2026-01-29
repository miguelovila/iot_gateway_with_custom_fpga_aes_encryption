// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Thu Jan 29 00:02:29 2026
// Host        : gapapaio running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/miguelovila/SimplifiedIotGateway/SimplifiedIotGateway.gen/sources_1/bd/design_1/ip/design_1_mii_to_rmii_0_0/design_1_mii_to_rmii_0_0_stub.v
// Design      : design_1_mii_to_rmii_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_mii_to_rmii_0_0,mii_to_rmii,{}" *) (* core_generation_info = "design_1_mii_to_rmii_0_0,mii_to_rmii,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mii_to_rmii,x_ipVersion=2.0,x_ipCoreRevision=21,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,C_INSTANCE=design_1_mii_to_rmii_0_0,C_FIXED_SPEED=1,C_INCLUDE_BUF=0,C_SPEED_100=1,C_FAMILY=artix7}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "mii_to_rmii,Vivado 2025.1" *) 
module design_1_mii_to_rmii_0_0(rst_n, ref_clk, mac2rmii_tx_en, mac2rmii_txd, 
  mac2rmii_tx_er, rmii2mac_tx_clk, rmii2mac_rx_clk, rmii2mac_col, rmii2mac_crs, 
  rmii2mac_rx_dv, rmii2mac_rx_er, rmii2mac_rxd, phy2rmii_crs_dv, phy2rmii_rx_er, 
  phy2rmii_rxd, rmii2phy_txd, rmii2phy_tx_en)
/* synthesis syn_black_box black_box_pad_pin="rst_n,mac2rmii_tx_en,mac2rmii_txd[3:0],mac2rmii_tx_er,rmii2mac_tx_clk,rmii2mac_rx_clk,rmii2mac_col,rmii2mac_crs,rmii2mac_rx_dv,rmii2mac_rx_er,rmii2mac_rxd[3:0],phy2rmii_crs_dv,phy2rmii_rx_er,phy2rmii_rxd[1:0],rmii2phy_txd[1:0],rmii2phy_tx_en" */
/* synthesis syn_force_seq_prim="ref_clk" */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_mode = "slave rst" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, BOARD.ASSOCIATED_PARAM RESET_BOARD_INTERFACE, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clock CLK" *) (* x_interface_mode = "slave clock" *) (* x_interface_parameter = "XIL_INTERFACENAME clock, BOARD.ASSOCIATED_PARAM REF_CLK_BOARD_INTERFACE, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0" *) input ref_clk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:mii:1.0 MII TX_EN" *) (* x_interface_mode = "slave MII" *) input mac2rmii_tx_en;
  (* x_interface_info = "xilinx.com:interface:mii:1.0 MII TXD" *) input [3:0]mac2rmii_txd;
  (* x_interface_info = "xilinx.com:interface:mii:1.0 MII TX_ER" *) input mac2rmii_tx_er;
  (* x_interface_info = "xilinx.com:interface:mii:1.0 MII TX_CLK" *) output rmii2mac_tx_clk;
  (* x_interface_info = "xilinx.com:interface:mii:1.0 MII RX_CLK" *) output rmii2mac_rx_clk;
  (* x_interface_info = "xilinx.com:interface:mii:1.0 MII COL" *) output rmii2mac_col;
  (* x_interface_info = "xilinx.com:interface:mii:1.0 MII CRS" *) output rmii2mac_crs;
  (* x_interface_info = "xilinx.com:interface:mii:1.0 MII RX_DV" *) output rmii2mac_rx_dv;
  (* x_interface_info = "xilinx.com:interface:mii:1.0 MII RX_ER" *) output rmii2mac_rx_er;
  (* x_interface_info = "xilinx.com:interface:mii:1.0 MII RXD" *) output [3:0]rmii2mac_rxd;
  (* x_interface_info = "xilinx.com:interface:rmii:1.0 RMII_PHY_M CRS_DV" *) (* x_interface_mode = "master RMII_PHY_M" *) (* x_interface_parameter = "XIL_INTERFACENAME RMII_PHY_M, BOARD.ASSOCIATED_PARAM RMII_BOARD_INTERFACE" *) input phy2rmii_crs_dv;
  (* x_interface_info = "xilinx.com:interface:rmii:1.0 RMII_PHY_M RX_ER" *) input phy2rmii_rx_er;
  (* x_interface_info = "xilinx.com:interface:rmii:1.0 RMII_PHY_M RXD" *) input [1:0]phy2rmii_rxd;
  (* x_interface_info = "xilinx.com:interface:rmii:1.0 RMII_PHY_M TXD" *) output [1:0]rmii2phy_txd;
  (* x_interface_info = "xilinx.com:interface:rmii:1.0 RMII_PHY_M TX_EN" *) output rmii2phy_tx_en;
endmodule
