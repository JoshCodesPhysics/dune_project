// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Jan 21 16:25:37 2021
// Host        : heplnw061.pp.rl.ac.uk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /data2/hmo31799/dune_project/ped_sub/tpg_core/proj/dataflowZCU102/dataflowZCU102/dataflowZCU102.srcs/sources_1/ip/crif_fifo/crif_fifo_stub.v
// Design      : crif_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_3,Vivado 2018.3" *)
module crif_fifo(s_aclk, s_aresetn, s_axis_tvalid, 
  s_axis_tready, s_axis_tdata, s_axis_tkeep, s_axis_tlast, s_axis_tuser, m_axis_tvalid, 
  m_axis_tready, m_axis_tdata, m_axis_tkeep, m_axis_tlast, m_axis_tuser, 
  axis_prog_full_thresh, axis_prog_empty_thresh, axis_prog_full, axis_prog_empty)
/* synthesis syn_black_box black_box_pad_pin="s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[15:0],s_axis_tkeep[1:0],s_axis_tlast,s_axis_tuser[0:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[15:0],m_axis_tkeep[1:0],m_axis_tlast,m_axis_tuser[0:0],axis_prog_full_thresh[8:0],axis_prog_empty_thresh[8:0],axis_prog_full,axis_prog_empty" */;
  input s_aclk;
  input s_aresetn;
  input s_axis_tvalid;
  output s_axis_tready;
  input [15:0]s_axis_tdata;
  input [1:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [15:0]m_axis_tdata;
  output [1:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tuser;
  input [8:0]axis_prog_full_thresh;
  input [8:0]axis_prog_empty_thresh;
  output axis_prog_full;
  output axis_prog_empty;
endmodule
