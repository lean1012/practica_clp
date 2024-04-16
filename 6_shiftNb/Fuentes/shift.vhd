library IEEE;
use IEEE.std_logic_1164.all;

entity shiftNb is
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
end;

architecture shiftNb_arq of shiftNb is
	--Parte declarativa
	component ffd
	port(
		clk_i : in std_logic;
		rst_i : in std_logic;
		ena_i : in std_logic;
		d_i   : in std_logic;
		q_o   : out std_logic
	);
	end component;

	signal d_aux: std_logic_vector(N downto 0);


	begin
	-- Parte descriptiva
	

	shiftNb_inst: for i in 0 to N-1 generate
		ffd_inst: ffd port map(
			clk_i => clk_i,
			rst_i => rst_i,
			ena_i => ena_i,
			d_i   => d_aux(i),
			q_o   => d_aux(i+1)
		);
	end generate;
	d_aux(0) <= d_i;
	q_o <= d_aux(N);
end;