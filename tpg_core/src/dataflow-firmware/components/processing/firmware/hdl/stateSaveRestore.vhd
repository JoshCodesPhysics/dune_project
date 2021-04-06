----------------------------------------------------------------------------------
-- Company:  Rutherford Appleton Laboratory
-- Engineer: Konstantinos Manolopoulos
-- 
-- Create Date: 05/04/2020 01:03:20 PM
-- Design Name: 
-- Module Name: stateSaveRestore - Behavioral
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


entity stateSaveRestore is
  Port ( 
    reset           : in std_logic;   
    clk             : in std_logic;    
    s_axis_data_w   : in  dtpc_axis4_w;
    m_axis_data_r   : in  dtpc_axis4_r;   
    stateRestore_w  : out dtpc_axis4_w  
  );
end stateSaveRestore;


architecture Behavioral of stateSaveRestore is


COMPONENT RAM_2048x12
  PORT (
    clka  : IN STD_LOGIC;
    wea   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    dina  : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    clkb  : IN STD_LOGIC;
    enb   : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END COMPONENT;

----------------------- State Save/Restore signals --------------------
  signal toggle          : std_logic := '0';
  signal stateSR         : std_logic := '0';
  signal s_stateSR       : std_logic := '0';
  signal stateSR_tlast   : std_logic := '0';
  signal s_stateSR_tlast : std_logic := '0';
  signal data_cnt        : unsigned( 5 downto 0) := (OTHERS => '0');
  signal wr_cnt          : unsigned(10 downto 0) := (OTHERS => '0');
  signal rd_cnt          : unsigned(10 downto 0) := "00000100000";  
  signal stateRAMOut     : std_logic_vector(11 downto 0) := (others => '0');
        
  signal en_cnt          : unsigned(7 downto 0) := (OTHERS => '0');
  signal s_tvalid        : std_logic := '0';                    
  --signal s_enable        : std_logic := '0';



begin

  -----------------------------------------------------------------------------
  -- State Save/Restore
  -----------------------------------------------------------------------------  
  --Control Signals for State save-restore  
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then
          data_cnt      <= (OTHERS => '0');
          wr_cnt        <= (OTHERS => '0');
          rd_cnt        <= "00000100000";
          stateSR       <= '0';
          stateSR_tlast <= '0';
      elsif s_axis_data_w.tvalid = '1' and s_axis_data_w.tkeep = "11" and m_axis_data_r.tready = '1' then  --what if tvalid drops?!!!!!!!
          data_cnt <= data_cnt + 1;
          if data_cnt >= 31 and data_cnt < 63 then --create a valid signal for State SR
              stateSR <= '1';
          else
              stateSR <= '0';    
          end if;
          
          if data_cnt = 62 then                    --create a tlast signal for State SR
              stateSR_tlast <= '1';
          else
              stateSR_tlast <= '0';
          end if;
          
      end if;     

      if stateSR = '1' and m_axis_data_r.tready = '1' then
          wr_cnt <= wr_cnt + 1;
          rd_cnt <= rd_cnt + 1;          
      end if;                       
  end if;
  end process;
  
  
  --During the last 32 clk cycles of an input packet store the last 32 data of wire N and
  -- readout the previously stored 32 data of wire N+1
  stateRAM_inst : RAM_2048x12
  PORT MAP (
    clka   => clk,
    wea(0) => stateSR,
    addra  => std_logic_vector(wr_cnt),
    dina   => s_axis_data_w.tdata(11 downto 0),
    clkb   => clk,
    enb    => stateSR,
    addrb  => std_logic_vector(rd_cnt),
    doutb  => stateRAMOut
  );


  --Delay for 1 clk so they match the RAM output
  process(clk)
  begin
  if rising_edge(clk) then
    if reset = '1' then
        s_stateSR       <= '0';
        s_stateSR_tlast <= '0';  
    elsif m_axis_data_r.tready = '1' then
        s_stateSR       <= stateSR;       --used as tvalid for the FIR input
        s_stateSR_tlast <= stateSR_tlast; --used as  tlast for the FIR input  
    end if;         
  end if;
  end process;
 
 
  stateRestore_w.tdata  <= std_logic_vector( resize( signed(stateRAMOut), 16) );
  stateRestore_w.tvalid <= s_stateSR;
  stateRestore_w.tlast  <= s_stateSR_tlast;
  stateRestore_w.tkeep    <= "00";         --Not used  ==> should edit pckg to initialise values there!!!!!!!!!!!
  stateRestore_w.tuser(0) <= '0';          --Not used
  
  --CLK_EN tst
--  process(clk)
--  begin
--  if rising_edge(clk) then  
--      if reset = '1' then
--          s_enable <= '0'; 
--      elsif m_axis_data_r.tready = '1' then
--          s_tvalid <= s_axis_data_w.tvalid; 
      
--          if s_axis_data_w.tvalid='1' and s_tvalid='0' then
--              en_cnt <= (OTHERS => '0');
--              --s_enable <= '0';
--          elsif en_cnt < 107 then
--              en_cnt <= en_cnt + 1;    
--              s_enable <= '1';
--          elsif en_cnt = 107 then
--              s_enable <= '0';    
--          end if;   
--      end if;       
--  end if;
--  end process;

end Behavioral;
