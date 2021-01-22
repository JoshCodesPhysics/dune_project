// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Jan 21 16:29:27 2021
// Host        : heplnw061.pp.rl.ac.uk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ axis_register_slice_fr_sim_netlist.v
// Design      : axis_register_slice_fr
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "axis_register_slice_fr,axis_register_slice_v1_1_18_axis_register_slice,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axis_register_slice_v1_1_18_axis_register_slice,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (aclk,
    aresetn,
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
    m_axis_tuser);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [15:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *) input [1:0]s_axis_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) input [0:0]s_axis_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output [15:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TKEEP" *) output [1:0]m_axis_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output m_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) output [0:0]m_axis_tuser;

  wire aclk;
  wire aresetn;
  wire [15:0]m_axis_tdata;
  wire [1:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [0:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire [15:0]s_axis_tdata;
  wire [1:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [0:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire [0:0]NLW_inst_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tid_UNCONNECTED;
  wire [1:0]NLW_inst_m_axis_tstrb_UNCONNECTED;

  (* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000010011011" *) 
  (* C_AXIS_TDATA_WIDTH = "16" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "1" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_NUM_SLR_CROSSINGS = "0" *) 
  (* C_PIPELINES_MASTER = "0" *) 
  (* C_PIPELINES_MIDDLE = "0" *) 
  (* C_PIPELINES_SLAVE = "0" *) 
  (* C_REG_CONFIG = "8" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* G_INDX_SS_TDATA = "1" *) 
  (* G_INDX_SS_TDEST = "6" *) 
  (* G_INDX_SS_TID = "5" *) 
  (* G_INDX_SS_TKEEP = "3" *) 
  (* G_INDX_SS_TLAST = "4" *) 
  (* G_INDX_SS_TREADY = "0" *) 
  (* G_INDX_SS_TSTRB = "2" *) 
  (* G_INDX_SS_TUSER = "7" *) 
  (* G_MASK_SS_TDATA = "2" *) 
  (* G_MASK_SS_TDEST = "64" *) 
  (* G_MASK_SS_TID = "32" *) 
  (* G_MASK_SS_TKEEP = "8" *) 
  (* G_MASK_SS_TLAST = "16" *) 
  (* G_MASK_SS_TREADY = "1" *) 
  (* G_MASK_SS_TSTRB = "4" *) 
  (* G_MASK_SS_TUSER = "128" *) 
  (* G_TASK_SEVERITY_ERR = "2" *) 
  (* G_TASK_SEVERITY_INFO = "0" *) 
  (* G_TASK_SEVERITY_WARNING = "1" *) 
  (* P_TPAYLOAD_WIDTH = "20" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_register_slice_v1_1_18_axis_register_slice inst
       (.aclk(aclk),
        .aclk2x(1'b0),
        .aclken(1'b1),
        .aresetn(aresetn),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_inst_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_inst_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(NLW_inst_m_axis_tstrb_UNCONNECTED[1:0]),
        .m_axis_tuser(m_axis_tuser),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({1'b1,1'b1}),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000010011011" *) (* C_AXIS_TDATA_WIDTH = "16" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TUSER_WIDTH = "1" *) (* C_FAMILY = "zynquplus" *) 
(* C_NUM_SLR_CROSSINGS = "0" *) (* C_PIPELINES_MASTER = "0" *) (* C_PIPELINES_MIDDLE = "0" *) 
(* C_PIPELINES_SLAVE = "0" *) (* C_REG_CONFIG = "8" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* G_INDX_SS_TDATA = "1" *) (* G_INDX_SS_TDEST = "6" *) (* G_INDX_SS_TID = "5" *) 
(* G_INDX_SS_TKEEP = "3" *) (* G_INDX_SS_TLAST = "4" *) (* G_INDX_SS_TREADY = "0" *) 
(* G_INDX_SS_TSTRB = "2" *) (* G_INDX_SS_TUSER = "7" *) (* G_MASK_SS_TDATA = "2" *) 
(* G_MASK_SS_TDEST = "64" *) (* G_MASK_SS_TID = "32" *) (* G_MASK_SS_TKEEP = "8" *) 
(* G_MASK_SS_TLAST = "16" *) (* G_MASK_SS_TREADY = "1" *) (* G_MASK_SS_TSTRB = "4" *) 
(* G_MASK_SS_TUSER = "128" *) (* G_TASK_SEVERITY_ERR = "2" *) (* G_TASK_SEVERITY_INFO = "0" *) 
(* G_TASK_SEVERITY_WARNING = "1" *) (* P_TPAYLOAD_WIDTH = "20" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_register_slice_v1_1_18_axis_register_slice
   (aclk,
    aclk2x,
    aresetn,
    aclken,
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
    m_axis_tuser);
  input aclk;
  input aclk2x;
  input aresetn;
  input aclken;
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

  wire \<const0> ;
  wire aclk;
  wire aclken;
  wire areset_r;
  wire areset_r_i_1_n_0;
  wire aresetn;
  wire [15:0]m_axis_tdata;
  wire [1:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [0:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire [15:0]s_axis_tdata;
  wire [1:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [0:0]s_axis_tuser;
  wire s_axis_tvalid;

  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tstrb[1] = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  LUT1 #(
    .INIT(2'h1)) 
    areset_r_i_1
       (.I0(aresetn),
        .O(areset_r_i_1_n_0));
  FDRE areset_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(areset_r_i_1_n_0),
        .Q(areset_r),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_register_slice_v1_1_18_axisc_register_slice axisc_register_slice_0
       (.D(areset_r),
        .Q(m_axis_tvalid),
        .aclk(aclk),
        .aclken(aclken),
        .m_axis_tready(m_axis_tready),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .\storage_data1_reg[19]_0 ({m_axis_tuser,m_axis_tlast,m_axis_tkeep,m_axis_tdata}),
        .\storage_data2_reg[19]_0 ({s_axis_tuser,s_axis_tlast,s_axis_tkeep,s_axis_tdata}));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_register_slice_v1_1_18_axisc_register_slice
   (s_axis_tready,
    Q,
    \storage_data1_reg[19]_0 ,
    aclk,
    m_axis_tready,
    aclken,
    D,
    \storage_data2_reg[19]_0 ,
    s_axis_tvalid);
  output s_axis_tready;
  output [0:0]Q;
  output [19:0]\storage_data1_reg[19]_0 ;
  input aclk;
  input m_axis_tready;
  input aclken;
  input [0:0]D;
  input [19:0]\storage_data2_reg[19]_0 ;
  input s_axis_tvalid;

  wire [0:0]D;
  wire [0:0]Q;
  wire aclk;
  wire aclken;
  wire [1:0]areset_d;
  wire m_axis_tready;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire s_ready_i0;
  wire s_ready_i_i_1_n_0;
  wire s_ready_i_i_3_n_0;
  wire s_ready_i_i_4_n_0;
  wire [1:0]state;
  wire \state[0]_i_1_n_0 ;
  wire \state[0]_i_2_n_0 ;
  wire \state[0]_i_4_n_0 ;
  wire \state_reg_n_0_[1] ;
  wire storage_data1;
  wire \storage_data1[0]_i_1_n_0 ;
  wire \storage_data1[10]_i_1_n_0 ;
  wire \storage_data1[11]_i_1_n_0 ;
  wire \storage_data1[12]_i_1_n_0 ;
  wire \storage_data1[13]_i_1_n_0 ;
  wire \storage_data1[14]_i_1_n_0 ;
  wire \storage_data1[15]_i_2_n_0 ;
  wire \storage_data1[16]_i_1_n_0 ;
  wire \storage_data1[17]_i_1_n_0 ;
  wire \storage_data1[18]_i_1_n_0 ;
  wire \storage_data1[19]_i_1_n_0 ;
  wire \storage_data1[1]_i_1_n_0 ;
  wire \storage_data1[2]_i_1_n_0 ;
  wire \storage_data1[3]_i_1_n_0 ;
  wire \storage_data1[4]_i_1_n_0 ;
  wire \storage_data1[5]_i_1_n_0 ;
  wire \storage_data1[6]_i_1_n_0 ;
  wire \storage_data1[7]_i_1_n_0 ;
  wire \storage_data1[8]_i_1_n_0 ;
  wire \storage_data1[9]_i_1_n_0 ;
  wire [19:0]\storage_data1_reg[19]_0 ;
  wire [19:0]storage_data2;
  wire storage_data2_0;
  wire [19:0]\storage_data2_reg[19]_0 ;

  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \areset_d_reg[0] 
       (.C(aclk),
        .CE(aclken),
        .D(D),
        .Q(areset_d[0]),
        .R(1'b0));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \areset_d_reg[1] 
       (.C(aclk),
        .CE(aclken),
        .D(areset_d[0]),
        .Q(areset_d[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000FEEE0222)) 
    s_ready_i_i_1
       (.I0(s_axis_tready),
        .I1(s_ready_i0),
        .I2(s_ready_i_i_3_n_0),
        .I3(Q),
        .I4(s_ready_i_i_4_n_0),
        .I5(D),
        .O(s_ready_i_i_1_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    s_ready_i_i_2
       (.I0(areset_d[0]),
        .I1(areset_d[1]),
        .I2(aclken),
        .O(s_ready_i0));
  LUT6 #(
    .INIT(64'h00040000000A0000)) 
    s_ready_i_i_3
       (.I0(m_axis_tready),
        .I1(s_axis_tvalid),
        .I2(areset_d[1]),
        .I3(areset_d[0]),
        .I4(aclken),
        .I5(\state_reg_n_0_[1] ),
        .O(s_ready_i_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h4444F444)) 
    s_ready_i_i_4
       (.I0(\state_reg_n_0_[1] ),
        .I1(m_axis_tready),
        .I2(aclken),
        .I3(areset_d[1]),
        .I4(areset_d[0]),
        .O(s_ready_i_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_ready_i_i_1_n_0),
        .Q(s_axis_tready),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFF08)) 
    \state[0]_i_1 
       (.I0(aclken),
        .I1(areset_d[1]),
        .I2(areset_d[0]),
        .I3(D),
        .O(\state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h78BB0000)) 
    \state[0]_i_2 
       (.I0(m_axis_tready),
        .I1(Q),
        .I2(s_axis_tvalid),
        .I3(\state_reg_n_0_[1] ),
        .I4(\state[0]_i_4_n_0 ),
        .O(\state[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h7088)) 
    \state[0]_i_3 
       (.I0(m_axis_tready),
        .I1(Q),
        .I2(s_axis_tvalid),
        .I3(\state_reg_n_0_[1] ),
        .O(state[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \state[0]_i_4 
       (.I0(areset_d[1]),
        .I1(areset_d[0]),
        .I2(aclken),
        .O(\state[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hBCBB)) 
    \state[1]_i_1 
       (.I0(m_axis_tready),
        .I1(Q),
        .I2(s_axis_tvalid),
        .I3(\state_reg_n_0_[1] ),
        .O(state[1]));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(aclk),
        .CE(\state[0]_i_2_n_0 ),
        .D(state[0]),
        .Q(Q),
        .R(\state[0]_i_1_n_0 ));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \state_reg[1] 
       (.C(aclk),
        .CE(\state[0]_i_2_n_0 ),
        .D(state[1]),
        .Q(\state_reg_n_0_[1] ),
        .S(\state[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[0]_i_1 
       (.I0(storage_data2[0]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [0]),
        .O(\storage_data1[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[10]_i_1 
       (.I0(storage_data2[10]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [10]),
        .O(\storage_data1[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[11]_i_1 
       (.I0(storage_data2[11]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [11]),
        .O(\storage_data1[11]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF40)) 
    \storage_data1[12]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(storage_data2[12]),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [12]),
        .O(\storage_data1[12]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF40)) 
    \storage_data1[13]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(storage_data2[13]),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [13]),
        .O(\storage_data1[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF40)) 
    \storage_data1[14]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(storage_data2[14]),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [14]),
        .O(\storage_data1[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB0008800)) 
    \storage_data1[15]_i_1 
       (.I0(m_axis_tready),
        .I1(Q),
        .I2(s_axis_tvalid),
        .I3(aclken),
        .I4(\state_reg_n_0_[1] ),
        .O(storage_data1));
  LUT4 #(
    .INIT(16'hEF40)) 
    \storage_data1[15]_i_2 
       (.I0(\state_reg_n_0_[1] ),
        .I1(storage_data2[15]),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [15]),
        .O(\storage_data1[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hEF40)) 
    \storage_data1[16]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(storage_data2[16]),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [16]),
        .O(\storage_data1[16]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF40)) 
    \storage_data1[17]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(storage_data2[17]),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [17]),
        .O(\storage_data1[17]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF40)) 
    \storage_data1[18]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(storage_data2[18]),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [18]),
        .O(\storage_data1[18]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF40)) 
    \storage_data1[19]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(storage_data2[19]),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [19]),
        .O(\storage_data1[19]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[1]_i_1 
       (.I0(storage_data2[1]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [1]),
        .O(\storage_data1[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[2]_i_1 
       (.I0(storage_data2[2]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [2]),
        .O(\storage_data1[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[3]_i_1 
       (.I0(storage_data2[3]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [3]),
        .O(\storage_data1[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[4]_i_1 
       (.I0(storage_data2[4]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [4]),
        .O(\storage_data1[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[5]_i_1 
       (.I0(storage_data2[5]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [5]),
        .O(\storage_data1[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[6]_i_1 
       (.I0(storage_data2[6]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [6]),
        .O(\storage_data1[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[7]_i_1 
       (.I0(storage_data2[7]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [7]),
        .O(\storage_data1[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[8]_i_1 
       (.I0(storage_data2[8]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [8]),
        .O(\storage_data1[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEF20)) 
    \storage_data1[9]_i_1 
       (.I0(storage_data2[9]),
        .I1(\state_reg_n_0_[1] ),
        .I2(Q),
        .I3(\storage_data2_reg[19]_0 [9]),
        .O(\storage_data1[9]_i_1_n_0 ));
  FDRE \storage_data1_reg[0] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[0]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [0]),
        .R(1'b0));
  FDRE \storage_data1_reg[10] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[10]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [10]),
        .R(1'b0));
  FDRE \storage_data1_reg[11] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[11]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [11]),
        .R(1'b0));
  FDRE \storage_data1_reg[12] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[12]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [12]),
        .R(1'b0));
  FDRE \storage_data1_reg[13] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[13]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [13]),
        .R(1'b0));
  FDRE \storage_data1_reg[14] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[14]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [14]),
        .R(1'b0));
  FDRE \storage_data1_reg[15] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[15]_i_2_n_0 ),
        .Q(\storage_data1_reg[19]_0 [15]),
        .R(1'b0));
  FDRE \storage_data1_reg[16] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[16]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [16]),
        .R(1'b0));
  FDRE \storage_data1_reg[17] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[17]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [17]),
        .R(1'b0));
  FDRE \storage_data1_reg[18] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[18]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [18]),
        .R(1'b0));
  FDRE \storage_data1_reg[19] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[19]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [19]),
        .R(1'b0));
  FDRE \storage_data1_reg[1] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[1]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [1]),
        .R(1'b0));
  FDRE \storage_data1_reg[2] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[2]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [2]),
        .R(1'b0));
  FDRE \storage_data1_reg[3] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[3]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [3]),
        .R(1'b0));
  FDRE \storage_data1_reg[4] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[4]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [4]),
        .R(1'b0));
  FDRE \storage_data1_reg[5] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[5]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [5]),
        .R(1'b0));
  FDRE \storage_data1_reg[6] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[6]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [6]),
        .R(1'b0));
  FDRE \storage_data1_reg[7] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[7]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [7]),
        .R(1'b0));
  FDRE \storage_data1_reg[8] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[8]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [8]),
        .R(1'b0));
  FDRE \storage_data1_reg[9] 
       (.C(aclk),
        .CE(storage_data1),
        .D(\storage_data1[9]_i_1_n_0 ),
        .Q(\storage_data1_reg[19]_0 [9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h80)) 
    \storage_data2[19]_i_1 
       (.I0(s_axis_tvalid),
        .I1(aclken),
        .I2(s_axis_tready),
        .O(storage_data2_0));
  FDRE \storage_data2_reg[0] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [0]),
        .Q(storage_data2[0]),
        .R(1'b0));
  FDRE \storage_data2_reg[10] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [10]),
        .Q(storage_data2[10]),
        .R(1'b0));
  FDRE \storage_data2_reg[11] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [11]),
        .Q(storage_data2[11]),
        .R(1'b0));
  FDRE \storage_data2_reg[12] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [12]),
        .Q(storage_data2[12]),
        .R(1'b0));
  FDRE \storage_data2_reg[13] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [13]),
        .Q(storage_data2[13]),
        .R(1'b0));
  FDRE \storage_data2_reg[14] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [14]),
        .Q(storage_data2[14]),
        .R(1'b0));
  FDRE \storage_data2_reg[15] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [15]),
        .Q(storage_data2[15]),
        .R(1'b0));
  FDRE \storage_data2_reg[16] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [16]),
        .Q(storage_data2[16]),
        .R(1'b0));
  FDRE \storage_data2_reg[17] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [17]),
        .Q(storage_data2[17]),
        .R(1'b0));
  FDRE \storage_data2_reg[18] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [18]),
        .Q(storage_data2[18]),
        .R(1'b0));
  FDRE \storage_data2_reg[19] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [19]),
        .Q(storage_data2[19]),
        .R(1'b0));
  FDRE \storage_data2_reg[1] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [1]),
        .Q(storage_data2[1]),
        .R(1'b0));
  FDRE \storage_data2_reg[2] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [2]),
        .Q(storage_data2[2]),
        .R(1'b0));
  FDRE \storage_data2_reg[3] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [3]),
        .Q(storage_data2[3]),
        .R(1'b0));
  FDRE \storage_data2_reg[4] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [4]),
        .Q(storage_data2[4]),
        .R(1'b0));
  FDRE \storage_data2_reg[5] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [5]),
        .Q(storage_data2[5]),
        .R(1'b0));
  FDRE \storage_data2_reg[6] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [6]),
        .Q(storage_data2[6]),
        .R(1'b0));
  FDRE \storage_data2_reg[7] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [7]),
        .Q(storage_data2[7]),
        .R(1'b0));
  FDRE \storage_data2_reg[8] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [8]),
        .Q(storage_data2[8]),
        .R(1'b0));
  FDRE \storage_data2_reg[9] 
       (.C(aclk),
        .CE(storage_data2_0),
        .D(\storage_data2_reg[19]_0 [9]),
        .Q(storage_data2[9]),
        .R(1'b0));
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
