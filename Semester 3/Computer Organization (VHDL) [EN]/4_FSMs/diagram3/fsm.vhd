LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY diagram3 IS
PORT(
  inp, clk, areset : IN STD_LOGIC;
  outpt : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
);
END diagram3;

ARCHITECTURE moore_fsm OF diagram3 IS

TYPE state_type IS (S0, S1, S2);
SIGNAL state : state_type;

BEGIN
  PROCESS(clk, areset)
  BEGIN
    IF (areset = '1') THEN state <= S0;
    ELSIF (RISING_EDGE(clk)) THEN
      CASE state IS
        WHEN S0 =>
          IF inp = '0' THEN state <= S2;
          ELSE state <= S1;
          END IF;
        WHEN S1 =>
          IF inp = '0' THEN state <= S1;
          ELSE state <= S2;
          END IF;
        WHEN S2 =>
          IF inp = '0' THEN state <= S1;
          ELSE state <= S0;
          END IF;
      END CASE;
    END IF;
  END PROCESS;

  PROCESS (state)
  BEGIN
    CASE state IS
      WHEN S0 =>
        outpt <= "01";
      WHEN S1 =>
        outpt <= "11";
      WHEN S2 =>
        outpt <= "11";
    END CASE;
  END PROCESS;
END moore_fsm;
