LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ2 IS
PORT(
  a, b, c : IN STD_LOGIC;
  q : OUT STD_LOGIC
);
END circ2;

ARCHITECTURE dataflow OF circ2 IS
BEGIN
  q <= (a AND b) OR ((b OR c) AND (b and c));
END dataflow;
