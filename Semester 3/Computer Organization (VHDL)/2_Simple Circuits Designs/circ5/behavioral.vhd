LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ5 IS
PORT(
  i1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END circ5;

ARCHITECTURE behavioral OF circ5 IS
BEGIN
  PROCESS (i1)
  BEGIN
    IF i1 = "00" THEN
      d <= "1000";
    ELSIF i1 = "01" THEN
      d <= "0010";
    ELSIF i1 = "10" THEN
      d <= "0100";
    ELSE
      d <= "0001";
    END IF;
  END PROCESS;
END behavioral;
