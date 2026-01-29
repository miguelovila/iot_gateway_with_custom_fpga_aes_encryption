--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
--Date        : Thu Jan 29 04:49:56 2026
--Host        : gapapaio running 64-bit Ubuntu 24.04.3 LTS
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    ACL_SPI_io0_io : inout STD_LOGIC;
    ACL_SPI_io1_io : inout STD_LOGIC;
    ACL_SPI_sck_io : inout STD_LOGIC;
    ACL_SPI_ss_io : inout STD_LOGIC;
    BUTTONS_5BITS_tri_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ETH_REF_CLK : out STD_LOGIC;
    IIC_RTL_scl_io : inout STD_LOGIC;
    IIC_RTL_sda_io : inout STD_LOGIC;
    LEDS_16BITS_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    MDIO_RTL_mdc : out STD_LOGIC;
    MDIO_RTL_mdio_io : inout STD_LOGIC;
    RESET : in STD_LOGIC;
    RESET_RTL : out STD_LOGIC_VECTOR ( 0 to 0 );
    RMII_RTL_crs_dv : in STD_LOGIC;
    RMII_RTL_rx_er : in STD_LOGIC;
    RMII_RTL_rxd : in STD_LOGIC_VECTOR ( 1 downto 0 );
    RMII_RTL_tx_en : out STD_LOGIC;
    RMII_RTL_txd : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SWITCHES_16BITS_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SYS_CLOCK : in STD_LOGIC;
    UART_rxd : in STD_LOGIC;
    UART_txd : out STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    SYS_CLOCK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    MDIO_RTL_mdc : out STD_LOGIC;
    MDIO_RTL_mdio_i : in STD_LOGIC;
    MDIO_RTL_mdio_o : out STD_LOGIC;
    MDIO_RTL_mdio_t : out STD_LOGIC;
    RESET_RTL : out STD_LOGIC_VECTOR ( 0 to 0 );
    UART_rxd : in STD_LOGIC;
    UART_txd : out STD_LOGIC;
    RMII_RTL_crs_dv : in STD_LOGIC;
    RMII_RTL_rx_er : in STD_LOGIC;
    RMII_RTL_rxd : in STD_LOGIC_VECTOR ( 1 downto 0 );
    RMII_RTL_tx_en : out STD_LOGIC;
    RMII_RTL_txd : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ETH_REF_CLK : out STD_LOGIC;
    BUTTONS_5BITS_tri_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    SWITCHES_16BITS_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    LEDS_16BITS_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    IIC_RTL_scl_i : in STD_LOGIC;
    IIC_RTL_scl_o : out STD_LOGIC;
    IIC_RTL_scl_t : out STD_LOGIC;
    IIC_RTL_sda_i : in STD_LOGIC;
    IIC_RTL_sda_o : out STD_LOGIC;
    IIC_RTL_sda_t : out STD_LOGIC;
    ACL_SPI_io0_i : in STD_LOGIC;
    ACL_SPI_io0_o : out STD_LOGIC;
    ACL_SPI_io0_t : out STD_LOGIC;
    ACL_SPI_io1_i : in STD_LOGIC;
    ACL_SPI_io1_o : out STD_LOGIC;
    ACL_SPI_io1_t : out STD_LOGIC;
    ACL_SPI_sck_i : in STD_LOGIC;
    ACL_SPI_sck_o : out STD_LOGIC;
    ACL_SPI_sck_t : out STD_LOGIC;
    ACL_SPI_ss_i : in STD_LOGIC;
    ACL_SPI_ss_o : out STD_LOGIC;
    ACL_SPI_ss_t : out STD_LOGIC
  );
  end component design_1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal ACL_SPI_io0_i : STD_LOGIC;
  signal ACL_SPI_io0_o : STD_LOGIC;
  signal ACL_SPI_io0_t : STD_LOGIC;
  signal ACL_SPI_io1_i : STD_LOGIC;
  signal ACL_SPI_io1_o : STD_LOGIC;
  signal ACL_SPI_io1_t : STD_LOGIC;
  signal ACL_SPI_sck_i : STD_LOGIC;
  signal ACL_SPI_sck_o : STD_LOGIC;
  signal ACL_SPI_sck_t : STD_LOGIC;
  signal ACL_SPI_ss_i : STD_LOGIC;
  signal ACL_SPI_ss_o : STD_LOGIC;
  signal ACL_SPI_ss_t : STD_LOGIC;
  signal IIC_RTL_scl_i : STD_LOGIC;
  signal IIC_RTL_scl_o : STD_LOGIC;
  signal IIC_RTL_scl_t : STD_LOGIC;
  signal IIC_RTL_sda_i : STD_LOGIC;
  signal IIC_RTL_sda_o : STD_LOGIC;
  signal IIC_RTL_sda_t : STD_LOGIC;
  signal MDIO_RTL_mdio_i : STD_LOGIC;
  signal MDIO_RTL_mdio_o : STD_LOGIC;
  signal MDIO_RTL_mdio_t : STD_LOGIC;
