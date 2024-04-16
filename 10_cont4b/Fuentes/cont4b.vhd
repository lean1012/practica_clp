library IEEE;
use IEEE.std_logic_1164.all;

entity cont4b is
	port(
		clk_i : in std_logic;
		rst_i : in std_logic;
		ena_i : in std_logic;
		cont_o   : out std_logic_vector(3 downto 0)
	);
end;

architecture cont4b_arq of cont4b is
	--Parte declarativa
	component cont1b
	port(
		clk_i 	       : in std_logic;
		rst_i 	       : in std_logic;
		ena_i 	   : in std_logic;
		q_i        : in std_logic;
		q_o  	   : out std_logic;
		ena_o      : out std_logic
	);
	end component;

	signal ena_aux : std_logic_vector(4 downto 0);
	signal q_aux : std_logic_vector(4 downto 0);
	


	
begin
	
	ena_aux(0) <= ena_i;
	q_aux(0) <= '1';

	cont4b_inst: for i in 0 to 3 generate
		cont1b_inst: cont1b port map(
			clk_i 	       => clk_i,
			rst_i 	       => rst_i,
			ena_i 	   => ena_aux(i),
			q_i        => q_aux(i),
			q_o  	   => q_aux(i+1),
			ena_o      => ena_aux(i+1)
		);
	end generate;

	cont_o <= q_aux(4 downto 1);
	
	
	
end;