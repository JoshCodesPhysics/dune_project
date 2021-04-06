----------------------------------------------------------------------------------
-- Company:  Rutherford Appleton Laboratory
-- Engineer: Konstas Manolopoulos
-- 
-- Create Date: 21.01.2019 17:12:35
-- Design Name: 
-- Module Name: SingleChain - Behavioral
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
use work.dtpc_mon_defs.all;

entity SingleChain is
  generic (
    ENABLE_PEDSUB     : boolean := TRUE;
    ENABLE_FIR        : boolean := TRUE;
    ENABLE_HF         : boolean := TRUE;
    ENABLE_PEDSUB_SSR : boolean := TRUE;
    ENABLE_FIR_SSR    : boolean := TRUE;
    ENABLE_PedValTX   : boolean := TRUE
    ); 
  Port (   
      clk                     : in  std_logic;
      reset                   : in  std_logic;
      threshold               : in std_logic_vector(15 downto 0);
      localreset              : in  std_logic;
      singleChannelIn_w       : in  dtpc_axis4_w;
      singleChannelIn_r       : out dtpc_axis4_r;            
      singleChannelOut_w      : out dtpc_axis4_w;
      singleChannelOut_r      : in  dtpc_axis4_r;
      mon_rst                 : in  std_logic;
      mon_stuff               : out dtpc_mon_data_array(3 downto 0)
);
end SingleChain;

architecture Behavioral of SingleChain is


-----------------------------------------------------------------------
-- Signal Declaration
-----------------------------------------------------------------------
  signal PedSubOut_w : dtpc_axis4_w := DTPC_AXIS4_W_NULL;
  signal PedSubOut_r : dtpc_axis4_r := DTPC_AXIS4_R_NULL;
      
  signal FIR_out_w   : dtpc_axis4_w := DTPC_AXIS4_W_NULL;
  signal FIR_out_r   : dtpc_axis4_r := DTPC_AXIS4_R_NULL;

  signal HF_out_w    : dtpc_axis4_w := DTPC_AXIS4_W_NULL;
  signal HF_out_r    : dtpc_axis4_r := DTPC_AXIS4_R_NULL;
      
  signal hitFinder_rst : std_logic := '0';
  signal pedValTx_rst  : std_logic := '0';
  
  signal pedSub_valid  : std_logic := '0';
  signal pedSub_median : std_logic_vector(11 downto 0) := (others => '0');
  signal pedSub_accum  : std_logic_vector(11 downto 0) := (others => '0');



-----------------------------------------------------------------------
-- Main body of code
-----------------------------------------------------------------------    
begin

  hitFinder_rst <= reset or localreset;
  pedValTx_rst  <= reset or localreset;
  
  g_pedsub: if ENABLE_PEDSUB  generate
    PedSub_inst: entity work.PedSub_wrapper    
    generic map(                
       ENABLE_SSR => ENABLE_PEDSUB_SSR
    )
    Port Map(
      clk                => clk,
      reset              => reset,
      localreset         => localreset,
      s_axis_data_w      => singleChannelIn_w, 
      s_axis_data_r      => singleChannelIn_r,            
      m_axis_data_w      => PedSubOut_w,
      m_axis_data_r      => PedSubOut_r,
      --PedSub validation signals
      pedSub_valid       => pedSub_valid,
      pedSub_median      => pedSub_median,
      pedSub_accum       => pedSub_accum
    );
  else generate
      PedSubOut_w       <= singleChannelIn_w;
      singleChannelIn_r <= PedSubOut_r;
  end generate;
  
  
  g_fir: if ENABLE_FIR  generate
    FIR_inst: entity work.fir_wrapper
    generic map(                
        ENABLE_SSR   => ENABLE_FIR_SSR
    )
    Port Map(
      clk                => clk,
      reset              => reset, 
      localreset         => localreset,                    
      s_axis_data_w      => PedSubOut_w, 
      s_axis_data_r      => PedSubOut_r,            
      m_axis_data_w      => FIR_out_w,
      m_axis_data_r      => FIR_out_r
    );
  else generate
      FIR_out_w   <= PedSubOut_w;
      PedSubOut_r <= FIR_out_r;
  end generate;


  g_hf: if ENABLE_HF  generate
    HFA_inst: entity work.HitFinder_km
    port map(
      clk           => clk,    
      reset         => hitFinder_rst, 
      threshold     => threshold,      
      axis_in_w     => FIR_out_w, 
      axis_in_r     => FIR_out_r,                        
      packet_out_w  => HF_out_w,
      packet_out_r  => HF_out_r 
    );
  else generate
      HF_out_w  <= FIR_out_w;
      FIR_out_r <= HF_out_r;
  end generate;
  
  --singleChannelOut_w <= HF_out_w;
  --HF_out_r           <= singleChannelOut_r;


  g_pedValTx: if ENABLE_PedValTX generate 
    pedValTx_inst: entity work.PedValues_tx
    port map( 
      clk           => clk,
      reset         => pedValTx_rst,    
      pedSub_valid  => pedSub_valid,
      pedSub_median => pedSub_median,
      pedSub_accum  => pedSub_accum,    
      s_axis_data_w => HF_out_w,
      s_axis_data_r => HF_out_r,        
      m_axis_data_w => singleChannelOut_w,
      m_axis_data_r => singleChannelOut_r
    );
  else generate
      singleChannelOut_w <= HF_out_w;
      HF_out_r           <= singleChannelOut_r;
  end generate;


  -- Probes
  monprb_in: entity work.dtpc_mon_probe
    port map(
        clk => clk,
        rst => mon_rst,
        d_w => singleChannelIn_w,
        d_r => singleChannelIn_r,
        mon => mon_stuff(0)
      );

  monprb_ped_out: entity work.dtpc_mon_probe
    port map(
        clk => clk,
        rst => mon_rst,
        d_w => PedSubOut_w,
        d_r => PedSubOut_r,
        mon => mon_stuff(1)
      );

  monprb_fir_out: entity work.dtpc_mon_probe
    port map(
        clk => clk,
        rst => mon_rst,
        d_w => FIR_out_w,
        d_r => FIR_out_r,
        mon => mon_stuff(2)
      );

  monprb_hf_out: entity work.dtpc_mon_probe
    port map(
        clk => clk,
        rst => mon_rst,
        d_w => HF_out_w,
        d_r => HF_out_r,
        mon => mon_stuff(3)
      );


end Behavioral;
