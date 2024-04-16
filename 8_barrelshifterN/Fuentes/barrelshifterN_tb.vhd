library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity barrelshifterN_tb is
end;

architecture barrelshifterN_tb_arq of barrelshifterN_tb is

	component barrelshifterN is
		generic (
		N: natural := 4
	);

	port(
		a_i: in std_logic_vector(N-1 downto 0);
        des_i: in std_logic_vector(N-1 downto 0);
		s_o: out std_logic_vector(N-1 downto 0)
	);
	end component;

	constant N_tb: natural := 7;

	signal a_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(4, N_tb));
	signal des_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(1, N_tb));
	signal s_tb: std_logic_vector(N_tb-1 downto 0);
	
begin

	a_tb <= std_logic_vector(to_unsigned(5, N_tb)) after 500 ns, std_logic_vector(to_unsigned(9, N_tb)) after 1000 ns;
	des_tb <= std_logic_vector(to_unsigned(2, N_tb)) after 500 ns, std_logic_vector(to_unsigned(5, N_tb)) after 1000 ns;

	DUT: barrelshifterN
	generic map(
			N => N_tb
		)
		port map(
			a_i => a_tb,
			des_i => des_tb,
			s_o => s_tb
		);

end;