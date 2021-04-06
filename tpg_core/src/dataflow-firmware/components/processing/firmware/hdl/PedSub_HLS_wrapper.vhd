----------------------------------------------------------------------------------
-- Company: Rutherford Appleton Laboratory 
-- Engineer: Konstantinos Manolopoulos
-- 
-- Create Date: 08/01/2021 18:50:00 PM
-- Design Name: 
-- Module Name: PedSub_HLS_wrapper - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: wrapper for PedSub HLS block + SSR mechanism
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


entity PedSub_HLS_wrapper is
Port ( 
    clk                : in  std_logic; 
    reset              : in  std_logic;     
    s_axis_data_w      : in  dtpc_axis4_w;
    s_axis_data_r      : out dtpc_axis4_r;    
    m_axis_data_w      : out dtpc_axis4_w;
    m_axis_data_r      : in  dtpc_axis4_r;
    --PedSub validation signals
    pedSub_valid       : out  std_logic;
    pedSub_median      : out  std_logic_vector(11 downto 0);
    pedSub_accum       : out  std_logic_vector(11 downto 0)
);
end PedSub_HLS_wrapper;


architecture Behavioral of PedSub_HLS_wrapper is


signal s_tlast        : std_logic := '0';
signal s_tready	      : std_logic := '0';
signal median         : std_logic_vector(11 downto 0) := (OTHERS => '0');
signal accum          : std_logic_vector(11 downto 0) := (OTHERS => '0');
signal median_RamOut  : std_logic_vector(11 downto 0) := (OTHERS => '0');
signal accum_RamOut   : std_logic_vector(11 downto 0) := (OTHERS => '0');
-- AXI4 pointless ports
signal start : STD_LOGIC := '1';
-- signal continue : STD_LOGIC := '1';
signal done  : STD_LOGIC := '0';
signal idle  : STD_LOGIC := '0';
-- Temporary ports for median and accumulator for bit width resizing later
-- (median is truncated and accumulator is zero-padded)
signal ped_val_i_temp : std_logic_vector(15 downto 0) := (OTHERS => '0');
signal accum_i_temp : std_logic_vector(15 downto 0) := (OTHERS => '0');
signal ped_val_o_temp : std_logic_vector(15 downto 0) := (OTHERS => '0');
signal accum_o_temp : std_logic_vector(15 downto 0) := (OTHERS => '0');
-- Temp reset output port to remove error
-- signal treset_out_temp : STD_LOGIC := '0';
-- Signal input clock signals
-- signal gen_count : std_logic_vector(31 downto 0) := (OTHERS => '0');
-- signal accum_count : std_logic_vector(31 downto 0) := (OTHERS => '0');
-- signal ped_count : std_logic_vector(31 downto 0) := (OTHERS => '0');

begin

-- Zero padding the inputs
ped_val_i_temp <= "0000" & median_Ramout;
accum_i_temp <= "0000" & accum_RamOut;
-- Circumventing tready_o issue
s_tready             <= m_axis_data_r.tready;
s_axis_data_r.tready <= '0' when reset='1' else s_tready;

  -----------------------------------------------------------------------
  -- Simplified HLS block will be instantiated here
  ----------------------------------------------------------------------

  pedsub_HLS : entity work.pedsub_HLS
	port map(
	ap_clk		=> clk,
        ap_rst		=> reset,
        ap_start	=> start,
        ap_done		=> done,
        ap_idle		=> idle,
	ap_ready	=> open,
	-- ap_continue	=> continue,
        tdata_i         => s_axis_data_w.tdata,
        tdata_o		=> m_axis_data_w.tdata,
        tdata_o_ap_vld	=> open,
        accum_i		=> accum_i_temp,
	accum_o		=> accum_o_temp,
        accum_o_ap_vld	=> open,
	ped_i		=> ped_val_i_temp,
	ped_o	      	=> ped_val_o_temp,
	ped_o_ap_vld  	=> open,
    	tvalid_i      	=> s_axis_data_w.tvalid,
    	tvalid_o      	=> m_axis_data_w.tvalid,
        tvalid_o_ap_vld => open,
	tuser_i		=> s_axis_data_w.tuser(0),
	tuser_o		=> m_axis_data_w.tuser(0),
	tuser_o_ap_vld	=> open,
	tkeep0_i      	=> s_axis_data_w.tkeep(0),
	tkeep0_o      	=> m_axis_data_w.tkeep(0),
	tkeep0_o_ap_vld => open,
	tkeep1_i      	=> s_axis_data_w.tkeep(1),
	tkeep1_o      	=> m_axis_data_w.tkeep(1),
	tkeep1_o_ap_vld => open,
	tready_i      	=> s_tready,
	treset_i      	=> reset,
	treset_o      	=> open,
	treset_o_ap_vld => open,
	tlast_i       	=> s_axis_data_w.tlast,
	tlast_o       	=> s_tlast,
	tlast_o_ap_vld 	=> open
  );
m_axis_data_w.tlast <= s_tlast;
  

PedSSR_inst :entity work.ssr_ped
   Port map ( 
     clk                => clk,
     reset              => reset,       
     tlast              => s_tlast,  
     median             => median,  
     accumulator        => accum,  
     median_RamOut      => median_RamOut,   
     accumulator_RamOut => accum_RamOut
   );

median <= ped_val_o_temp(11 downto 0);
accum <= accum_o_temp(11 downto 0);

end Behavioral;
