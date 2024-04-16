library IEEE;
use IEEE.std_logic_1164.all;

entity mult2x1_tb is
end;

architecture mult2x1_tb_arq of mult2x1_tb is


	component mult2x1 is
		generic(
			N: natural := 4
		);
		port(
			a_i: in std_logic_vector(N-1 downto 0);
			b_i: in std_logic_vector(N-1 downto 0);
			sel_i: in std_logic;
			s_o: out std_logic_vector(N-1 downto 0)
		);
	 end component;

	constant N_tb :natural := 4;
	signal a_tb: std_logic_vector(N_tb-1 downto 0) := (others => '1');
	signal b_tb: std_logic_vector(N_tb-1 downto 0) := (others => '0');
	signal sel_tb: std_logic := '0';
	signal s_tb: std_logic_vector(N_tb-1 downto 0);
	
begin


	sel_tb <= not sel_tb after 40 ns;


	DUT: mult2x1
		generic map(
			N => N_tb
		)
		port map(
			a_i => a_tb,
			b_i => b_tb,
			sel_i => sel_tb,
			s_o   => s_tb
		);

end;