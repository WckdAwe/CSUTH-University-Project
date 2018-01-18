LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and2 IS
PORT(
  i1, i2 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END and2;

ARCHITECTURE behavioral OF and2 IS
BEGIN
  o1 <= i1 and i2;
END behavioral;
