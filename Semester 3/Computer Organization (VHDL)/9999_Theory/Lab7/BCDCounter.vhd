LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY BCDCounter IS
PORT(
  clk_enable, clk, reset : IN STD_LOGIC;
  outpt : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END BCDCounter;

ARCHITECTURE arch OF BCDCounter IS
SIGNAL tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
PROCESS(clk, reset)
BEGIN
  IF(reset = '1') THEN
    tmp <= "00000000";
  ELSIF(RISING_EDGE(clk)) THEN
    IF(clk_enable = '1') THEN
      IF(tmp = "100000001")THEN
        tmp <= "00000000";
      ELSE
        tmp <= tmp + 1;
      END IF;
    END IF;
  END IF;
END PROCESS;
outpt <= tmp;
END arch;
