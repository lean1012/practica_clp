library IEEE;
use IEEE.std_logic_1164.all;

entity contBCD_comp_tb is
end;

architecture contBCD_comp_tb_arq of contBCD_comp_tb is


	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal ena_tb: std_logic := '1';
	signal cuenta_tb: std_logic_vector(3 downto 0);
	signal max_tb: std_logic;
	
begin

	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 50 ns, '1' after 800 ns, '0' after 900 ns;
	ena_tb <= '0' after 435 ns, '1' after 700 ns, '0' after 1000 ns, '1' after 1200 ns;

	DUT: entity work.contBCD_comp
		port map(
			clk => clk_tb,
			rst => rst_tb,
			ena => ena_tb,
			cuenta_o   => cuenta_tb,
			max_o => max_tb
		);

end;