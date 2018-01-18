LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY half_adder IS
PORT(
  i1, i2 : IN STD_LOGIC;
  S, C : OUT STD_LOGIC
);
END half_adder;

ARCHITECTURE behavioral OF half_adder IS
BEGIN
  S <= i1 XOR i2;
  C <= i1 AND i2;
END behavioral;
