----------------------------------------------------------------------------------
-- Company: Rutherford Appleton Laboratory
-- Engineer: Konstantinos Manolopoulos 
-- 
-- Create Date: 06/26/2020 06:40:09 PM
-- Design Name: 
-- Module Name: PedValues_tx - Behavioral
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

use work.dtpc_stream_defs.all; -- Definitions of AXI4S 


entity PedValues_tx is
  Port ( 
    clk           : in  std_logic;
    reset         : in  std_logic;
    --PedSub validation signals
    pedSub_valid  : in  std_logic;
    pedSub_median : in  std_logic_vector(11 downto 0);
    pedSub_accum  : in  std_logic_vector(11 downto 0);
    --HF block output signals
    s_axis_data_w      : in  dtpc_axis4_w;
    s_axis_data_r      : out dtpc_axis4_r; 
  
    --PedValues_tx output
    m_axis_data_w : out dtpc_axis4_w;
    m_axis_data_r : in  dtpc_axis4_r
  );
end PedValues_tx;

architecture Behavioral of PedValues_tx is


  signal s_tready    : std_logic := '0';

  signal s0_PedValid : std_logic := '0';
  signal waitforHits : std_logic := '0';
  signal cnt_clear   : std_logic := '0';
  signal cnt_incr    : std_logic := '0';
  signal cnt         : unsigned(4 downto 0) := (others => '0');

  signal s0_tdata  : std_logic_vector(11 downto 0) := (others => '0');
  signal s0_tkeep  : std_logic_vector( 1 downto 0) := (others => '0');
  signal s0_tvalid : std_logic := '0';
  signal s0_tuser  : std_logic := '0';
  signal s0_tlast  : std_logic := '0';
  signal s1_tlast, s2_tlast, s3_tlast, s4_tlast : std_logic := '0';
  signal s5_tlast, s6_tlast, s7_tlast, s8_tlast : std_logic := '0';
  signal s9_tlast, s10_tlast : std_logic := '0';

  signal s_tdata_o  : std_logic_vector(15 downto 0) := (others => '0');
  signal s_tkeep_o  : std_logic_vector( 1 downto 0) := (others => '0');
  signal s_tvalid_o : std_logic := '0';
  signal s_tuser_o  : std_logic := '0';
  signal s_tlast_o  : std_logic := '0';
  
  signal pedVal_tx       : std_logic := '0';
  signal pedVal_tvalid_o : std_logic := '0';
  signal cnt_pedVal : unsigned(2 downto 0) := (others => '1');
  
  

