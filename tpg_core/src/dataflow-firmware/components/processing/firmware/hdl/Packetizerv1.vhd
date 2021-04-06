--Developer:Kunal Kothekar;
--Updated on Oct 24, 2019
--Packetizer to be implemented on FPGA
--Input text file of simulated hits
--version 1.3
--++ADDED Pipeline logic (5th July 2019)
--++FIXED TREADY issue (Oct 23 2019)
--The Packetizer acts as a interface between Hit finding algorithm and output
--buffer stage. It spits out 16 bit word hit quantities, with a packet denoting
--start and end of the hit word.


---------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity Packetizer is
  port (
    clk_p                : in std_logic;
    header_ready_i       : in std_logic;
    hit_last_i           : in std_logic;
    hit_user_i           : in std_logic_vector(0 downto 0);
    hit_valid_i          : in std_logic;
    hit_keep_i           : in std_logic_vector(1 downto 0);
    hitstart_i         :   in integer;
    hitend_i           :   in integer;
    hitpeak_i          :   in integer;
    peaktime_i         :   in integer;
    hitsum_i           :   in integer;
    hitcontinue_i      :   in integer;
    packet_o           :   out std_logic_vector(15 downto 0):= (others=>'0');
    packet_last_o      :   out std_logic := '0';
    packet_user_o      :   out std_logic_vector(0 downto 0):=(others=>'0');
    packet_valid_o     :   out std_logic := '0';   --AXI4 o/p
    packet_keep_o       :   out std_logic_vector(1 downto 0):= "00"; --AXI4 o/p
    packetready_o      :   out std_logic := '1'   --internal ready signal for HFA block
    );
end Packetizer;

architecture bee of packetizer is
  signal start:std_logic;

begin

  process(clk_p)

    variable hitstart_packet_v:std_logic_vector(15 downto 0);
    variable hitend_packet_v:std_logic_vector(15 downto 0);
    variable hitpeak_packet_v:std_logic_vector(15 downto 0);
    variable peaktime_packet_v:std_logic_vector(15 downto 0);
    variable hitsum_packet_v:std_logic_vector(15 downto 0);
    variable hitcontinue_packet_v:std_logic_vector(15 downto 0):= (others=>'0');
    variable opcounter_v:integer range 0 to 7 := 0;
    variable opreadybuffer:std_logic := '1';
    variable tlast_v:std_logic:= '0';
    variable tkeep_v:std_logic:= '0';
   
   

  begin

    if rising_edge(clk_p) then    --program loop starts at clock rising edge


      if header_ready_i = '1' then  --Show the readiness to other blocks
        if opreadybuffer = '1' then
          packetready_o <= '1';
        else
          packetready_o <= '0';
        end if;
      else
        packetready_o <= '0'; --KM addition
      end if;
         
      packet_valid_o <= '0';    --Initialise AXI4 control flags
      packet_keep_o  <= "00";
      tkeep_v := '0';
      packet_user_o <= "0";


      --if hit_valid_i = '0' and hit_keep_i ="00" and tlast_v = '0' then
      if hit_valid_i = '0' and hit_keep_i ="00" and tlast_v = '0' and header_ready_i='1' then --KM addition
        packet_last_o <= hit_last_i; --Take tlast AXI4 control flag from previous
        packet_o <= (others=>'0');   --Initialise output
     
      end if;
           
        
     

      --if hit_valid_i='1' and hit_keep_i = "11" and opcounter_v = 0 then
      if hit_valid_i='1' and hit_keep_i = "11" and opcounter_v = 0 and header_ready_i='1' then --KM addition
        --Get hit
        opreadybuffer := '0';
        hitstart_packet_v := std_logic_vector(to_unsigned(hitstart_i, 16));
        hitend_packet_v := std_logic_vector(to_unsigned(hitend_i, 16));
        hitpeak_packet_v := std_logic_vector(to_unsigned(hitpeak_i, 16));
        peaktime_packet_v := std_logic_vector(to_unsigned(peaktime_i, 16));
        hitsum_packet_v := std_logic_vector(to_unsigned(hitsum_i, 16));
        hitcontinue_packet_v := std_logic_vector(to_unsigned(hitcontinue_i, 16));
     
      end if;


      if opreadybuffer = '0' and header_ready_i='1'  then

        packet_keep_o <= "11";
        tkeep_v := '1';
       

        if hit_last_i='1' then
          tlast_v := '1';
        end if;
        
     
        if (opcounter_v = 0) then
          packet_o(15 downto 0) <= hitstart_packet_v(15 downto 0);
          opcounter_v := 1;
          
        elsif (opcounter_v = 1) then
          packet_o(15 downto 0) <= hitend_packet_v(15 downto 0);
          opcounter_v := 2;
        elsif (opcounter_v = 2) then
          packet_o(15 downto 0) <= hitpeak_packet_v(15 downto 0);
          opcounter_v := 3;
        elsif (opcounter_v = 3) then
          packet_o(15 downto 0)<= peaktime_packet_v(15 downto 0);
          opcounter_v := 4;
        elsif (opcounter_v = 4) then
          packet_o(15 downto 0) <= hitsum_packet_v(15 downto 0);
          opcounter_v := 5;
        elsif (opcounter_v = 5) then
          packet_o(15 downto 0) <= hitcontinue_packet_v(15 downto 0);
          packet_last_o <= tlast_v;
          packet_user_o <= "1";
          opcounter_v := 6;
        elsif (opcounter_v = 6) then  
          opcounter_v := 0;
          opreadybuffer := '1';
          tlast_v := '0';
          packet_user_o <= "0";
          packet_keep_o <= "00";
          tkeep_v := '0';
          packet_o(15 downto 0) <= (others=>'0');
        end if;
      end if;

      packet_valid_o <= tkeep_v or hit_last_i;
      

    end if;

  end process;


end bee;

       
