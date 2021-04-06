-- dtpc_sum
--
-- Trivial example design to add up total content of a whole block
--
-- Dave Newbold, July 2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.dtpc_stream_defs.all;

entity dtpc_sum is
	port(
		clk: in std_logic;
		rst: in std_logic;
		d_w: in dtpc_axis4_w;
		d_r: out dtpc_axis4_r;
		q_w: out dtpc_axis4_w;
		q_r: in dtpc_axis4_r
	);

end dtpc_sum;

architecture rtl of dtpc_sum is

	signal algo_in_w, algo_out_w: dtpc_axis4_w;
	signal algo_in_r, algo_out_r: dtpc_axis4_r;
	signal s: unsigned(31 downto 0);
	signal clr, done, p: std_logic;

begin

-- Helper

	helper: entity work.dtpc_helper
		port map(
			clk => clk,
			rst => rst,
			d_w => d_w,
			d_r => d_r,
			q_algo_w => algo_in_w,
			q_algo_r => algo_in_r,
			d_algo_w => algo_out_w,
			d_algo_r => algo_out_r,
			q_w => q_w,
			q_r => q_r
		);
		
-- Sum the content

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' or clr = '1' then
				s <= (others => '0');
			elsif (algo_in_w.tvalid and algo_in_w.tkeep(0)) = '1' then
				s <= s + unsigned(algo_in_w.tdata);
			end if;
		end if;
	end process;

-- State machine

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				done <= '0';
			else
				if (algo_in_w.tvalid and algo_in_w.tlast) = '1' then
					done <= '1';
					p <= '0';
				elsif done = '1' and algo_out_r.tready = '1' then
					p <= not p;
					if p = '1' then
						done <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	clr <= p and algo_out_r.tready;

-- Stream IO

	algo_in_r.tready <= not done;
	algo_out_w.tvalid <= done;
	algo_out_w.tdata <= std_logic_vector(s(31 downto 16)) when p = '0' else std_logic_vector(s(15 downto 0));
	algo_out_w.tkeep <= "11";
	algo_out_w.tlast <= p;
	algo_out_w.tuser(0) <= p;

end rtl;
