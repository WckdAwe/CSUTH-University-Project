LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or2 IS
PORT(
  i1, i2 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END or2;

ARCHITECTURE behavioral OF or2 IS
BEGIN
  o1 <= i1 or i2;
END behavioral;
