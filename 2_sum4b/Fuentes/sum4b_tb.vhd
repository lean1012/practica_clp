library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity sum4b_tb is
end;

architecture sum4b_tb_arq of sum4b_tb is

	component sum4b is
		generic(
		N: natural := 4
	);
	port(
		ci_i: in std_logic;
		a_i: in std_logic_vector(N-1 downto 0);
		b_i: in std_logic_vector(N-1 downto 0);
		co_o: out std_logic;
		s_o: out std_logic_vector(N-1 downto 0)

	);
	end component;
	constant N_tb: natural := 4;

	signal a_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(1, N_tb));
	signal b_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(3, N_tb));
	signal ci_tb: std_logic := '0';
	signal co_tb: std_logic;
	signal so_tb: std_logic_vector(N_tb-1 downto 0);

	
	
begin

	a_tb <= std_logic_vector(to_unsigned(3, N_tb)) after 150 ns, std_logic_vector(to_unsigned(5, N_tb)) after 400 ns;
	b_tb <= std_logic_vector(to_unsigned(2, N_tb)) after 250 ns, std_logic_vector(to_unsigned(7, N_tb)) after 300 ns;
	ci_tb <= '1' after 130 ns, '0' after 450 ns;

	DUT: sum4b
		port map(
			ci_i  => ci_tb, 
			a_i  => a_tb,
			b_i  => b_tb,
			co_o  => co_tb,
			s_o => so_tb
		);

end;