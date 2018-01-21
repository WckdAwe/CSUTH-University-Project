LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or4 IS
PORT(
  i1, i2, i3, i4 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END or4;

ARCHITECTURE behavioral OF or4 IS
BEGIN
  o1 <= i1 or i2 or i3 or i4;
END behavioral;
