----------------------------------------------------------------------------------
-- Company: Rutherford Apletton Laboratory
-- Engineer: Konstantinos Manolopoulos
-- 
-- Create Date: 04/23/2020 12:42:36 AM
-- Design Name: 
-- Module Name: fir32_v0 - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity fir32_v0 is
  Port ( 
    reset               : in  std_logic;  
    clk                 : in  std_logic;  
    s_axis_data_tvalid  : in  std_logic;            
    s_axis_data_tlast   : in  std_logic;  
    s_axis_data_tuser   : in  std_logic_vector( 0 downto 0);
    s_axis_data_tkeep   : in  std_logic_vector( 1 downto 0);  
    s_axis_data_tdata   : in  std_logic_vector(11 downto 0);    
    s_axis_data_tready  : out std_logic;         
    m_axis_data_tready  : in  std_logic;
    m_axis_data_tvalid  : out std_logic;    
    m_axis_data_tlast   : out std_logic;
    m_axis_data_tuser   : out std_logic_vector( 0 downto 0);
    m_axis_data_tkeep   : out std_logic_vector( 1 downto 0);
    m_axis_data_tdata   : out std_logic_vector(28 downto 0);
    stateRestore_tdata  : in  std_logic_vector(11 downto 0);
    stateRestore_tvalid : in  std_logic;   
    stateRestore_tlast  : in  std_logic
  );
end fir32_v0;


architecture Behavioral of fir32_v0 is



-----------------------------------------------------------------------
-- Signal Declaration
-----------------------------------------------------------------------
type t_coeff is array (0 to 31) of integer;
signal s_coeff : t_coeff := (0,0,0,0,0,0,0,0,2,4,6,7,9,11,12,13,13,12,11,9,7,6,4,2,0,0,0,0,0,0,0,0);

type t_data_pipe is array (0 to 31) of signed(11 downto 0);
signal s_tdata           : t_data_pipe := (others => (others => '0') );
signal s_stRestore_tdata : t_data_pipe := (others => (others => '0') );

type t_mult is array (0 to 31) of signed(23 downto 0);
signal s_mult : t_mult := (others => (others => '0') );

type t_add_l0 is array (0 to 15) of signed(24 downto 0);
type t_add_l1 is array (0 to  7) of signed(25 downto 0);
type t_add_l2 is array (0 to  3) of signed(26 downto 0);
type t_add_l3 is array (0 to  1) of signed(27 downto 0);
signal s_add_l0 : t_add_l0 := (others => (others => '0'));
signal s_add_l1 : t_add_l1 := (others => (others => '0'));
signal s_add_l2 : t_add_l2 := (others => (others => '0'));
signal s_add_l3 : t_add_l3 := (others => (others => '0'));

signal s_add_l4 : signed(28 downto 0) := (others => '0');

signal s0_tlast,  s1_tlast   : std_logic := '0';
signal s2_tlast,  s3_tlast   : std_logic := '0';
signal s4_tlast,  s5_tlast   : std_logic := '0'; 
signal s6_tlast,  s7_tlast   : std_logic := '0';
signal s8_tlast,  s9_tlast   : std_logic := '0';
signal s0_tvalid, s1_tvalid  : std_logic := '0'; 
signal s2_tvalid, s3_tvalid  : std_logic := '0';
signal s4_tvalid, s5_tvalid  : std_logic := '0';
signal s6_tvalid             : std_logic := '0';
signal s_tvalid_i,s_tvalid_o : std_logic := '0';
signal s_tready,  s_start    : std_logic := '0';

signal s0_axis_data_tdata : std_logic_vector(11 downto 0) := (others => '0');
signal s0_tkeep, s1_tkeep : std_logic_vector( 1 downto 0) := (others => '0'); 
signal s2_tkeep, s3_tkeep : std_logic_vector( 1 downto 0) := (others => '0');
signal s4_tkeep, s5_tkeep : std_logic_vector( 1 downto 0) := (others => '0');
signal s6_tkeep           : std_logic_vector( 1 downto 0) := (others => '0');
signal s_tkeep_i          : std_logic_vector( 1 downto 0) := (others => '0');

signal cnt : unsigned(6 downto 0) := (others => '0');

type t_tlast_i_pipe is array (0 to 14) of std_logic;
signal tst_tlast : t_tlast_i_pipe := (others => '0');
--signal tst_tlast : std_logic_vector(0 to 6) := (others => '0');

attribute use_dsp48 : string;
attribute use_dsp48 of s_mult : signal is "yes";
 
