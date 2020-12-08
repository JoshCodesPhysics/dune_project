#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/opt/ppd/tools/xilinx/SDK/2018.3/bin:/opt/ppd/tools/xilinx/Vivado/2018.3/ids_lite/ISE/bin/lin64:/opt/ppd/tools/xilinx/Vivado/2018.3/bin
else
  PATH=/opt/ppd/tools/xilinx/SDK/2018.3/bin:/opt/ppd/tools/xilinx/Vivado/2018.3/ids_lite/ISE/bin/lin64:/opt/ppd/tools/xilinx/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/opt/ppd/tools/xilinx/Vivado/2018.3/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/opt/ppd/tools/xilinx/Vivado/2018.3/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/net/home/ppd/hmo31799/Documents/dune_project/ped_sub/tpg_core/proj/dataflowZCU102/dataflowZCU102/dataflowZCU102.runs/temac_gbe_v9_0_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log temac_gbe_v9_0.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source temac_gbe_v9_0.tcl
