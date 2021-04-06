----------------------------------------------------------------------------------
-- Company:  Rutherford Appleton Laboratory
-- Engineer: Kostas Manolopoulos
-- 
-- Create Date: 08.05.2019 15:10:37
-- Design Name: 
-- Module Name: HeaderStripperCombiner - Behavioral
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

entity HeaderStripperCombiner is
  Port ( 
    clk               : in std_logic;
    reset             : in std_logic;
    ----------------- Header Stripper -----------------
    --Header + ADC data
    s_axis_data_w              : in  dtpc_axis4_w;
    s_axis_data_r              : out dtpc_axis4_r;
    --Single Channel TPG Input: ADC data
    singleChannelInput_w       : out dtpc_axis4_w;
    singleChannelInput_r       : in  dtpc_axis4_r;
    
    ----------------- Header Combiner -----------------
    --Single Channel TPG Output: Hits
    singleChannelOutput_w      : in  dtpc_axis4_w;
    singleChannelOutput_r      : out dtpc_axis4_r;
    --Header + Hits    
    m_axis_data_w              : out dtpc_axis4_w;
    m_axis_data_r              : in  dtpc_axis4_r
  );
end HeaderStripperCombiner;

architecture Behavioral of HeaderStripperCombiner is


-----------------------------------------------------------------------
-- Signal Declaration                                                
-----------------------------------------------------------------------
signal flag0 : std_logic := '0';

signal endOfHeader: std_logic := '0';
signal header_reg : std_logic_vector(15 downto 0) := (others => '0');

signal ADCdata_tvalid, s_ADCdata_tvalid : std_logic := '0';
signal ADCdata_tdata, s_ADCdata_tdata   : std_logic_vector(15 downto 0) := (others => '0');
signal ADCdata_tkeep, s_ADCdata_tkeep   : std_logic_vector( 1 downto 0) := (others => '0');
signal ADCdata_tuser, s_ADCdata_tuser   : std_logic_vector( 0 downto 0) := (others => '0');
signal ADCdata_tlast, s_ADCdata_tlast   : std_logic := '0';

signal headerShiftReg_ce       : std_logic := '0';
signal headerShiftReg_ceStr    : std_logic := '1';
signal headerShiftReg_ceComb   : std_logic := '0';
signal s_headerShiftReg_ceComb : std_logic := '0';
signal s_headerShiftReg_ceStr  : std_logic := '0'; 
signal header_shiftReg0, header_shiftReg1, header_shiftReg2 : std_logic_vector(15 downto 0) := (others => '0');
signal header_shiftReg3, header_shiftReg4, header_shiftReg5 : std_logic_vector(15 downto 0) := (others => '0');

signal endOfCombineHeader : std_logic := '0';
signal cnt                : unsigned(2 downto 0) := (others => '0');

signal s0_HitData_tvalid, s1_HitData_tvalid, s2_HitData_tvalid, s3_HitData_tvalid : std_logic := '0';
signal s4_HitData_tvalid, s5_HitData_tvalid, s6_HitData_tvalid                    : std_logic := '0'; 
signal s0_HitData_tlast, s1_HitData_tlast, s2_HitData_tlast, s3_HitData_tlast     : std_logic := '0';
signal s4_HitData_tlast, s5_HitData_tlast, s6_HitData_tlast                       : std_logic := '0'; 
signal s0_HitData_tuser, s1_HitData_tuser, s2_HitData_tuser, s3_HitData_tuser     : std_logic := '0';
signal s4_HitData_tuser, s5_HitData_tuser, s6_HitData_tuser                       : std_logic := '0'; 
signal s0_HitData_tkeep                                                           : std_logic_vector( 1 downto 0) := (others => '0');
signal s0_HitData_tdata, s1_HitData_tdata, s2_HitData_tdata, s3_HitData_tdata     : std_logic_vector(15 downto 0) := (others => '0');
signal s4_HitData_tdata, s5_HitData_tdata, s6_HitData_tdata                       : std_logic_vector(15 downto 0) := (others => '0');

signal muxout_sel                   : std_logic := '0';
signal headerComb_valid             : std_logic := '0';
signal Header_tuser, s_Header_tuser : std_logic := '0';



