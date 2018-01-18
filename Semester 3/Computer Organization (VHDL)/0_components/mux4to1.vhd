LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4to1 IS
PORT(
  a, b, c, d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  o1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END mux4to1;

ARCHITECTURE arch OF mux4to1 IS
BEGIN
  o1 <= a WHEN (s = "00") ELSE
        b WHEN (s = "01") ELSE
        c WHEN (s = "10") ELSE
        d;
END arch;
