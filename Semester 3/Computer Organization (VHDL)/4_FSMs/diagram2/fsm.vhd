LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY diagram2 IS
PORT(
  inp, clk, areset : IN STD_LOGIC;
  outpt : OUT STD_LOGIC
);
END diagram2;

ARCHITECTURE moore_fsm OF diagram2 IS

TYPE state_type IS (S1, S2);
SIGNAL state : state_type;

BEGIN
  PROCESS(clk, areset)
  BEGIN
    IF (areset = '1') THEN state <= S1;
    ELSIF (RISING_EDGE(clk)) THEN
      CASE state IS
        WHEN S1 =>
          IF inp = '0' THEN state <= S2;
          ELSE state <= S1;
          END IF;
        WHEN S2 =>
          IF inp = '0' THEN state <= S1;
          ELSE state <= S2;
          END IF;
      END CASE;
    END IF;
  END PROCESS;

  PROCESS (state)
  BEGIN
    CASE state IS
      WHEN S1 =>
        outpt <= '0';
      WHEN S2 =>
        outpt <= '1';
    END CASE;
  END PROCESS;
END moore_fsm;
