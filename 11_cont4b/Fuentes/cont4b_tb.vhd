library IEEE;
use IEEE.std_logic_1164.all;

entity cont4b_tb is
end;

architecture cont4b_tb_arq of cont4b_tb is

	 component cont4b is
		port(
			clk_i : in std_logic;
			rst_i : in std_logic;
			ena_i : in std_logic;
			cont_o   : out std_logic_vector(3 downto 0)
		);
	 end component;

	signal clk_tb : std_logic := '0';
	signal rst_tb : std_logic := '1';
	signal ena_tb : std_logic := '1';
	signal q_tb   : std_logic_vector(3 downto 0);

begin

	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 11 ns;
 

	DUT: cont4b
		port map(
			clk_i => clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			cont_o   => q_tb
		);

end;