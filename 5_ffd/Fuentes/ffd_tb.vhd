library IEEE;
use IEEE.std_logic_1164.all;

entity ffd_tb is
end;

architecture ffd_tb_arq of ffd_tb is

	 component ffd is
		port(
		clk_i : in std_logic;
		rst_i : in std_logic;
		ena_i : in std_logic;
		d_i   : in std_logic;
		q_o   : out std_logic
	);
	 end component;

	signal clk_tb :std_logic := '0';
	signal rst_tb :std_logic := '1';
	signal ena_tb :std_logic := '1';
	signal d_tb   :std_logic := '1';
	signal q_tb   :std_logic;

begin

	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 100 ns;
	d_tb   <= '0' after 300 ns, '1' after 600 ns, '0' after 900 ns;
	ena_tb <= '0' after 500 ns, '1' after 700 ns;
	 

	DUT: ffd
		port map(
			clk_i => clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			d_i   => d_tb,
			q_o   => q_tb
		);

end;