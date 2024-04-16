library IEEE;
use IEEE.std_logic_1164.all;

entity mult2x1 is
	generic(
		N: natural := 4
	);
	port(
		a_i: in std_logic_vector(N-1 downto 0);
		b_i: in std_logic_vector(N-1 downto 0);
		sel_i: in std_logic;						--sel = 1 me quedo con a, sel = 0 con b
		s_o: out std_logic_vector(N-1 downto 0)
	);
end;

architecture mult2x1_arq of mult2x1 is
	signal a_aux: std_logic_vector(N-1 downto 0);
	signal b_aux: std_logic_vector(N-1 downto 0);


begin
	s_o <= (a_i and (a_aux'range => sel_i)) or (b_i and (b_aux'range => not sel_i));
end;