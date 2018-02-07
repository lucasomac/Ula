LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE adic IS
      COMPONENT adic
	    PORT(	operA, operB	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			result : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
		);
		END COMPONENT ;
END adic;

ARCHITECTURE adic_arch OF adic IS
BEGIN
result <= '0'&operA + '0'&operB;
END adic_arch;

