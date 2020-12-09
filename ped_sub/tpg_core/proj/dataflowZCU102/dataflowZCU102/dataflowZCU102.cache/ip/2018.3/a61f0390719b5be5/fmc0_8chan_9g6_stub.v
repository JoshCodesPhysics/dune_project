// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Wed Dec  9 10:11:09 2020
// Host        : mercury006.pp.rl.ac.uk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fmc0_8chan_9g6_stub.v
// Design      : fmc0_8chan_9g6
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "fmc0_8chan_9g6_gtwizard_top,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(gtwiz_userclk_tx_active_in, 
  gtwiz_userclk_rx_active_in, gtwiz_reset_clk_freerun_in, gtwiz_reset_all_in, 
  gtwiz_reset_tx_pll_and_datapath_in, gtwiz_reset_tx_datapath_in, 
  gtwiz_reset_rx_pll_and_datapath_in, gtwiz_reset_rx_datapath_in, 
  gtwiz_reset_rx_cdr_stable_out, gtwiz_reset_tx_done_out, gtwiz_reset_rx_done_out, 
  gtwiz_userdata_tx_in, gtwiz_userdata_rx_out, gtrefclk01_in, qpll1outclk_out, 
  qpll1outrefclk_out, gthrxn_in, gthrxp_in, loopback_in, rx8b10ben_in, rxcommadeten_in, 
  rxmcommaalignen_in, rxpcommaalignen_in, rxusrclk_in, rxusrclk2_in, tx8b10ben_in, 
  txctrl0_in, txctrl1_in, txctrl2_in, txusrclk_in, txusrclk2_in, gthtxn_out, gthtxp_out, 
  gtpowergood_out, rxbyteisaligned_out, rxbyterealign_out, rxcommadet_out, rxctrl0_out, 
  rxctrl1_out, rxctrl2_out, rxctrl3_out, rxoutclk_out, rxpmaresetdone_out, txoutclk_out, 
  txpmaresetdone_out)
/* synthesis syn_black_box black_box_pad_pin="gtwiz_userclk_tx_active_in[0:0],gtwiz_userclk_rx_active_in[0:0],gtwiz_reset_clk_freerun_in[0:0],gtwiz_reset_all_in[0:0],gtwiz_reset_tx_pll_and_datapath_in[0:0],gtwiz_reset_tx_datapath_in[0:0],gtwiz_reset_rx_pll_and_datapath_in[0:0],gtwiz_reset_rx_datapath_in[0:0],gtwiz_reset_rx_cdr_stable_out[0:0],gtwiz_reset_tx_done_out[0:0],gtwiz_reset_rx_done_out[0:0],gtwiz_userdata_tx_in[255:0],gtwiz_userdata_rx_out[255:0],gtrefclk01_in[1:0],qpll1outclk_out[1:0],qpll1outrefclk_out[1:0],gthrxn_in[7:0],gthrxp_in[7:0],loopback_in[23:0],rx8b10ben_in[7:0],rxcommadeten_in[7:0],rxmcommaalignen_in[7:0],rxpcommaalignen_in[7:0],rxusrclk_in[7:0],rxusrclk2_in[7:0],tx8b10ben_in[7:0],txctrl0_in[127:0],txctrl1_in[127:0],txctrl2_in[63:0],txusrclk_in[7:0],txusrclk2_in[7:0],gthtxn_out[7:0],gthtxp_out[7:0],gtpowergood_out[7:0],rxbyteisaligned_out[7:0],rxbyterealign_out[7:0],rxcommadet_out[7:0],rxctrl0_out[127:0],rxctrl1_out[127:0],rxctrl2_out[63:0],rxctrl3_out[63:0],rxoutclk_out[7:0],rxpmaresetdone_out[7:0],txoutclk_out[7:0],txpmaresetdone_out[7:0]" */;
  input [0:0]gtwiz_userclk_tx_active_in;
  input [0:0]gtwiz_userclk_rx_active_in;
  input [0:0]gtwiz_reset_clk_freerun_in;
  input [0:0]gtwiz_reset_all_in;
  input [0:0]gtwiz_reset_tx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_tx_datapath_in;
  input [0:0]gtwiz_reset_rx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_rx_datapath_in;
  output [0:0]gtwiz_reset_rx_cdr_stable_out;
  output [0:0]gtwiz_reset_tx_done_out;
  output [0:0]gtwiz_reset_rx_done_out;
  input [255:0]gtwiz_userdata_tx_in;
  output [255:0]gtwiz_userdata_rx_out;
  input [1:0]gtrefclk01_in;
  output [1:0]qpll1outclk_out;
  output [1:0]qpll1outrefclk_out;
  input [7:0]gthrxn_in;
  input [7:0]gthrxp_in;
  input [23:0]loopback_in;
  input [7:0]rx8b10ben_in;
  input [7:0]rxcommadeten_in;
  input [7:0]rxmcommaalignen_in;
  input [7:0]rxpcommaalignen_in;
  input [7:0]rxusrclk_in;
  input [7:0]rxusrclk2_in;
  input [7:0]tx8b10ben_in;
  input [127:0]txctrl0_in;
  input [127:0]txctrl1_in;
  input [63:0]txctrl2_in;
  input [7:0]txusrclk_in;
  input [7:0]txusrclk2_in;
  output [7:0]gthtxn_out;
  output [7:0]gthtxp_out;
  output [7:0]gtpowergood_out;
  output [7:0]rxbyteisaligned_out;
  output [7:0]rxbyterealign_out;
  output [7:0]rxcommadet_out;
  output [127:0]rxctrl0_out;
  output [127:0]rxctrl1_out;
  output [63:0]rxctrl2_out;
  output [63:0]rxctrl3_out;
  output [7:0]rxoutclk_out;
  output [7:0]rxpmaresetdone_out;
  output [7:0]txoutclk_out;
  output [7:0]txpmaresetdone_out;
endmodule