begin

  -----------------------------------------------------------------------
  -- tready logic 
  -----------------------------------------------------------------------
  s_tready             <= m_axis_data_r.tready;
  s_axis_data_r.tready <= '0' when reset='1' else s_tready;


  -----------------------------------------------------------------------
  -- Ped Values Tx
  -----------------------------------------------------------------------
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then       
          s0_PedValid  <= '0'; 
          s0_tdata <=(others => '0'); s0_tkeep <= "00";
          s0_tvalid <= '0'; s0_tuser <= '0'; 
          s0_tlast <= '0'; s1_tlast <= '0'; s2_tlast <= '0'; s3_tlast <= '0'; 
          s4_tlast <= '0'; s5_tlast <= '0'; s6_tlast <= '0'; s7_tlast <= '0';
          s8_tlast <= '0'; s9_tlast <= '0'; s10_tlast <= '0';
      elsif s_tready = '1' then
          s0_PedValid  <= pedSub_valid;
          
          s0_tvalid  <= s_axis_data_w.tvalid;
          s0_tdata   <= s_axis_data_w.tdata(11 downto 0);
          s0_tkeep   <= s_axis_data_w.tkeep;
          s0_tuser   <= s_axis_data_w.tuser(0);
          s0_tlast   <= s_axis_data_w.tlast;          
          s1_tlast   <= s0_tlast;
          s2_tlast   <= s1_tlast;
          s3_tlast   <= s2_tlast;
          s4_tlast   <= s3_tlast;          
          s5_tlast   <= s4_tlast;
          s6_tlast   <= s5_tlast;
          s7_tlast   <= s6_tlast;
          s8_tlast   <= s7_tlast;
          s9_tlast   <= s8_tlast;
          s10_tlast  <= s9_tlast;
      end if;          
  end if;
  end process;

  --cnt clears with PedValid  => beginning of the packet that corresponds to Ped values
  --cnt increments with tuser => hence only when there's at least 1 hit
  cnt_clear <= s0_PedValid;
  cnt_incr  <= s_axis_data_w.tuser(0);
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then       
          cnt         <= (others => '1');
          waitforHits <= '0';    
          pedVal_tx   <= '0';
          waitforHits <= '0';
          cnt_pedVal  <= (others => '1');
          pedVal_tvalid_o <= '0';
          
      elsif s_tready = '1' then
          
          if cnt_clear = '1' then
              cnt <= (others => '0');
          elsif cnt_incr = '1' then
              cnt <= cnt + 1;
          end if;
         
          if cnt_clear = '1' then
              waitforHits <= '1';
          end if;

        
          if waitforHits = '1' then              
              if cnt >= 1 then
                  if s1_tlast = '1' then --s0_tlast
                      pedVal_tx <= '1';
                  end if;              
              
                  if s1_tlast = '1' then --s0_tlast
                      cnt_pedVal <= (others => '0');
                  elsif cnt_pedVal < 6 then
                      cnt_pedVal <= cnt_pedVal + 1;
                      pedVal_tvalid_o <= '1';
                  elsif cnt_pedVal = 6 then
                      pedVal_tvalid_o <= '0';    
                  end if;              
               
              
                  if pedVal_tx = '0' then
                      s_tvalid_o <= s0_tvalid and s0_tkeep(0);
                      s_tdata_o  <= "0000" & s0_tdata;                      
                      s_tkeep_o  <= s0_tkeep;
                      s_tuser_o  <= s0_tuser;
                  else
                      if cnt_pedVal = 0 then
                          s_tdata_o <= "1111" & pedSub_median; --add prefix F  
                      elsif cnt_pedVal = 1 then
                          s_tdata_o <= "1011" & pedSub_accum;  --add prefix B
                      elsif cnt_pedVal = 2 then                          
                          s_tdata_o <= "1111111011101101"; --FEED (pad words)
                      elsif cnt_pedVal = 3 then                          
                          s_tdata_o <= "1111000000001101"; --F00D    
                      elsif cnt_pedVal = 4 then                          
                          s_tdata_o <= "1101111010101101"; --DEAD
                      elsif cnt_pedVal = 5 then                          
                          s_tdata_o <= "1011111011101111"; --BEEF
                      elsif cnt_pedVal = 6 then
                          s_tdata_o <= (others => '0');
                      end if;
                                                      
                  end if;
              else --if there are no Hits just send input directly to output
                 s_tvalid_o <= s0_tvalid;
                 s_tdata_o  <= "0000" & s0_tdata;
                 s_tkeep_o  <= s0_tkeep;
                 s_tuser_o  <= s0_tuser;
                 s_tlast_o  <= s0_tlast;
              end if; 
          end if;
 
      end if;          
  end if;
  end process;


  m_axis_data_w.tdata    <= s_tdata_o;
  m_axis_data_w.tvalid   <= s_tvalid_o or pedVal_tvalid_o or s10_tlast; --s9_tlast
  m_axis_data_w.tkeep    <= s_tkeep_o  or (pedVal_tvalid_o & pedVal_tvalid_o);
  m_axis_data_w.tuser(0) <= s_tuser_o  or s8_tlast;  --s7_tlast
  m_axis_data_w.tlast    <= s_tlast_o  or s10_tlast; --s9_tlast


end Behavioral;