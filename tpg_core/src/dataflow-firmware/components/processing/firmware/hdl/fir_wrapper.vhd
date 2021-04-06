library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dtpc_stream_defs.all;

entity fir_wrapper is
generic (    
    ENABLE_SSR : boolean := TRUE    
);
port(
    clk            : in  std_logic;
    reset          : in  std_logic;
    localreset     : in  std_logic;
    s_axis_data_w  : in  dtpc_axis4_w;
    s_axis_data_r  : out dtpc_axis4_r;            
    m_axis_data_w  : out dtpc_axis4_w;
    m_axis_data_r  : in  dtpc_axis4_r
);
end fir_wrapper;

architecture rtl of fir_wrapper is

    
signal ipFIR_rst : std_logic := '0';

                         
begin

  ipFIR_rst <= reset or localreset;

  gen_fir : if ENABLE_SSR generate
    fir_ssr: entity work.FIR_StateSR
    port map(
      clk            => clk,
      reset          => reset,
      localreset     => localreset,
      s_axis_data_w  => s_axis_data_w,
      s_axis_data_r  => s_axis_data_r,            
      m_axis_data_w  => open,
      m_axis_data_r  => m_axis_data_r
    );
  else generate
    -- xil_fir : entity work.xilinxFIR
    -- port map(
    --   clk            => clk,
    --   reset          => ipFIR_rst,
    --   s_axis_data_w  => s_axis_data_w,
    --   s_axis_data_r  => s_axis_data_r,            
    --   m_axis_data_w  => open,
    --   m_axis_data_r  => m_axis_data_r
    -- );

      -- fir32_v0: entity work.fir32_v0
      -- port map(
	--   clk	        	=> clk,
	--   reset			=> reset,
	--   s_axis_data_tvalid 	=> s_axis_data_w.tvalid,
	--   s_axis_data_tlast	=> s_axis_data_w.tlast,
	--   s_axis_data_tuser	=> s_axis_data_w.tuser,
	--   s_axis_data_tkeep	=> s_axis_data_w.tkeep,
	--   s_axis_data_tdata	=> s_axis_data_w.tdata,
	--   s_axis_data_tready	=> s_axis_data_w.tready,
	--   m_axis_data_tready	=> open,
	--   m_axis_data_tvalid	=> open,
	--   m_axis_data_tlast	=> open,
	--   m_axis_data_tuser	=> open,
	--   m_axis_data_tkeep	=> open,
	--   m_axis_data_tuser	=> open,
	--   stateRestore_tdata	=> s_axis_data_w.tdata,
	--   stateRestore_tvalid	=> s_axis_data_w.tvalid,
	--   stateRestore_tlast	=> s_axis_data_w.tlast,
	-- );
  end generate;
      fir_HLS_wrapper: entity work.fir_HLS_wrapper
      port map(
        clk            => clk,
        reset          => reset,
        localreset     => localreset,
        s_axis_data_w  =>  s_axis_data_w,
        s_axis_data_r  =>  s_axis_data_r,
        m_axis_data_w  =>  m_axis_data_w,
        m_axis_data_r  =>  m_axis_data_r
      );	

end rtl;
