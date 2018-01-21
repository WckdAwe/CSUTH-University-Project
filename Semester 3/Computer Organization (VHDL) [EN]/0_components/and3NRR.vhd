LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and3NRR IS
PORT(
  i1, i2, i3 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END and3NRR;

ARCHITECTURE behavioral OF and3NRR IS
BEGIN
  o1 <= i1 and (NOT i2) and (NOT i3);
END behavioral;
