library IEEE;
use IEEE.std_logic_1164.all;

entity cont1b is		--Ver imagen cont1b para nomeclatura
	port(
		clk_i 	       : in std_logic;
		rst_i 	       : in std_logic;
		ena_i 	   : in std_logic;
		q_i        : in std_logic;
		q_o  	   : out std_logic;
		ena_o      : out std_logic
	);
end;

architecture cont1b_arq of cont1b is
	--Parte declarativa
	component regNb
	generic(
		N		: natural := 1
	);
	port(
		clk_i	: in std_logic;								
		rst_i	: in std_logic;								
		ena_i	: in std_logic;								
		d_i		: in std_logic_vector(N-1 downto 0);		
		q_o		: out std_logic_vector(N-1 downto 0)		
	);
	end component;

	signal ena_aux: std_logic;
	signal sal_xor: std_logic;
	signal q_aux: std_logic;
	
begin
	-- Parte descriptiva
	
	regNb_inst: regNb port map(
		clk_i => clk_i,
		rst_i => rst_i,
		ena_i => '1',
		d_i(0)   => sal_xor,
		q_o(0)   => q_aux
	);

	ena_aux <= ena_i and q_i;
	sal_xor <= q_aux xor ena_aux;

	q_o <= q_aux;
	ena_o <= ena_aux;


		

	
	
	
end;