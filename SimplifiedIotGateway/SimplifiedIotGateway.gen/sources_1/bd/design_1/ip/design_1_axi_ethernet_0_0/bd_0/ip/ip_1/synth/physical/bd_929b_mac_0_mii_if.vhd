--------------------------------------------------------------------------------
-- File       : bd_929b_mac_0_mii_if.vhd
-- Author     : AMD Inc.
-- -----------------------------------------------------------------------------
-- (c) Copyright 2009 Advanced Micro Devices, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Advanced Micro Devices, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- -----------------------------------------------------------------------------
-- Description:  This module creates a Media Independent
--               Interface (MII) by instantiating Input/Output buffers
--               and Input/Output flip-flops as required.
--
--               This interface is used to connect the Ethernet MAC to
--               an external Ethernet PHY via MII connection.
--
--               The MII transmitter clocking logic is also defined here: the
--               transmitter clock received from the PHY is unique and cannot be
--               shared across multiple instantiations of the core.
--
--               The MII receiver clocking logic is also defined here: the
--               receiver clock received from the PHY is unique and cannot be
--               shared across multiple instantiations of the core.:
--
--------------------------------------------------------------------------------

library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- The entity declaration for the PHY IF design.
--------------------------------------------------------------------------------
entity bd_929b_mac_0_mii_if is
    port(
      -- Synchronous resets
      tx_reset             : in  std_logic;
      rx_reset             : in  std_logic;

      -- The following ports are the MII physical interface: these will be at
      -- pins on the FPGA
      mii_txd              : out std_logic_vector(3 downto 0);
      mii_tx_en            : out std_logic;
      mii_tx_er            : out std_logic;
      mii_tx_clk           : in  std_logic;
      mii_rxd              : in  std_logic_vector(3 downto 0);
      mii_rx_dv            : in  std_logic;
      mii_rx_er            : in  std_logic;
      mii_rx_clk           : in  std_logic;

      -- The following ports are the internal connections from IOB logic
      -- to the TEMAC core
      txd_from_mac         : in  std_logic_vector(3 downto 0);
      tx_en_from_mac       : in  std_logic;
      tx_er_from_mac       : in  std_logic;
      rxd_to_mac           : out std_logic_vector(3 downto 0) := (others => '0');
      rx_dv_to_mac         : out std_logic := '0';
      rx_er_to_mac         : out std_logic := '0';

      -- Receiver clock for the MAC and Client Logic
      rx_clk               : out  std_logic;

      -- Transmitter clock for the MAC and Client Logic
      tx_clk               : out  std_logic

   );
end bd_929b_mac_0_mii_if;


architecture PHY_IF of bd_929b_mac_0_mii_if is


  ------------------------------------------------------------------------------
  -- internal signals
  ------------------------------------------------------------------------------
  signal mii_tx_clk_ibuf   : std_logic;
  signal mii_txd_obuf      : std_logic_vector(3 downto 0);
  signal mii_tx_en_obuf    : std_logic;
  signal mii_tx_er_obuf    : std_logic;
  signal mii_rxd_ibuf      : std_logic_vector(3 downto 0);
  signal mii_rx_dv_ibuf    : std_logic;
  signal mii_rx_er_ibuf    : std_logic;
  signal mii_rx_clk_ibuf   : std_logic;
  
  signal tx_clk_int        : std_logic;
  signal rx_clk_int        : std_logic;


begin




   ------------------------------------------------------------------------------
   -- Input/Output Buffers
   ------------------------------------------------------------------------------




mii_tx_clk_ibuf <= mii_tx_clk;
mii_tx_en <= mii_tx_en_obuf;
mii_tx_er <= mii_tx_er_obuf;
mii_txd <=   mii_txd_obuf;
mii_rx_clk_ibuf <= mii_rx_clk;
mii_rx_dv_ibuf <= mii_rx_dv;
mii_rx_er_ibuf <= mii_rx_er;
mii_rxd_ibuf <= mii_rxd;

tx_clk_int <= mii_tx_clk_ibuf;

  -- Route the internal clock to the output port
  tx_clk <= tx_clk_int;


   -----------------------------------------------------------------------------
   -- MII Transmitter Logic :
   -- drive TX signals through IOBs onto MII interface
   -----------------------------------------------------------------------------

   -- Infer IOB Output flip-flops.
   reg_mii_tx_out : process (tx_clk_int)
   begin
      if tx_clk_int'event and tx_clk_int = '1' then
         mii_tx_en_obuf <= tx_en_from_mac;
         mii_tx_er_obuf <= tx_er_from_mac;
         mii_txd_obuf   <= txd_from_mac;
      end if;
   end process reg_mii_tx_out;


  ------------------------------------------------------------------------------
  -- MII Receiver Clock Logic
  ------------------------------------------------------------------------------

  -- The MAC receiever clock at 10/100 speeds is provided by the PHY

  -- Route MII Rx clock onto a regional clock network.
  rx_clk_int <= mii_rx_clk_ibuf;

  -- Route the internal clock to the output port
  rx_clk <= rx_clk_int;


  ------------------------------------------------------------------------------
  -- MII Receiver Logic : receive RX signals through IOBs from MII interface
  ------------------------------------------------------------------------------

  -- Infer IOB Input flip-flops.
  reg_mii_rx_in : process (rx_clk_int)
  begin
    if rx_clk_int'event and rx_clk_int = '1' then
      rx_dv_to_mac <= mii_rx_dv_ibuf after 1 ps;
      rx_er_to_mac <= mii_rx_er_ibuf after 1 ps;
      rxd_to_mac   <= mii_rxd_ibuf after 1 ps;
   end if;
  end process reg_mii_rx_in;



end PHY_IF;
