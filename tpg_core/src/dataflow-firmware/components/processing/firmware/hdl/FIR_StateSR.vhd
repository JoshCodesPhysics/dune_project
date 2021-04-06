library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dtpc_stream_defs.all;

entity FIR_StateSR is
  port (
      clk            : in  std_logic;
      reset          : in  std_logic;
      localreset     : in  std_logic;
      s_axis_data_w  : in  dtpc_axis4_w;
      s_axis_data_r  : out dtpc_axis4_r;            
      m_axis_data_w  : out dtpc_axis4_w;
      m_axis_data_r  : in  dtpc_axis4_r
  );
end FIR_StateSR;

architecture rtl of FIR_StateSR is


-----------------------------------------------------------------------
-- Signal Declaration
-----------------------------------------------------------------------  
  --signal aresetn            : std_logic := '0';
  signal m_axis_data_tdata  : std_logic_vector(28 downto 0) := (others => '0');  -- data payload CUSTOM FIR
  signal m_axis_data_tuser  : std_logic_vector( 0 downto 0) := (others => '0');  -- user-defined payload
  signal m_axis_data_tkeep  : std_logic_vector( 1 downto 0) := (others => '0');
  signal m_axis_data_tlast  : std_logic := '0';  -- indicates end of packet
  signal m_axis_data_tvalid : std_logic := '0';
  signal m_axis_data_tready : std_logic := '0';
        
  constant  c_FIR_BITSHIFT  : natural := 6; -- Number of bits to right shift output of FIR
  
  signal stateRestore_w     : dtpc_axis4_w;    

  signal fir_rst : std_logic := '0';


-----------------------------------------------------------------------
-- Main body of code
-----------------------------------------------------------------------                          
begin

  fir_rst <= reset or localreset;

  --===========================================================
  -- custom FIR 32 TAP
  --===========================================================
  FIR32_v0_inst : entity work.fir32_v0
  PORT MAP (
    reset                => fir_rst,
    clk                  => clk,
    s_axis_data_tvalid   => s_axis_data_w.tvalid,          
    s_axis_data_tready   => s_axis_data_r.tready,       
    s_axis_data_tlast    => s_axis_data_w.tlast,
    s_axis_data_tuser    => s_axis_data_w.tuser,
    s_axis_data_tkeep    => s_axis_data_w.tkeep,
    s_axis_data_tdata    => s_axis_data_w.tdata(11 downto 0),        
    m_axis_data_tvalid   => m_axis_data_tvalid,       
    m_axis_data_tready   => m_axis_data_tready,
    m_axis_data_tlast    => m_axis_data_tlast,
    m_axis_data_tuser    => m_axis_data_tuser,
    m_axis_data_tkeep    => m_axis_data_tkeep,
    m_axis_data_tdata    => m_axis_data_tdata,
    stateRestore_tdata   => stateRestore_w.tdata(11 downto 0),
    stateRestore_tvalid  => stateRestore_w.tvalid,
    stateRestore_tlast   => stateRestore_w.tlast       
  );

  -- Transfer data from FIR to hit finder. Right shift by 6 bits ( ie. divide by 64 ) to approximately compensate for gain in FIR      
  m_axis_data_w.tdata  <= m_axis_data_tdata( c_FIR_BITSHIFT+15 downto c_FIR_BITSHIFT);    
  m_axis_data_w.tvalid <= m_axis_data_tvalid;
  m_axis_data_w.tkeep  <= m_axis_data_tkeep; 
  m_axis_data_w.tuser  <= m_axis_data_tuser;  
  m_axis_data_w.tlast  <= m_axis_data_tlast;
  m_axis_data_tready   <= m_axis_data_r.tready;
    
  
  -----------------------------------------------------------------------------
  -- State Save/Restore
  -----------------------------------------------------------------------------    
  ssr_inst: entity work.stateSaveRestore
  port map( 
    reset          => reset,       
    clk            => clk,    
    s_axis_data_w  => s_axis_data_w, 
    m_axis_data_r  => m_axis_data_r,   
    stateRestore_w => stateRestore_w
  );

 
end rtl;

