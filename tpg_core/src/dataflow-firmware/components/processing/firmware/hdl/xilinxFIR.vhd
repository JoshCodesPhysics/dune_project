library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dtpc_stream_defs.all;

entity xilinxFIR is
    port (
        clk            : in  std_logic;
        reset          : in  std_logic;
        s_axis_data_w  : in  dtpc_axis4_w;
        s_axis_data_r  : out dtpc_axis4_r;            
        m_axis_data_w  : out dtpc_axis4_w;
        m_axis_data_r  : in  dtpc_axis4_r
    );
end xilinxFIR;

architecture rtl of xilinxFIR is

-----------------------------------------------------------------------
-- Component Declaration
-----------------------------------------------------------------------
component fir_compiler_0
  PORT (
    aresetn              : in std_logic;
    aclk                 : in std_logic;
    s_axis_data_tvalid   : in std_logic;
    s_axis_data_tready   : out std_logic;
    s_axis_data_tlast    : in std_logic;
    s_axis_data_tuser    : in std_logic_vector( 0 downto 0);
    s_axis_data_tdata    : in std_logic_vector(15 downto 0);
    s_axis_config_tvalid : in std_logic;
    s_axis_config_tready : out std_logic;
    s_axis_config_tdata  : in std_logic_vector(7 downto 0);
    s_axis_reload_tvalid : in std_logic;
    s_axis_reload_tready : out std_logic;
    s_axis_reload_tlast  : in std_logic;
    s_axis_reload_tdata  : in std_logic_vector(15 downto 0);
    m_axis_data_tvalid   : out std_logic;
    m_axis_data_tready   : in std_logic;
    m_axis_data_tlast    : out std_logic;
    m_axis_data_tuser    : out std_logic_vector( 0 downto 0);
    m_axis_data_tdata    : out std_logic_vector(31 downto 0);
    event_s_reload_tlast_missing    : out std_logic;
    event_s_reload_tlast_unexpected : out std_logic
  );
end component;
    signal aresetn                             : std_logic := '0';

    -- Config slave channel signals
    signal config_tvalid            : std_logic := '0';  -- payload is valid
    signal config_tready            : std_logic := '1';  -- slave is ready
    signal config_tdata             : std_logic_vector(7 downto 0) := (others => '0');  -- data payload
    -- Reload slave channel signals
    signal reload_tvalid            : std_logic := '0';  -- payload is valid
    signal reload_tready            : std_logic := '1';  -- slave is ready
    signal reload_tdata             : std_logic_vector(15 downto 0) := (others => '0');  -- data payload
    signal reload_tlast             : std_logic := '0';  -- indicates end of packet
    -- Data master channel signals
    signal m_axis_data_tvalid       : std_logic := '0';  -- payload is valid
    signal m_axis_data_tready       : std_logic := '1';  -- slave is ready
    signal m_axis_data_tdata        : std_logic_vector(31 downto 0) := (others => '0');  -- data payload
    signal m_axis_data_tuser        : std_logic_vector( 0 downto 0) := (others => '0');  -- user-defined payload
    signal m_axis_data_tlast        : std_logic := '0';  -- indicates end of packet
    -- Event signals
    signal FIR_event_s_reload_tlast_missing    : std_logic  :=  '0';  -- s_axis_reload_tlast low at end of reload packet
    signal FIR_event_s_reload_tlast_unexpected : std_logic  :=  '0';  -- s_axis_reload_tlast high not at end of reload packet

    constant  c_FIR_BITSHIFT : natural := 6; -- Number of bits to right shift
                                           -- output of FIR
begin

    aresetn               <= not reset;

    FIR32_inst : fir_compiler_0
    PORT MAP (
    aresetn              => aresetn,
    aclk                 => clk,
    s_axis_data_tvalid   => s_axis_data_w.tvalid,          
    s_axis_data_tready   => s_axis_data_r.tready,       
    s_axis_data_tlast    => s_axis_data_w.tlast,
    s_axis_data_tuser    => s_axis_data_w.tuser,
    s_axis_data_tdata    => s_axis_data_w.tdata,        
    s_axis_config_tvalid => config_tvalid,     
    s_axis_config_tready => config_tready,     
    s_axis_config_tdata  => config_tdata,      
    s_axis_reload_tvalid => reload_tvalid,     
    s_axis_reload_tready => reload_tready,     
    s_axis_reload_tlast  => reload_tlast,      
    s_axis_reload_tdata  => reload_tdata,      
    m_axis_data_tvalid   => m_axis_data_tvalid,       
    m_axis_data_tready   => m_axis_data_tready,
    m_axis_data_tlast    => m_axis_data_tlast,
    m_axis_data_tuser    => m_axis_data_tuser,
    m_axis_data_tdata    => m_axis_data_tdata,        
    event_s_reload_tlast_missing    => FIR_event_s_reload_tlast_missing,     
    event_s_reload_tlast_unexpected => FIR_event_s_reload_tlast_unexpected   
    );


    m_axis_data_tready <= m_axis_data_r.tready;
    m_axis_data_w.tvalid <= m_axis_data_tvalid;
    --m_axis_data_w.tdata  <= std_logic_vector( shift_right( signed(m_axis_data_tdata(11) & m_axis_data_tdata(11) & m_axis_data_tdata(11) & m_axis_data_tdata(11) & m_axis_data_tdata(11 downto 0)), 7) );

    -- Transfer data from FIR to hit finder. Right shift by 6 bits ( ie. divide by 64 )
    -- to approximately compensate for gain in FIR
    m_axis_data_w.tdata  <= m_axis_data_tdata( c_FIR_BITSHIFT+15 downto c_FIR_BITSHIFT);

    m_axis_data_w.tkeep  <= m_axis_data_tvalid & m_axis_data_tvalid;
    m_axis_data_w.tuser  <= m_axis_data_tuser;  
    m_axis_data_w.tlast  <= m_axis_data_tlast;
    
end rtl;