----------------------------------------------------------------------------------
-- Company: Rutherford Appleton Laboratory 
-- Engineer: Konstantinos Manolopoulos
-- 
-- Create Date: 08/01/2021 18:20:00 PM
-- Design Name: 
-- Module Name: ssr_ped - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Just the SSR mechanism for the Ped HLS block
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


entity ssr_ped is
Port ( 
    clk                : in  std_logic; 
    reset              : in  std_logic;     
    tlast              : in  std_logic;
    median             : in  std_logic_vector(11 downto 0);
    accumulator        : in  std_logic_vector(11 downto 0);
    median_RamOut      : out std_logic_vector(11 downto 0);
    accumulator_RamOut : out std_logic_vector(11 downto 0)
);
end ssr_ped;


architecture Behavioral of ssr_ped is


COMPONENT Median_distRAM_64x12
  PORT (
    a    : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    d    : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    dpra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    clk  : IN STD_LOGIC;
    we   : IN STD_LOGIC;
    qdpo_srst : IN STD_LOGIC;
    qdpo      : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END COMPONENT;

COMPONENT distRAM_64x12
  PORT (
    a    : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    d    : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    dpra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    clk  : IN STD_LOGIC;
    we   : IN STD_LOGIC;
    qdpo_srst : IN STD_LOGIC;
    qdpo      : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END COMPONENT;


signal s1_tlast           : std_logic := '0';
signal channel_cnt        : unsigned(5 downto 0)          := (OTHERS => '0'); 
signal medianRamOut      : std_logic_vector(11 downto 0) := (OTHERS => '0');
signal accumulatorRamOut : std_logic_vector(11 downto 0) := (OTHERS => '0');




begin
      
  -----------------------------------------------------------------------------
  -- State Save/Restore
  -----------------------------------------------------------------------------
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then
          s1_tlast <= '0';
      else
          s1_tlast <= tlast;
      end if;     
  end if;
  end process;


  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then
          channel_cnt <= (others => '0');
      elsif s1_tlast = '1' then
          channel_cnt <= channel_cnt + 1;
      end if;     
  end if;
  end process;

  
  median_distRAM_inst : Median_distRAM_64x12
  PORT MAP (
    a         => std_logic_vector(channel_cnt),
    d         => median,
    dpra      => std_logic_vector(channel_cnt),
    clk       => clk,
    we        => s1_tlast,
    qdpo_srst => reset,
    qdpo      => medianRamOut
  );

  accum_distRAM_inst : distRAM_64x12
  PORT MAP (
    a         => std_logic_vector(channel_cnt),
    d         => accumulator,
    dpra      => std_logic_vector(channel_cnt),
    clk       => clk,
    we        => s1_tlast,
    qdpo_srst => reset,
    qdpo      => accumulatorRamOut
  );
  
  median_RamOut      <= medianRamOut;  
  accumulator_RamOut <= accumulatorRamOut;

end Behavioral;
