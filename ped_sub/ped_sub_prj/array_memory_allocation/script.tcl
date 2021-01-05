############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project ped_sub_prj
set_top ped_alg
add_files functions.h
add_files functions.cpp
add_files -tb pedsub_test2.cpp -cflags "-Wno-unknown-pragmas"
open_solution "array_memory_allocation"
set_part {xczu9eg-ffvb1156-2-e}
create_clock -period 250MHz -name default
config_export -format ip_catalog -rtl vhdl
source "./ped_sub_prj/array_memory_allocation/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -rtl vhdl -format ip_catalog
