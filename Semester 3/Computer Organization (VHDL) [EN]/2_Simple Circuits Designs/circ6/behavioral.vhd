LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ6 IS
PORT( i1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			o1 : OUT STD_LOGIC
		);
END ENTITY circ6;


ARCHITECTURE behavioral OF circ6 IS
BEGIN
	PROCESS(i1)
	BEGIN
		IF i1 = "0000" OR i1 = "1000" OR i1 = "1001" THEN
			o1 <= '1';
		ELSE
			o1 <= '0';
		END IF;
	END PROCESS;
END behavioral;
