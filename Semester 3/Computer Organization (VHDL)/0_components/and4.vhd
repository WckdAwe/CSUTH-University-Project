LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and4 IS
PORT(
  i1, i2, i3, i4 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END and4;

ARCHITECTURE behavioral OF and4 IS
BEGIN
  o1 <= i1 and i2 and i3 and i4;
END behavioral;
