library IEEE;
use IEEE.std_logic_1164.all;

entity shiftNb_tb is
end;

architecture shiftNb_tb_arq of shiftNb_tb is

	 component shiftNb is
		generic(
			N: natural := 4
		);
		port(
			clk_i : in std_logic;
			rst_i : in std_logic;
			ena_i : in std_logic;
			d_i   : in std_logic;
			q_o   : out std_logic
	);
	 end component;
	 
	constant N_tb :natural := 4;
	signal clk_tb :std_logic := '0';
	signal rst_tb :std_logic := '0';
	signal ena_tb :std_logic := '1';
	signal d_tb   :std_logic := '0';
	signal q_tb   :std_logic;


begin

	clk_tb <= not clk_tb after 10 ns;
	d_tb   <=  not d_tb after 18 ns;
	 

	DUT: shiftNb
		generic map(
			N => N_tb
		)
		port map(
			clk_i => clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			d_i   => d_tb,
			q_o   => q_tb
		);

end;
