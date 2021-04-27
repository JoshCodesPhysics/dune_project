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
signal not_reset : std_logic := '0';
-- signal tdata_SSR_in : std_logic_vector(15 downto 0) := (OTHERS => '0');
-- signal tvalid_SSR_in : std_logic := '0';
-- signal stateRestore_w     : dtpc_axis4_w;

-- AXI4S pointless HLS ports
signal start : STD_LOGIC := '1';
signal done  : STD_LOGIC := '0';
signal idle  : STD_LOGIC := '0';

-- Special reset signal for the FIR
signal fir_rst : std_logic := '0';
-- Number of bits to right shift output of FIR
-- constant  c_FIR_BITSHIFT  : natural := 6; 

begin

fir_rst <= reset or localreset;


not_reset <= not fir_rst;

-- Circumventing tready_o issue
s_tready             <= m_axis_data_r.tready;
s_axis_data_r.tready <= '0' when reset='1' else s_tready;

-- tdata_SSR_in <= stateRestore_w.tdata;
-- tvalid_SSR_in <= stateRestore_w.tvalid;

 -- Instantiate fir_HLS block:
 --	fir_HLS: entity work.fir_HLS
	fir_HLS_SSR: entity work.fir_HLS_SSR
  	    port map(
  		ap_clk          => clk,
          	ap_rst          => reset,
          	ap_start        => start,
          	ap_done         => done,
          	ap_idle         => idle,
          	ap_ready        => open,
  		s_axis_data_tdata         => s_axis_data_w.tdata,		
		-- s_axis_data_tdata_SSR	  => tdata_SSR_in,
		-- s_axis_data_tvalid_SSR	  => tvalid_SSR_in,
          	m_axis_data_tdata         => m_axis_data_w.tdata,
          	m_axis_data_tdata_ap_vld  => open,
  		s_axis_data_tvalid        => s_axis_data_w.tvalid,
  		m_axis_data_tvalid        => m_axis_data_w.tvalid,
   		m_axis_data_tvalid_ap_vld => open,
  		s_axis_data_tuser         => s_axis_data_w.tuser(0),
  		m_axis_data_tuser         => m_axis_data_w.tuser(0),
  		m_axis_data_tuser_ap_vld  => open,
  		s_axis_data_tkeep_V        => s_axis_data_w.tkeep,
  		m_axis_data_tkeep_V        => m_axis_data_w.tkeep,
  		m_axis_data_tkeep_V_ap_vld => open,
  		m_axis_data_tready        => s_tready,
 		s_axis_data_tlast         => s_axis_data_w.tlast,
		m_axis_data_tlast         => m_axis_data_w.tlast,
		m_axis_data_tlast_ap_vld  => open
);

-- ssr_inst: entity work.stateSaveRestore
--     port map(
--         reset          => reset,
--   	clk            => clk,
--   	s_axis_data_w  => s_axis_data_w,
--   	m_axis_data_r  => m_axis_data_r,
--   	stateRestore_w => stateRestore_w
-- );


-- Instantiated fir_HLS_SSR_axis block

-- fir_HLS_axi4s_simp : entity work.fir_HLS_axi4s_simplified
-- 	port map(
-- 		ap_clk          => clk,
--      		ap_rst_n        => not_reset,
--      		ap_start        => start,
--      		ap_done         => done,
--      		ap_idle         => idle,
--      		ap_ready        => open,
-- 	--	s_axis_data_TDATA(15 downto 0)	=> s_axis_data_w.tdata,
--	--	s_axis_data_TDATA(17 downto 16)	=> s_axis_data_w.tkeep,
--	--	s_axis_data_TDATA(18)	=> s_axis_data_w.tuser(0),
--	--	s_axis_data_TDATA(19)	=> s_axis_data_w.tlast,
--	--	s_axis_data_TDATA(23 downto 20) => "0000",
--		s_axis_data_TDATA	=> s_axis_data_w.tdata,
--		s_axis_data_TKEEP	=> s_axis_data_w.tkeep,
--		s_axis_data_TLAST	=> s_axis_data_w.tlast,
--	--	s_axis_data_TUSER	=> s_axis_data_w.tuser(0),
-- 		s_axis_data_TVALID	=> s_axis_data_w.tvalid,
-- 		s_axis_data_TREADY	=> s_axis_data_r.tready,
-- 		m_axis_data_TDATA	=> m_axis_data_w.tdata,
-- 		m_axis_data_TVALID	=> m_axis_data_w.tvalid,
-- 		m_axis_data_TREADY	=> m_axis_data_r.tready,
-- 		m_axis_data_TKEEP	=> m_axis_data_w.tkeep,
-- 		m_axis_data_TLAST	=> s_tlast
-- 	--	m_axis_data_TUSER	=> m_axis_data_w.user(0)
-- );
--
--m_axis_data_w.tuser(0) <= s_tlast;
--m_axis_data_w.tlast <= s_tlast;
end rtl;
