LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ7 IS
PORT(
  a, b : IN STD_LOGIC;
  o1, o2 : OUT STD_LOGIC
);
END circ7;

ARCHITECTURE dataflow OF circ7 IS
BEGIN
  o1 <= (a NAND b) NAND (a NAND b);
  o2 <= ((a NAND b) NAND ((a NAND a) NAND (b NAND b))) NAND ((a NAND b) NAND ((a NAND a) NAND (b NAND b)));
END dataflow;
