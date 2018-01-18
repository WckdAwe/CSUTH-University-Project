LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nand2 IS
PORT(
  i1, i2 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END nand2;

ARCHITECTURE behavioral OF nand2 IS
BEGIN
  o1 <= i1 nand i2;
END behavioral;
