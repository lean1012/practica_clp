library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity sumrestNb_tb is
end;

architecture sumrestNb_tb_arq of sumrestNb_tb is

	component sumrestNb is
		generic(
			N: natural := 4
		);
		
		port(
			sr_i: in std_logic;
			a_i: in std_logic_vector(N-1 downto 0);
			b_i: in std_logic_vector(N-1 downto 0);
			s_o: out std_logic_vector(N-1 downto 0);
			co_o: out std_logic
		);
	end component;

	constant N_tb: natural := 4;
	signal sr_tb: std_logic := '1';
	signal a_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(0, N_tb));
	signal b_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(1, N_tb));
	signal s_tb: std_logic_vector(N_tb-1 downto 0);
	signal co_tb: std_logic;
	
begin

	a_tb <= std_logic_vector(to_unsigned(3, N_tb)) after 120 ns, std_logic_vector(to_unsigned(7, N_tb)) after 420 ns, std_logic_vector(to_unsigned(7, N_tb)) after 700 ns;
	b_tb <= std_logic_vector(to_unsigned(5, N_tb)) after 230 ns, std_logic_vector(to_unsigned(3, N_tb)) after 550 ns, std_logic_vector(to_unsigned(1, N_tb)) after 730 ns;
	sr_tb <= not sr_tb after 50 ns;

	DUT: sumrestNb
	generic map(
			N => N_tb
		)
		port map(
			sr_i => sr_tb,
			a_i => a_tb,
			b_i => b_tb,
			s_o => s_tb,
			co_o => co_tb
		);

end;