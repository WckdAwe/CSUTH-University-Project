LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY siso IS
PORT(
  clk,enable : IN STD_LOGIC;
  si : IN STD_LOGIC;
  so : OUT STD_LOGIC
);
END siso;

ARCHITECTURE structural OF siso IS
SIGNAL temp : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
PROCESS (clk)
BEGIN
  IF(RISING_EDGE(clk)) THEN
    IF(enable = '1') THEN
      temp(7 DOWNTO 1) <= temp(6 DOWNTO 0);
      temp(0) <= si;
    END IF;
  END IF;
END PROCESS;
so <= temp(7);

END structural;
