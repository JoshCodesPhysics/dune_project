############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_latency -min 2 "ped_alg/accumulator_condition"
set_directive_latency -min 2 "ped_alg/pedestal_condition"
set_directive_latency -min 1 "ped_alg/ped_sub"
set_directive_latency -min 2 "ped_alg/ped_subtraction"
set_directive_interface -mode ap_memory "array_scan" ADC_stored
set_directive_interface -mode ap_memory "array_scan" tvalid_stored
set_directive_interface -mode ap_memory "array_scan" tlast_user_stored
set_directive_interface -mode ap_memory "array_scan" tkeep_stored
set_directive_interface -mode ap_memory "array_scan" ped_array
set_directive_interface -mode ap_memory "array_scan" ADC_array
set_directive_interface -mode ap_memory "array_scan" accum_array
