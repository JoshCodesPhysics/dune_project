----------------------------------------------------------------------------------
-- Company: Rutherford Appleton Laboratory 
-- Engineer: Joshua Horswill
-- 
-- Create Date: 23/03/2021 11:45:00 PM
-- Design Name: 
-- Module Name: fir_HLS_wrapper - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Wrapper for FIR filter HLS block that includes SSR mechanism
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.dtpc_stream_defs.all;

entity fir_HLS_wrapper is
Port (
    clk            : in  std_logic;
    reset          : in  std_logic;
    localreset     : in  std_logic;
    s_axis_data_w  : in  dtpc_axis4_w;
    s_axis_data_r  : out dtpc_axis4_r;
    m_axis_data_w  : out dtpc_axis4_w;
    m_axis_data_r  : in  dtpc_axis4_r
);
end fir_HLS_wrapper;

architecture rtl of fir_HLS_wrapper is

signal s_tlast	: std_logic := '0';
signal s_tready	: std_logic := '0';

-- AXI4S pointless HLS ports
signal start : STD_LOGIC := '1';
signal done  : STD_LOGIC := '0';
signal idle  : STD_LOGIC := '0';

-- Special reset signal for the FIR
-- signal fir_rst : std_logic := '0';
-- Number of bits to right shift output of FIR
constant  c_FIR_BITSHIFT  : natural := 6; 
begin

-- fir_rst <= reset or localreset;

-- Circumventing tready_o issue
s_tready             <= m_axis_data_r.tready;
s_axis_data_r.tready <= '0' when reset='1' else s_tready;

-- Instantiate fir_HLS block:
	-- fir_HLS : entity work.fir_HLS
	fir_HLS_simplified : entity work.fir_HLS_simplified
	    port map(
		ap_clk          => clk,
        	ap_rst          => reset,
        	ap_start        => start,
        	ap_done         => done,
        	ap_idle         => idle,
        	ap_ready        => open,
		tdata_i         => s_axis_data_w.tdata,
        	tdata_o         => m_axis_data_w.tdata,
        	tdata_o_ap_vld  => open,
		tvalid_i        => s_axis_data_w.tvalid,
		tvalid_o        => m_axis_data_w.tvalid,
		tvalid_o_ap_vld => open,
		tuser_i         => s_axis_data_w.tuser(0),
		tuser_o         => m_axis_data_w.tuser(0),
		tuser_o_ap_vld  => open,
		tkeep0_i        => s_axis_data_w.tkeep(0),
		tkeep0_o        => m_axis_data_w.tkeep(0),
		tkeep0_o_ap_vld => open,
		tkeep1_i        => s_axis_data_w.tkeep(1),
		tkeep1_o        => m_axis_data_w.tkeep(1),
		tkeep1_o_ap_vld => open,
		tready_i        => s_tready,
		treset_i        => reset,
		treset_o        => open,
		treset_o_ap_vld => open,
		tlast_i         => s_axis_data_w.tlast,
		tlast_o         => s_tlast,
		tlast_o_ap_vld  => open
	);

m_axis_data_w.tlast <= s_tlast;

end rtl;
