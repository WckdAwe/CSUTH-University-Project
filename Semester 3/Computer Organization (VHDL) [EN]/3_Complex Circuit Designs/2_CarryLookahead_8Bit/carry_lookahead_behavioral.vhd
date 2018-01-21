LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY carry_lookahead_8bit IS
PORT(
  Cin : IN STD_LOGIC;
  P,G : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  Cout : OUT STD_LOGIC;
  PG, GG : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
);
END carry_lookahead_8bit;

ARCHITECTURE behavioral OF carry_lookahead_8bit IS

SIGNAL carry_bits : STD_LOGIC_VECTOR(7 DOWNTO 1);

BEGIN
  PROCESS
  BEGIN
    carry_bits(1) <= G(0) OR (P(0) AND Cin);
    FOR i IN (1 TO 6) LOOP
      carry_bits(i+1) <= G(i) OR (P(i) AND carry_bits(i));
    END LOOP;
    Cout <= G(7) OR (P(7) AND carry_bits(7));

    PG <= P(0) AND P(1) AND P(2) AND P(3) AND P(4) AND P(5) AND P(6) AND P(7);
    GG <= (G(0) AND P(1) AND P(2) AND P(3) AND P(4) AND P(5) AND P(6) AND P(7)) OR
          (G(1) AND P(2) AND P(3) AND P(4) AND P(5) AND P(6) AND P(7)) OR
          (G(2) AND P(3) AND P(4) AND P(5) AND P(6) AND P(7)) OR
          (G(3) AND P(4) AND P(5) AND P(6) AND P(7)) OR
          (G(4) AND P(5) AND P(6) AND P(7)) OR
          (G(5) AND P(6) AND P(7)) OR
          (G(6) AND P(7)) OR
          G(7);

    -- PG <= P(0) AND P(7 DOWNTO 1);
    -- GG <= (G(0) AND P(7 DOWNTO 1) OR
    --      (G(1) AND P(7 DOWNTO 2) OR
    --      (G(2) AND P(7 DOWNTO 3) OR
    --      (G(3) AND P(7 DOWNTO 4) OR
    --      (G(4) AND P(7 DOWNTO 5) OR
    --      (G(5) AND P(7 DOWNTO 6) OR
    --      (G(6) AND P(7)) OR
    --      G(7);
  END PROCESS
END behavioral;
