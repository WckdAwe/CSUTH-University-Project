LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and2NR IS
PORT(
  i1, i2 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END and2NR;

ARCHITECTURE behavioral OF and2NR IS
BEGIN
  o1 <= i1 and (NOT i2);
END behavioral;
