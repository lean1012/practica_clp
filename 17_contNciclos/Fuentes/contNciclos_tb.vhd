library IEEE;
use IEEE.std_logic_1164.all;

entity contNciclos_tb is
end;

architecture contNciclos_tb_arq of contNciclos_tb is

	component contNciclos is
		generic(
			N: natural := 5
		);
		
		port(
			clk : in std_logic;
			rst : in std_logic;
			s   : out std_logic
		);
	end component;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal s: std_logic := '0';
	
	
begin

	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 45 ns, '1' after 800 ns, '0' after 900 ns;

	DUT: entity work.contNciclos
		port map(
			clk => clk_tb,
			rst => rst_tb,
			s => s
		
		);

end;