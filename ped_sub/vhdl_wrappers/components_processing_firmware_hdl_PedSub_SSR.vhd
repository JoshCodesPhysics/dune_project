----------------------------------------------------------------------------------
-- Company: Rutherford Appleton Laboratory 
-- Engineer: Konstantinos Manolopoulos
-- 
-- Create Date: 06/08/2020 07:09:37 PM
-- Design Name: 
-- Module Name: PedSub_SSR - Behavioral
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


entity PedSub_SSR is
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
end PedSub_SSR;


architecture Behavioral of PedSub_SSR is


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


signal s_tvalid, s1_tvalid, s2_tvalid : std_logic := '0';
signal s_tlast, s1_tlast, s2_tlast    : std_logic := '0'; 
signal s3_tlast, s4_tlast             : std_logic := '0';
signal s_tuser, s1_tuser, s2_tuser    : std_logic := '0';
signal s_tready                       : std_logic := '0';
signal s_tkeep                        : std_logic := '0';
signal s1_tkeep, s2_tkeep             : std_logic_vector( 1 downto 0) := (OTHERS => '0');
signal s_tdata, s1_tdata              : std_logic_vector(11 downto 0) := (OTHERS => '0');

--signal updating    : std_logic := '1';
signal median      : std_logic_vector(11 downto 0) := "000111110100"; --500
signal accumulator : std_logic_vector(11 downto 0) := (OTHERS => '0');

signal targetValue     : std_logic_vector(11 downto 0) := "000000001001"; --set value to 9
signal neg_targetValue : std_logic_vector(11 downto 0) := "111111110111"; --set value to -9
signal m_axis_tdata    : std_logic_vector(11 downto 0) := (OTHERS => '0');

--state save/restore
signal channel_cnt        : unsigned(5 downto 0)          := (OTHERS => '0'); 
signal median_RamOut      : std_logic_vector(11 downto 0) := (OTHERS => '0');
signal accumulator_RamOut : std_logic_vector(11 downto 0) := (OTHERS => '0');

signal pedSub_median_out  : std_logic_vector(11 downto 0) := "000111110100";
signal pedSub_accum_out   : std_logic_vector(11 downto 0) := (OTHERS => '0');
signal s_pedSub_valid     : std_logic := '0';


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
          s3_tlast  <= s2_tlast;
          s4_tlast  <= s3_tlast;
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

     elsif s_tvalid = '0' and s_tkeep = '0' and s3_tlast = '1' then        
         median            <= median_RamOut;
         accumulator       <= accumulator_RamOut;
         pedSub_median_out <= median_RamOut;       --PedSub values for validation 
         pedSub_accum_out  <= accumulator_RamOut;  --PedSub values for validation
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
  
  
  -----------------------------------------------------------------------------
  -- State Save/Restore
  -----------------------------------------------------------------------------
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
    qdpo      => median_RamOut
  );

  accum_distRAM_inst : distRAM_64x12
  PORT MAP (
    a         => std_logic_vector(channel_cnt),
    d         => accumulator,
    dpra      => std_logic_vector(channel_cnt),
    clk       => clk,
    we        => s1_tlast,
    qdpo_srst => reset,
    qdpo      => accumulator_RamOut
  );
  

  --PedSub values for validation
  --Detect tvalid rising edge of a packet and send Median & Accum values to PedValues_tx block
  s_pedSub_valid  <= '1' when s_axis_data_w.tvalid = '1' and s1_tvalid='0' else '0';
  --pedSub_median <= pedSub_median_out;
  --pedSub_accum  <= pedSub_accum_out;
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then
          pedSub_median <= "000111110100"; 
          pedSub_accum  <= (others => '0');
          ------------pedSub_valid  <= '0';
      elsif s_tready = '1' then  
          pedSub_valid <= s_pedSub_valid;
      
          if s_pedSub_valid = '1' then
              pedSub_median <= pedSub_median_out;
              pedSub_accum  <= pedSub_accum_out;       
          end if;
      end if;
  end if;
  end process;
    
  

end Behavioral;