-----------------------------------------------------------------------
-- Main body of code
-----------------------------------------------------------------------
begin

  -----------------------------------------------------------------------
  -- tready logic
  -----------------------------------------------------------------------
  singleChannelOutput_r.tready <= '0' when (reset='1' or headerShiftReg_ceComb='1') else '1' when m_axis_data_r.tready='1' else '0';
  
  --s_axis_tready goes to 0 after receiving a packet and 
  --back to 1 after the TPG block send tlast  
  s_axis_data_r.tready <= '1' when singleChannelInput_r.tready='1' and flag0='0' else '0' when reset='1' else '0';  
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then
          flag0 <= '0';      
      elsif s_axis_data_w.tlast = '1' and singleChannelInput_r.tready='1' then
        flag0 <= '1';
      elsif singleChannelOutput_w.tlast = '1' and m_axis_data_r.tready='1' then
        flag0 <= '0';
      end if;            
  end if;
  end process;


  -----------------------------------------------------------------------
  -- Header Stripper
  -----------------------------------------------------------------------
  process(clk)
  begin
      if rising_edge(clk) then
          if reset = '1' then
              endOfHeader          <= '0';              
              headerShiftReg_ceStr <= '0';
          --During Header Frame store header data to a shift reg 
          --when Header Frame ends set endOfHeader flag to '1' and the shift reg ce to '0'   
          elsif s_axis_data_w.tvalid = '1' and s_axis_data_w.tkeep = "11" and endOfHeader = '0' and singleChannelInput_r.tready = '1' and flag0='0' then
          
              header_reg <= s_axis_data_w.tdata;
              
              if s_axis_data_w.tuser(0) = '1' and s_axis_data_w.tlast = '0' then
                 endOfHeader          <= '1';   
                 headerShiftReg_ceStr <= '0';
              else
                 endOfHeader          <= '0';
                 headerShiftReg_ceStr <= '1';  --if end of Header hasn't been reached set ce='1' to store Header to the shift reg                
              end if;     
          --after the end of Header send Data Frame to the TPG              
          elsif s_axis_data_w.tvalid = '1' and s_axis_data_w.tkeep = "11" and endOfHeader = '1' and singleChannelInput_r.tready = '1' and flag0='0' then
              ADCdata_tvalid <= s_axis_data_w.tvalid;  
              ADCdata_tdata  <= s_axis_data_w.tdata;
              ADCdata_tkeep  <= s_axis_data_w.tkeep;
              ADCdata_tuser  <= s_axis_data_w.tuser;
              ADCdata_tlast  <= s_axis_data_w.tlast;  
                                          
              if s_axis_data_w.tlast = '1' then
                  endOfHeader       <= '0'; --at the end of Data Frame set endOfHeader flag back to '0' for the next packet                              
              end if;                       
           --else
           elsif flag0='1' and singleChannelInput_r.tready = '1' then
               --need to set to zero here otherwise they will remain '1' after exiting previous if-statement
               ADCdata_tvalid   <= '0';
               ADCdata_tlast    <= '0';   
               ADCdata_tkeep    <= "00";
               ADCdata_tuser(0) <= '0';                                    
          end if;          
                                                     
      end if;
  end process;
  
  
  --Output signals to TPG
  process(clk)
  begin
  if rising_edge(clk) then
      if singleChannelInput_r.tready = '1' then
          s_ADCdata_tvalid <= ADCdata_tvalid;                                           
          s_ADCdata_tdata  <= ADCdata_tdata;
          s_ADCdata_tkeep  <= ADCdata_tkeep;
          s_ADCdata_tuser  <= ADCdata_tuser;
          s_ADCdata_tlast  <= ADCdata_tlast;
      end if;
  end if;
  end process;
  singleChannelInput_w.tvalid <= s_ADCdata_tvalid;                                           
  singleChannelInput_w.tdata  <= s_ADCdata_tdata;
  singleChannelInput_w.tkeep  <= s_ADCdata_tkeep;
  singleChannelInput_w.tuser  <= s_ADCdata_tuser;
  singleChannelInput_w.tlast  <= s_ADCdata_tlast;



  --Store Header
  --Shift reg ce is controlled by both the Header Stripper & Header Combiner  
  s_headerShiftReg_ceComb <= headerShiftReg_ceComb and m_axis_data_r.tready;
  s_headerShiftReg_ceStr  <= headerShiftReg_ceStr and singleChannelInput_r.tready;  
  headerShiftReg_ce <= s_headerShiftReg_ceStr or s_headerShiftReg_ceComb;
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then
          header_shiftReg0 <= ( others => '0'); 
      elsif headerShiftReg_ce = '1' then        
          header_shiftReg0 <= header_reg;
          header_shiftReg1 <= header_shiftReg0;
          header_shiftReg2 <= header_shiftReg1;
          header_shiftReg3 <= header_shiftReg2;
          header_shiftReg4 <= header_shiftReg3;          
          --header_shiftReg5 <= header_shiftReg4;
      end if; 
      if m_axis_data_r.tready ='1' then
          header_shiftReg5 <= header_shiftReg4;
      end if;
  end if;
  end process;



  -----------------------------------------------------------------------
  -- Header Combiner
  -----------------------------------------------------------------------
  --Delay Hit Data for 6 cycles
  process(clk)
  begin
  if rising_edge(clk) then 
      if reset = '1' then
          s0_HitData_tdata  <= (others => '0');
          s0_HitData_tkeep  <= (others => '0');
          s0_HitData_tvalid <= '0';
          s0_HitData_tlast  <= '0';
          s0_HitData_tuser  <= '0';
      elsif m_axis_data_r.tready = '1' then          
          s0_HitData_tdata  <= singleChannelOutput_w.tdata;    
          s0_HitData_tvalid <= singleChannelOutput_w.tvalid;            
          s0_HitData_tlast  <= singleChannelOutput_w.tlast;
          s0_HitData_tkeep  <= singleChannelOutput_w.tkeep;  
          s0_HitData_tuser  <= singleChannelOutput_w.tuser(0);

      end if;          
  end if;
  end process;
    
    
  --Header Combiner  
  process(clk)
  begin
  if rising_edge(clk) then
      if reset = '1' then 
          cnt                          <= (others => '0');
          endOfCombineHeader           <= '0';
          headerShiftReg_ceComb        <= '0';          
                   
      elsif m_axis_data_r.tready ='1' then
         -- when TPG output is valid read out the Header from the shift reg
         if endOfHeader = '1' and endOfCombineHeader = '0' then                                                         
             if cnt = 6 then
                 Header_tuser       <= '1';  --set tuser='1' for the last Header frame word                  
                 endOfCombineHeader <= '1';  --flag is raised at the last Header frame word and stays high until the end of the Data Frame                  
                 headerShiftReg_ceComb  <= '0'; 
             else
                 cnt <= cnt + 1;  
                 headerShiftReg_ceComb  <= '1'; --set ce to '1' to read out the  Header
             end if;                                
         -- after reading the Header wait until end of Data Frame   
         elsif singleChannelOutput_w.tvalid = '1' and singleChannelOutput_w.tkeep = "11" and endOfCombineHeader = '1' then                            
             headerShiftReg_ceComb <= '0';                             
             if singleChannelOutput_w.tlast = '1' then    --at the end of the Data Frame set cnt & flag back to 0 for the next packet
                 endOfCombineHeader <= '0';
             end if;    
         elsif singleChannelOutput_w.tvalid = '1' and singleChannelOutput_w.tlast = '1' then
             endOfCombineHeader <= '0';      
         else         
             Header_tuser                 <= '0';
             headerShiftReg_ceComb        <= '0';   
             cnt                          <= (others => '0');             
         end if;
     
           muxout_sel     <= headerShiftReg_ceComb; --delay shuft reg cer for 1 clk and use it as the muxOut select             
          --s_Header_tuser <= Header_tuser;          --delay Header Frame tuser for 1 clk             
     end if;       
        
  end if;
  end process;  
  --muxout_sel     <= headerShiftReg_ceComb;
  
     
  headerComb_valid <= muxout_sel;    
  --Header Combiner Output
  process(clk)
  begin
  if rising_edge(clk) then
      if m_axis_data_r.tready = '1' then          
          --Mux Header/Hits          
          if muxout_sel = '1' then
              m_axis_data_w.tdata <= header_shiftReg5;
              --m_axis_data_w.tdata <= header_shiftReg4;
          else
              m_axis_data_w.tdata <= s0_HitData_tdata;
          end if;  
          
          m_axis_data_w.tvalid   <= s0_HitData_tvalid or headerComb_valid;
          m_axis_data_w.tlast    <= s0_HitData_tlast;
          m_axis_data_w.tkeep    <= s0_HitData_tkeep or (headerComb_valid & headerComb_valid);
          m_axis_data_w.tuser(0) <= Header_tuser or s0_HitData_tuser; --s_Header_tuser
      end if;    
  end if;
  end process; 
 

end Behavioral;
