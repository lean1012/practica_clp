library IEEE;
use IEEE.std_logic_1164.all;

entity contNb_comp_tb is
end;

architecture contNb_comp_tb_arq of contNb_comp_tb is

	component contNb_comp is
		generic(
			N: natural := 4
		);
		port(
			clk : in std_logic;
			rst : in std_logic;
			ena : in std_logic;
			cont_o   : out std_logic_vector(N-1 downto 0)
			);
	end component;

	constant N_tb: natural := 3;
	signal clk_tb :std_logic := '0';
	signal rst_tb :std_logic := '1';
	signal ena_tb :std_logic := '1';
	
	signal cont_tb  : std_logic_vector(N_tb-1 downto 0) := (others => '0');

begin

	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 11 ns;
	ena_tb <= '0' after 100 ns, '1' after 200 ns, '0' after 400 ns;
 

	DUT: contNb_comp
	generic map(
			N => N_tb
		)
		port map(
			clk => clk_tb,
			rst => rst_tb,
			ena => ena_tb,
			cont_o   => cont_tb
		);

end;