LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nand2 IS
PORT(
  i1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  o1 : OUT STD_LOGIC
);
END nand2;

ARCHITECTURE behavioral OF nand2 IS
BEGIN
  PROCESS (i1)
  BEGIN
    IF i1 = "11" THEN
      o1 <= '0';
    ELSE
      o1 <= '1';
    END IF;
  END PROCESS;
END behavioral;
