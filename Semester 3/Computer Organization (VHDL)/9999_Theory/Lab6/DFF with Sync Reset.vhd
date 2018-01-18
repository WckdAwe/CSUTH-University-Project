LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dffr IS
PORT(
  clk, reset, d : IN STD_LOGIC;
  q : OUT STD_LOGIC
);
END dffr;


ARCHITECTURE arch OF dffr IS

BEGIN
PROCESS(clk)
BEGIN
  IF(RISING_EDGE(clk)) THEN
    IF(reset='1') THEN  q <= '0';
    ELSE q <= d;
    END IF;
  END IF;
END PROCESS;
END arch;
