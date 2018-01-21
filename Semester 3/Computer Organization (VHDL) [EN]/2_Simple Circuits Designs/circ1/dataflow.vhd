LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ1 IS
PORT(
  a, b, c, d : IN STD_LOGIC;
  e : OUT STD_LOGIC
);
END circ1;

ARCHITECTURE dataflow OF circ1 IS
BEGIN
  e <= (a AND (NOT b) AND (NOT c)) OR ((NOT b) AND (NOT c) AND (NOT d));
END dataflow;
