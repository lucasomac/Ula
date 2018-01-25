LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY ula IS
	PORT
	(
		operacao : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		operA	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		operB	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Result	: buffer STD_LOGIC_VECTOR(7 DOWNTO 0);
		Cin		: IN STD_LOGIC;
		N,Z,C,B,V : buffer STD_LOGIC		
	);
END ula;

ARCHITECTURE ula1 OF ula IS
--Arithimetic
constant ADIC : STD_LOGIC_VECTOR(3 DOWNTO 0):="0001";
constant SUB  : STD_LOGIC_VECTOR(3 DOWNTO 0):="0010";
constant INC  : STD_LOGIC_VECTOR(3 DOWNTO 0):="1010";
constant DEC  : STD_LOGIC_VECTOR(3 DOWNTO 0):="1011";
--Logic
constant OU   : STD_LOGIC_VECTOR(3 DOWNTO 0):="0011";
constant E    : STD_LOGIC_VECTOR(3 DOWNTO 0):="0100";
constant NAO  : STD_LOGIC_VECTOR(3 DOWNTO 0):="0101";
constant OUE  : STD_LOGIC_VECTOR(3 DOWNTO 0):="1100";
constant CP2  : STD_LOGIC_VECTOR(3 DOWNTO 0):="1101";
--Deslocamento
constant DLE  : STD_LOGIC_VECTOR(3 DOWNTO 0):="0110";
constant DLD  : STD_LOGIC_VECTOR(3 DOWNTO 0):="0111";
constant DAE  : STD_LOGIC_VECTOR(3 DOWNTO 0):="1000";
constant DAD  : STD_LOGIC_VECTOR(3 DOWNTO 0):="1001";

BEGIN
	process (operA, operB, operacao,result,Cin)
	variable temp : STD_LOGIC_VECTOR(8 DOWNTO 0);
	begin
		case operacao is
		when ADIC =>
			temp := ('0'&operA) + ('0'&operB);
			result <= temp(7 DOWNTO 0);
			C <= temp(8);
			if (operA(7)=operB(7)) then
				if (operA(7) /= result(7)) then 
					V <= '1';
					else V <= '0';
				end if;
			else V <= '0';
			end if;
		when SUB =>
			temp := ('0'&operA) - ('0'&operB);
			result <= temp(7 DOWNTO 0);
			B <= temp(8);
			if (operA(7) /= operB(7)) then
				if (operA(7) /= result(7)) then
					V <= '1';
					else V <= '0';
				end if;
			else V <= '0';
			end if;
		when INC =>
			result <= operA + 1;
		when DEC =>
			result <= operA - 1;
		when OU =>
			result <= operA or operB;
		when E =>
			result <= operA and operB;
		when NAO =>
			result <= not operA;
		when OUE =>
			result <= operA xor operB;
		when CP2 =>
			result <= (not operA) + 1;
		when DLE =>
			C <= operA(7);
			result(7) <= operA(6);
			result(6) <= operA(5);
			result(5) <= operA(4);
			result(4) <= operA(3);
			result(3) <= operA(2);
			result(2) <= operA(1);
			result(1) <= operA(0);
			result(0) <= Cin;
		when DAE =>
			C <= operA(7);
			result(7) <= operA(6);
			result(6) <= operA(5);
			result(5) <= operA(4);
			result(4) <= operA(3);
			result(3) <= operA(2);
			result(2) <= operA(1);
			result(1) <= operA(0);
			result(0) <= '0';
		when DLD =>
			C <= operA(0);
			result(0) <= operA(1);
			result(1) <= operA(2);
			result(2) <= operA(3);
			result(3) <= operA(4);
			result(4) <= operA(5);
			result(5) <= operA(6);
			result(6) <= operA(7);
			result(7) <= Cin;
		when DAD =>
			C <= operA(0);
			result(0) <= operA(1);
			result(1) <= operA(2);
			result(2) <= operA(3);
			result(3) <= operA(4);
			result(4) <= operA(5);
			result(5) <= operA(6);
			result(6) <= operA(7);
			result(7) <= '0';		
		when others =>
			result <= "00000000";
			Z <= '0';
			N <= '0';
			C <= '0';
			V <= '0';
			B <= '0';
		end case;
		if (result="00000000") then 
			Z <= '1';
			else Z <= '0';
		end if;
		N <= result(7);
	end process;
END ula1;