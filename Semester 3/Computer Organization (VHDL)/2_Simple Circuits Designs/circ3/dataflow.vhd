
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ3 IS
PORT(
  a, b, c : IN STD_LOGIC;
  y : OUT STD_LOGIC
);
END circ3;

ARCHITECTURE dataflow OF circ3 IS
BEGIN
  y <= NOT ((a AND b) OR (NOT c));
END dataflow;
