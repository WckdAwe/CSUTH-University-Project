LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and3 IS
PORT(
  i1, i2, i3 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END and3;

ARCHITECTURE behavioral OF and3 IS
BEGIN
  o1 <= i1 and i2 and i3;
END behavioral;
