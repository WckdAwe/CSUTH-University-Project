LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ7 IS
PORT(
  i1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  o1, o2 : OUT STD_LOGIC
);
END circ7;

ARCHITECTURE behavioral OF circ7 IS
BEGIN
  PROCESS (i1)
  BEGIN
    IF i1 = "01" or i1 = "10" THEN
      o1 <= '0';
      o2 <= '1';
    ELSIF i1 = "11" THEN
      o1 <= '1';
      o2 <= '0';
    ELSE
      o1 <= '0';
      o2 <= '0';
    END IF;
  END PROCESS;
END behavioral;
