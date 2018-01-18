LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY negabinary_tb IS
END negabinary_tb;

ARCHITECTURE tb OF negabinary_tb IS
COMPONENT negabinary IS
PORT(
  inp1 : IN INTEGER RANGE 0 TO 9;
  outpt : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
);
END COMPONENT;

SIGNAL inp1 : INTEGER RANGE 0 TO 9;
SIGNAL outpt : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
  test_unit : negabinary PORT MAP(inp1, outpt);
  PROCESS
  BEGIN
    inp1 <= 0;
    WAIT FOR 30 ps;
    inp1 <= 1;
    WAIT FOR 30 ps;
    inp1 <= 2;
    WAIT FOR 30 ps;
    inp1 <= 3;
    WAIT FOR 30 ps;
    inp1 <= 4;
    WAIT FOR 30 ps;
    inp1 <= 5;
    WAIT FOR 30 ps;
    inp1 <= 6;
    WAIT FOR 30 ps;
    inp1 <= 7;
    WAIT FOR 30 ps;
    inp1 <= 8;
    WAIT FOR 30 ps;
    inp1 <= 9;
    WAIT FOR 30 ps;
  END PROCESS;
END tb;
