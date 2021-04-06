----------------------------------------------------------------------------------
-- Company: Rutherford Appleton Laboratory
-- Engineer: Konstantinos Manolopoulos
-- 
-- Create Date: 04.06.2019 14:00:34
-- Design Name: 
-- Module Name: procBlckWrapper - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.dtpc_stream_defs.all;
use work.dtpc_mon_defs.all;


entity dtpc_tpg is
  generic (
    ENABLE_PEDSUB     : boolean := FALSE;
    ENABLE_FIR        : boolean := TRUE;
    ENABLE_HF         : boolean := FALSE;
    ENABLE_PEDSUB_SSR : boolean := FALSE;
    ENABLE_FIR_SSR    : boolean := FALSE;
    ENABLE_PedValTX   : boolean := FALSE
  ); 
  Port (
    clk       : in std_logic;
    rst       : in std_logic;
    threshold : in std_logic_vector(15 downto 0); 
    d         : in  dtpc_axis4_w;
    q         : out dtpc_axis4_r;
    qa        : out dtpc_axis4_w;
    da        : in  dtpc_axis4_r;
    mon       : out dtpc_mon_data_array(5 downto 0)

  );
end dtpc_tpg;


architecture Behavioral of dtpc_tpg is

  
  signal singleChannelInput_w       : dtpc_axis4_w := DTPC_AXIS4_W_NULL;
  signal singleChannelInput_r       : dtpc_axis4_r := DTPC_AXIS4_R_NULL;
  signal singleChannelOutput_w      : dtpc_axis4_w := DTPC_AXIS4_W_NULL;
  signal singleChannelOutput_r      : dtpc_axis4_r := DTPC_AXIS4_R_NULL;
    
  --temp TPG reset signals
  signal tmp_rst, s_tmp_rst, tmp_rst1 : std_logic := '0';
  --signal singleChain_rst : std_logic := '0';
  -- Monitoring signals
  signal sc_mon_stuff : dtpc_mon_data_array(3 downto 0);
  
    
begin


  headerStripComb_inst : ENTITY work.HeaderStripperCombiner
  port map(
    clk                   => clk,
    reset                 => rst,
    ----------------- Header Stripper -----------------
    --Header + ADC data
    s_axis_data_w         => d,
    s_axis_data_r         => q,
    --Single Channel TPG Input: ADC data
    singleChannelInput_w  => singleChannelInput_w,
    singleChannelInput_r  => singleChannelInput_r,
    ----------------- Header Combiner -----------------
    --Single Channel TPG Output: Hits
    singleChannelOutput_w => singleChannelOutput_w,
    singleChannelOutput_r => singleChannelOutput_r,        
    --Header + Hits    
    m_axis_data_w         => qa,
    m_axis_data_r         => da 
  );


  --singleChain_rst <= rst or tmp_rst1;   
  singleChain_inst : ENTITY work.SingleChain
  generic map(
    ENABLE_PEDSUB     => ENABLE_PEDSUB,
    ENABLE_FIR        => ENABLE_FIR,
    ENABLE_HF         => ENABLE_HF,
    ENABLE_PEDSUB_SSR => ENABLE_PEDSUB_SSR,
    ENABLE_FIR_SSR    => ENABLE_FIR_SSR,
    ENABLE_PedValTX   => ENABLE_PedValTX
    )
  port map(
    clk        => clk,
    reset      => rst,
    threshold  => threshold,
    localreset => tmp_rst1,
    singleChannelIn_w  => singleChannelInput_w,
    singleChannelIn_r  => singleChannelInput_r,       
    singleChannelOut_w => singleChannelOutput_w,
    singleChannelOut_r => singleChannelOutput_r,
    mon_rst   => rst,
    mon_stuff => sc_mon_stuff     
  );

 
 --use tlast to apply a tmp reset between packets
 --reset last 2 clks (needed by FIR)
 tmp_rst1 <= tmp_rst or s_tmp_rst;
 process(clk)
 begin
 if rising_edge(clk) then
     if da.tready = '1' then
         tmp_rst   <= singleChannelOutput_w.tlast;
         s_tmp_rst <= tmp_rst;
     end if;
 end if;
 end process;


  -- Probes
  monprb_in: entity work.dtpc_mon_probe
    port map(
        clk => clk,
        rst => rst,
        d_w => d,
        d_r => q,
        mon => mon(mon'right)
      );

  mon(mon'left-1 downto mon'right+1) <= sc_mon_stuff;

  monprb_out: entity work.dtpc_mon_probe
    port map(
        clk => clk,
        rst => rst,
        d_w => qa,
        d_r => da,
        mon => mon(mon'left)
      );
end Behavioral;