begin
ACL_SPI_io0_iobuf: component IOBUF
     port map (
      I => ACL_SPI_io0_o,
      IO => ACL_SPI_io0_io,
      O => ACL_SPI_io0_i,
      T => ACL_SPI_io0_t
    );
ACL_SPI_io1_iobuf: component IOBUF
     port map (
      I => ACL_SPI_io1_o,
      IO => ACL_SPI_io1_io,
      O => ACL_SPI_io1_i,
      T => ACL_SPI_io1_t
    );
ACL_SPI_sck_iobuf: component IOBUF
     port map (
      I => ACL_SPI_sck_o,
      IO => ACL_SPI_sck_io,
      O => ACL_SPI_sck_i,
      T => ACL_SPI_sck_t
    );
ACL_SPI_ss_iobuf: component IOBUF
     port map (
      I => ACL_SPI_ss_o,
      IO => ACL_SPI_ss_io,
      O => ACL_SPI_ss_i,
      T => ACL_SPI_ss_t
    );
IIC_RTL_scl_iobuf: component IOBUF
     port map (
      I => IIC_RTL_scl_o,
      IO => IIC_RTL_scl_io,
      O => IIC_RTL_scl_i,
      T => IIC_RTL_scl_t
    );
IIC_RTL_sda_iobuf: component IOBUF
     port map (
      I => IIC_RTL_sda_o,
      IO => IIC_RTL_sda_io,
      O => IIC_RTL_sda_i,
      T => IIC_RTL_sda_t
    );
MDIO_RTL_mdio_iobuf: component IOBUF
     port map (
      I => MDIO_RTL_mdio_o,
      IO => MDIO_RTL_mdio_io,
      O => MDIO_RTL_mdio_i,
      T => MDIO_RTL_mdio_t
    );
design_1_i: component design_1
     port map (
      ACL_SPI_io0_i => ACL_SPI_io0_i,
      ACL_SPI_io0_o => ACL_SPI_io0_o,
      ACL_SPI_io0_t => ACL_SPI_io0_t,
      ACL_SPI_io1_i => ACL_SPI_io1_i,
      ACL_SPI_io1_o => ACL_SPI_io1_o,
      ACL_SPI_io1_t => ACL_SPI_io1_t,
      ACL_SPI_sck_i => ACL_SPI_sck_i,
      ACL_SPI_sck_o => ACL_SPI_sck_o,
      ACL_SPI_sck_t => ACL_SPI_sck_t,
      ACL_SPI_ss_i => ACL_SPI_ss_i,
      ACL_SPI_ss_o => ACL_SPI_ss_o,
      ACL_SPI_ss_t => ACL_SPI_ss_t,
      BUTTONS_5BITS_tri_i(4 downto 0) => BUTTONS_5BITS_tri_i(4 downto 0),
      ETH_REF_CLK => ETH_REF_CLK,
      IIC_RTL_scl_i => IIC_RTL_scl_i,
      IIC_RTL_scl_o => IIC_RTL_scl_o,
      IIC_RTL_scl_t => IIC_RTL_scl_t,
      IIC_RTL_sda_i => IIC_RTL_sda_i,
      IIC_RTL_sda_o => IIC_RTL_sda_o,
      IIC_RTL_sda_t => IIC_RTL_sda_t,
      LEDS_16BITS_tri_o(15 downto 0) => LEDS_16BITS_tri_o(15 downto 0),
      MDIO_RTL_mdc => MDIO_RTL_mdc,
      MDIO_RTL_mdio_i => MDIO_RTL_mdio_i,
      MDIO_RTL_mdio_o => MDIO_RTL_mdio_o,
      MDIO_RTL_mdio_t => MDIO_RTL_mdio_t,
      RESET => RESET,
      RESET_RTL(0) => RESET_RTL(0),
      RMII_RTL_crs_dv => RMII_RTL_crs_dv,
      RMII_RTL_rx_er => RMII_RTL_rx_er,
      RMII_RTL_rxd(1 downto 0) => RMII_RTL_rxd(1 downto 0),
      RMII_RTL_tx_en => RMII_RTL_tx_en,
      RMII_RTL_txd(1 downto 0) => RMII_RTL_txd(1 downto 0),
      SWITCHES_16BITS_tri_i(15 downto 0) => SWITCHES_16BITS_tri_i(15 downto 0),
      SYS_CLOCK => SYS_CLOCK,
      UART_rxd => UART_rxd,
      UART_txd => UART_txd
    );
end STRUCTURE;
