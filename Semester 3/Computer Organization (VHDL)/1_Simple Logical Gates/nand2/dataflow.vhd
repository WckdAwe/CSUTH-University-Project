LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nand2 IS
PORT(
  inp1, inp2 : IN STD_LOGIC;
  out1 : OUT STD_LOGIC
);
END nand2;

ARCHITECTURE dataflow OF nand2 IS
BEGIN
  out1 <= inp1 nand inp2;
END dataflow;
