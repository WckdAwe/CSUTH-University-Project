LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY not1 IS
PORT(
  i1 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END not1;

ARCHITECTURE behavioral OF not1 IS
BEGIN
  o1 <= not i1;
END behavioral;
