LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux2to1 IS
PORT(
  a, b : IN STD_LOGIC;
  s : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END mux2to1;

ARCHITECTURE arch OF mux2to1 IS
BEGIN
  o1 <= a WHEN (s = '0') ELSE
        b;
END arch;
