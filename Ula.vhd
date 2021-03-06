LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.ula_package.all;

ENTITY ula IS
	PORT
	(
		operacao : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		operA	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		operB	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Result	: buffer STD_LOGIC_VECTOR(7 DOWNTO 0);
		Cin		: IN STD_LOGIC;
		N,Z,C,B,V : buffer STD_LOGIC
	);
END ula;


ARCHITECTURE ula OF ula IS

		BEGIN
		
		startUla : ula_struct PORT MAP (operA, operB, operacao,result,Cin);
		

END ula;