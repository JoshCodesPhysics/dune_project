#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("ped_val_i", 16, hls_in, 0, "ap_ovld", "in_data", 1),
	Port_Property("ped_val_o", 16, hls_out, 0, "ap_ovld", "out_data", 1),
	Port_Property("ped_val_o_ap_vld", 1, hls_out, 0, "ap_ovld", "out_vld", 1),
	Port_Property("accum_i", 8, hls_in, 1, "ap_ovld", "in_data", 1),
	Port_Property("accum_o", 8, hls_out, 1, "ap_ovld", "out_data", 1),
	Port_Property("accum_o_ap_vld", 1, hls_out, 1, "ap_ovld", "out_vld", 1),
	Port_Property("ADC", 16, hls_out, 2, "ap_vld", "out_data", 1),
	Port_Property("ADC_ap_vld", 1, hls_out, 2, "ap_vld", "out_vld", 1),
	Port_Property("tdata", 16, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("tvalid", 1, hls_in, 4, "ap_none", "in_data", 1),
	Port_Property("tkeep0", 1, hls_in, 5, "ap_none", "in_data", 1),
	Port_Property("tkeep1", 1, hls_in, 6, "ap_none", "in_data", 1),
	Port_Property("tready", 1, hls_in, 7, "ap_none", "in_data", 1),
};
const char* HLS_Design_Meta::dut_name = "ped_alg";
