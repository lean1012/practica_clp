library IEEE;
use IEEE.std_logic_1164.all;

entity sumrestNb is
	generic (
		N: natural := 4
	);

	port(
		sr_i: in std_logic; --suma 0, resta 1
		a_i: in std_logic_vector(N-1 downto 0);   -- N = 4 bit 3 es el signo
        b_i: in std_logic_vector(N-1 downto 0);   -- N = 4 bit 3 es el signo
        s_o: out std_logic_vector(N-1 downto 0);  -- N = 4 bit 3 es el signo
        co_o: out std_logic
	);
end;

architecture sumrestNb_arq of sumrestNb is

	component sumNb
	port(
		a_i: in std_logic_vector(N-1 downto 0);
        b_i: in std_logic_vector(N-1 downto 0);
		ci_i: in std_logic;
        s_o: out std_logic_vector(N-1 downto 0);
        co_o: out std_logic
	);
	end component;

	signal b_aux: std_logic_vector(N-1 downto 0);
	signal ci_aux: std_logic;
	signal co_aux: std_logic;
	signal so_aux: std_logic_vector(N-1 downto 0);

	begin
	
		b_aux <= b_i xor (b_aux'range => sr_i);  -- complemento		
		ci_aux <= sr_i;						    -- le sumo 1 del complemento a 2.

		sumNb_inst: sumNb port map(
			a_i => a_i,
			b_i => b_aux,
			ci_i => ci_aux,
			s_o => so_aux,
			co_o => co_aux
	);

	-- tabla de la verdad: si a,b y s tienen mismo signo no hay overflow, si a,b mismo signo y s signo diferente hay overflow, a y b con distinto signo no puede dar overflow
	co_o <= (not a_i(N-1) and not b_aux(N-1) and so_aux(N-1)) or (a_i(N-1) and b_aux(N-1) and not so_aux(N-1));
	s_o <= so_aux;	
end;

