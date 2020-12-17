# ==============================================================
# File generated on Thu Dec 17 13:38:32 GMT 2020
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files -tb ../../pedsub_test2.cpp -cflags { -Wno-unknown-pragmas}
add_files functions.cpp
add_files functions.h
set_part xczu9eg-ffvb1156-2-e
create_clock -name default -period 250MHz
set_directive_latency ped_alg/accumulator_condition -min 2
set_directive_latency ped_alg/pedestal_condition -min 2
set_directive_latency ped_alg/ped_sub -min 1
set_directive_latency ped_alg/ped_subtraction -min 2
set_directive_interface array_scan 
set_directive_interface array_scan 
set_directive_interface array_scan 
set_directive_interface array_scan 
set_directive_interface array_scan 
set_directive_interface array_scan 
set_directive_interface array_scan 
