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
	generic (
		ENABLE_SSR  : boolean := TRUE
	);
Port (
	clk		   : in   std_logic;
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

	signal treset : std_logic := '0';

begin

	treset <= reset or localreset;

	pedsub : entity work.PedestalSubtraction
	port map(
	  ap_clk		=> clk,
	  ap_rst		=> reset,
	  		=> s_axis_data_w,
	   => 

