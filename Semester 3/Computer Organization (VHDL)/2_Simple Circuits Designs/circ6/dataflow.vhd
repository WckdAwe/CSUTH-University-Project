LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ6 IS
PORT(
  a, b, c, d : IN STD_LOGIC;
  e : OUT STD_LOGIC
);
END circ6;

ARCHITECTURE dataflow OF circ6 IS
BEGIN
  e <= (a AND (b NOR c)) OR ((b NOR c) AND (NOT d));
END dataflow;
