-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Thu Jan 21 16:42:54 2021
-- Host        : heplnw061.pp.rl.ac.uk running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /data2/hmo31799/dune_project/ped_sub/tpg_core/proj/dataflowZCU102/dataflowZCU102/dataflowZCU102.srcs/sources_1/ip/Median_distRAM_64x12/Median_distRAM_64x12_stub.vhdl
-- Design      : Median_distRAM_64x12
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu9eg-ffvb1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Median_distRAM_64x12 is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 5 downto 0 );
    d : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 5 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    qdpo : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );

end Median_distRAM_64x12;

architecture stub of Median_distRAM_64x12 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[5:0],d[11:0],dpra[5:0],clk,we,qdpo_srst,qdpo[11:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_12,Vivado 2018.3";
begin
end;
