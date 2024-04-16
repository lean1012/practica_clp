library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity barrelshifterN is
	generic (
		N: natural := 4
	);

	port(
		a_i: in std_logic_vector(N-1 downto 0);
        des_i: in std_logic_vector(N-1 downto 0); -- lo deje con N-1, en la implementación verifico que sea un número posible  
		s_o: out std_logic_vector(N-1 downto 0)
	);
end;

architecture barrelshifterN_arq of barrelshifterN is

	signal zeros: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_aux: std_logic_vector(N-1 downto 0) := (others => '0');

	begin
	
		process(a_i,des_i)
		begin
			if(to_integer(unsigned(des_i)) > N) then
				s_aux <= (others => '0');
			elsif(to_integer(unsigned(des_i)) > 0) then
				s_aux <=  zeros(N-1 downto N - to_integer(unsigned(des_i))) & a_i(N-1 downto to_integer(unsigned(des_i)));
			else
				s_aux <= s_aux;
			end if;

		end process;
		s_o <= s_aux;	

end;
