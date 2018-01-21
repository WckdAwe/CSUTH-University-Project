LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mealy IS
PORT(
  clk, areset, inp : IN STD_LOGIC;
  outpt : OUT STD_LOGIC
);
END mealy;

ARCHITECTURE fsm OF mealy IS
TYPE state_type IS (S0, S1, S2);
SIGNAL state : state_type;
BEGIN
  PROCESS(clk, areset)
  BEGIN
    IF(areset = '1') THEN state <= S0;
    ELSIF(RISING_EDGE(clk)) THEN
      CASE state IS
        WHEN S0 =>
          IF(inp = '1') THEN state <= S1;
          ELSE state <= S2; END IF;
        WHEN S1 =>
          IF(inp = '1') THEN state <= S1;
          ELSE state <= S2; END IF;
        WHEN S2 =>
          IF(inp = '1') THEN state <= S0;
          ELSE state <= S1; END IF;
      END CASE;
    END IF;
  END PROCESS;

  PROCESS(state, inp)
  BEGIN
    CASE state IS
      WHEN S0 =>
        outpt <= '1';
      WHEN S1 =>
        IF(inp = '1') THEN outpt <= '0';
        ELSE outpt <= '1'; END IF;
      WHEN S2 =>
        IF(inp = '1') THEN outpt <= '1';
        ELSE outpt <= '0'; END IF;
    END CASE;
  END PROCESS;
END fsm;
