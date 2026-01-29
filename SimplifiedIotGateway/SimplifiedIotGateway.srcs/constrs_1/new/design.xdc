# Clock Signal
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports SYS_CLOCK]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports SYS_CLOCK]

# Reset Signal
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports RESET]

# Led Signals
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[0] }];
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[1] }];
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[2] }];
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[3] }];
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[4] }];
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[5] }];
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[6] }];
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[7] }];
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[8] }];
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[9] }];
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[10] }];
set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[11] }];
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[12] }];
set_property -dict { PACKAGE_PIN V14 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[13] }];
set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[14] }];
set_property -dict { PACKAGE_PIN V11 IOSTANDARD LVCMOS33 } [get_ports { LED_16BITS[15] }];

# Buttons Signals
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { BUTTONS_5BITS[0] }];
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { BUTTONS_5BITS[1] }];
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { BUTTONS_5BITS[4] }];
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { BUTTONS_5BITS[2] }];
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { BUTTONS_5BITS[3] }];

# Switches Signals
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[0] }];
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[1] }];
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[2] }];
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[3] }];
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[4] }];
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[5] }];
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[6] }];
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[7] }];
set_property -dict { PACKAGE_PIN T8    IOSTANDARD LVCMOS18 } [get_ports { SWITCHES_16BITS[8] }];
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS18 } [get_ports { SWITCHES_16BITS[9] }];
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[10] }];
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[11] }];
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[12] }];
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[13] }];
set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[14] }];
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { SWITCHES_16BITS[15] }];

# Ethernet Signals
set_property -dict {PACKAGE_PIN C9 IOSTANDARD LVCMOS33}   [get_ports MDIO_RTL_mdc]
set_property -dict {PACKAGE_PIN A9 IOSTANDARD LVCMOS33}   [get_ports MDIO_RTL_mdio_io]
set_property -dict {PACKAGE_PIN B3 IOSTANDARD LVCMOS33}   [get_ports {RESET_RTL[0]}]
set_property -dict {PACKAGE_PIN D9 IOSTANDARD LVCMOS33}   [get_ports RMII_RTL_crs_dv]
set_property -dict {PACKAGE_PIN C10 IOSTANDARD LVCMOS33}  [get_ports RMII_RTL_rx_er]
set_property -dict {PACKAGE_PIN C11 IOSTANDARD LVCMOS33}  [get_ports {RMII_RTL_rxd[0]}]
set_property -dict {PACKAGE_PIN D10 IOSTANDARD LVCMOS33}  [get_ports {RMII_RTL_rxd[1]}]
set_property -dict {PACKAGE_PIN B9 IOSTANDARD LVCMOS33}   [get_ports RMII_RTL_tx_en]
set_property -dict {PACKAGE_PIN A10 IOSTANDARD LVCMOS33}  [get_ports {RMII_RTL_txd[0]}]
set_property -dict {PACKAGE_PIN A8 IOSTANDARD LVCMOS33}   [get_ports {RMII_RTL_txd[1]}]
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33}   [get_ports ETH_REF_CLK]

# I2C Signals
set_property -dict { PACKAGE_PIN C14   IOSTANDARD LVCMOS33 } [get_ports { IIC_RTL_scl_io }];
set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { IIC_RTL_sda_io }];

# Accelerometer
set_property -dict { PACKAGE_PIN E15   IOSTANDARD LVCMOS33 } [get_ports { ACL_SPI_MISO }];
set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { ACL_SPI_MOSI }];
set_property -dict { PACKAGE_PIN F15   IOSTANDARD LVCMOS33 } [get_ports { ACL_SPI_SCLK }];
set_property -dict { PACKAGE_PIN D15   IOSTANDARD LVCMOS33 } [get_ports { ACL_SPI_CSN }];
#set_property -dict { PACKAGE_PIN B13   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[1] }];
#set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[2] }];