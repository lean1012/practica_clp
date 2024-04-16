library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity contNciclos is
	generic (
		N: natural := 5
	);
	port(
		clk : in std_logic;
		rst : in std_logic;
		s   : out std_logic
	);
end;

architecture contNciclos_arq of contNciclos is
	-- Parte declarativa
	signal cont : std_logic_vector(4 downto 0);
	signal max_o : std_logic;
	begin
	-- Parte descriptiva

	process(clk,rst)
	begin
		if(rst = '1') then
			cont <= (others => '0');
			max_o <= '0';
		elsif rising_edge(clk) then		
			if(to_integer(unsigned(cont)) < N-1 ) then
				cont <= std_logic_vector(unsigned(cont) + 1 );
				max_o <= '0';
			else 
				cont <= (others => '0'); 
				max_o <= '1';
			end if;

		else
			--nada
		end if;
		

	end process;
	
	s <= max_o;
end;