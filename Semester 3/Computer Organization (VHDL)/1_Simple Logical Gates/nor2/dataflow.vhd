LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nor2 IS
  PORT ( inp1 : IN STD_LOGIC;
         inp2 : IN STD_LOGIC;
         out1 : OUT STD_LOGIC );
END nor2;

ARCHITECTURE dataflow OF nor2 IS
BEGIN
  out1 <= inp1 nor inp2;
END dataflow;
