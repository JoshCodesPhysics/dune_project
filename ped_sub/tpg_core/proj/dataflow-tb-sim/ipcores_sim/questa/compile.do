vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/xbip_utils_v3_0_9
vlib questa_lib/msim/axi_utils_v2_0_5
vlib questa_lib/msim/fir_compiler_v7_2_11
vlib questa_lib/msim/dist_mem_gen_v8_0_12
vlib questa_lib/msim/blk_mem_gen_v8_4_2
vlib questa_lib/msim/axis_infrastructure_v1_1_0
vlib questa_lib/msim/axis_register_slice_v1_1_18

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap xbip_utils_v3_0_9 questa_lib/msim/xbip_utils_v3_0_9
vmap axi_utils_v2_0_5 questa_lib/msim/axi_utils_v2_0_5
vmap fir_compiler_v7_2_11 questa_lib/msim/fir_compiler_v7_2_11
vmap dist_mem_gen_v8_0_12 questa_lib/msim/dist_mem_gen_v8_0_12
vmap blk_mem_gen_v8_4_2 questa_lib/msim/blk_mem_gen_v8_4_2
vmap axis_infrastructure_v1_1_0 questa_lib/msim/axis_infrastructure_v1_1_0
vmap axis_register_slice_v1_1_18 questa_lib/msim/axis_register_slice_v1_1_18

vlog -work xil_defaultlib -64 -sv "+incdir+../../hdl" \
"/opt/ppd/tools/xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/ppd/tools/xilinx/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/ppd/tools/xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/ppd/tools/xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_9 -64 -93 \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/fir_compiler_0/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_5 -64 -93 \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/fir_compiler_0/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work fir_compiler_v7_2_11 -64 -93 \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/fir_compiler_0/hdl/fir_compiler_v7_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/fir_compiler_0/sim/fir_compiler_0.vhd" \

vlog -work dist_mem_gen_v8_0_12 -64 "+incdir+../../hdl" \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/Median_distRAM_64x12/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib -64 "+incdir+../../hdl" \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/Median_distRAM_64x12/sim/Median_distRAM_64x12.v" \

vlog -work dist_mem_gen_v8_0_12 -64 "+incdir+../../hdl" \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/distRAM_64x12/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib -64 "+incdir+../../hdl" \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/distRAM_64x12/sim/distRAM_64x12.v" \

vlog -work blk_mem_gen_v8_4_2 -64 "+incdir+../../hdl" \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/RAM_2048x12/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+../../hdl" \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/RAM_2048x12/sim/RAM_2048x12.v" \

vlog -work axis_infrastructure_v1_1_0 -64 "+incdir+../../hdl" \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/axis_register_slice_fr/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_register_slice_v1_1_18 -64 "+incdir+../../hdl" \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/axis_register_slice_fr/hdl/axis_register_slice_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../hdl" \
"../../ipcores_proj/ipcores_proj.srcs/sources_1/ip/axis_register_slice_fr/sim/axis_register_slice_fr.v" \

vlog -work xil_defaultlib \
"glbl.v"

