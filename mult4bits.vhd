library ieee;
use ieee.std_logic_1164.all;
entity mult4bits is
	port (a, b: in std_logic_vector (3 downto 0);
			s: out std_logic_vector (7 downto 0));
end mult4bits;
architecture arch_mult4bits of mult4bits is
-- deslocamento de 1 bit para esquerda, zerando o bit menos significativo
function deslocador (x : std_logic_vector (3 downto 0))
return std_logic_vector is
variable y : std_logic_vector (3 downto 0);
begin
	for i in 3 downto 1 loop
		y(i) := x(i-1);
	end loop ;
	y(0) := '0';
	return y;
end;


function deslocador8 (x : std_logic_vector (7 downto 0))
return std_logic_vector is
variable y : std_logic_vector (7 downto 0);
begin
	for i in 7 downto 1 loop
		y(i) := x(i-1);
	end loop ;
	y(0) := '0';
	return y;
end;

-- somador de 8 bits
function somador8bits (a : std_logic_vector (7 downto 0); b : std_logic_vector (7 downto 0))
return std_logic_vector is
variable vaium : std_logic;
variable soma : std_logic_vector (7 downto 0);
begin
	vaium := '0';
	for i in 0 to 7 loop
		soma(i) := a(i) xor b(i) xor vaium;
		vaium := ( a(i) and b(i) ) or ( b(i) and vaium) or (vaium and a(i) );
	end loop;
return soma;
end;

begin
	process(a,b)
	variable aux1 : std_logic_vector (7 downto 0);
	variable aux2 : std_logic_vector (3 downto 0);
	variable vaium : std_logic;
	begin
		-- inicializações
		aux1 := "00000000";
		aux2 := a;
		vaium := '0';
		-- implementação do algoritmo
		for i in 0 to 3 loop
			aux1 := deslocador8( aux1 );
			vaium := aux2(3);
			if vaium = '1' then
				aux1 := somador8bits( aux1, "0000"&b );
			end if;
			aux2 := deslocador( aux2 );
		end loop;
		s <= aux1;
	end process;
end arch_mult4bits;