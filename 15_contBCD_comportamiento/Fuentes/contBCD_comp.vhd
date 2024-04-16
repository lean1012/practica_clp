library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity contBCD_comp is
	port(
		clk : in std_logic;
		rst : in std_logic;
		ena : in std_logic;
		cuenta_o   : out std_logic_vector(3 downto 0);
		max_o : out std_logic
	);
end;

architecture contBCD_comp_arq of contBCD_comp is
	-- Parte declarativa
	signal cont : std_logic_vector(3 downto 0);
	signal max_o_aux : std_logic;
	begin
	-- Parte descriptiva

	process(clk,rst)
	begin
		if(rst = '1') then
			cont <= (others => '0');
			max_o_aux <= '0';
		elsif rising_edge(clk) then
			if ena = '1' then
				if(to_integer(unsigned(cont)) < 9 ) then
					cont <= std_logic_vector(unsigned(cont) + 1 );
					max_o_aux <= '0';
				else 
					cont <= (others => '0'); 
					max_o_aux <= '1';
				end if;
			else
				cont <= cont;
				max_o_aux <= '0';
			end if;
		else
			--nada
		end if;
		

	end process;
	
	cuenta_o <= cont;
	max_o <= max_o_aux;
end;