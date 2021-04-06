----------------------------------------------------------------------------------
-- Company: Rutherford Appleton Laboratory
-- Engineer: Konstantinos Manolopoulos
-- 
-- Create Date: 02/16/2020 06:22:22 PM
-- Design Name: 
-- Module Name: HitFinder_km - Behavioral
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

use work.dtpc_stream_defs.all; -- Definitions of AXI4S 


entity HitFinder_km is
  Port (
      clk          : in std_logic;
      reset        : in std_logic; 
      threshold    : in std_logic_vector(15 downto 0); 
      
      axis_in_w    : in dtpc_axis4_w; 
      axis_in_r    : out dtpc_axis4_r; 
      
      packet_out_w : out dtpc_axis4_w;
      packet_out_r : in dtpc_axis4_r     
  );
end HitFinder_km;

architecture Behavioral of HitFinder_km is


-----------------------------------------------------------------------
-- Signal Declaration                                                
-----------------------------------------------------------------------
  --signal threshold : unsigned(15 downto 0) :="0000000000010100"; 
  
  signal s_tready : std_logic := '0';
  signal s_enable : std_logic := '0';
  
  
  signal s0_tdata,  s1_tdata : std_logic_vector(15 downto 0) := (others => '0');
  signal s2_tdata,  s3_tdata : std_logic_vector(15 downto 0) := (others => '0');
  signal s0_tkeep            : std_logic_vector( 1 downto 0) := (others => '0');
  signal s0_tvalid                       : std_logic :='0';
  signal s0_tlast,  s1_tlast,  s2_tlast  : std_logic :='0';
  signal s3_tlast,  s4_tlast             : std_logic :='0';
  --signal s4_tdata  : std_logic_vector(15 downto 0) := (others => '0');
  --signal s1_tvalid, s2_tvalid, s3_tvalid, s4_tvalid : std_logic :='0';
  --signal s0_tuser,  s1_tuser,  s2_tuser,  s3_tuser,  s4_tuser  : std_logic :='0';
  --signal s1_tkeep,  s2_tkeep,  s3_tkeep,  s4_tkeep  : std_logic_vector( 1 downto 0) := (others => '0');
  
  signal s_current_ADCval  : std_logic_vector(15 downto 0) := (others => '0');  
  signal cnt               : unsigned(2 downto 0)          := (others => '0');
  signal HitInProgress     : std_logic := '0';
  signal s_HitInProgress   : std_logic := '0';
  signal s1_HitInProgress  : std_logic := '0';  
  --signal HitContinue_flag  : std_logic := '0';
  signal s_HitContinue     : std_logic_vector(15 downto 0) := (others =>'0');

  signal s0_currentPos     : unsigned(5 downto 0) := (others => '0');
  signal s1_currentPos     : unsigned(5 downto 0) := (others => '0');
  signal s2_currentPos     : unsigned(5 downto 0) := (others => '0');
  signal s3_currentPos     : unsigned(5 downto 0) := (others => '0');
  signal s_max_ADCval_pos  : unsigned(5 downto 0) := (others => '0');
  signal s1_max_ADCval_pos : unsigned(5 downto 0) := (others => '0');
  signal s_max_ADCval      : std_logic_vector(15 downto 0) := "0000000000010100"; --?????????????
  signal s1_max_ADCval     : std_logic_vector(15 downto 0) := "0000000000010100";
  signal s3_current_ADCval : std_logic_vector(15 downto 0) := (others => '0');
  signal sum_ADCval        : std_logic_vector(15 downto 0) := (others => '0');
  signal s_sum_ADCval      : std_logic_vector(15 downto 0) := (others => '0');
  
  signal HitStart_strobe : std_logic := '0';
  signal HitEnd_strobe   : std_logic := '0';
  signal s_HitStart_time : unsigned(5 downto 0) := (others => '0');
  signal s_HitEnd_time   : unsigned(5 downto 0) := (others => '0');
  signal muxout_cnt      : unsigned(2 downto 0) := (others => '0');
  signal HitStartval     : std_logic_vector(15 downto 0) := (others => '0');  
  signal HitEndval       : std_logic_vector(15 downto 0) := (others => '0');  
  signal HitPeaktime     : std_logic_vector(15 downto 0) := (others => '0'); 

  signal s_muxout_valid : std_logic := '0';
  signal s0_tlast_o, s1_tlast_o, s2_tlast_o, s3_tlast_o, s4_tlast_o, s5_tlast_o     : std_logic := '0'; 
  signal s0_earlyHit_tlast, s1_earlyHit_tlast, s2_earlyHit_tlast, s3_earlyHit_tlast : std_logic := '0';
  signal s4_earlyHit_tlast, s5_earlyHit_tlast, s6_earlyHit_tlast                    : std_logic := '0';


