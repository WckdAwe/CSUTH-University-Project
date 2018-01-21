LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY siso_32 IS
PORT(
  clk,load : IN STD_LOGIC;
  si : IN STD_LOGIC;
  so : OUT STD_LOGIC
);
END siso_32;

ARCHITECTURE structural OF siso_32 IS
SIGNAL temp : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
PROCESS (clk,load)
BEGIN
  IF(load = '1') THEN
    temp(0) <= si;
  END IF;
  IF(RISING_EDGE(clk)) THEN
    temp(31 DOWNTO 1) <= temp(30 DOWNTO 0);
  END IF;
END PROCESS;
so <= temp(7);

END structural;
