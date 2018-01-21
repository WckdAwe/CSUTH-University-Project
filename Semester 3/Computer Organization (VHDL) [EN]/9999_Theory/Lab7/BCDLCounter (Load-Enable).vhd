LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY BCDLCounter IS
PORT(
  clk, load : IN STD_LOGIC;
  din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END BCDLCounter;

ARCHITECTURE arch OF BCDLCounter IS
VARIABLE count : UNSIGNED(7 DOWNTO 0) := "00000000";
BEGIN
PROCESS(clk, load)
BEGIN
  IF(RISING_EDGE(clk))THEN
    IF(load = '1') THEN count := din;
    ELSE count := count + 1;
    END IF;
  END IF;
  dout <= count;
END PROCESS;
END arch;
