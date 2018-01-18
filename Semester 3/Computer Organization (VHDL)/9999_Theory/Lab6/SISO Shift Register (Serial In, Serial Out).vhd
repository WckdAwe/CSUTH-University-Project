LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SISO IS
PORT(
  clk, si : IN STD_LOGIC;
  so : OUT STD_LOGIC
);
END SISO;


ARCHITECTURE arch OF SISO IS

SIGNAL tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  PROCESS(clk)
  BEGIN
    IF(RISING_EDGE(clk)) THEN
      tmp(7 DOWNTO 1) <= tmp(6 DOWNTO 0);
      tmp(0) <= si;
    END IF;
  END PROCESS;
  so <= tmp(7);
END arch;
