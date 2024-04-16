library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity contNb_comp is
	generic(
		N: natural := 4
	);
	port(
		clk : in std_logic;
		rst : in std_logic;
		ena : in std_logic;
		cont_o   : out std_logic_vector(N-1 downto 0)
	);
end;

architecture contNb_comp_arq of contNb_comp is
	--Parte declarativa
	signal cont: std_logic_vector(N-1 downto 0);
	


	begin
	-- Parte descriptiva
	

	process(clk,rst)
	begin
		if rst = '1' then
			cont <= (others => '0');
		elsif rising_edge(clk) then
			if ena = '1' then
				cont <= std_logic_vector(unsigned(cont) + 1);
			else
				cont <= cont;
			end if;
		else 
			cont <= cont;
		end if;
	end process;

	cont_o <= cont;
	
end;