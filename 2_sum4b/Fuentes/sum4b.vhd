library IEEE;
use IEEE.std_logic_1164.all;

entity sum4b is
	generic(
		N: natural := 4
	);
	port(
		ci_i: in std_logic;
		a_i: in std_logic_vector(N-1 downto 0);
		b_i: in std_logic_vector(N-1 downto 0);
		co_o: out std_logic;
		s_o: out std_logic_vector(N-1 downto 0)

	);
end;

architecture sum4b_arq of sum4b is

	--Parte declarativa
	component sum1b is
		port(
			a_i: in std_logic;
			b_i: in std_logic;
			ci_i: in std_logic;
			s_o: out std_logic;
			co_o: out std_logic
		);
	end component;
	
	signal aux: std_logic_vector(N downto 0); 

	begin
	--Parte descriptiva

	sumNb_inst: for i in 0 to N-1 generate
		sum1b_inst: sum1b port map(
			a_i => a_i(i),
			b_i => b_i(i),
			ci_i => aux(i),
			s_o => s_o(i),
			co_o => aux(i+1)
		);
	end generate;

	aux(0) <= ci_i;
	co_o <= aux(N);

end;