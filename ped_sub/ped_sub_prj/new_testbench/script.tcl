############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project ped_sub_prj
set_top ped_alg
add_files functions.cpp
add_files functions.h
add_files -tb pedsub_test2.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "new_testbench"
set_part {xczu9eg-ffvb1156-2-e}
create_clock -period 250MHz -name default
source "./ped_sub_prj/new_testbench/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -format ip_catalog
