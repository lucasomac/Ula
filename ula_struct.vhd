LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ula_struct IS
	PORT
	(
		operacao : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		operA	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		operB	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Result	: buffer STD_LOGIC_VECTOR(7 DOWNTO 0);
		Cin		: IN STD_LOGIC;
		N,Z,C,B,V : buffer STD_LOGIC
	);
END ula_struct;


ARCHITECTURE ula_arch OF ula_struct IS
--Arithimetic
constant ADIC : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000001";
constant SUB  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000010";
constant INC  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000011";
constant DEC  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000100";
--Logic
constant OU   : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000101";
constant E    : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000110";
constant NAO  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000111";
constant OUE  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00001000";
constant CP2  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00001001";
--Deslocamento
constant DLE  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00001010";
constant DLD  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00001011";
constant BNUM  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00001100";
constant SNUM  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00001101";
constant RLD  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00001110";
constant RLE  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00001111";
--Iguaaldades
constant EQUAL  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00010000";
constant NEQUAL  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00010001";
constant BIGGER  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00010010";
constant SMALLER  : STD_LOGIC_VECTOR(7 DOWNTO 0):="00010011";

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
			if(result = "00000000") then 
				V <= '1';
			else 
				V <= '0';
			end if;
		when DEC =>
			result <= operA - 1;
			if(result > operA) then 
				V <= '1';
			else 
				V <= '0';
			end if;
		when OU =>
			result <= operA or operB;
		when E =>
			result <= operA and operB;
		when NAO =>
			result <= not operA;
		when OUE =>
			result <= operA xor operB;
		when CP2 =>
			result <= not (operA) + 1;
			if(result = "00000000") then 
				V <= '1';
			else 
				V <= '0';
			end if;
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
		when BNUM =>
			if(operA > operB) then 
				result <= operA;
				else result <= operB;
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
		when SNUM =>
			if(operA < operB) then 
				result <= operA;
				else result <= operB;
		when RLE =>
			C <= operA(7);
			result(7) <= operA(6);
			result(6) <= operA(5);
			result(5) <= operA(4);
			result(4) <= operA(3);
			result(3) <= operA(2);
			result(2) <= operA(1);
			result(1) <= operA(0);
			result(0) <= C;
		when RLD =>
			C <= operA(0);
			result(0) <= operA(1);
			result(1) <= operA(2);
			result(2) <= operA(3);
			result(3) <= operA(4);
			result(4) <= operA(5);
			result(5) <= operA(6);
			result(6) <= operA(7);
			result(7) <= C;
		when EQUAL =>
			if(operA = operB) then 
				Z <= '1';
				else Z <= '0';
		when NEQUAL =>
			if(operA /= operB) then 
				B <= '1';
				else B <= '0';
		when BIGGER =>
			if(operA > operB) then 
				B <= '1';
				else B <= '0';
		when SMALLER =>
			if(operA < operB) then 
				Z <= '1';
				else Z <= '0';
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
END ula_arch;