----------------------------------------------------------------------------------
-- Company: Rutherford Appleton Laboratory 
-- Engineer: Konstantinos Manolopoulos
-- 
-- Create Date: 06/08/2020 07:23:38 PM
-- Design Name: 
-- Module Name: PedSub_wrapper - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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


entity PedSub_wrapper is
generic (    
    ENABLE_SSR  : boolean := FALSE   
);
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


architecture Behavioral of PedSub_wrapper is

signal pedsub_rst : std_logic := '0';
signal start : STD_LOGIC := '0';
signal done  : STD_LOGIC := '0';
signal idle  : STD_LOGIC := '0';
signal ped_val_temp : std_logic_vector(15 downto 0) := (others => '0');
signal accum_temp : std_logic_vector(15 downto 0) := (others => '0');

begin

  pedsub_rst <= reset or localreset;

  gen_pedsub: if ENABLE_SSR generate
    pedsub_ssr: entity work.PedSub_SSR
    port map( 
      clk            => clk, 
      reset          => reset,   
      s_axis_data_w  => s_axis_data_w,
      s_axis_data_r  => s_axis_data_r,    
      m_axis_data_w  => m_axis_data_w,
      m_axis_data_r  => m_axis_data_r,
      pedSub_valid   => pedSub_valid,
      pedSub_median  => pedSub_median,
      pedSub_accum   => pedSub_accum
    );
  else generate

  PedSub_HLS_SSR_wrapper: entity work.PedSub_HLS_SSR_wrapper
      port map(
	  clk            => clk, 
	  reset          => reset,   
	  s_axis_data_w  => s_axis_data_w,
	  s_axis_data_r  => s_axis_data_r,    
	  m_axis_data_w  => m_axis_data_w,
	  m_axis_data_r  => m_axis_data_r,
	  pedSub_valid   => open,
	  pedSub_median  => open,
	  pedSub_accum   => open
      );
    
      pedSub_valid  <= '0';
      pedSub_median <= (others => '0');
      pedSub_accum  <= (others => '0');
  end generate;


-- pedsub : entity work.PedestalSubtraction
--     port map( 
-- 	clk            => clk, 
-- 	reset          => pedsub_rst,   
-- 	s_axis_data_w  => s_axis_data_w,
-- 	s_axis_data_r  => s_axis_data_r,    
-- 	m_axis_data_w  => open,
-- 	m_axis_data_r  => m_axis_data_r
--     );

--PedSub_median <= ped_val_temp(11 downto 0);
--PedSub_accum <= accum_temp(11 downto 0);

end Behavioral;
