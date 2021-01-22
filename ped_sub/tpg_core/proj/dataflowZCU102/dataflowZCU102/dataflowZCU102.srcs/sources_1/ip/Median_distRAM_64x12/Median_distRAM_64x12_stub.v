// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Jan 21 16:42:54 2021
// Host        : heplnw061.pp.rl.ac.uk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /data2/hmo31799/dune_project/ped_sub/tpg_core/proj/dataflowZCU102/dataflowZCU102/dataflowZCU102.srcs/sources_1/ip/Median_distRAM_64x12/Median_distRAM_64x12_stub.v
// Design      : Median_distRAM_64x12
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2018.3" *)
module Median_distRAM_64x12(a, d, dpra, clk, we, qdpo_srst, qdpo)
/* synthesis syn_black_box black_box_pad_pin="a[5:0],d[11:0],dpra[5:0],clk,we,qdpo_srst,qdpo[11:0]" */;
  input [5:0]a;
  input [11:0]d;
  input [5:0]dpra;
  input clk;
  input we;
  input qdpo_srst;
  output [11:0]qdpo;
endmodule
