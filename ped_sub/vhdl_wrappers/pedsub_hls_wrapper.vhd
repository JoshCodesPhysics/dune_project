----------------------------------------------------------------------------------
-- Company: Rutherford Appleton Laboratory 
-- Author: Joshua Horswill
-- 
-- Create Date: Tue 24 Nov 13:54:05 GMT 2020
-- Design Name: 
-- Module Name: PedSub_wrapper
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: This is a VHDL wrapper for the implementation of the pedestal
-- subtraction HLS IP block
-- 
-- Dependencies: 
-- 
-- Revision:

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.dtpc_stream_defs.all;

entity PedSub_wrapper is
Port (
	clk                : in  std_logic;
    	reset              : in  std_logic;
    	localreset         : in  std_logic;
    	s_axis_data_w      : in  dtpc_axis4_w;
    	s_axis_data_r      : out dtpc_axis4_r;
    	m_axis_data_w      : out dtpc_axis4_w;
    	m_axis_data_r      : in  dtpc_axis4_r;
    	--PedSub validation signals
    	pedSub_valid       : out  std_logic;
    	pedSub_median      : out  std_logic_vector(11 downto 0);
    	pedSub_accum       : out  std_logic_vector(11 downto 0)
);

end PedSub_wrapper;

architecture Behavioural of PedSub_wrapper is
	
begin
	ped_alg : entity work.PedestalSubtraction
	port map(
	  ap_clk		=> clk,
	  ap_rst		=> reset,
       -- How do I access these signals that aren't on s_axis or m_axis?

	  ped_val_i		=> median, -- or PedSub_median in SSR?
	  ped_val_o		=> medium_RamOut, -- or pedSub_median_out?
       -- ped_val_o_ap_vld	=> pedSub_valid, -- Not sure if necessary
	  accum_i		=> accumulator, -- or PedSub_accum in SSR
	  accum_o		=> accumulator_RamOut, -- or PedSub_accum_out?

       -- Is the signal reading in: s_axis_data + '_r' or '_w'
	  tdata			=> s_axis_data_w.tdata,
	  tvalid		=> s_axis_data_w.tvalid,
	  tkeep0		=> s_axis_data_w.tkeep(0), -- Is this correct?
	  tkeep1		=> s_axis_data_w.tkeep(1),

       -- Is this _r?
	  tready		=> m_axis_data_r.tready,

       -- Not sure what to do about treset and ap_rst so I set one to reset
       -- and the other to localreset
	  treset		=> localreset,
       -- _w or _r?	  
	  tlast			=> s_axis_data_w.tlast,
	  tvalid_out		=> m_axis_data_w.tvalid,
	  tkeep0_out		=> m_axis_data_w.tkeep(0),
	  tkeep1_out		=> m_axis_data_w.tkeep(1),
	  tready_out		=> s_axis_data_r.tready,
	  treset_out		=> -- not sure about this one
	  tlast_out		=> m_axis_data_w.tlast
	);

end Behavioral;
