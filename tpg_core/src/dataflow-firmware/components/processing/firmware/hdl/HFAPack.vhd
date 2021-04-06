--Developer:Kunal Kothekar;
--May 31, 2019 (Modified on June19, 2019)
--Packetizer to be implemented on FPGA
--Input text file of simulated hits
--version 1.1
--++Addition of packetizer
--Hierarchical design for HFA and packetizer
--++Addition of AXI4 streaming i/p and o/p


---------------------------------------------

-- WARNING: RESET MISSING !!!

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use work.dtpc_stream_defs.all;

entity HFAPack is
  port (
    clk_in                  :   in std_logic;    
    axis_in_w               :   in dtpc_axis4_w;
    axis_in_r               :   out  dtpc_axis4_r; -- axis_in_r.tready
    packet_out_w            :   out dtpc_axis4_w;
    packet_out_r            :   in dtpc_axis4_r  -- packet_out_r.tready
  );
end HFAPack;

architecture Behavioral of HFAPack is

  --  signal t_CLOCK      : std_logic;
  signal t_adcpulse   : integer; 
  signal t_hitstart   : integer; 
  signal t_hitend     : integer;
  signal t_hitpeak    : integer;
  signal t_peaktime   : integer;
  signal t_hitsum     : integer;
  signal t_opready    : std_logic;
  signal t_packetready : std_logic;
  signal t_keep        : std_logic_vector(1 downto 0):="00";
  signal t_continue    : integer;
  signal t_last        : std_logic;
  signal t_user        : std_logic_vector(0 downto 0);
  --signal t_header_ready : std_logic;
  

  component Packetizer is
    port (
      clk_p              : in std_logic;
      header_ready_i     : in std_logic;
      hit_last_i         : in std_logic;
      hit_user_i         : in std_logic_vector(0 downto 0);
      hit_valid_i        : in std_logic;
      hit_keep_i         :   in std_logic_vector(1 downto 0);
      hitstart_i         :   in integer;
      hitend_i           :   in integer;
      hitpeak_i          :   in integer;
      peaktime_i         :   in integer;
      hitsum_i           :   in integer;
      hitcontinue_i      :   in integer;
      packet_o           :   out std_logic_vector(15 downto 0);
      packet_last_o      :   out std_logic;
      packet_user_o      :   out std_logic_vector(0 downto 0);
      packet_valid_o     :   out std_logic;
      packet_keep_o      :   out std_logic_vector(1 downto 0);
      packetready_o      :   out std_logic
      
      );
  end component Packetizer;

  component HFA is
    port (
      clk_h              :   in std_logic;
      adcpulse_i         :   in std_logic_vector(15 downto 0);
      packetready_i      :   in std_logic;
      data_valid_i       :   in std_logic;
      tkeep_i            :   in std_logic_vector(1 downto 0);
      tlast_i            :   in std_logic;
      tuser_i            :   in std_logic_vector(0 downto 0);
      hitstart_o         :   out integer;
      hitend_o           :   out integer;
      hitpeak_o          :   out integer;
      peaktime_o         :   out integer;
      hitsum_o           :   out integer;
      hit_continue_o     :   out integer;
      hit_valid_o        :   out std_logic;
      hit_keep_o         :   out std_logic_vector(1 downto 0);
      tlast_o            :   out std_logic;
      tuser_o            :   out std_logic_vector(0 downto 0);
      tready_o           :   out std_logic
      
      );
  end component HFA;

begin

  H1 : HFA
    port map (
      clk_h            => clk_in,
      adcpulse_i       => axis_in_w.tdata,
      packetready_i    => t_packetready,
      data_valid_i     => axis_in_w.tvalid,
      tkeep_i          => axis_in_w.tkeep,
      tlast_i          => axis_in_w.tlast,
      tuser_i          => axis_in_w.tuser,
      hitstart_o       => t_hitstart,
      hitend_o         => t_hitend,
      hitpeak_o        => t_hitpeak,
      peaktime_o       => t_peaktime,
      hitsum_o         => t_hitsum,
      hit_continue_o   => t_continue,
      hit_valid_o      => t_opready,
      hit_keep_o       => t_keep,
      tlast_o          => t_last,
      tuser_o          => t_user,
      tready_o         => axis_in_r.tready
      );
  
  P1 : Packetizer
    port map (
      clk_p              =>   clk_in,
      header_ready_i     =>   packet_out_r.tready,
      hit_last_i         =>   t_last,
      hit_user_i         =>   t_user,
      hit_valid_i        =>   t_opready,
      hit_keep_i         =>   t_keep,
      hitstart_i         =>   t_hitstart,
      hitend_i           =>   t_hitend,
      hitpeak_i          =>   t_hitpeak,
      peaktime_i         =>   t_peaktime,
      hitsum_i           =>   t_hitsum,
      hitcontinue_i      =>   t_continue,
      packet_o           =>   packet_out_w.tdata,
      packet_last_o      =>   packet_out_w.tlast,
      packet_user_o      =>   packet_out_w.tuser,
      packet_valid_o     =>   packet_out_w.tvalid,
      packet_keep_o      =>   packet_out_w.tkeep,
      packetready_o      =>   t_packetready     
      );

  
end Behavioral;
