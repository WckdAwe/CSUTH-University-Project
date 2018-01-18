LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY PISO IS
PORT(
  clk, load : IN STD_LOGIC;
  pi : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  so : OUT STD_LOGIC
);
END PISO;


ARCHITECTURE arch OF PISO IS
SIGNAL t : STD_LOGIC;
SIGNAL tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  PROCESS(clk, load)
  BEGIN
    IF(load = '1') THEN tmp <= pi;
    ELSIF(RISING_EDGE(clk)) THEN
      t <= tmp(7);
      tmp(7 DOWNTO 1) <= tmp(6 DOWNTO 0);
      tmp(0) <= '0';
    END IF;
  END PROCESS;
  so <= t;
END arch;
