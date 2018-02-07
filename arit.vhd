LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


PACKAGE ula_package IS
	COMPONENT adic IS 
		PORT
		(
			operA	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			operB	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Result	: buffer STD_LOGIC_VECTOR(7 DOWNTO 0);
			Cin		: IN STD_LOGIC;
			N,Z,C,B,V : buffer STD_LOGIC
		);
	END COMPONENT;
	-------------------------------------------------------
	COMPONENT sub IS 
		PORT
		(
			operA	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			operB	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Result	: buffer STD_LOGIC_VECTOR(7 DOWNTO 0);
			Cin		: IN STD_LOGIC;
			N,Z,C,B,V : buffer STD_LOGIC
		);
	END COMPONENT;
END ula_package;
