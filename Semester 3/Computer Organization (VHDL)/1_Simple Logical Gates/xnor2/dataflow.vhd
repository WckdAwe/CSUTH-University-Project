LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xnor2 IS
  PORT ( inp1 : IN STD_LOGIC;
         inp2 : IN STD_LOGIC;
         out1 : OUT STD_LOGIC );
END xnor2;

ARCHITECTURE dataflow OF xnor2 IS
BEGIN
  out1 <= inp1 xnor inp2;
END dataflow;