-----------------------------------------------------------------------
-- Main body of code
-----------------------------------------------------------------------    
begin


  -----------------------------------------------------------------------
  -- tready logic 
  -----------------------------------------------------------------------
  s_tready           <= m_axis_data_tready;
  s_axis_data_tready <= '0' when reset='1' else s_tready;


  -----------------------------------------------------------------------
  -- FIR 32-TAP
  -----------------------------------------------------------------------
  process(clk)
  begin
  if rising_edge(clk) then
    if reset = '1' then
        s_tdata  <= (others => (others => '0') );        
        s_mult   <= (others => (others => '0') );
        s_add_l0 <= (others => (others => '0') );
        s_add_l1 <= (others => (others => '0') );
        s_add_l2 <= (others => (others => '0') );
        s_add_l3 <= (others => (others => '0') );
        s_add_l4 <= (others => '0');
            
    elsif s_tvalid_i = '1' and s_tkeep_i= "11" and m_axis_data_tready = '1' then
                
        s_tdata <= signed(s0_axis_data_tdata) & s_tdata(0 to s_tdata'length-2);
       
        -- Multiplication    
        for k in 0 to 31 loop
            s_mult(k) <= s_tdata(k) * to_signed( s_coeff(k), 12);
        end loop;

        --Adder Tree 5-level 
        for i in 0 to 15 loop
            s_add_l0(i) <= resize( s_mult(2*i), 25 ) + resize( s_mult(2*i+1), 25 );
        end loop;
        
        for j in 0 to 7 loop
            s_add_l1(j) <= resize( s_add_l0(2*j), 26 ) + resize( s_add_l0(2*j+1), 26 ); 
        end loop; 
        
        for l in 0 to 3 loop
            s_add_l2(l) <= resize( s_add_l1(2*l), 27 ) + resize( s_add_l1(2*l+1), 27 ); 
        end loop; 
        
        for m in 0 to 1 loop
            s_add_l3(m) <= resize( s_add_l2(2*m), 28 ) + resize( s_add_l2(2*m+1), 28 ); 
        end loop; 
        
        s_add_l4 <= resize( s_add_l3(0), 29 ) + resize( s_add_l3(1), 29 );
    
    --tmp
    --elsif s9_tlast = '1' then
    elsif tst_tlast(14) = '1' then
        for i in 0 to 31 loop
            s_tdata(i) <= s_stRestore_tdata(i);
        end loop;         
    end if;
  end if;
  end process;


  -----------------------------------------------------------------------
  -- FIR Control logic 
  -----------------------------------------------------------------------
  process(clk)
  begin
  if rising_edge(clk) then
    if reset = '1' then    
        s0_tvalid <= '0';
        s0_tkeep  <= "00";
        s0_tlast  <= '0';
            
    elsif m_axis_data_tready = '1' then
        s0_axis_data_tdata <= s_axis_data_tdata;
        
        s0_tvalid <= s_axis_data_tvalid;
        s1_tvalid <= s0_tvalid;  
        s2_tvalid <= s1_tvalid;
        s3_tvalid <= s2_tvalid;
        s4_tvalid <= s3_tvalid;
        s5_tvalid <= s4_tvalid;
        s6_tvalid <= s5_tvalid;
        
        s0_tkeep <= s_axis_data_tkeep;
        s1_tkeep <= s0_tkeep; 
        s2_tkeep <= s1_tkeep;
        s3_tkeep <= s2_tkeep;
        s4_tkeep <= s3_tkeep;
        s5_tkeep <= s4_tkeep;
        s6_tkeep <= s5_tkeep;
        
        s0_tlast <= s_axis_data_tlast; --add also tuser????????
        s1_tlast <= s0_tlast;
        s2_tlast <= s1_tlast;
        s3_tlast <= s2_tlast;        
        s4_tlast <= s3_tlast;
        s5_tlast <= s4_tlast;
        s6_tlast <= s5_tlast;                
        s7_tlast <= s6_tlast;
        s8_tlast <= s7_tlast;
        s9_tlast <= s8_tlast;
        
        --tst_tlast <= s_axis_data_tlast & tst_tlast(0 to tst_tlast'length-2);                        
    end if;
  end if;
  end process;

  --create a valid signals for the FIR
  s_tvalid_i <= s0_tvalid or s1_tvalid or s2_tvalid or s3_tvalid or s4_tvalid or s5_tvalid or s6_tvalid;  
  s_tkeep_i  <= s0_tkeep  or s1_tkeep  or s2_tkeep  or s3_tkeep  or s4_tkeep  or s5_tkeep  or s6_tkeep;
  
  --Control counter
  process(clk)
  begin
  if rising_edge(clk) then
    if reset = '1' then    
        cnt        <= (others => '0');
        s_tvalid_o <= '0';
        s_start    <= '0'; 
    elsif m_axis_data_tready = '1' then
    
        if s_axis_data_tvalid='1' and s0_tvalid='0' then
            s_start <= '1';
        else
            s_start <= '0';    
        end if;
      
        if s_start = '1' then
            cnt <= "0000001";
        elsif cnt = 70 then
            cnt        <= (others => '0');
            s_tvalid_o <= '0';             
        elsif cnt >= 1 and cnt <= 5 then
            cnt        <= cnt + 1;
            s_tvalid_o <= '0';          
        elsif cnt >= 6 and cnt <= 69 then
            cnt        <= cnt + 1;
            s_tvalid_o <= '1';            
        end if;
        
    end if;
  end if;
  end process;
  

  m_axis_data_tdata    <= std_logic_vector( s_add_l4 );
  m_axis_data_tvalid   <= s_tvalid_o;
  m_axis_data_tkeep    <= s_tvalid_o & s_tvalid_o;
  m_axis_data_tlast    <= s7_tlast;
  m_axis_data_tuser(0) <= s7_tlast;


  -----------------------------------------------------------------------
  -- State Restore 
  -----------------------------------------------------------------------
  process(clk)
  begin
  if rising_edge(clk) then
    --if reset = '1' then    
    --    s_stRestore_tdata <= (others => (others => '0') );
    --els
    if stateRestore_tvalid = '1' and m_axis_data_tready = '1' then   
        s_stRestore_tdata <= signed(stateRestore_tdata) & s_stRestore_tdata(0 to s_stRestore_tdata'length-2);
    end if;
    
    
    tst_tlast <= s7_tlast & tst_tlast(0 to tst_tlast'length-2);                        
       
  end if;
  end process;
  
  
  
end Behavioral;