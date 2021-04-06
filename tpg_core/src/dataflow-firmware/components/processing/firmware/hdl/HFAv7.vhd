--Developer:Kunal Kothekar;
--Updated on Oct 24, 2019
--Hit finding algorithm to be implemented on FPGA
--Input text file of simulated hits
--version 1.8
--whats new?
--Adds complete AXI4 Protocol + hit continue feature (July 5 2019)
--Changed TREADY and control flags behaviour (Oct 24, 2019)


---------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_arith.all;

entity HFA is
  port (
    adcpulse_i         :   in std_logic_vector(15 downto 0);
    packetready_i      :   in std_logic;
    data_valid_i       :   in std_logic:= '0';
    tkeep_i            :   in std_logic_vector(1 downto 0):="00";
    tlast_i            :   in std_logic;
    tuser_i            :   in std_logic_vector(0 downto 0);
    clk_h              :   in std_logic;
    hitstart_o         :   out integer;
    hitend_o           :   out integer;
    hitpeak_o          :   out integer;
    peaktime_o         :   out integer;
    hitsum_o           :   out integer;
    hit_continue_o       :   out integer:= 0;
    hit_valid_o          :   out std_logic:= '0';
    hit_keep_o           :   out std_logic_vector(1 downto 0);
    tlast_o              :   out std_logic:= '0';
    tuser_o              :   out std_logic_vector(0 downto 0):=(others=>'0');
    tready_o             :   out std_logic := '1'
    );
end HFA;

architecture behavioral of HFA is
  signal acc:integer:=0;     --timer
  signal accsec:integer:=0;   --time recorder
  type gaul is array(natural range<>) of integer;
  signal hit:integer;
  signal thresh:integer;
  
begin

  process(clk_h)
    
    variable in_hit_v  : integer:=0;
    variable hit_ready_v : integer:=0;
    variable eventprint_v:gaul(0 to 4);
    variable eventprintread_v:gaul(0 to 4);
    variable inhibit:integer:=0;
    variable yup:integer:=0; ---1 when signal crosses the threshold
    constant savescope:integer:=10;
    variable hitsave:gaul(0 to savescope+4);
    variable hit_peak_v:integer:=0;
    variable hitsum_v:integer:=0;
    variable hitcontinue_v:integer:=0;
    
    

  begin

    if rising_edge(clk_h) then    --program loop starts at clock rising edge

--------start the timer-----------
      hit <= 0;
      

      if tlast_i = '1' then
        accsec <= 0;
        tlast_o <= '1';
      else
        tlast_o <= '0';
      end if;

      if packetready_i = '1' then
        tready_o <= '1';
      else
        tready_o<= '0';
      end if;
      
      if data_valid_i = '1' and tkeep_i = "11" then
        if packetready_i = '1' then
          accsec <= accsec+1;  --timer starts
          hit<= to_integer(signed(adcpulse_i));
          thresh<=20;  ----define the threshold
          
        end if;

      else
        accsec <= 0;

      end if;


    
      -------initialize the oput

      if hit<thresh then ---- initialize o/p to zero
        hitstart_o <= 0;
        hitend_o <= 0;
        hitpeak_o <= 0;
        peaktime_o <= 0;
        hitsum_o <= 0;
        hit_valid_o <= '0';
        hit_keep_o <= "00";
      end if;

----------take care of garbage oput-----------------
      
      if((inhibit=1 or hit<thresh or hit_ready_v=0) and hitsave(0)/=hit) then
        hitstart_o <= 0;
        hitend_o <= 0;
        hitpeak_o <= 0;
        peaktime_o <= 0;
        hitsum_o <= 0;
        hit_valid_o <= '0';
        hit_keep_o <= "00";
        inhibit:=0;
      end if;

      --------------save the incoming data--------------------
      
      for k in savescope downto 1 loop
        hitsave(k):=hitsave(k-1);
      end loop;
      hitsave(0):=hit; ---put the new incoming data in bin 0

      

      ---part 1 when signal breaches the threshold

      if hit>=thresh and inhibit=0 and hitsave(1)<thresh then
        eventprint_v(0):=accsec; --time stored
        eventprintread_v(0):=eventprint_v(0);
        in_hit_v := 1;
        hitstart_o <= eventprint_v(0);
        inhibit:=1;
      end if;


      --part 2 when signal comes below threshold

      if hit<thresh and hitsave(1)>=thresh then
        hit_ready_v := 1;
        in_hit_v := 0;
        eventprint_v(1):=accsec; --time stored
        eventprintread_v(1):=eventprint_v(1);
      end if;


      ---part 3 peak finder
      if hit>=thresh and in_hit_v=1 then
        if hit>hit_peak_v then
          hit_peak_v:=hit;
          eventprint_v(2):=accsec; --time stored
          eventprintread_v(2):=eventprint_v(2);
        end if;
      end if;

      ---part 4 running sum
      if hit>=thresh and in_hit_v=1 then
        hitsum_v:=hitsum_v+hit;
      end if;

      --part 5 hit continue
      --if (hit>=thresh and in_hit_v=1) and tlast_i ='1' then
      --hitcontinue_v := 1;
      --else
      --hitcontinue_v := 0;
      --end if;

      -- Send hit out

      if hit_ready_v = 1 and in_hit_v = 0 and packetready_i='1' then
        hitstart_o <= eventprint_v(0);
        hitend_o <= eventprint_v(1);
        peaktime_o <= eventprint_v(2);
        hitpeak_o <= hit_peak_v;
        hitsum_o <= hitsum_v;
        hit_continue_o <= 0;
        hit_valid_o<='1';
        hit_keep_o <= "11";
        hit_ready_v:=0;
        inhibit:=1;
        
      end if;

      -- If hit spills over or hit continue

      if tlast_i = '1' then
        if hit_ready_v = 0 and in_hit_v = 1 and packetready_i= '1' then
          hitstart_o <= eventprint_v(0);
          hitend_o <= eventprint_v(1);
          peaktime_o <= eventprint_v(2);
          hitpeak_o <= hit_peak_v;
          hitsum_o <= hitsum_v;
          hit_continue_o <= 1;
          hit_valid_o<='1';
          hit_keep_o <= "11";
        -- hit_ready_v:=0;
        --inhibit:=1;
        end if;
      end if;

      

      

      
    end if;


  end process;


end behavioral;











