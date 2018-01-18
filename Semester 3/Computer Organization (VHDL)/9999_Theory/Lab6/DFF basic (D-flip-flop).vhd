LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dff IS
PORT(
  clk, d : IN STD_LOGIC;
  q : OUT STD_LOGIC
);
END dff;


ARCHITECTURE arch OF dff IS

BEGIN
PROCESS(clk)
BEGIN
  IF(RISING_EDGE(clk)) THEN q <= d;
  END IF;
END PROCESS;
END arch;
