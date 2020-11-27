-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Fri Nov 27 00:43:29 2020
-- Host        : heplnw061.pp.rl.ac.uk running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /data/kmanolo/Josh/tpg_core/proj/dataflowZCU102/dataflowZCU102/dataflowZCU102.srcs/sources_1/ip/fmc0_8chan_9g6/fmc0_8chan_9g6_stub.vhdl
-- Design      : fmc0_8chan_9g6
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu9eg-ffvb1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fmc0_8chan_9g6 is
  Port ( 
    gtwiz_userclk_tx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_all_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_cdr_stable_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userdata_tx_in : in STD_LOGIC_VECTOR ( 255 downto 0 );
    gtwiz_userdata_rx_out : out STD_LOGIC_VECTOR ( 255 downto 0 );
    gtrefclk01_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    qpll1outclk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    qpll1outrefclk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gthrxn_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gthrxp_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    loopback_in : in STD_LOGIC_VECTOR ( 23 downto 0 );
    rx8b10ben_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rxcommadeten_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rxmcommaalignen_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rxpcommaalignen_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rxusrclk_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rxusrclk2_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx8b10ben_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txctrl0_in : in STD_LOGIC_VECTOR ( 127 downto 0 );
    txctrl1_in : in STD_LOGIC_VECTOR ( 127 downto 0 );
    txctrl2_in : in STD_LOGIC_VECTOR ( 63 downto 0 );
    txusrclk_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txusrclk2_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gthtxn_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gthtxp_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gtpowergood_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxbyteisaligned_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxbyterealign_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxcommadet_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxctrl0_out : out STD_LOGIC_VECTOR ( 127 downto 0 );
    rxctrl1_out : out STD_LOGIC_VECTOR ( 127 downto 0 );
    rxctrl2_out : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rxctrl3_out : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rxoutclk_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxpmaresetdone_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    txoutclk_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    txpmaresetdone_out : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end fmc0_8chan_9g6;

architecture stub of fmc0_8chan_9g6 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "gtwiz_userclk_tx_active_in[0:0],gtwiz_userclk_rx_active_in[0:0],gtwiz_reset_clk_freerun_in[0:0],gtwiz_reset_all_in[0:0],gtwiz_reset_tx_pll_and_datapath_in[0:0],gtwiz_reset_tx_datapath_in[0:0],gtwiz_reset_rx_pll_and_datapath_in[0:0],gtwiz_reset_rx_datapath_in[0:0],gtwiz_reset_rx_cdr_stable_out[0:0],gtwiz_reset_tx_done_out[0:0],gtwiz_reset_rx_done_out[0:0],gtwiz_userdata_tx_in[255:0],gtwiz_userdata_rx_out[255:0],gtrefclk01_in[1:0],qpll1outclk_out[1:0],qpll1outrefclk_out[1:0],gthrxn_in[7:0],gthrxp_in[7:0],loopback_in[23:0],rx8b10ben_in[7:0],rxcommadeten_in[7:0],rxmcommaalignen_in[7:0],rxpcommaalignen_in[7:0],rxusrclk_in[7:0],rxusrclk2_in[7:0],tx8b10ben_in[7:0],txctrl0_in[127:0],txctrl1_in[127:0],txctrl2_in[63:0],txusrclk_in[7:0],txusrclk2_in[7:0],gthtxn_out[7:0],gthtxp_out[7:0],gtpowergood_out[7:0],rxbyteisaligned_out[7:0],rxbyterealign_out[7:0],rxcommadet_out[7:0],rxctrl0_out[127:0],rxctrl1_out[127:0],rxctrl2_out[63:0],rxctrl3_out[63:0],rxoutclk_out[7:0],rxpmaresetdone_out[7:0],txoutclk_out[7:0],txpmaresetdone_out[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "fmc0_8chan_9g6_gtwizard_top,Vivado 2018.3";
begin
end;
