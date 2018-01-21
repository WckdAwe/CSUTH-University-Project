LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY moore IS
PORT(
  clk, areset, inp : IN STD_LOGIC;
  outpt : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END moore;

ARCHITECTURE fsm OF moore IS
TYPE state_type IS (S0, S1, S2, S3);
SIGNAL state : state_type;
BEGIN
  PROCESS(clk, areset)
  BEGIN
    IF(areset = '1') THEN state <= S0;
    ELSIF(RISING_EDGE(clk))THEN
      CASE state IS
        WHEN S0 => IF (inp = '1') THEN state <= S1; END IF;
        WHEN S1 => IF (inp = '0') THEN state <= S2; END IF;
        WHEN S2 => IF (inp = '1') THEN state <= S3; END IF;
        WHEN S3 => IF (inp = '0') THEN state <= S0; END IF;
      END CASE;
    END IF;
  END PROCESS;

  PROCESS(state)
  BEGIN
    CASE state IS
      WHEN S0 => outpt <= "0000";
      WHEN S1 => outpt <= "1001";
      WHEN S2 => outpt <= "1100";
      WHEN S3 => outpt <= "1111";
    END CASE;
  END PROCESS;

END fsm;
