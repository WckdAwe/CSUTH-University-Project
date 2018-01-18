LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ4 IS
PORT(
  a, b, c : IN STD_LOGIC;
  y : OUT STD_LOGIC
);
END circ4;

ARCHITECTURE dataflow OF circ4 IS
BEGIN
  y <= (NOT (a AND b)) AND (NOT (NOT c));
END dataflow;
