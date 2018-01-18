LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ5 IS
PORT(
  a, b : IN STD_LOGIC;
  d0, d1, d2, d3 : OUT STD_LOGIC
);
END circ5;

ARCHITECTURE dataflow OF circ5 IS
BEGIN
  d0 <= (NOT a) AND (NOT b);
  d1 <= a AND (NOT b);
  d2 <= (NOT a) AND b;
  d3 <= a AND b;
END dataflow;


