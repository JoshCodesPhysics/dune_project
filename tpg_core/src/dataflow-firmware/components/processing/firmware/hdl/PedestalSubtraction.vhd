----------------------------------------------------------------------------------
-- Company: Rutherford Appleton Laboratory 
-- Engineer: Konstantinos Manolopoulos
-- 
-- Create Date: 10.12.2018 18:28:55
-- Design Name: 
-- Module Name: PedestalSubtraction - Behavioral
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

entity PedestalSubtraction is
Port ( 
    clk                : in  std_logic; 
    reset              : in  std_logic;   
    s_axis_data_w      : in  dtpc_axis4_w;
    s_axis_data_r      : out dtpc_axis4_r;    
    m_axis_data_w      : out dtpc_axis4_w;
    m_axis_data_r      : in  dtpc_axis4_r
);
end PedestalSubtraction;


architecture Behavioral of PedestalSubtraction is

signal s_tvalid, s1_tvalid, s2_tvalid : std_logic := '0';
signal s_tlast, s1_tlast, s2_tlast    : std_logic := '0'; 
signal s_tuser, s1_tuser, s2_tuser    : std_logic := '0';
signal s_tready            : std_logic := '0';
signal s_tkeep             : std_logic := '0';
signal s1_tkeep, s2_tkeep  : std_logic_vector( 1 downto 0) := (OTHERS => '0');
signal s_tdata, s1_tdata   : std_logic_vector(11 downto 0) := (OTHERS => '0');

signal updating    : std_logic := '1';
signal median      : std_logic_vector(11 downto 0) := "000111110100"; --500
signal accumulator : std_logic_vector(11 downto 0) := (OTHERS => '0');

signal targetValue     : std_logic_vector(11 downto 0) := "000000001001"; --set value to 9
signal neg_targetValue : std_logic_vector(11 downto 0) := "111111110111"; --set value to -9
signal m_axis_tdata    : std_logic_vector(11 downto 0) := (OTHERS => '0');

 
 
begin
  
  -----------------------------------------------------------------------
  --Input Output Registers
  -----------------------------------------------------------------------
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then 
          s1_tvalid <= '0';
          s1_tlast  <= '0';
          s1_tuser  <= '0';
          s1_tdata  <= ( OTHERS => '0');      
      elsif s_tready = '1' then      
          s1_tvalid <= s_axis_data_w.tvalid;                                         
          s1_tlast  <= s_axis_data_w.tlast;                   
          s1_tuser  <= s_axis_data_w.tuser(0);                                                  
          s1_tkeep  <= s_axis_data_w.tkeep;                                            
          s1_tdata  <= s_axis_data_w.tdata(11 downto 0);                                
      end if;          
  end if;
  end process;


  process(clk)
  begin
  if rising_edge(clk) then  
      if s_tready = '1' then
          s2_tvalid <= s1_tvalid;
          s2_tlast  <= s1_tlast;
          s2_tuser  <= s1_tuser;
          s2_tkeep  <= s1_tkeep;
      end if;                  
  end if;
  end process;


  --Assign Input signals
  s_tdata  <= s_axis_data_w.tdata(11 downto 0);
  s_tvalid <= s_axis_data_w.tvalid;
  s_tkeep  <= s_axis_data_w.tkeep(1) and s_axis_data_w.tkeep(0); 

  --Assign output signals
  m_axis_data_w.tvalid   <= s2_tvalid; 
  m_axis_data_w.tlast    <= s2_tlast;
  m_axis_data_w.tuser(0) <= s2_tuser;
  m_axis_data_w.tkeep    <= s2_tkeep;



  -----------------------------------------------------------------------
  -- tready logic 
  -----------------------------------------------------------------------
  s_tready             <= m_axis_data_r.tready;
  s_axis_data_r.tready <= '0' when reset='1' else s_tready;


  
  -----------------------------------------------------------------------
  -- Median/Accumulator Logic & Pedestal subtraction
  -----------------------------------------------------------------------
  process(clk)
  begin
  if rising_edge(clk) then
    --if updating = '1' then
    if reset = '1' then
        median      <= "000111110100";
        accumulator <= (OTHERS => '0');
    elsif s_tvalid = '1' and s_tkeep='1' and m_axis_data_r.tready = '1' then       
        if s_tdata > median then                                                             
            if accumulator = targetValue then
                median      <= std_logic_vector( signed(median) + to_signed(1,12) );
                accumulator <= (OTHERS => '0');       
            else    
                accumulator <= std_logic_vector( signed(accumulator) + to_signed(1,12) );
            end if;                                    
        elsif s_tdata < median then                                     
            if accumulator = neg_targetValue then
                median      <= std_logic_vector( signed(median) - to_signed(1,12) );
                accumulator <= (OTHERS => '0');
            else
                accumulator <= std_logic_vector( signed(accumulator) - to_signed(1,12) );
            end if;   
        end if;       
    end if;        
          
  end if;
  end process;


  process(clk)
  begin
  if rising_edge(clk) then
      --if updating = '1' then
      if reset = '1' then
          m_axis_tdata <= ( OTHERS => '0');
      elsif s_tready = '1' then      
          m_axis_tdata <= std_logic_vector( signed(s1_tdata) - signed(median) );              
      end if;
  end if;
  end process;
  
  m_axis_data_w.tdata <= m_axis_tdata(11) & m_axis_tdata(11) & m_axis_tdata(11) &  m_axis_tdata(11) & m_axis_tdata;
  
  
  
  --Stop updating mredian when in a hit
--  process(clk)
--  begin
--  if rising_edge(clk) then      
--      if din_s4 > std_logic_vector( signed(threshold) + to_signed(10,12) ) then
--          updating <= '0'; --in a hit, stop updating
--      else
--          updating <= '1';
--      end if;      
--  end if;
--  end process;

end Behavioral;
