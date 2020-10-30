# This is the first tcl file for the pedestal subtraction block in HLS
#
######################################################################
# Project settings

# Create a project
open_project	-reset ped_sub_prj

# Source file and test bench
add_files		functions.cpp
add_files -tb 		pedsub_test.cpp

# Specify the top-level function for synthesis
set_top			ped_alg

############################
# Solution settings

open_solution -reset solution1

# Xilinx device and lock period
# - Not specifying uncertainty, leave to default
# (12.5% of clock period)

set_part {xczu9eg-ffvb1156-2-e}
create_clock -period "250MHz"

# Simulate the C code
csim_design

exit
