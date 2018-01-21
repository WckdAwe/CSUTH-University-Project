LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY BCDToExcess3_tb IS
END BCDToExcess3_tb;

ARCHITECTURE tb OF BCDToExcess3_tb IS
COMPONENT BCDToExcess3 IS
PORT(
  inp1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;

SIGNAL inp1, out1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
  test_unit : BCDToExcess3 PORT MAP(inp1, out1);
  PROCESS
  BEGIN
    FOR i IN 0 TO 9 LOOP
      inp1 <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
      WAIT FOR 30 ps;
    END LOOP;
  END PROCESS;
END tb;
