LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg8 IS
PORT(
  clk, reset : IN STD_LOGIC;
  d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END reg8;


ARCHITECTURE arch OF reg8 IS

BEGIN
PROCESS(clk, reset)
BEGIN
  IF(reset = '1') THEN q <= "00000000";
  ELSIF(RISING_EDGE(clk)) THEN q <= d;
  END IF;
END PROCESS;
END arch;
