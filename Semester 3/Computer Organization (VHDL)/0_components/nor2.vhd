LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nor2 IS
PORT(
  i1, i2 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END nor2;

ARCHITECTURE behavioral OF nor2 IS
BEGIN
  o1 <= i1 nor i2;
END behavioral;
