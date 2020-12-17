// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Tue Dec 15 11:07:21 2020
// Host        : heplnw061.pp.rl.ac.uk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ crif_fifo_sim_netlist.v
// Design      : crif_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "crif_fifo,fifo_generator_v13_2_3,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_3,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_aclk,
    s_aresetn,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tuser,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_prog_full,
    axis_prog_empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 slave_aclk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME slave_aclk, ASSOCIATED_BUSIF S_AXIS:S_AXI, ASSOCIATED_RESET s_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input s_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 slave_aresetn RST" *) (* x_interface_parameter = "XIL_INTERFACENAME slave_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_aresetn;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [15:0]s_axis_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *) input [1:0]s_axis_tkeep;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input s_axis_tlast;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TUSER" *) input [0:0]s_axis_tuser;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output [15:0]m_axis_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TKEEP" *) output [1:0]m_axis_tkeep;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output m_axis_tlast;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TUSER" *) output [0:0]m_axis_tuser;
  input [8:0]axis_prog_full_thresh;
  input [8:0]axis_prog_empty_thresh;
  output axis_prog_full;
  output axis_prog_empty;

  wire axis_prog_empty;
  wire [8:0]axis_prog_empty_thresh;
  wire axis_prog_full;
  wire [8:0]axis_prog_full_thresh;
  wire [15:0]m_axis_tdata;
  wire [1:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [0:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [15:0]s_axis_tdata;
  wire [1:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [0:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_empty_UNCONNECTED;
  wire NLW_U0_full_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
  wire [17:0]NLW_U0_dout_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [1:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "4" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "4" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "16" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "2" *) 
  (* C_AXIS_TSTRB_WIDTH = "2" *) 
  (* C_AXIS_TUSER_WIDTH = "1" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "18" *) 
  (* C_DIN_WIDTH_AXIS = "20" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "32" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "18" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "1" *) 
  (* C_HAS_AXIS_TLAST = "1" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "2" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "5" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "2" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "5" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "2" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "1" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "4kx4" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "511" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "14" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "14" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "14" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "3" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "15" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1022" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "3" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "512" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "9" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_3 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[9:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_empty_thresh(axis_prog_empty_thresh),
        .axis_prog_full(axis_prog_full),
        .axis_prog_full_thresh(axis_prog_full_thresh),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[9:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[9:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dout(NLW_U0_dout_UNCONNECTED[17:0]),
        .empty(NLW_U0_empty_UNCONNECTED),
        .full(NLW_U0_full_UNCONNECTED),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[1:0]),
        .m_axis_tuser(m_axis_tuser),
        .m_axis_tvalid(m_axis_tvalid),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(1'b0),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(s_aclk),
        .s_aclk_en(1'b0),
        .s_aresetn(s_aresetn),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({1'b0,1'b0}),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(1'b0),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr
   (D,
    ENB_dly_D,
    s_aclk,
    ENB_I,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    Q,
    s_axis_tdata,
    DINADIN,
    p_19_out,
    out,
    s_axis_tvalid);
  output [19:0]D;
  output ENB_dly_D;
  input s_aclk;
  input ENB_I;
  input [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [8:0]Q;
  input [15:0]s_axis_tdata;
  input [3:0]DINADIN;
  input p_19_out;
  input out;
  input s_axis_tvalid;

  wire [19:0]D;
  wire [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [3:0]DINADIN;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire out;
  wire p_19_out;
  wire s_aclk;
  wire [15:0]s_axis_tdata;
  wire s_axis_tvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.D(D),
        .\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .DINADIN(DINADIN),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .out(out),
        .p_19_out(p_19_out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width
   (D,
    ENB_dly_D,
    s_aclk,
    ENB_I,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    Q,
    s_axis_tdata,
    DINADIN,
    p_19_out,
    out,
    s_axis_tvalid);
  output [19:0]D;
  output ENB_dly_D;
  input s_aclk;
  input ENB_I;
  input [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [8:0]Q;
  input [15:0]s_axis_tdata;
  input [3:0]DINADIN;
  input p_19_out;
  input out;
  input s_axis_tvalid;

  wire [19:0]D;
  wire [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [3:0]DINADIN;
  wire ENB_I;
  wire ENB_dly;
  wire ENB_dly_D;
  wire POR_B;
  wire [8:0]Q;
  wire [4:0]RSTB_SHFT_REG;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ;
  wire out;
  wire p_19_out;
  wire p_1_out;
  wire s_aclk;
  wire [15:0]s_axis_tdata;
  wire s_axis_tvalid;

  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_D_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(ENB_dly),
        .Q(ENB_dly_D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(POR_B),
        .Q(ENB_dly),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \SAFETY_CKT_GEN.POR_B_i_1 
       (.I0(RSTB_SHFT_REG[0]),
        .I1(RSTB_SHFT_REG[4]),
        .O(p_1_out));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.POR_B_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(p_1_out),
        .Q(POR_B),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(RSTB_SHFT_REG[0]),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTB_SHFT_REG_reg " *) 
  (* srl_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(s_aclk),
        .D(RSTB_SHFT_REG[0]),
        .Q(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ),
        .Q(RSTB_SHFT_REG[4]),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.D(D),
        .\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 (\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .DINADIN(DINADIN),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .POR_B(POR_B),
        .Q(Q),
        .out(out),
        .p_19_out(p_19_out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper
   (D,
    s_aclk,
    ENB_I,
    POR_B,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ,
    Q,
    s_axis_tdata,
    DINADIN,
    p_19_out,
    ENB_dly_D,
    out,
    s_axis_tvalid);
  output [19:0]D;
  input s_aclk;
  input ENB_I;
  input POR_B;
  input [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  input [8:0]Q;
  input [15:0]s_axis_tdata;
  input [3:0]DINADIN;
  input p_19_out;
  input ENB_dly_D;
  input out;
  input s_axis_tvalid;

  wire [19:0]D;
  wire [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_33 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_40 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_41 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_42 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_48 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_49 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_50 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_56 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_57 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_58 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_68 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_69 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_70 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_71 ;
  wire [3:0]DINADIN;
  wire ENA_I;
  wire ENB_I;
  wire ENB_dly_D;
  wire POR_B;
  wire [8:0]Q;
  wire out;
  wire p_19_out;
  wire s_aclk;
  wire [15:0]s_axis_tdata;
  wire s_axis_tvalid;
  wire [15:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTA_UNCONNECTED ;
  wire [15:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTB_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTPA_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTPB_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTA_UNCONNECTED [15:0]),
        .CASDOUTB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTB_UNCONNECTED [15:0]),
        .CASDOUTPA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTPA_UNCONNECTED [1:0]),
        .CASDOUTPB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTPB_UNCONNECTED [1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CLKARDCLK(s_aclk),
        .CLKBWRCLK(s_aclk),
        .DINADIN({1'b0,1'b0,1'b0,s_axis_tdata[5:1],1'b0,1'b0,1'b0,s_axis_tdata[0],DINADIN}),
        .DINBDIN({1'b0,1'b0,1'b0,s_axis_tdata[15:11],1'b0,1'b0,1'b0,s_axis_tdata[10:6]}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT({\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_33 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ,D[9:5],\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_40 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_41 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_42 ,D[4:0]}),
        .DOUTBDOUT({\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_48 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_49 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_50 ,D[19:15],\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_56 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_57 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_58 ,D[14:10]}),
        .DOUTPADOUTP({\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_68 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_69 }),
        .DOUTPBDOUTP({\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_70 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_71 }),
        .ENARDEN(ENB_I),
        .ENBWREN(ENA_I),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(POR_B),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({p_19_out,p_19_out,p_19_out,p_19_out}));
  LUT3 #(
    .INIT(8'hBA)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_2 
       (.I0(ENB_dly_D),
        .I1(out),
        .I2(s_axis_tvalid),
        .O(ENA_I));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top
   (D,
    ENB_dly_D,
    s_aclk,
    ENB_I,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    Q,
    s_axis_tdata,
    DINADIN,
    p_19_out,
    out,
    s_axis_tvalid);
  output [19:0]D;
  output ENB_dly_D;
  input s_aclk;
  input ENB_I;
  input [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [8:0]Q;
  input [15:0]s_axis_tdata;
  input [3:0]DINADIN;
  input p_19_out;
  input out;
  input s_axis_tvalid;

  wire [19:0]D;
  wire [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [3:0]DINADIN;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire out;
  wire p_19_out;
  wire s_aclk;
  wire [15:0]s_axis_tdata;
  wire s_axis_tvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr \valid.cstr 
       (.D(D),
        .\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .DINADIN(DINADIN),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .out(out),
        .p_19_out(p_19_out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_2
   (D,
    ENB_dly_D,
    s_aclk,
    ENB_I,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    Q,
    s_axis_tdata,
    DINADIN,
    p_19_out,
    out,
    s_axis_tvalid);
  output [19:0]D;
  output ENB_dly_D;
  input s_aclk;
  input ENB_I;
  input [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [8:0]Q;
  input [15:0]s_axis_tdata;
  input [3:0]DINADIN;
  input p_19_out;
  input out;
  input s_axis_tvalid;

  wire [19:0]D;
  wire [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [3:0]DINADIN;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire out;
  wire p_19_out;
  wire s_aclk;
  wire [15:0]s_axis_tdata;
  wire s_axis_tvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_2_synth inst_blk_mem_gen
       (.D(D),
        .\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .DINADIN(DINADIN),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .out(out),
        .p_19_out(p_19_out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_2_synth
   (D,
    ENB_dly_D,
    s_aclk,
    ENB_I,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    Q,
    s_axis_tdata,
    DINADIN,
    p_19_out,
    out,
    s_axis_tvalid);
  output [19:0]D;
  output ENB_dly_D;
  input s_aclk;
  input ENB_I;
  input [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [8:0]Q;
  input [15:0]s_axis_tdata;
  input [3:0]DINADIN;
  input p_19_out;
  input out;
  input s_axis_tvalid;

  wire [19:0]D;
  wire [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [3:0]DINADIN;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire out;
  wire p_19_out;
  wire s_aclk;
  wire [15:0]s_axis_tdata;
  wire s_axis_tvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.D(D),
        .\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .DINADIN(DINADIN),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .out(out),
        .p_19_out(p_19_out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_compare
   (comp0,
    v1_reg_0);
  output comp0;
  input [4:0]v1_reg_0;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp0;
  wire [4:0]v1_reg_0;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:5],comp0,carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:5],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:5],v1_reg_0}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_compare_0
   (ram_full_fb_i_reg,
    p_2_out,
    v1_reg_1,
    ram_full_i_reg,
    out,
    s_axis_tvalid,
    ram_full_i_reg_0,
    \gaf.gaf1.ram_afull_fb_reg ,
    \gaf.gaf1.ram_afull_fb_reg_0 ,
    E,
    p_0_in);
  output ram_full_fb_i_reg;
  output p_2_out;
  input [4:0]v1_reg_1;
  input ram_full_i_reg;
  input out;
  input s_axis_tvalid;
  input ram_full_i_reg_0;
  input \gaf.gaf1.ram_afull_fb_reg ;
  input \gaf.gaf1.ram_afull_fb_reg_0 ;
  input [0:0]E;
  input p_0_in;

  wire [0:0]E;
  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp1;
  wire \gaf.gaf1.ram_afull_fb_reg ;
  wire \gaf.gaf1.ram_afull_fb_reg_0 ;
  wire out;
  wire p_0_in;
  wire p_2_out;
  wire ram_full_fb_i_reg;
  wire ram_full_i_reg;
  wire ram_full_i_reg_0;
  wire s_axis_tvalid;
  wire [4:0]v1_reg_1;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h0CFF040C0C0C040C)) 
    \gaf.gaf1.ram_afull_fb_i_1 
       (.I0(comp1),
        .I1(\gaf.gaf1.ram_afull_fb_reg ),
        .I2(\gaf.gaf1.ram_afull_fb_reg_0 ),
        .I3(ram_full_i_reg),
        .I4(E),
        .I5(p_0_in),
        .O(p_2_out));
  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:5],comp1,carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:5],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:5],v1_reg_1}));
  LUT5 #(
    .INIT(32'hFFFF1000)) 
    ram_full_fb_i_i_1
       (.I0(ram_full_i_reg),
        .I1(out),
        .I2(s_axis_tvalid),
        .I3(comp1),
        .I4(ram_full_i_reg_0),
        .O(ram_full_fb_i_reg));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_compare_1
   (p_0_in,
    v1_reg_2,
    \gaf.gaf1.ram_afull_fb_reg );
  output p_0_in;
  input [3:0]v1_reg_2;
  input \gaf.gaf1.ram_afull_fb_reg ;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire \gaf.gaf1.ram_afull_fb_reg ;
  wire p_0_in;
  wire [3:0]v1_reg_2;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:5],p_0_in,carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:5],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:5],\gaf.gaf1.ram_afull_fb_reg ,v1_reg_2}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_compare_2
   (comp0,
    \gmux.gm[1].gms.ms_0 ,
    \gmux.gm[2].gms.ms_0 ,
    \gmux.gm[3].gms.ms_0 ,
    \gmux.gm[4].gms.ms_0 ,
    ram_empty_i_reg);
  output comp0;
  input \gmux.gm[1].gms.ms_0 ;
  input \gmux.gm[2].gms.ms_0 ;
  input \gmux.gm[3].gms.ms_0 ;
  input \gmux.gm[4].gms.ms_0 ;
  input ram_empty_i_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp0;
  wire \gmux.gm[1].gms.ms_0 ;
  wire \gmux.gm[2].gms.ms_0 ;
  wire \gmux.gm[3].gms.ms_0 ;
  wire \gmux.gm[4].gms.ms_0 ;
  wire ram_empty_i_reg;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:5],comp0,carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:5],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:5],ram_empty_i_reg,\gmux.gm[4].gms.ms_0 ,\gmux.gm[3].gms.ms_0 ,\gmux.gm[2].gms.ms_0 ,\gmux.gm[1].gms.ms_0 }));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_compare_3
   (ram_empty_fb_i_reg,
    v1_reg_2,
    ram_empty_i_reg,
    E,
    ram_empty_i_reg_0,
    out,
    p_19_out,
    comp0);
  output ram_empty_fb_i_reg;
  input [3:0]v1_reg_2;
  input ram_empty_i_reg;
  input [0:0]E;
  input ram_empty_i_reg_0;
  input out;
  input p_19_out;
  input comp0;

  wire [0:0]E;
  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp0;
  wire comp1;
  wire out;
  wire p_19_out;
  wire ram_empty_fb_i_reg;
  wire ram_empty_i_reg;
  wire ram_empty_i_reg_0;
  wire [3:0]v1_reg_2;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:5],comp1,carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:5],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:5],ram_empty_i_reg,v1_reg_2}));
  LUT6 #(
    .INIT(64'h0F0FFF8FFF0FFF8F)) 
    ram_empty_fb_i_i_1
       (.I0(E),
        .I1(comp1),
        .I2(ram_empty_i_reg_0),
        .I3(out),
        .I4(p_19_out),
        .I5(comp0),
        .O(ram_empty_fb_i_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_ramfifo
   (axis_prog_empty,
    wr_rst_busy,
    Q,
    s_axis_tready,
    m_axis_tvalid,
    axis_prog_full,
    s_aclk,
    m_axis_tready,
    axis_prog_empty_thresh,
    s_axis_tdata,
    DINADIN,
    s_axis_tvalid,
    axis_prog_full_thresh,
    s_aresetn);
  output axis_prog_empty;
  output wr_rst_busy;
  output [19:0]Q;
  output s_axis_tready;
  output m_axis_tvalid;
  output axis_prog_full;
  input s_aclk;
  input m_axis_tready;
  input [8:0]axis_prog_empty_thresh;
  input [15:0]s_axis_tdata;
  input [3:0]DINADIN;
  input s_axis_tvalid;
  input [8:0]axis_prog_full_thresh;
  input s_aresetn;

  wire [3:0]DINADIN;
  wire [19:0]Q;
  wire axis_prog_empty;
  wire [8:0]axis_prog_empty_thresh;
  wire axis_prog_full;
  wire [8:0]axis_prog_full_thresh;
  wire dout_i;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ;
  wire \gntv_or_sync_fifo.gl0.rd_n_1 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_10 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_29 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_4 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_5 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_6 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_7 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_8 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_9 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_24 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_25 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_26 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_27 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_28 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_29 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_30 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_4 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_44 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_5 ;
  wire [3:0]\grss.rsts/c2/v1_reg ;
  wire \gwss.gpf.wrpf/ram_rd_en_i ;
  wire \gwss.gpf.wrpf/ram_wr_en_i ;
  wire [4:0]\gwss.wsts/c0/v1_reg ;
  wire [4:0]\gwss.wsts/c1/v1_reg ;
  wire \gwss.wsts/comp0 ;
  wire [3:0]\gwss.wsts/gaf.c2/v1_reg ;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire p_0_in;
  wire [8:0]p_0_out;
  wire [8:0]p_12_out;
  wire [8:0]p_13_out;
  wire p_17_out;
  wire p_19_out;
  wire [7:0]rd_pntr_plus1;
  wire rst_full_gen_i;
  wire rstblk_n_2;
  wire rstblk_n_6;
  wire rstblk_n_7;
  wire s_aclk;
  wire s_aresetn;
  wire [15:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [1:0]sckt_wr_rst_cc;
  wire [7:0]wr_pntr_plus2;
  wire wr_rst_busy;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.DI({\gntv_or_sync_fifo.gl0.wr_n_24 ,\gntv_or_sync_fifo.gl0.wr_n_25 ,\gntv_or_sync_fifo.gl0.wr_n_26 ,\gntv_or_sync_fifo.gl0.wr_n_27 ,\gntv_or_sync_fifo.gl0.wr_n_28 ,\gntv_or_sync_fifo.gl0.wr_n_29 ,\gntv_or_sync_fifo.gl0.wr_n_30 }),
        .E(dout_i),
        .Q(sckt_wr_rst_cc),
        .S({\gntv_or_sync_fifo.gl0.wr_n_4 ,\gntv_or_sync_fifo.gl0.wr_n_5 }),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_empty_thresh(axis_prog_empty_thresh),
        .\gc0.count_d1_reg[6] ({\gntv_or_sync_fifo.gl0.rd_n_4 ,\gntv_or_sync_fifo.gl0.rd_n_5 ,\gntv_or_sync_fifo.gl0.rd_n_6 ,\gntv_or_sync_fifo.gl0.rd_n_7 ,\gntv_or_sync_fifo.gl0.rd_n_8 ,\gntv_or_sync_fifo.gl0.rd_n_9 ,\gntv_or_sync_fifo.gl0.rd_n_10 }),
        .\gc0.count_d1_reg[8] (p_0_out),
        .\gc0.count_d1_reg[8]_0 (rstblk_n_6),
        .\gc0.count_reg[7] (rd_pntr_plus1),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] (p_0_in),
        .\gmux.gm[3].gms.ms (wr_pntr_plus2),
        .\gmux.gm[4].gms.ms (p_13_out),
        .\gmux.gm[4].gms.ms_0 (p_12_out),
        .\greg.gpcry_sym.diff_pntr_pad_reg[9] (\gntv_or_sync_fifo.gl0.wr_n_44 ),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .out(p_17_out),
        .p_19_out(p_19_out),
        .ram_empty_fb_i_reg(\gntv_or_sync_fifo.gl0.rd_n_1 ),
        .ram_empty_i_reg(rstblk_n_7),
        .ram_full_fb_i_reg(\gntv_or_sync_fifo.gl0.rd_n_29 ),
        .ram_rd_en_i(\gwss.gpf.wrpf/ram_rd_en_i ),
        .ram_wr_en_i(\gwss.gpf.wrpf/ram_wr_en_i ),
        .s_aclk(s_aclk),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg(\gwss.wsts/c0/v1_reg ),
        .v1_reg_0(\gwss.wsts/c1/v1_reg ),
        .v1_reg_1(\gwss.wsts/gaf.c2/v1_reg ),
        .v1_reg_2(\grss.rsts/c2/v1_reg ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.DI({\gntv_or_sync_fifo.gl0.wr_n_24 ,\gntv_or_sync_fifo.gl0.wr_n_25 ,\gntv_or_sync_fifo.gl0.wr_n_26 ,\gntv_or_sync_fifo.gl0.wr_n_27 ,\gntv_or_sync_fifo.gl0.wr_n_28 ,\gntv_or_sync_fifo.gl0.wr_n_29 ,\gntv_or_sync_fifo.gl0.wr_n_30 }),
        .Q(p_12_out),
        .S({\gntv_or_sync_fifo.gl0.wr_n_4 ,\gntv_or_sync_fifo.gl0.wr_n_5 }),
        .axis_prog_full(axis_prog_full),
        .axis_prog_full_thresh(axis_prog_full_thresh),
        .comp0(\gwss.wsts/comp0 ),
        .\gaf.gaf1.ram_afull_fb_reg (p_17_out),
        .\gaf.gaf1.ram_afull_fb_reg_0 (rst_full_gen_i),
        .\gcc0.gc1.gsym.count_d1_reg[1] (rstblk_n_6),
        .\gcc0.gc1.gsym.count_d1_reg[8] (p_13_out),
        .\gcc0.gc1.gsym.count_d2_reg[7] (\gntv_or_sync_fifo.gl0.wr_n_44 ),
        .\gcc0.gc1.gsym.count_reg[7] (wr_pntr_plus2),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] (\gntv_or_sync_fifo.gl0.rd_n_29 ),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ({\gntv_or_sync_fifo.gl0.rd_n_4 ,\gntv_or_sync_fifo.gl0.rd_n_5 ,\gntv_or_sync_fifo.gl0.rd_n_6 ,\gntv_or_sync_fifo.gl0.rd_n_7 ,\gntv_or_sync_fifo.gl0.rd_n_8 ,\gntv_or_sync_fifo.gl0.rd_n_9 ,\gntv_or_sync_fifo.gl0.rd_n_10 }),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] (p_0_out),
        .\gmux.gm[3].gms.ms (rd_pntr_plus1),
        .out(p_0_in),
        .p_19_out(p_19_out),
        .ram_full_i_reg(\gntv_or_sync_fifo.gl0.rd_n_1 ),
        .ram_full_i_reg_0(rstblk_n_2),
        .ram_rd_en_i(\gwss.gpf.wrpf/ram_rd_en_i ),
        .ram_wr_en_i(\gwss.gpf.wrpf/ram_wr_en_i ),
        .s_aclk(s_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg(\grss.rsts/c2/v1_reg ),
        .v1_reg_0(\gwss.wsts/c0/v1_reg ),
        .v1_reg_1(\gwss.wsts/c1/v1_reg ),
        .v1_reg_2(\gwss.wsts/gaf.c2/v1_reg ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory \gntv_or_sync_fifo.mem 
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (p_0_out),
        .DINADIN(DINADIN),
        .E(dout_i),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ),
        .Q(p_12_out),
        .\goreg_bm.dout_i_reg[19]_0 (Q),
        .out(p_0_in),
        .p_19_out(p_19_out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_reset_blk_ramfifo rstblk
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\gntv_or_sync_fifo.gl0.rd_n_1 ),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ),
        .Q(sckt_wr_rst_cc),
        .comp0(\gwss.wsts/comp0 ),
        .\grstd1.grst_full.grst_f.rst_d3_reg_0 (rstblk_n_2),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_0 (rstblk_n_6),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[1]_0 (rstblk_n_7),
        .out(rst_full_gen_i),
        .ram_full_i_reg(p_0_in),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .wr_rst_busy(wr_rst_busy));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_top
   (axis_prog_empty,
    wr_rst_busy,
    Q,
    s_axis_tready,
    m_axis_tvalid,
    axis_prog_full,
    s_aclk,
    m_axis_tready,
    axis_prog_empty_thresh,
    s_axis_tdata,
    DINADIN,
    s_axis_tvalid,
    axis_prog_full_thresh,
    s_aresetn);
  output axis_prog_empty;
  output wr_rst_busy;
  output [19:0]Q;
  output s_axis_tready;
  output m_axis_tvalid;
  output axis_prog_full;
  input s_aclk;
  input m_axis_tready;
  input [8:0]axis_prog_empty_thresh;
  input [15:0]s_axis_tdata;
  input [3:0]DINADIN;
  input s_axis_tvalid;
  input [8:0]axis_prog_full_thresh;
  input s_aresetn;

  wire [3:0]DINADIN;
  wire [19:0]Q;
  wire axis_prog_empty;
  wire [8:0]axis_prog_empty_thresh;
  wire axis_prog_full;
  wire [8:0]axis_prog_full_thresh;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [15:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire wr_rst_busy;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_ramfifo \grf.rf 
       (.DINADIN(DINADIN),
        .Q(Q),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_empty_thresh(axis_prog_empty_thresh),
        .axis_prog_full(axis_prog_full),
        .axis_prog_full_thresh(axis_prog_full_thresh),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "4" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "4" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "16" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "2" *) (* C_AXIS_TSTRB_WIDTH = "2" *) 
(* C_AXIS_TUSER_WIDTH = "1" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "1" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "10" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "18" *) 
(* C_DIN_WIDTH_AXIS = "20" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "32" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "18" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "zynquplus" *) (* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "1" *) (* C_HAS_AXIS_TLAST = "1" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "0" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "0" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "1" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "0" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "2" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "5" *) (* C_IMPLEMENTATION_TYPE_WACH = "2" *) (* C_IMPLEMENTATION_TYPE_WDCH = "5" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "2" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "1" *) 
(* C_MEMORY_TYPE = "1" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "2" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "4kx4" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "511" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "14" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "14" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "14" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "3" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "511" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "15" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "15" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "15" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "1022" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "3" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "10" *) 
(* C_RD_DEPTH = "1024" *) (* C_RD_FREQ = "1" *) (* C_RD_PNTR_WIDTH = "10" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "0" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "10" *) 
(* C_WR_DEPTH = "1024" *) (* C_WR_DEPTH_AXIS = "512" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "10" *) 
(* C_WR_PNTR_WIDTH_AXIS = "9" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_3
   (backup,
    backup_marker,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    sleep,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [17:0]din;
  input wr_en;
  input rd_en;
  input [9:0]prog_empty_thresh;
  input [9:0]prog_empty_thresh_assert;
  input [9:0]prog_empty_thresh_negate;
  input [9:0]prog_full_thresh;
  input [9:0]prog_full_thresh_assert;
  input [9:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  input sleep;
  output [17:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [9:0]data_count;
  output [9:0]rd_data_count;
  output [9:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [15:0]s_axis_tdata;
  input [1:0]s_axis_tstrb;
  input [1:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [0:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [15:0]m_axis_tdata;
  output [1:0]m_axis_tstrb;
  output [1:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [0:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [8:0]axis_prog_full_thresh;
  input [8:0]axis_prog_empty_thresh;
  output [9:0]axis_data_count;
  output [9:0]axis_wr_data_count;
  output [9:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire \<const1> ;
  wire axis_prog_empty;
  wire [8:0]axis_prog_empty_thresh;
  wire axis_prog_full;
  wire [8:0]axis_prog_full_thresh;
  wire [15:0]m_axis_tdata;
  wire [1:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [0:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [15:0]s_axis_tdata;
  wire [1:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [0:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire wr_rst_busy;

  assign almost_empty = \<const1> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign data_count[9] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign dout[17] = \<const0> ;
  assign dout[16] = \<const0> ;
  assign dout[15] = \<const0> ;
  assign dout[14] = \<const0> ;
  assign dout[13] = \<const0> ;
  assign dout[12] = \<const0> ;
  assign dout[11] = \<const0> ;
  assign dout[10] = \<const0> ;
  assign dout[9] = \<const0> ;
  assign dout[8] = \<const0> ;
  assign dout[7] = \<const0> ;
  assign dout[6] = \<const0> ;
  assign dout[5] = \<const0> ;
  assign dout[4] = \<const0> ;
  assign dout[3] = \<const0> ;
  assign dout[2] = \<const0> ;
  assign dout[1] = \<const0> ;
  assign dout[0] = \<const0> ;
  assign empty = \<const1> ;
  assign full = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tstrb[1] = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const1> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[9] = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign rd_rst_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign valid = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[9] = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_3_synth inst_fifo_gen
       (.DINADIN({s_axis_tkeep,s_axis_tuser,s_axis_tlast}),
        .Q({m_axis_tdata,m_axis_tkeep,m_axis_tuser,m_axis_tlast}),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_empty_thresh(axis_prog_empty_thresh),
        .axis_prog_full(axis_prog_full),
        .axis_prog_full_thresh(axis_prog_full_thresh),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .wr_rst_busy(wr_rst_busy));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_3_synth
   (axis_prog_empty,
    wr_rst_busy,
    Q,
    s_axis_tready,
    m_axis_tvalid,
    axis_prog_full,
    s_aclk,
    m_axis_tready,
    axis_prog_empty_thresh,
    s_axis_tdata,
    DINADIN,
    s_axis_tvalid,
    axis_prog_full_thresh,
    s_aresetn);
  output axis_prog_empty;
  output wr_rst_busy;
  output [19:0]Q;
  output s_axis_tready;
  output m_axis_tvalid;
  output axis_prog_full;
  input s_aclk;
  input m_axis_tready;
  input [8:0]axis_prog_empty_thresh;
  input [15:0]s_axis_tdata;
  input [3:0]DINADIN;
  input s_axis_tvalid;
  input [8:0]axis_prog_full_thresh;
  input s_aresetn;

  wire [3:0]DINADIN;
  wire [19:0]Q;
  wire axis_prog_empty;
  wire [8:0]axis_prog_empty_thresh;
  wire axis_prog_full;
  wire [8:0]axis_prog_full_thresh;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [15:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire wr_rst_busy;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_top \gaxis_fifo.gaxisf.axisf 
       (.DINADIN(DINADIN),
        .Q(Q),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_empty_thresh(axis_prog_empty_thresh),
        .axis_prog_full(axis_prog_full),
        .axis_prog_full_thresh(axis_prog_full_thresh),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .wr_rst_busy(wr_rst_busy));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory
   (ENB_dly_D,
    \goreg_bm.dout_i_reg[19]_0 ,
    s_aclk,
    ENB_I,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    Q,
    s_axis_tdata,
    DINADIN,
    p_19_out,
    out,
    s_axis_tvalid,
    E);
  output ENB_dly_D;
  output [19:0]\goreg_bm.dout_i_reg[19]_0 ;
  input s_aclk;
  input ENB_I;
  input [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [8:0]Q;
  input [15:0]s_axis_tdata;
  input [3:0]DINADIN;
  input p_19_out;
  input out;
  input s_axis_tvalid;
  input [0:0]E;

  wire [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [3:0]DINADIN;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire [19:0]doutb;
  wire [19:0]\goreg_bm.dout_i_reg[19]_0 ;
  wire out;
  wire p_19_out;
  wire s_aclk;
  wire [15:0]s_axis_tdata;
  wire s_axis_tvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_2 \gbm.gbmg.gbmga.ngecc.bmg 
       (.D(doutb),
        .\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .DINADIN(DINADIN),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .out(out),
        .p_19_out(p_19_out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[0]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[10] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[10]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[11] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[11]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[12] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[12]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[13] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[13]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[14] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[14]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[15] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[15]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[16] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[16]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[17] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[17]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[18] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[18]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[19] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[19]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[1]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[2]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[3]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[4]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[5]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[6]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[7]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[8]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[9] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[9]),
        .Q(\goreg_bm.dout_i_reg[19]_0 [9]),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_bin_cntr
   (\gc0.count_d1_reg[6]_0 ,
    Q,
    S,
    \gc0.count_reg[8]_0 ,
    \gc0.count_reg[7]_0 ,
    v1_reg,
    v1_reg_0,
    v1_reg_1,
    \gc0.count_d1_reg[1]_0 ,
    \gc0.count_d1_reg[2]_0 ,
    \gc0.count_d1_reg[4]_0 ,
    \gc0.count_d1_reg[6]_1 ,
    \gc0.count_d1_reg[8]_0 ,
    \gmux.gm[4].gms.ms ,
    p_19_out,
    E,
    \gmux.gm[4].gms.ms_0 ,
    \gmux.gm[3].gms.ms ,
    \gc0.count_d1_reg[8]_1 ,
    s_aclk);
  output [6:0]\gc0.count_d1_reg[6]_0 ;
  output [8:0]Q;
  output [5:0]S;
  output \gc0.count_reg[8]_0 ;
  output [7:0]\gc0.count_reg[7]_0 ;
  output [4:0]v1_reg;
  output [4:0]v1_reg_0;
  output [3:0]v1_reg_1;
  output \gc0.count_d1_reg[1]_0 ;
  output \gc0.count_d1_reg[2]_0 ;
  output \gc0.count_d1_reg[4]_0 ;
  output \gc0.count_d1_reg[6]_1 ;
  output \gc0.count_d1_reg[8]_0 ;
  input [8:0]\gmux.gm[4].gms.ms ;
  input p_19_out;
  input [0:0]E;
  input [8:0]\gmux.gm[4].gms.ms_0 ;
  input [7:0]\gmux.gm[3].gms.ms ;
  input \gc0.count_d1_reg[8]_1 ;
  input s_aclk;

  wire [0:0]E;
  wire [8:0]Q;
  wire [5:0]S;
  wire \gc0.count[8]_i_2_n_0 ;
  wire \gc0.count_d1_reg[1]_0 ;
  wire \gc0.count_d1_reg[2]_0 ;
  wire \gc0.count_d1_reg[4]_0 ;
  wire [6:0]\gc0.count_d1_reg[6]_0 ;
  wire \gc0.count_d1_reg[6]_1 ;
  wire \gc0.count_d1_reg[8]_0 ;
  wire \gc0.count_d1_reg[8]_1 ;
  wire [7:0]\gc0.count_reg[7]_0 ;
  wire \gc0.count_reg[8]_0 ;
  wire [7:0]\gmux.gm[3].gms.ms ;
  wire [8:0]\gmux.gm[4].gms.ms ;
  wire [8:0]\gmux.gm[4].gms.ms_0 ;
  wire p_19_out;
  wire [8:0]plusOp__0;
  wire [8:8]rd_pntr_plus1;
  wire s_aclk;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;
  wire [3:0]v1_reg_1;

  LUT1 #(
    .INIT(2'h1)) 
    \gc0.count[0]_i_1 
       (.I0(\gc0.count_reg[7]_0 [0]),
        .O(plusOp__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gc0.count[1]_i_1 
       (.I0(\gc0.count_reg[7]_0 [0]),
        .I1(\gc0.count_reg[7]_0 [1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \gc0.count[2]_i_1 
       (.I0(\gc0.count_reg[7]_0 [2]),
        .I1(\gc0.count_reg[7]_0 [0]),
        .I2(\gc0.count_reg[7]_0 [1]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \gc0.count[3]_i_1 
       (.I0(\gc0.count_reg[7]_0 [3]),
        .I1(\gc0.count_reg[7]_0 [1]),
        .I2(\gc0.count_reg[7]_0 [0]),
        .I3(\gc0.count_reg[7]_0 [2]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \gc0.count[4]_i_1 
       (.I0(\gc0.count_reg[7]_0 [4]),
        .I1(\gc0.count_reg[7]_0 [2]),
        .I2(\gc0.count_reg[7]_0 [0]),
        .I3(\gc0.count_reg[7]_0 [1]),
        .I4(\gc0.count_reg[7]_0 [3]),
        .O(plusOp__0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \gc0.count[5]_i_1 
       (.I0(\gc0.count_reg[7]_0 [5]),
        .I1(\gc0.count_reg[7]_0 [3]),
        .I2(\gc0.count_reg[7]_0 [1]),
        .I3(\gc0.count_reg[7]_0 [0]),
        .I4(\gc0.count_reg[7]_0 [2]),
        .I5(\gc0.count_reg[7]_0 [4]),
        .O(plusOp__0[5]));
  LUT2 #(
    .INIT(4'h9)) 
    \gc0.count[6]_i_1 
       (.I0(\gc0.count[8]_i_2_n_0 ),
        .I1(\gc0.count_reg[7]_0 [6]),
        .O(plusOp__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \gc0.count[7]_i_1 
       (.I0(\gc0.count_reg[7]_0 [7]),
        .I1(\gc0.count[8]_i_2_n_0 ),
        .I2(\gc0.count_reg[7]_0 [6]),
        .O(plusOp__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hA6AA)) 
    \gc0.count[8]_i_1 
       (.I0(rd_pntr_plus1),
        .I1(\gc0.count_reg[7]_0 [6]),
        .I2(\gc0.count[8]_i_2_n_0 ),
        .I3(\gc0.count_reg[7]_0 [7]),
        .O(plusOp__0[8]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \gc0.count[8]_i_2 
       (.I0(\gc0.count_reg[7]_0 [4]),
        .I1(\gc0.count_reg[7]_0 [2]),
        .I2(\gc0.count_reg[7]_0 [0]),
        .I3(\gc0.count_reg[7]_0 [1]),
        .I4(\gc0.count_reg[7]_0 [3]),
        .I5(\gc0.count_reg[7]_0 [5]),
        .O(\gc0.count[8]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(\gc0.count_reg[7]_0 [0]),
        .Q(Q[0]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(\gc0.count_reg[7]_0 [1]),
        .Q(Q[1]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(\gc0.count_reg[7]_0 [2]),
        .Q(Q[2]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(\gc0.count_reg[7]_0 [3]),
        .Q(Q[3]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(\gc0.count_reg[7]_0 [4]),
        .Q(Q[4]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(\gc0.count_reg[7]_0 [5]),
        .Q(Q[5]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(\gc0.count_reg[7]_0 [6]),
        .Q(Q[6]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(\gc0.count_reg[7]_0 [7]),
        .Q(Q[7]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(rd_pntr_plus1),
        .Q(Q[8]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDSE #(
    .INIT(1'b1)) 
    \gc0.count_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[0]),
        .Q(\gc0.count_reg[7]_0 [0]),
        .S(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[1]),
        .Q(\gc0.count_reg[7]_0 [1]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[2]),
        .Q(\gc0.count_reg[7]_0 [2]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[3]),
        .Q(\gc0.count_reg[7]_0 [3]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[4]),
        .Q(\gc0.count_reg[7]_0 [4]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[5]),
        .Q(\gc0.count_reg[7]_0 [5]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[6]),
        .Q(\gc0.count_reg[7]_0 [6]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[7]),
        .Q(\gc0.count_reg[7]_0 [7]),
        .R(\gc0.count_d1_reg[8]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[8]),
        .Q(rd_pntr_plus1),
        .R(\gc0.count_d1_reg[8]_1 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(Q[1]),
        .I1(\gmux.gm[4].gms.ms_0 [1]),
        .I2(Q[0]),
        .I3(\gmux.gm[4].gms.ms_0 [0]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(Q[1]),
        .I1(\gmux.gm[4].gms.ms [1]),
        .I2(Q[0]),
        .I3(\gmux.gm[4].gms.ms [0]),
        .O(v1_reg_0[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__2 
       (.I0(Q[0]),
        .I1(\gmux.gm[3].gms.ms [0]),
        .I2(Q[1]),
        .I3(\gmux.gm[3].gms.ms [1]),
        .O(v1_reg_1[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__3 
       (.I0(Q[1]),
        .I1(\gmux.gm[4].gms.ms_0 [1]),
        .I2(Q[0]),
        .I3(\gmux.gm[4].gms.ms_0 [0]),
        .O(\gc0.count_d1_reg[1]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(Q[2]),
        .I1(\gmux.gm[4].gms.ms_0 [2]),
        .I2(Q[3]),
        .I3(\gmux.gm[4].gms.ms_0 [3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__0 
       (.I0(Q[2]),
        .I1(\gmux.gm[4].gms.ms [2]),
        .I2(Q[3]),
        .I3(\gmux.gm[4].gms.ms [3]),
        .O(v1_reg_0[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__2 
       (.I0(Q[2]),
        .I1(\gmux.gm[3].gms.ms [2]),
        .I2(Q[3]),
        .I3(\gmux.gm[3].gms.ms [3]),
        .O(v1_reg_1[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__3 
       (.I0(Q[2]),
        .I1(\gmux.gm[4].gms.ms_0 [2]),
        .I2(Q[3]),
        .I3(\gmux.gm[4].gms.ms_0 [3]),
        .O(\gc0.count_d1_reg[2]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(Q[4]),
        .I1(\gmux.gm[4].gms.ms_0 [4]),
        .I2(Q[5]),
        .I3(\gmux.gm[4].gms.ms_0 [5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__0 
       (.I0(Q[4]),
        .I1(\gmux.gm[4].gms.ms [4]),
        .I2(Q[5]),
        .I3(\gmux.gm[4].gms.ms [5]),
        .O(v1_reg_0[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__2 
       (.I0(Q[4]),
        .I1(\gmux.gm[3].gms.ms [4]),
        .I2(Q[5]),
        .I3(\gmux.gm[3].gms.ms [5]),
        .O(v1_reg_1[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__3 
       (.I0(Q[4]),
        .I1(\gmux.gm[4].gms.ms_0 [4]),
        .I2(Q[5]),
        .I3(\gmux.gm[4].gms.ms_0 [5]),
        .O(\gc0.count_d1_reg[4]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(Q[6]),
        .I1(\gmux.gm[4].gms.ms_0 [6]),
        .I2(Q[7]),
        .I3(\gmux.gm[4].gms.ms_0 [7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__0 
       (.I0(Q[6]),
        .I1(\gmux.gm[4].gms.ms [6]),
        .I2(Q[7]),
        .I3(\gmux.gm[4].gms.ms [7]),
        .O(v1_reg_0[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__2 
       (.I0(Q[6]),
        .I1(\gmux.gm[3].gms.ms [6]),
        .I2(Q[7]),
        .I3(\gmux.gm[3].gms.ms [7]),
        .O(v1_reg_1[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__3 
       (.I0(Q[6]),
        .I1(\gmux.gm[4].gms.ms_0 [6]),
        .I2(Q[7]),
        .I3(\gmux.gm[4].gms.ms_0 [7]),
        .O(\gc0.count_d1_reg[6]_1 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(Q[8]),
        .I1(\gmux.gm[4].gms.ms_0 [8]),
        .O(v1_reg[4]));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__0 
       (.I0(Q[8]),
        .I1(\gmux.gm[4].gms.ms [8]),
        .O(v1_reg_0[4]));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__1 
       (.I0(Q[8]),
        .I1(\gmux.gm[4].gms.ms_0 [8]),
        .O(\gc0.count_d1_reg[8]_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__2 
       (.I0(rd_pntr_plus1),
        .I1(\gmux.gm[4].gms.ms_0 [8]),
        .O(\gc0.count_reg[8]_0 ));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_10
       (.I0(Q[4]),
        .I1(\gmux.gm[4].gms.ms_0 [4]),
        .I2(Q[5]),
        .I3(\gmux.gm[4].gms.ms_0 [5]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_10__0
       (.I0(Q[4]),
        .I1(\gmux.gm[4].gms.ms [4]),
        .I2(Q[5]),
        .I3(\gmux.gm[4].gms.ms [5]),
        .O(\gc0.count_d1_reg[6]_0 [4]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_11
       (.I0(Q[3]),
        .I1(\gmux.gm[4].gms.ms_0 [3]),
        .I2(Q[4]),
        .I3(\gmux.gm[4].gms.ms_0 [4]),
        .O(S[2]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_11__0
       (.I0(Q[3]),
        .I1(\gmux.gm[4].gms.ms [3]),
        .I2(Q[4]),
        .I3(\gmux.gm[4].gms.ms [4]),
        .O(\gc0.count_d1_reg[6]_0 [3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_12
       (.I0(Q[2]),
        .I1(\gmux.gm[4].gms.ms_0 [2]),
        .I2(Q[3]),
        .I3(\gmux.gm[4].gms.ms_0 [3]),
        .O(S[1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_12__0
       (.I0(Q[2]),
        .I1(\gmux.gm[4].gms.ms [2]),
        .I2(Q[3]),
        .I3(\gmux.gm[4].gms.ms [3]),
        .O(\gc0.count_d1_reg[6]_0 [2]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_13
       (.I0(Q[1]),
        .I1(\gmux.gm[4].gms.ms_0 [1]),
        .I2(Q[2]),
        .I3(\gmux.gm[4].gms.ms_0 [2]),
        .O(S[0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_13__0
       (.I0(Q[1]),
        .I1(\gmux.gm[4].gms.ms [1]),
        .I2(Q[2]),
        .I3(\gmux.gm[4].gms.ms [2]),
        .O(\gc0.count_d1_reg[6]_0 [1]));
  LUT6 #(
    .INIT(64'hBB2B44D444D4BB2B)) 
    plusOp__0_carry_i_14__0
       (.I0(Q[0]),
        .I1(\gmux.gm[4].gms.ms [0]),
        .I2(p_19_out),
        .I3(E),
        .I4(Q[1]),
        .I5(\gmux.gm[4].gms.ms [1]),
        .O(\gc0.count_d1_reg[6]_0 [0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_8
       (.I0(Q[6]),
        .I1(\gmux.gm[4].gms.ms_0 [6]),
        .I2(Q[7]),
        .I3(\gmux.gm[4].gms.ms_0 [7]),
        .O(S[5]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_8__0
       (.I0(Q[6]),
        .I1(\gmux.gm[4].gms.ms [6]),
        .I2(Q[7]),
        .I3(\gmux.gm[4].gms.ms [7]),
        .O(\gc0.count_d1_reg[6]_0 [6]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_9
       (.I0(Q[5]),
        .I1(\gmux.gm[4].gms.ms_0 [5]),
        .I2(Q[6]),
        .I3(\gmux.gm[4].gms.ms_0 [6]),
        .O(S[4]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_9__0
       (.I0(Q[5]),
        .I1(\gmux.gm[4].gms.ms [5]),
        .I2(Q[6]),
        .I3(\gmux.gm[4].gms.ms [6]),
        .O(\gc0.count_d1_reg[6]_0 [5]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_fwft
   (E,
    \gpregsm1.curr_fwft_state_reg[0]_0 ,
    ram_full_fb_i_reg,
    m_axis_tvalid,
    s_aclk,
    empty_fwft_fb_o_i_reg_0,
    out,
    aempty_fwft_fb_i_reg_0,
    m_axis_tready,
    Q,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ,
    s_axis_tvalid,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_1 );
  output [0:0]E;
  output [0:0]\gpregsm1.curr_fwft_state_reg[0]_0 ;
  output [0:0]ram_full_fb_i_reg;
  output m_axis_tvalid;
  input s_aclk;
  input empty_fwft_fb_o_i_reg_0;
  input out;
  input aempty_fwft_fb_i_reg_0;
  input m_axis_tready;
  input [1:0]Q;
  input \gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ;
  input s_axis_tvalid;
  input [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ;
  input [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_1 ;

  wire [0:0]E;
  wire [1:0]Q;
  (* DONT_TOUCH *) wire aempty_fwft_fb_i;
  wire aempty_fwft_fb_i_i_1_n_0;
  wire aempty_fwft_fb_i_i_2_n_0;
  wire aempty_fwft_fb_i_reg_0;
  (* DONT_TOUCH *) wire aempty_fwft_i;
  (* DONT_TOUCH *) wire [1:0]curr_fwft_state;
  (* DONT_TOUCH *) wire empty_fwft_fb_i;
  wire empty_fwft_fb_i_i_1_n_0;
  (* DONT_TOUCH *) wire empty_fwft_fb_o_i;
  wire empty_fwft_fb_o_i_reg0;
  wire empty_fwft_fb_o_i_reg_0;
  (* DONT_TOUCH *) wire empty_fwft_i;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ;
  wire [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ;
  wire [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_1 ;
  wire \gpregsm1.curr_fwft_state[0]_i_1_n_0 ;
  wire \gpregsm1.curr_fwft_state[1]_i_1_n_0 ;
  wire [0:0]\gpregsm1.curr_fwft_state_reg[0]_0 ;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire out;
  wire [0:0]ram_full_fb_i_reg;
  wire s_aclk;
  wire s_axis_tvalid;
  (* DONT_TOUCH *) wire user_valid;

  LUT6 #(
    .INIT(64'hEF80EB00FFFFFFFF)) 
    aempty_fwft_fb_i_i_1
       (.I0(out),
        .I1(curr_fwft_state[0]),
        .I2(curr_fwft_state[1]),
        .I3(aempty_fwft_fb_i),
        .I4(aempty_fwft_fb_i_i_2_n_0),
        .I5(aempty_fwft_fb_i_reg_0),
        .O(aempty_fwft_fb_i_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    aempty_fwft_fb_i_i_2
       (.I0(m_axis_tready),
        .I1(empty_fwft_fb_o_i),
        .O(aempty_fwft_fb_i_i_2_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    aempty_fwft_fb_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(aempty_fwft_fb_i_i_1_n_0),
        .Q(aempty_fwft_fb_i),
        .R(1'b0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    aempty_fwft_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(aempty_fwft_fb_i_i_1_n_0),
        .Q(aempty_fwft_i),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFF0F0F0FFF4FFF0F)) 
    empty_fwft_fb_i_i_1
       (.I0(empty_fwft_fb_o_i),
        .I1(m_axis_tready),
        .I2(aempty_fwft_fb_i_reg_0),
        .I3(empty_fwft_fb_i),
        .I4(curr_fwft_state[0]),
        .I5(curr_fwft_state[1]),
        .O(empty_fwft_fb_i_i_1_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    empty_fwft_fb_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(empty_fwft_fb_i_i_1_n_0),
        .Q(empty_fwft_fb_i),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF320)) 
    empty_fwft_fb_o_i_i_1
       (.I0(m_axis_tready),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(empty_fwft_fb_o_i),
        .O(empty_fwft_fb_o_i_reg0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_fb_o_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(empty_fwft_fb_o_i_reg0),
        .Q(empty_fwft_fb_o_i),
        .S(empty_fwft_fb_o_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    empty_fwft_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(empty_fwft_fb_i_i_1_n_0),
        .Q(empty_fwft_i),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h10555555)) 
    \gc0.count_d1[8]_i_1 
       (.I0(out),
        .I1(empty_fwft_fb_o_i),
        .I2(m_axis_tready),
        .I3(curr_fwft_state[0]),
        .I4(curr_fwft_state[1]),
        .O(E));
  LUT6 #(
    .INIT(64'h0000005D00000000)) 
    \goreg_bm.dout_i[19]_i_1 
       (.I0(curr_fwft_state[0]),
        .I1(m_axis_tready),
        .I2(empty_fwft_fb_o_i),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(curr_fwft_state[1]),
        .O(\gpregsm1.curr_fwft_state_reg[0]_0 ));
  LUT4 #(
    .INIT(16'hEEAE)) 
    \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(curr_fwft_state[0]),
        .I2(m_axis_tready),
        .I3(empty_fwft_fb_o_i),
        .O(\gpregsm1.curr_fwft_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB000FFFF)) 
    \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(empty_fwft_fb_o_i),
        .I1(m_axis_tready),
        .I2(curr_fwft_state[0]),
        .I3(curr_fwft_state[1]),
        .I4(out),
        .O(\gpregsm1.curr_fwft_state[1]_i_1_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\gpregsm1.curr_fwft_state[0]_i_1_n_0 ),
        .Q(curr_fwft_state[0]),
        .R(empty_fwft_fb_o_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\gpregsm1.curr_fwft_state[1]_i_1_n_0 ),
        .Q(curr_fwft_state[1]),
        .R(empty_fwft_fb_o_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.user_valid_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\gpregsm1.curr_fwft_state[0]_i_1_n_0 ),
        .Q(user_valid),
        .R(empty_fwft_fb_o_i_reg_0));
  LUT1 #(
    .INIT(2'h1)) 
    m_axis_tvalid_INST_0
       (.I0(empty_fwft_i),
        .O(m_axis_tvalid));
  LUT5 #(
    .INIT(32'h1000FF10)) 
    plusOp__0_carry_i_7__0
       (.I0(E),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ),
        .I2(s_axis_tvalid),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_1 ),
        .O(ram_full_fb_i_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_logic
   (ram_rd_en_i,
    ram_empty_fb_i_reg,
    ram_wr_en_i,
    axis_prog_empty,
    \gc0.count_d1_reg[6] ,
    \gc0.count_d1_reg[8] ,
    \gc0.count_reg[7] ,
    E,
    ram_full_fb_i_reg,
    v1_reg,
    v1_reg_0,
    v1_reg_1,
    m_axis_tvalid,
    v1_reg_2,
    s_aclk,
    \gc0.count_d1_reg[8]_0 ,
    p_19_out,
    DI,
    S,
    \greg.gpcry_sym.diff_pntr_pad_reg[9] ,
    out,
    Q,
    ram_empty_i_reg,
    \gmux.gm[4].gms.ms ,
    m_axis_tready,
    \gmux.gm[4].gms.ms_0 ,
    axis_prog_empty_thresh,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ,
    s_axis_tvalid,
    \gmux.gm[3].gms.ms );
  output ram_rd_en_i;
  output ram_empty_fb_i_reg;
  output ram_wr_en_i;
  output axis_prog_empty;
  output [6:0]\gc0.count_d1_reg[6] ;
  output [8:0]\gc0.count_d1_reg[8] ;
  output [7:0]\gc0.count_reg[7] ;
  output [0:0]E;
  output [0:0]ram_full_fb_i_reg;
  output [4:0]v1_reg;
  output [4:0]v1_reg_0;
  output [3:0]v1_reg_1;
  output m_axis_tvalid;
  input [3:0]v1_reg_2;
  input s_aclk;
  input \gc0.count_d1_reg[8]_0 ;
  input p_19_out;
  input [6:0]DI;
  input [1:0]S;
  input [0:0]\greg.gpcry_sym.diff_pntr_pad_reg[9] ;
  input out;
  input [1:0]Q;
  input ram_empty_i_reg;
  input [8:0]\gmux.gm[4].gms.ms ;
  input m_axis_tready;
  input [8:0]\gmux.gm[4].gms.ms_0 ;
  input [8:0]axis_prog_empty_thresh;
  input \gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ;
  input s_axis_tvalid;
  input [7:0]\gmux.gm[3].gms.ms ;

  wire [6:0]DI;
  wire [0:0]E;
  wire [1:0]Q;
  wire [1:0]S;
  wire axis_prog_empty;
  wire [8:0]axis_prog_empty_thresh;
  wire [6:0]\gc0.count_d1_reg[6] ;
  wire [8:0]\gc0.count_d1_reg[8] ;
  wire \gc0.count_d1_reg[8]_0 ;
  wire [7:0]\gc0.count_reg[7] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ;
  wire [7:0]\gmux.gm[3].gms.ms ;
  wire [8:0]\gmux.gm[4].gms.ms ;
  wire [8:0]\gmux.gm[4].gms.ms_0 ;
  wire [0:0]\greg.gpcry_sym.diff_pntr_pad_reg[9] ;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire out;
  wire p_19_out;
  wire p_2_out;
  wire ram_empty_fb_i_reg;
  wire ram_empty_i_reg;
  wire [0:0]ram_full_fb_i_reg;
  wire ram_rd_en_i;
  wire ram_wr_en_i;
  wire rpntr_n_16;
  wire rpntr_n_17;
  wire rpntr_n_18;
  wire rpntr_n_19;
  wire rpntr_n_20;
  wire rpntr_n_21;
  wire rpntr_n_22;
  wire rpntr_n_45;
  wire rpntr_n_46;
  wire rpntr_n_47;
  wire rpntr_n_48;
  wire rpntr_n_49;
  wire s_aclk;
  wire s_axis_tvalid;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;
  wire [3:0]v1_reg_1;
  wire [3:0]v1_reg_2;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_fwft \gr1.gr1_int.rfwft 
       (.E(ram_empty_fb_i_reg),
        .Q(Q),
        .aempty_fwft_fb_i_reg_0(ram_empty_i_reg),
        .empty_fwft_fb_o_i_reg_0(\gc0.count_d1_reg[8]_0 ),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] (\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 (\gmux.gm[4].gms.ms [0]),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_1 (\gc0.count_d1_reg[8] [0]),
        .\gpregsm1.curr_fwft_state_reg[0]_0 (E),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .out(p_2_out),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .s_aclk(s_aclk),
        .s_axis_tvalid(s_axis_tvalid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_pe_ss \grss.gpe.rdpe 
       (.DI(DI),
        .E(ram_empty_fb_i_reg),
        .Q(Q),
        .S({rpntr_n_16,rpntr_n_17,rpntr_n_18,rpntr_n_19,rpntr_n_20,rpntr_n_21,S}),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_empty_thresh(axis_prog_empty_thresh),
        .\greg.gpcry_sym.diff_pntr_pad_reg[9]_0 (\greg.gpcry_sym.diff_pntr_pad_reg[9] ),
        .\greg.ram_wr_en_i_reg_0 (\gc0.count_d1_reg[8]_0 ),
        .out(out),
        .p_19_out(p_19_out),
        .ram_rd_en_i(ram_rd_en_i),
        .ram_wr_en_i(ram_wr_en_i),
        .s_aclk(s_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_status_flags_ss \grss.rsts 
       (.E(ram_empty_fb_i_reg),
        .\gmux.gm[1].gms.ms (rpntr_n_45),
        .\gmux.gm[2].gms.ms (rpntr_n_46),
        .\gmux.gm[3].gms.ms (rpntr_n_47),
        .\gmux.gm[4].gms.ms (rpntr_n_48),
        .out(p_2_out),
        .p_19_out(p_19_out),
        .ram_empty_i_reg_0(rpntr_n_49),
        .ram_empty_i_reg_1(rpntr_n_22),
        .ram_empty_i_reg_2(ram_empty_i_reg),
        .s_aclk(s_aclk),
        .v1_reg_2(v1_reg_2));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_bin_cntr rpntr
       (.E(ram_empty_fb_i_reg),
        .Q(\gc0.count_d1_reg[8] ),
        .S({rpntr_n_16,rpntr_n_17,rpntr_n_18,rpntr_n_19,rpntr_n_20,rpntr_n_21}),
        .\gc0.count_d1_reg[1]_0 (rpntr_n_45),
        .\gc0.count_d1_reg[2]_0 (rpntr_n_46),
        .\gc0.count_d1_reg[4]_0 (rpntr_n_47),
        .\gc0.count_d1_reg[6]_0 (\gc0.count_d1_reg[6] ),
        .\gc0.count_d1_reg[6]_1 (rpntr_n_48),
        .\gc0.count_d1_reg[8]_0 (rpntr_n_49),
        .\gc0.count_d1_reg[8]_1 (\gc0.count_d1_reg[8]_0 ),
        .\gc0.count_reg[7]_0 (\gc0.count_reg[7] ),
        .\gc0.count_reg[8]_0 (rpntr_n_22),
        .\gmux.gm[3].gms.ms (\gmux.gm[3].gms.ms ),
        .\gmux.gm[4].gms.ms (\gmux.gm[4].gms.ms ),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms_0 ),
        .p_19_out(p_19_out),
        .s_aclk(s_aclk),
        .v1_reg(v1_reg),
        .v1_reg_0(v1_reg_0),
        .v1_reg_1(v1_reg_1));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_pe_ss
   (ram_rd_en_i,
    ram_wr_en_i,
    axis_prog_empty,
    \greg.ram_wr_en_i_reg_0 ,
    E,
    s_aclk,
    p_19_out,
    DI,
    S,
    \greg.gpcry_sym.diff_pntr_pad_reg[9]_0 ,
    out,
    Q,
    axis_prog_empty_thresh);
  output ram_rd_en_i;
  output ram_wr_en_i;
  output axis_prog_empty;
  input \greg.ram_wr_en_i_reg_0 ;
  input [0:0]E;
  input s_aclk;
  input p_19_out;
  input [6:0]DI;
  input [7:0]S;
  input [0:0]\greg.gpcry_sym.diff_pntr_pad_reg[9]_0 ;
  input out;
  input [1:0]Q;
  input [8:0]axis_prog_empty_thresh;

  wire [6:0]DI;
  wire [0:0]E;
  wire [1:0]Q;
  wire [7:0]S;
  wire axis_prog_empty;
  wire [8:0]axis_prog_empty_thresh;
  wire [8:0]diff_pntr;
  wire \gpe4.prog_empty_i_i_1_n_0 ;
  wire \gpe4.prog_empty_i_i_3_n_0 ;
  wire \gpe4.prog_empty_i_i_5_n_0 ;
  wire \gpe4.prog_empty_i_i_6_n_0 ;
  wire \gpe4.prog_empty_i_i_7_n_0 ;
  wire [0:0]\greg.gpcry_sym.diff_pntr_pad_reg[9]_0 ;
  wire \greg.ram_wr_en_i_reg_0 ;
  wire ltOp;
  wire ltOp_carry_i_10_n_0;
  wire ltOp_carry_i_11_n_0;
  wire ltOp_carry_i_12_n_0;
  wire ltOp_carry_i_13_n_0;
  wire ltOp_carry_i_1_n_0;
  wire ltOp_carry_i_2_n_0;
  wire ltOp_carry_i_3_n_0;
  wire ltOp_carry_i_4_n_0;
  wire ltOp_carry_i_5_n_0;
  wire ltOp_carry_i_6_n_0;
  wire ltOp_carry_i_7_n_0;
  wire ltOp_carry_i_8_n_0;
  wire ltOp_carry_i_9_n_0;
  wire ltOp_carry_n_4;
  wire ltOp_carry_n_5;
  wire ltOp_carry_n_6;
  wire ltOp_carry_n_7;
  wire out;
  wire p_19_out;
  wire [9:1]plusOp;
  wire plusOp__0_carry_n_0;
  wire plusOp__0_carry_n_1;
  wire plusOp__0_carry_n_2;
  wire plusOp__0_carry_n_3;
  wire plusOp__0_carry_n_4;
  wire plusOp__0_carry_n_5;
  wire plusOp__0_carry_n_6;
  wire plusOp__0_carry_n_7;
  wire prog_empty_i0_out;
  wire [8:8]prog_empty_thresh_sub_two;
  wire ram_rd_en_i;
  wire ram_wr_en_i;
  wire s_aclk;
  wire [7:5]NLW_ltOp_carry_CO_UNCONNECTED;
  wire [7:0]NLW_ltOp_carry_O_UNCONNECTED;
  wire [7:0]NLW_plusOp__0_carry__0_CO_UNCONNECTED;
  wire [7:1]NLW_plusOp__0_carry__0_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF3E2)) 
    \gpe4.prog_empty_i_i_1 
       (.I0(ltOp),
        .I1(out),
        .I2(axis_prog_empty),
        .I3(prog_empty_i0_out),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\gpe4.prog_empty_i_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000082)) 
    \gpe4.prog_empty_i_i_2 
       (.I0(\gpe4.prog_empty_i_i_3_n_0 ),
        .I1(prog_empty_thresh_sub_two),
        .I2(diff_pntr[8]),
        .I3(\gpe4.prog_empty_i_i_5_n_0 ),
        .I4(\gpe4.prog_empty_i_i_6_n_0 ),
        .I5(\gpe4.prog_empty_i_i_7_n_0 ),
        .O(prog_empty_i0_out));
  LUT5 #(
    .INIT(32'h90060990)) 
    \gpe4.prog_empty_i_i_3 
       (.I0(axis_prog_empty_thresh[7]),
        .I1(diff_pntr[7]),
        .I2(axis_prog_empty_thresh[6]),
        .I3(ltOp_carry_i_12_n_0),
        .I4(diff_pntr[6]),
        .O(\gpe4.prog_empty_i_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hA9)) 
    \gpe4.prog_empty_i_i_4 
       (.I0(axis_prog_empty_thresh[8]),
        .I1(ltOp_carry_i_11_n_0),
        .I2(axis_prog_empty_thresh[7]),
        .O(prog_empty_thresh_sub_two));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6FF9F66F)) 
    \gpe4.prog_empty_i_i_5 
       (.I0(diff_pntr[3]),
        .I1(axis_prog_empty_thresh[3]),
        .I2(axis_prog_empty_thresh[1]),
        .I3(axis_prog_empty_thresh[2]),
        .I4(diff_pntr[2]),
        .O(\gpe4.prog_empty_i_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h9FF9FFFF9FF99FF9)) 
    \gpe4.prog_empty_i_i_6 
       (.I0(diff_pntr[1]),
        .I1(axis_prog_empty_thresh[1]),
        .I2(axis_prog_empty_thresh[0]),
        .I3(diff_pntr[0]),
        .I4(ram_rd_en_i),
        .I5(ram_wr_en_i),
        .O(\gpe4.prog_empty_i_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h6FF9F66F)) 
    \gpe4.prog_empty_i_i_7 
       (.I0(axis_prog_empty_thresh[5]),
        .I1(diff_pntr[5]),
        .I2(axis_prog_empty_thresh[4]),
        .I3(ltOp_carry_i_13_n_0),
        .I4(diff_pntr[4]),
        .O(\gpe4.prog_empty_i_i_7_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \gpe4.prog_empty_i_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\gpe4.prog_empty_i_i_1_n_0 ),
        .Q(axis_prog_empty),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(diff_pntr[0]),
        .R(\greg.ram_wr_en_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(diff_pntr[1]),
        .R(\greg.ram_wr_en_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(diff_pntr[2]),
        .R(\greg.ram_wr_en_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(diff_pntr[3]),
        .R(\greg.ram_wr_en_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[5] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp[5]),
        .Q(diff_pntr[4]),
        .R(\greg.ram_wr_en_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[6] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp[6]),
        .Q(diff_pntr[5]),
        .R(\greg.ram_wr_en_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[7] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp[7]),
        .Q(diff_pntr[6]),
        .R(\greg.ram_wr_en_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[8] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp[8]),
        .Q(diff_pntr[7]),
        .R(\greg.ram_wr_en_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[9] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp[9]),
        .Q(diff_pntr[8]),
        .R(\greg.ram_wr_en_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \greg.ram_rd_en_i_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(E),
        .Q(ram_rd_en_i),
        .R(\greg.ram_wr_en_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \greg.ram_wr_en_i_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(p_19_out),
        .Q(ram_wr_en_i),
        .R(\greg.ram_wr_en_i_reg_0 ));
  CARRY8 ltOp_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({NLW_ltOp_carry_CO_UNCONNECTED[7:5],ltOp,ltOp_carry_n_4,ltOp_carry_n_5,ltOp_carry_n_6,ltOp_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,ltOp_carry_i_1_n_0,ltOp_carry_i_2_n_0,ltOp_carry_i_3_n_0,ltOp_carry_i_4_n_0,ltOp_carry_i_5_n_0}),
        .O(NLW_ltOp_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,ltOp_carry_i_6_n_0,ltOp_carry_i_7_n_0,ltOp_carry_i_8_n_0,ltOp_carry_i_9_n_0,ltOp_carry_i_10_n_0}));
  LUT4 #(
    .INIT(16'h00E1)) 
    ltOp_carry_i_1
       (.I0(axis_prog_empty_thresh[7]),
        .I1(ltOp_carry_i_11_n_0),
        .I2(axis_prog_empty_thresh[8]),
        .I3(diff_pntr[8]),
        .O(ltOp_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h6006)) 
    ltOp_carry_i_10
       (.I0(diff_pntr[1]),
        .I1(axis_prog_empty_thresh[1]),
        .I2(axis_prog_empty_thresh[0]),
        .I3(diff_pntr[0]),
        .O(ltOp_carry_i_10_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    ltOp_carry_i_11
       (.I0(axis_prog_empty_thresh[6]),
        .I1(axis_prog_empty_thresh[4]),
        .I2(axis_prog_empty_thresh[1]),
        .I3(axis_prog_empty_thresh[2]),
        .I4(axis_prog_empty_thresh[3]),
        .I5(axis_prog_empty_thresh[5]),
        .O(ltOp_carry_i_11_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    ltOp_carry_i_12
       (.I0(axis_prog_empty_thresh[5]),
        .I1(axis_prog_empty_thresh[3]),
        .I2(axis_prog_empty_thresh[2]),
        .I3(axis_prog_empty_thresh[1]),
        .I4(axis_prog_empty_thresh[4]),
        .O(ltOp_carry_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    ltOp_carry_i_13
       (.I0(axis_prog_empty_thresh[3]),
        .I1(axis_prog_empty_thresh[2]),
        .I2(axis_prog_empty_thresh[1]),
        .O(ltOp_carry_i_13_n_0));
  LUT5 #(
    .INIT(32'h5401D543)) 
    ltOp_carry_i_2
       (.I0(diff_pntr[7]),
        .I1(axis_prog_empty_thresh[6]),
        .I2(ltOp_carry_i_12_n_0),
        .I3(axis_prog_empty_thresh[7]),
        .I4(diff_pntr[6]),
        .O(ltOp_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'h5401D543)) 
    ltOp_carry_i_3
       (.I0(diff_pntr[5]),
        .I1(axis_prog_empty_thresh[4]),
        .I2(ltOp_carry_i_13_n_0),
        .I3(axis_prog_empty_thresh[5]),
        .I4(diff_pntr[4]),
        .O(ltOp_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'h40FD0143)) 
    ltOp_carry_i_4
       (.I0(diff_pntr[2]),
        .I1(axis_prog_empty_thresh[2]),
        .I2(axis_prog_empty_thresh[1]),
        .I3(diff_pntr[3]),
        .I4(axis_prog_empty_thresh[3]),
        .O(ltOp_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h1171)) 
    ltOp_carry_i_5
       (.I0(diff_pntr[1]),
        .I1(axis_prog_empty_thresh[1]),
        .I2(axis_prog_empty_thresh[0]),
        .I3(diff_pntr[0]),
        .O(ltOp_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'hA956)) 
    ltOp_carry_i_6
       (.I0(diff_pntr[8]),
        .I1(axis_prog_empty_thresh[7]),
        .I2(ltOp_carry_i_11_n_0),
        .I3(axis_prog_empty_thresh[8]),
        .O(ltOp_carry_i_6_n_0));
  LUT5 #(
    .INIT(32'h90060990)) 
    ltOp_carry_i_7
       (.I0(axis_prog_empty_thresh[7]),
        .I1(diff_pntr[7]),
        .I2(axis_prog_empty_thresh[6]),
        .I3(ltOp_carry_i_12_n_0),
        .I4(diff_pntr[6]),
        .O(ltOp_carry_i_7_n_0));
  LUT5 #(
    .INIT(32'h94020294)) 
    ltOp_carry_i_8
       (.I0(diff_pntr[4]),
        .I1(ltOp_carry_i_13_n_0),
        .I2(axis_prog_empty_thresh[4]),
        .I3(diff_pntr[5]),
        .I4(axis_prog_empty_thresh[5]),
        .O(ltOp_carry_i_8_n_0));
  LUT5 #(
    .INIT(32'h94020294)) 
    ltOp_carry_i_9
       (.I0(diff_pntr[2]),
        .I1(axis_prog_empty_thresh[2]),
        .I2(axis_prog_empty_thresh[1]),
        .I3(axis_prog_empty_thresh[3]),
        .I4(diff_pntr[3]),
        .O(ltOp_carry_i_9_n_0));
  CARRY8 plusOp__0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({plusOp__0_carry_n_0,plusOp__0_carry_n_1,plusOp__0_carry_n_2,plusOp__0_carry_n_3,plusOp__0_carry_n_4,plusOp__0_carry_n_5,plusOp__0_carry_n_6,plusOp__0_carry_n_7}),
        .DI({DI,1'b0}),
        .O(plusOp[8:1]),
        .S(S));
  CARRY8 plusOp__0_carry__0
       (.CI(plusOp__0_carry_n_0),
        .CI_TOP(1'b0),
        .CO(NLW_plusOp__0_carry__0_CO_UNCONNECTED[7:0]),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp__0_carry__0_O_UNCONNECTED[7:1],plusOp[9]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\greg.gpcry_sym.diff_pntr_pad_reg[9]_0 }));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_status_flags_ss
   (out,
    \gmux.gm[1].gms.ms ,
    \gmux.gm[2].gms.ms ,
    \gmux.gm[3].gms.ms ,
    \gmux.gm[4].gms.ms ,
    ram_empty_i_reg_0,
    v1_reg_2,
    ram_empty_i_reg_1,
    s_aclk,
    E,
    ram_empty_i_reg_2,
    p_19_out);
  output out;
  input \gmux.gm[1].gms.ms ;
  input \gmux.gm[2].gms.ms ;
  input \gmux.gm[3].gms.ms ;
  input \gmux.gm[4].gms.ms ;
  input ram_empty_i_reg_0;
  input [3:0]v1_reg_2;
  input ram_empty_i_reg_1;
  input s_aclk;
  input [0:0]E;
  input ram_empty_i_reg_2;
  input p_19_out;

  wire [0:0]E;
  wire c2_n_0;
  wire comp0;
  wire \gmux.gm[1].gms.ms ;
  wire \gmux.gm[2].gms.ms ;
  wire \gmux.gm[3].gms.ms ;
  wire \gmux.gm[4].gms.ms ;
  wire p_19_out;
  (* DONT_TOUCH *) wire ram_empty_fb_i;
  (* DONT_TOUCH *) wire ram_empty_i;
  wire ram_empty_i_reg_0;
  wire ram_empty_i_reg_1;
  wire ram_empty_i_reg_2;
  wire s_aclk;
  wire [3:0]v1_reg_2;

  assign out = ram_empty_fb_i;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_compare_2 c1
       (.comp0(comp0),
        .\gmux.gm[1].gms.ms_0 (\gmux.gm[1].gms.ms ),
        .\gmux.gm[2].gms.ms_0 (\gmux.gm[2].gms.ms ),
        .\gmux.gm[3].gms.ms_0 (\gmux.gm[3].gms.ms ),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms ),
        .ram_empty_i_reg(ram_empty_i_reg_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_compare_3 c2
       (.E(E),
        .comp0(comp0),
        .out(ram_empty_fb_i),
        .p_19_out(p_19_out),
        .ram_empty_fb_i_reg(c2_n_0),
        .ram_empty_i_reg(ram_empty_i_reg_1),
        .ram_empty_i_reg_0(ram_empty_i_reg_2),
        .v1_reg_2(v1_reg_2));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(c2_n_0),
        .Q(ram_empty_fb_i),
        .R(1'b0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_empty_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(c2_n_0),
        .Q(ram_empty_i),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_reset_blk_ramfifo
   (wr_rst_busy,
    out,
    \grstd1.grst_full.grst_f.rst_d3_reg_0 ,
    Q,
    ENB_I,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_0 ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[1]_0 ,
    s_aclk,
    ram_full_i_reg,
    comp0,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    ENB_dly_D,
    s_aresetn);
  output wr_rst_busy;
  output out;
  output \grstd1.grst_full.grst_f.rst_d3_reg_0 ;
  output [1:0]Q;
  output ENB_I;
  output \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_0 ;
  output \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[1]_0 ;
  input s_aclk;
  input ram_full_i_reg;
  input comp0;
  input \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input ENB_dly_D;
  input s_aresetn;

  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire ENB_I;
  wire ENB_dly_D;
  wire [1:0]Q;
  wire comp0;
  wire dest_rst;
  wire \grstd1.grst_full.grst_f.rst_d3_i_1_n_0 ;
  wire \grstd1.grst_full.grst_f.rst_d3_reg_0 ;
  wire inverted_reset;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[1]_0 ;
  wire ram_full_i_reg;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d3;
  wire s_aclk;
  wire s_aresetn;
  wire [3:2]sckt_wr_rst_cc;
  wire wr_rst_busy_i;

  assign out = rst_d3;
  assign wr_rst_busy = wr_rst_busy_i;
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hABAA)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_1 
       (.I0(ENB_dly_D),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .O(ENB_I));
  LUT2 #(
    .INIT(4'hE)) 
    \gpf3f.prog_full_i_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(wr_rst_busy_i),
        .Q(rst_d1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d1),
        .Q(rst_d2),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hFE)) 
    \grstd1.grst_full.grst_f.rst_d3_i_1 
       (.I0(rst_d2),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(\grstd1.grst_full.grst_f.rst_d3_i_1_n_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\grstd1.grst_full.grst_f.rst_d3_i_1_n_0 ),
        .Q(rst_d3),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(dest_rst),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(Q[0]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(Q[1]),
        .Q(sckt_wr_rst_cc[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(sckt_wr_rst_cc[2]),
        .Q(sckt_wr_rst_cc[3]),
        .R(1'b0));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst \ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(s_aclk),
        .dest_rst(dest_rst),
        .src_rst(inverted_reset));
  LUT1 #(
    .INIT(2'h1)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst_i_1 
       (.I0(s_aresetn),
        .O(inverted_reset));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h1)) 
    ram_empty_fb_i_i_2
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0444)) 
    ram_full_fb_i_i_2
       (.I0(rst_d3),
        .I1(ram_full_i_reg),
        .I2(comp0),
        .I3(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\grstd1.grst_full.grst_f.rst_d3_reg_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    wr_rst_busy_i_inferred_i_1
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(sckt_wr_rst_cc[2]),
        .I3(sckt_wr_rst_cc[3]),
        .O(wr_rst_busy_i));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_bin_cntr
   (S,
    Q,
    \gcc0.gc1.gsym.count_reg[8]_0 ,
    DI,
    \gcc0.gc1.gsym.count_reg[7]_0 ,
    \gcc0.gc1.gsym.count_d1_reg[6]_0 ,
    \gcc0.gc1.gsym.count_d1_reg[8]_0 ,
    v1_reg,
    \gcc0.gc1.gsym.count_d2_reg[7]_0 ,
    \gcc0.gc1.gsym.count_d1_reg[7]_0 ,
    \gcc0.gc1.gsym.count_d1_reg[0]_0 ,
    E,
    \greg.gpcry_sym.diff_pntr_pad_reg[8] ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[9] ,
    out,
    s_axis_tvalid,
    \gmux.gm[3].gms.ms ,
    \gcc0.gc1.gsym.count_d1_reg[1]_0 ,
    s_aclk);
  output [1:0]S;
  output [8:0]Q;
  output \gcc0.gc1.gsym.count_reg[8]_0 ;
  output [6:0]DI;
  output [7:0]\gcc0.gc1.gsym.count_reg[7]_0 ;
  output [5:0]\gcc0.gc1.gsym.count_d1_reg[6]_0 ;
  output [8:0]\gcc0.gc1.gsym.count_d1_reg[8]_0 ;
  output [3:0]v1_reg;
  output [0:0]\gcc0.gc1.gsym.count_d2_reg[7]_0 ;
  output [0:0]\gcc0.gc1.gsym.count_d1_reg[7]_0 ;
  output [0:0]\gcc0.gc1.gsym.count_d1_reg[0]_0 ;
  input [0:0]E;
  input \greg.gpcry_sym.diff_pntr_pad_reg[8] ;
  input [8:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] ;
  input out;
  input s_axis_tvalid;
  input [7:0]\gmux.gm[3].gms.ms ;
  input \gcc0.gc1.gsym.count_d1_reg[1]_0 ;
  input s_aclk;

  wire [6:0]DI;
  wire [0:0]E;
  wire [8:0]Q;
  wire [1:0]S;
  wire \gcc0.gc1.gsym.count[8]_i_2_n_0 ;
  wire [0:0]\gcc0.gc1.gsym.count_d1_reg[0]_0 ;
  wire \gcc0.gc1.gsym.count_d1_reg[1]_0 ;
  wire [5:0]\gcc0.gc1.gsym.count_d1_reg[6]_0 ;
  wire [0:0]\gcc0.gc1.gsym.count_d1_reg[7]_0 ;
  wire [8:0]\gcc0.gc1.gsym.count_d1_reg[8]_0 ;
  wire [0:0]\gcc0.gc1.gsym.count_d2_reg[7]_0 ;
  wire [7:0]\gcc0.gc1.gsym.count_reg[7]_0 ;
  wire \gcc0.gc1.gsym.count_reg[8]_0 ;
  wire [8:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] ;
  wire [7:0]\gmux.gm[3].gms.ms ;
  wire \greg.gpcry_sym.diff_pntr_pad_reg[8] ;
  wire out;
  wire [8:0]plusOp__1;
  wire s_aclk;
  wire s_axis_tvalid;
  wire [3:0]v1_reg;
  wire [8:8]wr_pntr_plus2;

  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gcc0.gc1.gsym.count[0]_i_1 
       (.I0(\gcc0.gc1.gsym.count_reg[7]_0 [0]),
        .O(plusOp__1[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \gcc0.gc1.gsym.count[1]_i_1 
       (.I0(\gcc0.gc1.gsym.count_reg[7]_0 [0]),
        .I1(\gcc0.gc1.gsym.count_reg[7]_0 [1]),
        .O(plusOp__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \gcc0.gc1.gsym.count[2]_i_1 
       (.I0(\gcc0.gc1.gsym.count_reg[7]_0 [2]),
        .I1(\gcc0.gc1.gsym.count_reg[7]_0 [0]),
        .I2(\gcc0.gc1.gsym.count_reg[7]_0 [1]),
        .O(plusOp__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \gcc0.gc1.gsym.count[3]_i_1 
       (.I0(\gcc0.gc1.gsym.count_reg[7]_0 [3]),
        .I1(\gcc0.gc1.gsym.count_reg[7]_0 [1]),
        .I2(\gcc0.gc1.gsym.count_reg[7]_0 [0]),
        .I3(\gcc0.gc1.gsym.count_reg[7]_0 [2]),
        .O(plusOp__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \gcc0.gc1.gsym.count[4]_i_1 
       (.I0(\gcc0.gc1.gsym.count_reg[7]_0 [4]),
        .I1(\gcc0.gc1.gsym.count_reg[7]_0 [2]),
        .I2(\gcc0.gc1.gsym.count_reg[7]_0 [0]),
        .I3(\gcc0.gc1.gsym.count_reg[7]_0 [1]),
        .I4(\gcc0.gc1.gsym.count_reg[7]_0 [3]),
        .O(plusOp__1[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \gcc0.gc1.gsym.count[5]_i_1 
       (.I0(\gcc0.gc1.gsym.count_reg[7]_0 [5]),
        .I1(\gcc0.gc1.gsym.count_reg[7]_0 [3]),
        .I2(\gcc0.gc1.gsym.count_reg[7]_0 [1]),
        .I3(\gcc0.gc1.gsym.count_reg[7]_0 [0]),
        .I4(\gcc0.gc1.gsym.count_reg[7]_0 [2]),
        .I5(\gcc0.gc1.gsym.count_reg[7]_0 [4]),
        .O(plusOp__1[5]));
  LUT2 #(
    .INIT(4'h9)) 
    \gcc0.gc1.gsym.count[6]_i_1 
       (.I0(\gcc0.gc1.gsym.count[8]_i_2_n_0 ),
        .I1(\gcc0.gc1.gsym.count_reg[7]_0 [6]),
        .O(plusOp__1[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \gcc0.gc1.gsym.count[7]_i_1 
       (.I0(\gcc0.gc1.gsym.count_reg[7]_0 [7]),
        .I1(\gcc0.gc1.gsym.count[8]_i_2_n_0 ),
        .I2(\gcc0.gc1.gsym.count_reg[7]_0 [6]),
        .O(plusOp__1[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hA6AA)) 
    \gcc0.gc1.gsym.count[8]_i_1 
       (.I0(wr_pntr_plus2),
        .I1(\gcc0.gc1.gsym.count_reg[7]_0 [6]),
        .I2(\gcc0.gc1.gsym.count[8]_i_2_n_0 ),
        .I3(\gcc0.gc1.gsym.count_reg[7]_0 [7]),
        .O(plusOp__1[8]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \gcc0.gc1.gsym.count[8]_i_2 
       (.I0(\gcc0.gc1.gsym.count_reg[7]_0 [4]),
        .I1(\gcc0.gc1.gsym.count_reg[7]_0 [2]),
        .I2(\gcc0.gc1.gsym.count_reg[7]_0 [0]),
        .I3(\gcc0.gc1.gsym.count_reg[7]_0 [1]),
        .I4(\gcc0.gc1.gsym.count_reg[7]_0 [3]),
        .I5(\gcc0.gc1.gsym.count_reg[7]_0 [5]),
        .O(\gcc0.gc1.gsym.count[8]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gcc0.gc1.gsym.count_d1_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[7]_0 [0]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[8]_0 [0]),
        .S(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[7]_0 [1]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[8]_0 [1]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[7]_0 [2]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[8]_0 [2]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[7]_0 [3]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[8]_0 [3]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[7]_0 [4]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[8]_0 [4]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[7]_0 [5]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[8]_0 [5]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[7]_0 [6]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[8]_0 [6]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[7]_0 [7]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[8]_0 [7]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(wr_pntr_plus2),
        .Q(\gcc0.gc1.gsym.count_d1_reg[8]_0 [8]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[8]_0 [0]),
        .Q(Q[0]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[8]_0 [1]),
        .Q(Q[1]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[8]_0 [2]),
        .Q(Q[2]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[8]_0 [3]),
        .Q(Q[3]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[8]_0 [4]),
        .Q(Q[4]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[8]_0 [5]),
        .Q(Q[5]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[8]_0 [6]),
        .Q(Q[6]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[8]_0 [7]),
        .Q(Q[7]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[8]_0 [8]),
        .Q(Q[8]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__1[0]),
        .Q(\gcc0.gc1.gsym.count_reg[7]_0 [0]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gcc0.gc1.gsym.count_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__1[1]),
        .Q(\gcc0.gc1.gsym.count_reg[7]_0 [1]),
        .S(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__1[2]),
        .Q(\gcc0.gc1.gsym.count_reg[7]_0 [2]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__1[3]),
        .Q(\gcc0.gc1.gsym.count_reg[7]_0 [3]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__1[4]),
        .Q(\gcc0.gc1.gsym.count_reg[7]_0 [4]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__1[5]),
        .Q(\gcc0.gc1.gsym.count_reg[7]_0 [5]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__1[6]),
        .Q(\gcc0.gc1.gsym.count_reg[7]_0 [6]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__1[7]),
        .Q(\gcc0.gc1.gsym.count_reg[7]_0 [7]),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__1[8]),
        .Q(wr_pntr_plus2),
        .R(\gcc0.gc1.gsym.count_d1_reg[1]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__1 
       (.I0(Q[1]),
        .I1(\gmux.gm[3].gms.ms [1]),
        .I2(Q[0]),
        .I3(\gmux.gm[3].gms.ms [0]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__1 
       (.I0(Q[3]),
        .I1(\gmux.gm[3].gms.ms [3]),
        .I2(Q[2]),
        .I3(\gmux.gm[3].gms.ms [2]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__1 
       (.I0(Q[5]),
        .I1(\gmux.gm[3].gms.ms [5]),
        .I2(Q[4]),
        .I3(\gmux.gm[3].gms.ms [4]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__1 
       (.I0(Q[7]),
        .I1(\gmux.gm[3].gms.ms [7]),
        .I2(Q[6]),
        .I3(\gmux.gm[3].gms.ms [6]),
        .O(v1_reg[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__3 
       (.I0(wr_pntr_plus2),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [8]),
        .O(\gcc0.gc1.gsym.count_reg[8]_0 ));
  LUT4 #(
    .INIT(16'hD22D)) 
    plusOp__0_carry__0_i_1
       (.I0(Q[7]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [7]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [8]),
        .I3(Q[8]),
        .O(\gcc0.gc1.gsym.count_d2_reg[7]_0 ));
  LUT4 #(
    .INIT(16'hD22D)) 
    plusOp__0_carry__0_i_1__0
       (.I0(\gcc0.gc1.gsym.count_d1_reg[8]_0 [7]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [7]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [8]),
        .I3(\gcc0.gc1.gsym.count_d1_reg[8]_0 [8]),
        .O(\gcc0.gc1.gsym.count_d1_reg[7]_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_1
       (.I0(Q[6]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [6]),
        .O(DI[6]));
  LUT6 #(
    .INIT(64'h40F4BF0BBF0B40F4)) 
    plusOp__0_carry_i_14
       (.I0(E),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[8] ),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [0]),
        .I3(Q[0]),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [1]),
        .I5(Q[1]),
        .O(S[1]));
  LUT5 #(
    .INIT(32'h95996A66)) 
    plusOp__0_carry_i_15
       (.I0(Q[0]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[8] ),
        .I2(out),
        .I3(s_axis_tvalid),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [0]),
        .O(S[0]));
  LUT5 #(
    .INIT(32'hA9AA5655)) 
    plusOp__0_carry_i_15__0
       (.I0(\gcc0.gc1.gsym.count_d1_reg[8]_0 [0]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[8] ),
        .I2(out),
        .I3(s_axis_tvalid),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [0]),
        .O(\gcc0.gc1.gsym.count_d1_reg[0]_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_1__0
       (.I0(\gcc0.gc1.gsym.count_d1_reg[8]_0 [6]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [6]),
        .O(\gcc0.gc1.gsym.count_d1_reg[6]_0 [5]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_2
       (.I0(Q[5]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [5]),
        .O(DI[5]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_2__0
       (.I0(\gcc0.gc1.gsym.count_d1_reg[8]_0 [5]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [5]),
        .O(\gcc0.gc1.gsym.count_d1_reg[6]_0 [4]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_3
       (.I0(Q[4]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [4]),
        .O(DI[4]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_3__0
       (.I0(\gcc0.gc1.gsym.count_d1_reg[8]_0 [4]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [4]),
        .O(\gcc0.gc1.gsym.count_d1_reg[6]_0 [3]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_4
       (.I0(Q[3]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [3]),
        .O(DI[3]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_4__0
       (.I0(\gcc0.gc1.gsym.count_d1_reg[8]_0 [3]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [3]),
        .O(\gcc0.gc1.gsym.count_d1_reg[6]_0 [2]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_5
       (.I0(Q[2]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [2]),
        .O(DI[2]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_5__0
       (.I0(\gcc0.gc1.gsym.count_d1_reg[8]_0 [2]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [2]),
        .O(\gcc0.gc1.gsym.count_d1_reg[6]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_6
       (.I0(Q[1]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [1]),
        .O(DI[1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_6__0
       (.I0(\gcc0.gc1.gsym.count_d1_reg[8]_0 [1]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [1]),
        .O(\gcc0.gc1.gsym.count_d1_reg[6]_0 [0]));
  LUT5 #(
    .INIT(32'h2BBB2B2B)) 
    plusOp__0_carry_i_7
       (.I0(Q[0]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] [0]),
        .I2(\greg.gpcry_sym.diff_pntr_pad_reg[8] ),
        .I3(out),
        .I4(s_axis_tvalid),
        .O(DI[0]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_logic
   (comp0,
    out,
    \gaf.gaf1.ram_afull_fb_reg ,
    axis_prog_full,
    S,
    p_19_out,
    Q,
    \gcc0.gc1.gsym.count_reg[7] ,
    DI,
    \gcc0.gc1.gsym.count_d1_reg[8] ,
    v1_reg,
    \gcc0.gc1.gsym.count_d2_reg[7] ,
    s_axis_tready,
    v1_reg_0,
    v1_reg_1,
    v1_reg_2,
    s_aclk,
    \gcc0.gc1.gsym.count_d1_reg[1] ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ,
    ram_full_i_reg,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[9] ,
    ram_wr_en_i,
    ram_rd_en_i,
    s_axis_tvalid,
    ram_full_i_reg_0,
    \gaf.gaf1.ram_afull_fb_reg_0 ,
    axis_prog_full_thresh,
    \gmux.gm[3].gms.ms );
  output comp0;
  output out;
  output \gaf.gaf1.ram_afull_fb_reg ;
  output axis_prog_full;
  output [1:0]S;
  output p_19_out;
  output [8:0]Q;
  output [7:0]\gcc0.gc1.gsym.count_reg[7] ;
  output [6:0]DI;
  output [8:0]\gcc0.gc1.gsym.count_d1_reg[8] ;
  output [3:0]v1_reg;
  output [0:0]\gcc0.gc1.gsym.count_d2_reg[7] ;
  output s_axis_tready;
  input [4:0]v1_reg_0;
  input [4:0]v1_reg_1;
  input [3:0]v1_reg_2;
  input s_aclk;
  input \gcc0.gc1.gsym.count_d1_reg[1] ;
  input [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ;
  input [6:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ;
  input ram_full_i_reg;
  input [8:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] ;
  input ram_wr_en_i;
  input ram_rd_en_i;
  input s_axis_tvalid;
  input ram_full_i_reg_0;
  input \gaf.gaf1.ram_afull_fb_reg_0 ;
  input [8:0]axis_prog_full_thresh;
  input [7:0]\gmux.gm[3].gms.ms ;

  wire [6:0]DI;
  wire [8:0]Q;
  wire [1:0]S;
  wire axis_prog_full;
  wire [8:0]axis_prog_full_thresh;
  wire comp0;
  wire \gaf.gaf1.ram_afull_fb_reg ;
  wire \gaf.gaf1.ram_afull_fb_reg_0 ;
  wire \gcc0.gc1.gsym.count_d1_reg[1] ;
  wire [8:0]\gcc0.gc1.gsym.count_d1_reg[8] ;
  wire [0:0]\gcc0.gc1.gsym.count_d2_reg[7] ;
  wire [7:0]\gcc0.gc1.gsym.count_reg[7] ;
  wire [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ;
  wire [6:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ;
  wire [8:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] ;
  wire [7:0]\gmux.gm[3].gms.ms ;
  wire out;
  wire p_19_out;
  wire ram_full_i_reg;
  wire ram_full_i_reg_0;
  wire ram_rd_en_i;
  wire ram_wr_en_i;
  wire s_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [3:0]v1_reg;
  wire [4:0]v1_reg_0;
  wire [4:0]v1_reg_1;
  wire [3:0]v1_reg_2;
  wire wpntr_n_11;
  wire wpntr_n_27;
  wire wpntr_n_28;
  wire wpntr_n_29;
  wire wpntr_n_30;
  wire wpntr_n_31;
  wire wpntr_n_32;
  wire wpntr_n_47;
  wire wpntr_n_48;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_pf_ss \gwss.gpf.wrpf 
       (.DI({wpntr_n_27,wpntr_n_28,wpntr_n_29,wpntr_n_30,wpntr_n_31,wpntr_n_32,\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] }),
        .S({\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ,wpntr_n_48}),
        .axis_prog_full(axis_prog_full),
        .axis_prog_full_thresh(axis_prog_full_thresh),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[9]_0 (wpntr_n_47),
        .\gpf3f.prog_full_i_reg_0 (\gcc0.gc1.gsym.count_d1_reg[1] ),
        .\gpf3f.prog_full_i_reg_1 (\gaf.gaf1.ram_afull_fb_reg ),
        .\gpf3f.prog_full_i_reg_2 (\gaf.gaf1.ram_afull_fb_reg_0 ),
        .ram_rd_en_i(ram_rd_en_i),
        .ram_wr_en_i(ram_wr_en_i),
        .s_aclk(s_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_status_flags_ss \gwss.wsts 
       (.E(p_19_out),
        .comp0(comp0),
        .\gaf.gaf1.ram_afull_fb_reg_0 (\gaf.gaf1.ram_afull_fb_reg ),
        .\gaf.gaf1.ram_afull_fb_reg_1 (wpntr_n_11),
        .\gaf.gaf1.ram_afull_fb_reg_2 (\gcc0.gc1.gsym.count_d1_reg[1] ),
        .\gaf.gaf1.ram_afull_fb_reg_3 (\gaf.gaf1.ram_afull_fb_reg_0 ),
        .out(out),
        .ram_full_i_reg_0(ram_full_i_reg),
        .ram_full_i_reg_1(ram_full_i_reg_0),
        .s_aclk(s_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg_0(v1_reg_0),
        .v1_reg_1(v1_reg_1),
        .v1_reg_2(v1_reg_2));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_bin_cntr wpntr
       (.DI(DI),
        .E(p_19_out),
        .Q(Q),
        .S(S),
        .\gcc0.gc1.gsym.count_d1_reg[0]_0 (wpntr_n_48),
        .\gcc0.gc1.gsym.count_d1_reg[1]_0 (\gcc0.gc1.gsym.count_d1_reg[1] ),
        .\gcc0.gc1.gsym.count_d1_reg[6]_0 ({wpntr_n_27,wpntr_n_28,wpntr_n_29,wpntr_n_30,wpntr_n_31,wpntr_n_32}),
        .\gcc0.gc1.gsym.count_d1_reg[7]_0 (wpntr_n_47),
        .\gcc0.gc1.gsym.count_d1_reg[8]_0 (\gcc0.gc1.gsym.count_d1_reg[8] ),
        .\gcc0.gc1.gsym.count_d2_reg[7]_0 (\gcc0.gc1.gsym.count_d2_reg[7] ),
        .\gcc0.gc1.gsym.count_reg[7]_0 (\gcc0.gc1.gsym.count_reg[7] ),
        .\gcc0.gc1.gsym.count_reg[8]_0 (wpntr_n_11),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] (\gdiff.gcry_1_sym.diff_pntr_pad_reg[9] ),
        .\gmux.gm[3].gms.ms (\gmux.gm[3].gms.ms ),
        .\greg.gpcry_sym.diff_pntr_pad_reg[8] (ram_full_i_reg),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg(v1_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_pf_ss
   (axis_prog_full,
    DI,
    S,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[9]_0 ,
    \gpf3f.prog_full_i_reg_0 ,
    s_aclk,
    ram_wr_en_i,
    ram_rd_en_i,
    axis_prog_full_thresh,
    \gpf3f.prog_full_i_reg_1 ,
    \gpf3f.prog_full_i_reg_2 );
  output axis_prog_full;
  input [6:0]DI;
  input [7:0]S;
  input [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[9]_0 ;
  input \gpf3f.prog_full_i_reg_0 ;
  input s_aclk;
  input ram_wr_en_i;
  input ram_rd_en_i;
  input [8:0]axis_prog_full_thresh;
  input \gpf3f.prog_full_i_reg_1 ;
  input \gpf3f.prog_full_i_reg_2 ;

  wire [6:0]DI;
  wire [7:0]S;
  wire axis_prog_full;
  wire [8:0]axis_prog_full_thresh;
  wire [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[9]_0 ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[1] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[2] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[3] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[4] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[5] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[6] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[7] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[8] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[9] ;
  wire \gpf3f.prog_full_i_i_2_n_0 ;
  wire \gpf3f.prog_full_i_i_3_n_0 ;
  wire \gpf3f.prog_full_i_i_4_n_0 ;
  wire \gpf3f.prog_full_i_i_5_n_0 ;
  wire \gpf3f.prog_full_i_i_6_n_0 ;
  wire \gpf3f.prog_full_i_i_7_n_0 ;
  wire \gpf3f.prog_full_i_i_8_n_0 ;
  wire \gpf3f.prog_full_i_reg_0 ;
  wire \gpf3f.prog_full_i_reg_1 ;
  wire \gpf3f.prog_full_i_reg_2 ;
  wire gtOp;
  wire gtOp_carry_i_10_n_0;
  wire gtOp_carry_i_11_n_0;
  wire gtOp_carry_i_12_n_0;
  wire gtOp_carry_i_13_n_0;
  wire gtOp_carry_i_1_n_0;
  wire gtOp_carry_i_2_n_0;
  wire gtOp_carry_i_3_n_0;
  wire gtOp_carry_i_4_n_0;
  wire gtOp_carry_i_5_n_0;
  wire gtOp_carry_i_6_n_0;
  wire gtOp_carry_i_7_n_0;
  wire gtOp_carry_i_8_n_0;
  wire gtOp_carry_i_9_n_0;
  wire gtOp_carry_n_4;
  wire gtOp_carry_n_5;
  wire gtOp_carry_n_6;
  wire gtOp_carry_n_7;
  wire plusOp__0_carry__0_n_15;
  wire plusOp__0_carry_n_0;
  wire plusOp__0_carry_n_1;
  wire plusOp__0_carry_n_10;
  wire plusOp__0_carry_n_11;
  wire plusOp__0_carry_n_12;
  wire plusOp__0_carry_n_13;
  wire plusOp__0_carry_n_14;
  wire plusOp__0_carry_n_15;
  wire plusOp__0_carry_n_2;
  wire plusOp__0_carry_n_3;
  wire plusOp__0_carry_n_4;
  wire plusOp__0_carry_n_5;
  wire plusOp__0_carry_n_6;
  wire plusOp__0_carry_n_7;
  wire plusOp__0_carry_n_8;
  wire plusOp__0_carry_n_9;
  wire ram_rd_en_i;
  wire ram_wr_en_i;
  wire s_aclk;
  wire [7:5]NLW_gtOp_carry_CO_UNCONNECTED;
  wire [7:0]NLW_gtOp_carry_O_UNCONNECTED;
  wire [7:0]NLW_plusOp__0_carry__0_CO_UNCONNECTED;
  wire [7:1]NLW_plusOp__0_carry__0_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_15),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[1] ),
        .R(\gpf3f.prog_full_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_14),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[2] ),
        .R(\gpf3f.prog_full_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_13),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[3] ),
        .R(\gpf3f.prog_full_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_12),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[4] ),
        .R(\gpf3f.prog_full_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[5] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_11),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[5] ),
        .R(\gpf3f.prog_full_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[6] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_10),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[6] ),
        .R(\gpf3f.prog_full_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[7] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_9),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[7] ),
        .R(\gpf3f.prog_full_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[8] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_8),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[8] ),
        .R(\gpf3f.prog_full_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[9] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_15),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[9] ),
        .R(\gpf3f.prog_full_i_reg_0 ));
  LUT6 #(
    .INIT(64'h0B0B0B0B08080B08)) 
    \gpf3f.prog_full_i_i_2 
       (.I0(axis_prog_full),
        .I1(\gpf3f.prog_full_i_reg_1 ),
        .I2(\gpf3f.prog_full_i_reg_2 ),
        .I3(\gpf3f.prog_full_i_i_3_n_0 ),
        .I4(\gpf3f.prog_full_i_i_4_n_0 ),
        .I5(gtOp),
        .O(\gpf3f.prog_full_i_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h84422118)) 
    \gpf3f.prog_full_i_i_3 
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[7] ),
        .I1(axis_prog_full_thresh[7]),
        .I2(gtOp_carry_i_12_n_0),
        .I3(axis_prog_full_thresh[6]),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[8] ),
        .O(\gpf3f.prog_full_i_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEFEEFFFF)) 
    \gpf3f.prog_full_i_i_4 
       (.I0(\gpf3f.prog_full_i_i_5_n_0 ),
        .I1(\gpf3f.prog_full_i_i_6_n_0 ),
        .I2(ram_wr_en_i),
        .I3(ram_rd_en_i),
        .I4(\gpf3f.prog_full_i_i_7_n_0 ),
        .I5(\gpf3f.prog_full_i_i_8_n_0 ),
        .O(\gpf3f.prog_full_i_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h6FF9F66F)) 
    \gpf3f.prog_full_i_i_5 
       (.I0(axis_prog_full_thresh[5]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[6] ),
        .I2(axis_prog_full_thresh[4]),
        .I3(gtOp_carry_i_13_n_0),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[5] ),
        .O(\gpf3f.prog_full_i_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hF66F)) 
    \gpf3f.prog_full_i_i_6 
       (.I0(axis_prog_full_thresh[0]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[1] ),
        .I2(axis_prog_full_thresh[1]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[2] ),
        .O(\gpf3f.prog_full_i_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hE11E)) 
    \gpf3f.prog_full_i_i_7 
       (.I0(axis_prog_full_thresh[7]),
        .I1(gtOp_carry_i_11_n_0),
        .I2(axis_prog_full_thresh[8]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[9] ),
        .O(\gpf3f.prog_full_i_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h6FF9F66F)) 
    \gpf3f.prog_full_i_i_8 
       (.I0(axis_prog_full_thresh[3]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[4] ),
        .I2(axis_prog_full_thresh[1]),
        .I3(axis_prog_full_thresh[2]),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[3] ),
        .O(\gpf3f.prog_full_i_i_8_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gpf3f.prog_full_i_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\gpf3f.prog_full_i_i_2_n_0 ),
        .Q(axis_prog_full),
        .S(\gpf3f.prog_full_i_reg_0 ));
  CARRY8 gtOp_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({NLW_gtOp_carry_CO_UNCONNECTED[7:5],gtOp,gtOp_carry_n_4,gtOp_carry_n_5,gtOp_carry_n_6,gtOp_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,gtOp_carry_i_1_n_0,gtOp_carry_i_2_n_0,gtOp_carry_i_3_n_0,gtOp_carry_i_4_n_0,gtOp_carry_i_5_n_0}),
        .O(NLW_gtOp_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,gtOp_carry_i_6_n_0,gtOp_carry_i_7_n_0,gtOp_carry_i_8_n_0,gtOp_carry_i_9_n_0,gtOp_carry_i_10_n_0}));
  LUT4 #(
    .INIT(16'h02A8)) 
    gtOp_carry_i_1
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[9] ),
        .I1(axis_prog_full_thresh[7]),
        .I2(gtOp_carry_i_11_n_0),
        .I3(axis_prog_full_thresh[8]),
        .O(gtOp_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h6006)) 
    gtOp_carry_i_10
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[2] ),
        .I1(axis_prog_full_thresh[1]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[1] ),
        .I3(axis_prog_full_thresh[0]),
        .O(gtOp_carry_i_10_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    gtOp_carry_i_11
       (.I0(axis_prog_full_thresh[6]),
        .I1(axis_prog_full_thresh[4]),
        .I2(axis_prog_full_thresh[1]),
        .I3(axis_prog_full_thresh[2]),
        .I4(axis_prog_full_thresh[3]),
        .I5(axis_prog_full_thresh[5]),
        .O(gtOp_carry_i_11_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    gtOp_carry_i_12
       (.I0(axis_prog_full_thresh[5]),
        .I1(axis_prog_full_thresh[3]),
        .I2(axis_prog_full_thresh[2]),
        .I3(axis_prog_full_thresh[1]),
        .I4(axis_prog_full_thresh[4]),
        .O(gtOp_carry_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    gtOp_carry_i_13
       (.I0(axis_prog_full_thresh[3]),
        .I1(axis_prog_full_thresh[2]),
        .I2(axis_prog_full_thresh[1]),
        .O(gtOp_carry_i_13_n_0));
  LUT5 #(
    .INIT(32'h2ABC02A8)) 
    gtOp_carry_i_2
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[8] ),
        .I1(axis_prog_full_thresh[6]),
        .I2(gtOp_carry_i_12_n_0),
        .I3(axis_prog_full_thresh[7]),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[7] ),
        .O(gtOp_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'h2ABC02A8)) 
    gtOp_carry_i_3
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[6] ),
        .I1(axis_prog_full_thresh[4]),
        .I2(gtOp_carry_i_13_n_0),
        .I3(axis_prog_full_thresh[5]),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[5] ),
        .O(gtOp_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'h2ABC02A8)) 
    gtOp_carry_i_4
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[4] ),
        .I1(axis_prog_full_thresh[1]),
        .I2(axis_prog_full_thresh[2]),
        .I3(axis_prog_full_thresh[3]),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[3] ),
        .O(gtOp_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h88E8)) 
    gtOp_carry_i_5
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[2] ),
        .I1(axis_prog_full_thresh[1]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[1] ),
        .I3(axis_prog_full_thresh[0]),
        .O(gtOp_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'hE11E)) 
    gtOp_carry_i_6
       (.I0(axis_prog_full_thresh[7]),
        .I1(gtOp_carry_i_11_n_0),
        .I2(axis_prog_full_thresh[8]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[9] ),
        .O(gtOp_carry_i_6_n_0));
  LUT5 #(
    .INIT(32'h84422118)) 
    gtOp_carry_i_7
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[7] ),
        .I1(axis_prog_full_thresh[7]),
        .I2(gtOp_carry_i_12_n_0),
        .I3(axis_prog_full_thresh[6]),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[8] ),
        .O(gtOp_carry_i_7_n_0));
  LUT5 #(
    .INIT(32'h94020294)) 
    gtOp_carry_i_8
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[5] ),
        .I1(gtOp_carry_i_13_n_0),
        .I2(axis_prog_full_thresh[4]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[6] ),
        .I4(axis_prog_full_thresh[5]),
        .O(gtOp_carry_i_8_n_0));
  LUT5 #(
    .INIT(32'h94020294)) 
    gtOp_carry_i_9
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[3] ),
        .I1(axis_prog_full_thresh[2]),
        .I2(axis_prog_full_thresh[1]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[4] ),
        .I4(axis_prog_full_thresh[3]),
        .O(gtOp_carry_i_9_n_0));
  CARRY8 plusOp__0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({plusOp__0_carry_n_0,plusOp__0_carry_n_1,plusOp__0_carry_n_2,plusOp__0_carry_n_3,plusOp__0_carry_n_4,plusOp__0_carry_n_5,plusOp__0_carry_n_6,plusOp__0_carry_n_7}),
        .DI({DI,1'b0}),
        .O({plusOp__0_carry_n_8,plusOp__0_carry_n_9,plusOp__0_carry_n_10,plusOp__0_carry_n_11,plusOp__0_carry_n_12,plusOp__0_carry_n_13,plusOp__0_carry_n_14,plusOp__0_carry_n_15}),
        .S(S));
  CARRY8 plusOp__0_carry__0
       (.CI(plusOp__0_carry_n_0),
        .CI_TOP(1'b0),
        .CO(NLW_plusOp__0_carry__0_CO_UNCONNECTED[7:0]),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp__0_carry__0_O_UNCONNECTED[7:1],plusOp__0_carry__0_n_15}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gdiff.gcry_1_sym.diff_pntr_pad_reg[9]_0 }));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_status_flags_ss
   (comp0,
    out,
    \gaf.gaf1.ram_afull_fb_reg_0 ,
    E,
    s_axis_tready,
    v1_reg_0,
    v1_reg_1,
    v1_reg_2,
    \gaf.gaf1.ram_afull_fb_reg_1 ,
    s_aclk,
    \gaf.gaf1.ram_afull_fb_reg_2 ,
    ram_full_i_reg_0,
    s_axis_tvalid,
    ram_full_i_reg_1,
    \gaf.gaf1.ram_afull_fb_reg_3 );
  output comp0;
  output out;
  output \gaf.gaf1.ram_afull_fb_reg_0 ;
  output [0:0]E;
  output s_axis_tready;
  input [4:0]v1_reg_0;
  input [4:0]v1_reg_1;
  input [3:0]v1_reg_2;
  input \gaf.gaf1.ram_afull_fb_reg_1 ;
  input s_aclk;
  input \gaf.gaf1.ram_afull_fb_reg_2 ;
  input ram_full_i_reg_0;
  input s_axis_tvalid;
  input ram_full_i_reg_1;
  input \gaf.gaf1.ram_afull_fb_reg_3 ;

  wire [0:0]E;
  wire c1_n_0;
  wire comp0;
  wire \gaf.gaf1.ram_afull_fb_reg_1 ;
  wire \gaf.gaf1.ram_afull_fb_reg_2 ;
  wire \gaf.gaf1.ram_afull_fb_reg_3 ;
  wire p_0_in;
  wire p_2_out;
  (* DONT_TOUCH *) wire ram_afull_fb;
  (* DONT_TOUCH *) wire ram_afull_i;
  (* DONT_TOUCH *) wire ram_full_fb_i;
  (* DONT_TOUCH *) wire ram_full_i;
  wire ram_full_i_reg_0;
  wire ram_full_i_reg_1;
  wire s_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [4:0]v1_reg_0;
  wire [4:0]v1_reg_1;
  wire [3:0]v1_reg_2;

  assign \gaf.gaf1.ram_afull_fb_reg_0  = ram_afull_fb;
  assign out = ram_full_fb_i;
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_3 
       (.I0(s_axis_tvalid),
        .I1(ram_full_fb_i),
        .O(E));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_compare c0
       (.comp0(comp0),
        .v1_reg_0(v1_reg_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_compare_0 c1
       (.E(E),
        .\gaf.gaf1.ram_afull_fb_reg (ram_afull_fb),
        .\gaf.gaf1.ram_afull_fb_reg_0 (\gaf.gaf1.ram_afull_fb_reg_3 ),
        .out(ram_full_fb_i),
        .p_0_in(p_0_in),
        .p_2_out(p_2_out),
        .ram_full_fb_i_reg(c1_n_0),
        .ram_full_i_reg(ram_full_i_reg_0),
        .ram_full_i_reg_0(ram_full_i_reg_1),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg_1(v1_reg_1));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_compare_1 \gaf.c2 
       (.\gaf.gaf1.ram_afull_fb_reg (\gaf.gaf1.ram_afull_fb_reg_1 ),
        .p_0_in(p_0_in),
        .v1_reg_2(v1_reg_2));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    \gaf.gaf1.ram_afull_fb_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(p_2_out),
        .Q(ram_afull_fb),
        .S(\gaf.gaf1.ram_afull_fb_reg_2 ));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(ram_afull_i));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_full_fb_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(c1_n_0),
        .Q(ram_full_fb_i),
        .R(1'b0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_full_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(c1_n_0),
        .Q(ram_full_i),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    s_axis_tready_INST_0
       (.I0(ram_full_i),
        .O(s_axis_tready));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
