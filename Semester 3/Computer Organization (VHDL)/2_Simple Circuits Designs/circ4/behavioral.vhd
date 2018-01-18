LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ4 IS
PORT(
  i1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
  o1 : OUT STD_LOGIC
);
END circ4;

ARCHITECTURE behavioral OF circ4 IS
BEGIN
  PROCESS (i1)
  BEGIN
    IF i1 = "001" OR i1 = "011" OR i1 = "101" THEN
      o1 <= '1';
    ELSE
      o1 <= '0';
    END IF;
  END PROCESS;
END behavioral;