-----------------------------------------------------------------------
-- Main body of code
-----------------------------------------------------------------------
begin


  -----------------------------------------------------------------------
  -- tready logic
  -----------------------------------------------------------------------
  s_tready         <= packet_out_r.tready;
  axis_in_r.tready <= '0' when (reset='1' or s_tready='0') else '1' when s_tready='1';

  
  -----------------------------------------------------------------------
  -- Input Registers
  -----------------------------------------------------------------------
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then
          s0_tvalid <= '0';
          s0_tdata  <= (others => '0'); s1_tdata  <= (others => '0');
          s2_tdata  <= (others => '0'); s3_tdata  <= (others => '0');
          s0_tkeep  <= (others => '0');
          s0_tlast  <= '0';
          --s0_tuser  <= '0';
      elsif s_tready = '1' then
          s0_tvalid <= axis_in_w.tvalid;
          --s1_tvalid <= s0_tvalid;  s2_tvalid <= s1_tvalid;
          --s3_tvalid <= s2_tvalid;  s4_tvalid <= s3_tvalid;
      
          s0_tdata <= axis_in_w.tdata;
          s1_tdata <= s0_tdata; 
          s2_tdata <= s1_tdata;
          s3_tdata <= s2_tdata;
          --s4_tdata <= s3_tdata;
      
          s0_tkeep <= axis_in_w.tkeep;
          --s1_tkeep <= s0_tkeep;  s2_tkeep <= s1_tkeep;
          --s3_tkeep <= s2_tkeep;  s4_tkeep <= s3_tkeep;

          s0_tlast <= axis_in_w.tlast;
          s1_tlast <= s0_tlast;
          s2_tlast <= s1_tlast;
          s3_tlast <= s2_tlast;
          s4_tlast <= s3_tlast;
     
          --s0_tuser <= axis_in_w.tuser(0);
          --s1_tuser <= s0_tuser; s2_tuser <= s1_tuser;
          --s3_tuser <= s2_tuser; s4_tuser <= s3_tuser;
      end if;    
  end if;
  end process;
  
  
  s_enable <= '1' when s0_tvalid ='1' and s0_tkeep="11" else '0';    
  -----------------------------------------------------------------------
  -- Decide if there is a Hit or a HitContinue
  -----------------------------------------------------------------------
  s_current_ADCval <= s0_tdata;
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then
          cnt               <= (others => '0');
          s_HitInProgress   <= '0';
          s1_HitInProgress  <= '0';          
          s_HitContinue     <= (others => '0');
          --HitContinue_flag  <= '0';          
      elsif s_tready = '1' then
  
          --If 2 consecutive ADC values are above threshold it's a hit
          if to_integer(signed( s_current_ADCval )) > to_integer(signed( threshold )) and s_enable = '1' then      
              if cnt <= 2 then
                  cnt <= cnt  + 1;
              end if;            
          else
              cnt <= (others => '0');                                          
          end if;
              
          if cnt >= 2 then
              s_HitInProgress <= '1';
          else    
              s_HitInProgress <= '0';
          end if;                                           
          s1_HitInProgress <= s_HitInProgress;           
      
          --If for last ADC val there's a HitInProgress ==> HitContinue
          if s3_tlast = '1' and s1_HitInProgress = '1' then
              --HitContinue_flag <= '1'; 
              s_HitContinue    <= "0000000000000001";
              cnt              <= (others => '0');    
          elsif s5_tlast_o = '1' then 
              --HitContinue_flag <= '0';
              s_HitContinue    <= (others => '0');    
          end if;
      
      end if;
      
  end if;
  end process;
  
  --HitInProgress singal in sync with s4_tdata (in case we want to have 3 ADCs>Threshold to register a hit)
  --HitInProgress <= s_HitInProgress or s1_HitInProgress or s2_HitInProgress;
  --In sync with s3_tdata
  HitInProgress   <= s_HitInProgress or s1_HitInProgress;      
  HitStart_strobe <= (s_HitInProgress xor s1_HitInProgress) and s_HitInProgress;
  HitEnd_strobe   <= (s_HitInProgress xor s1_HitInProgress) and s1_HitInProgress; 
  
  
  -----------------------------------------------------------------------
  -- Calculate Hit Values
  -----------------------------------------------------------------------   
  s3_current_ADCval <= s3_tdata;
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then
          s0_currentPos <= (others => '0'); s1_currentPos <= (others => '0');
          s2_currentPos <= (others => '0'); s3_currentPos <= (others => '0');          
          s_max_ADCval_pos <= (others => '0');
          s_max_ADCval     <= (others => '0');
          sum_ADCval       <= (others => '0');
      elsif s_tready = '1' then 
      
          if s_enable =  '1' then                  --6 bit counter to track the position (clk-tick) of each ADC val
              s0_currentPos <= s0_currentPos + 1;  --Delay it by 3 clks to match s3_tdata/HitInProgress
          end if;
          s1_currentPos <= s0_currentPos;          
          s2_currentPos <= s1_currentPos;     
          s3_currentPos <= s2_currentPos;
          
          --Calculate Peak value & Peak time     
          if to_integer(signed( s3_current_ADCval )) > to_integer(signed( s_max_ADCval )) and HitInProgress = '1' then
              s_max_ADCval     <= s3_current_ADCval;
              s_max_ADCval_pos <= s3_currentPos;
          end if; 
          
          --Calculate ADC sum                        
          if HitInProgress = '1' then
              sum_ADCval <= std_logic_vector( signed(sum_ADCval) + signed(s3_current_ADCval) );
          end if; 
          
          --if s5_tlast_o = '1' or s6_earlyHit_tlast = '1' then !!!!!!!!!!!!!
          if s5_tlast_o = '1' or s0_earlyHit_tlast = '1' then
              s_max_ADCval_pos <= (others => '0');
              s_max_ADCval     <= (others => '0');
              sum_ADCval       <= (others => '0');
          end if;    
                  
      end if;                     
  end if;
  end process;
  
  
  -----------------------------------------------------------------------
  -- Output Hit Values
  -----------------------------------------------------------------------  
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then            
          s_HitStart_time <= (others => '0');
          s_HitEnd_time   <= (others => '0');
          muxout_cnt      <= "110";
          s_muxout_valid  <= '0';
                            
      elsif s_tready = '1' then 
      
          if HitStart_strobe = '1' then
              s_HitStart_time <= s3_currentPos;
          end if;
      
          if HitEnd_strobe = '1' then
              s_HitEnd_time <= s3_currentPos;
          end if;
          
          --!!!!!!!!NEW!!!!
          if s0_earlyHit_tlast = '1' then
              s_sum_ADCval      <= sum_ADCval;
              s1_max_ADCval_pos <= s_max_ADCval_pos;
              s1_max_ADCval     <= s_max_ADCval;
          end if;
          
          
          if HitEnd_strobe = '1' then
              muxout_cnt <= (others => '0');
              --s_muxout_valid <= '0';                                      
          elsif muxout_cnt < 6 then    
              muxout_cnt <= muxout_cnt + 1;
              s_muxout_valid <= '1';
          elsif muxout_cnt = 6 then    
              s_muxout_valid <= '0';
          end if;                    
      end if;    
  end if;
  end process;
  
  
  HitStartval   <= "0000000000" & std_logic_vector(s_HitStart_time);
  HitEndval     <= "0000000000" & std_logic_vector(s_HitEnd_time);
  --HitPeaktime   <= "0000000000" & std_logic_vector(s_max_ADCval_pos);
  HitPeaktime   <= "0000000000" & std_logic_vector(s1_max_ADCval_pos);
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then
            packet_out_w.tdata <= (others => '0');
      elsif s_tready = '1' then
          if muxout_cnt = 0 then
              packet_out_w.tdata <= HitStartval; 
          elsif muxout_cnt = 1 then
              packet_out_w.tdata <= HitEndval;
          elsif muxout_cnt = 2 then
              --packet_out_w.tdata <= s_max_ADCval;
              packet_out_w.tdata <= s1_max_ADCval;
          elsif muxout_cnt = 3 then
              packet_out_w.tdata <= HitPeaktime;
          elsif muxout_cnt = 4 then
              ------packet_out_w.tdata <= sum_ADCval;
              packet_out_w.tdata <= s_sum_ADCval;
          elsif muxout_cnt = 5 then
              packet_out_w.tdata <= s_HitContinue;          
          end if;              
      end if;                     
  end if;
  end process;
  
  
  packet_out_w.tvalid   <= s_muxout_valid or s5_tlast_o;
  packet_out_w.tkeep    <= s_muxout_valid & s_muxout_valid;
  packet_out_w.tlast    <= s5_tlast_o;
  packet_out_w.tuser(0) <= s6_earlyHit_tlast;

  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then
          s0_tlast_o <= '0'; s1_tlast_o <= '0'; s2_tlast_o <= '0'; 
          s3_tlast_o <= '0'; s4_tlast_o <= '0'; s5_tlast_o <= '0'; 
          s0_earlyHit_tlast <= '0'; s1_earlyHit_tlast <= '0'; s2_earlyHit_tlast <= '0';
          s3_earlyHit_tlast <= '0'; s4_earlyHit_tlast <= '0'; s5_earlyHit_tlast <= '0';
          s6_earlyHit_tlast <= '0'; 
      elsif s_tready = '1' then 
          s0_tlast_o <= s4_tlast;
          s1_tlast_o <= s0_tlast_o;
          s2_tlast_o <= s1_tlast_o;
          s3_tlast_o <= s2_tlast_o;
          s4_tlast_o <= s3_tlast_o;
          s5_tlast_o <= s4_tlast_o;
          
          s0_earlyHit_tlast <= HitEnd_strobe;
          s1_earlyHit_tlast <= s0_earlyHit_tlast;
          s2_earlyHit_tlast <= s1_earlyHit_tlast;
          s3_earlyHit_tlast <= s2_earlyHit_tlast;
          s4_earlyHit_tlast <= s3_earlyHit_tlast;
          s5_earlyHit_tlast <= s4_earlyHit_tlast;
          s6_earlyHit_tlast <= s5_earlyHit_tlast;
      end if;    
  end if;
  end process;


end Behavioral;