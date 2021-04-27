library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.dtpc_stream_defs.all;


entity PedSub_HLS_SSR_wrapper is
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
end PedSub_HLS_SSR_wrapper;

architecture Behavioral of PedSub_HLS_SSR_wrapper is

signal s_tready       : std_logic := '0';
-- AXI4 pointless ports
signal start : STD_LOGIC := '1';
signal done  : STD_LOGIC := '0';
signal idle  : STD_LOGIC := '0';
signal not_reset : STD_LOGIC := '0';

begin
s_tready             <= m_axis_data_r.tready;
s_axis_data_r.tready <= '0' when reset='1' else s_tready;

not_reset <= not reset;

pedsub_HLS_SSR : entity work.pedsub_HLS_SSR
 	port map(
 		ap_clk          => clk,
         	ap_rst          => reset,
         	ap_start        => start,
         	ap_done         => done,
         	ap_idle         => idle,
         	ap_ready        => open,
 		tdata_i_data_V	=> s_axis_data_w.tdata,
 		tdata_i_keep_V	=> s_axis_data_w.tkeep,
 		tdata_i_user	=> s_axis_data_w.tuser(0),
 		tdata_i_last	=> s_axis_data_w.tlast,
 		tdata_i_ready	=> s_tready,
 		tdata_i_valid	=> s_axis_data_w.tvalid,
 		tdata_o_data_V	=> m_axis_data_w.tdata,
 		tdata_o_keep_V	=> m_axis_data_w.tkeep,
 		tdata_o_keep_V_ap_vld	=> open,
 		tdata_o_user	=> m_axis_data_w.tuser(0),
 		tdata_o_user_ap_vld	=> open,
 		tdata_o_last	=> m_axis_data_w.tlast,
 		tdata_o_last_ap_vld	=> open,
 		tdata_o_ready	=> open,
 		tdata_o_ready_ap_vld	=> open,
 		tdata_o_valid	=> m_axis_data_w.tvalid,
 		tdata_o_valid_ap_vld	=> open
 ); 

-- pedsub_axi4s_test : entity work.pedsub_axi4s_test
-- 	port map(
-- 		ap_clk          => clk,
--         	ap_rst_n          => not_reset,
--                 ap_start        => start,
--                 ap_done         => done,
--                 ap_idle         => idle,
--                 ap_ready        => open,
-- 		tdata_o_TREADY  => m_axis_data_r.tready,
-- 		tdata_o_TDATA	=> m_axis_data_w.tdata,
-- 		tdata_o_TVALID	=> m_axis_data_w.tvalid,
-- 		tdata_o_TLAST	=> m_axis_data_w.tlast,
-- 		tdata_o_TKEEP	=> m_axis_data_w.tkeep,
-- 		tdata_o_TUSER	=> m_axis_data_w.tuser(0),
-- 		tdata_i_TDATA(15 downto 0)	=> s_axis_data_w.tdata,
-- 		tdata_i_TDATA(17 downto 16)	=> s_axis_data_w.tkeep,
-- 		tdata_i_TDATA(18)	=> s_axis_data_w.tuser(0),
-- 		tdata_i_TDATA(19)	=> s_axis_data_w.tlast,
-- 		tdata_i_TDATA(23 downto 20)	=> "0000",
-- 		tdata_i_TVALID	=> s_axis_data_w.tvalid,
-- 		tdata_i_TREADY	=> s_axis_data_r.tready
-- );

-- m_axis_data_w.tuser <= s_axis_data_w.tuser;

end Behavioral;
