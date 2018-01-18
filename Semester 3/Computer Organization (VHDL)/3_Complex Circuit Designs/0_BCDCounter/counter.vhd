LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY counter IS
PORT(
  clock_enable, clock, reset: IN STD_LOGIC;
  outpt: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END counter;

ARCHITECTURE structural OF counter IS
SIGNAL temp : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  PROCESS (clock, reset)
  BEGIN
    IF(reset = '1') THEN
      temp <= "00000000";
    ELSIF(RISING_EDGE(clock)) THEN
      IF(clock_enable = '0') THEN
        IF(temp = "100000001") THEN
          temp <= "00000000";
        ELSE temp <= std_logic_vector(signed(temp) + 1);
        END IF;
      END IF;
    END IF;
  END PROCESS;
outpt <= temp;
END structural;
