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
	component regNb
	generic(
		N		: natural := 4
	);
	port(
		clk_i	: in std_logic;								
		rst_i	: in std_logic;								
		ena_i	: in std_logic;								
		d_i		: in std_logic_vector(N-1 downto 0);		
		q_o		: out std_logic_vector(N-1 downto 0)		
	);
	end component;

	signal sal_and: std_logic_vector(3 downto 0);
	signal sal_xor: std_logic_vector(3 downto 0);
	signal q_aux: std_logic_vector(3 downto 0);
begin
	-- Parte descriptiva

	
	regNb_inst: regNb port map(
		clk_i => clk_i,
		rst_i => rst_i,
		ena_i => ena_i,
		d_i   => sal_xor,
		q_o   => q_aux
	);
	
	process(sal_and,ena_i,sal_xor,q_aux)
	begin
		sal_and(0) <= ena_i;
		sal_xor(0) <= q_aux(0) xor sal_and(0);
		LOOP1: for i in 1 to 3 loop
			sal_and(i) <= (sal_and(i-1) and q_aux(i-1));
			sal_xor(i) <= q_aux(i) xor sal_and(i);
			end loop;

	end process;

	cont_o <= q_aux;


	
	
	
end;