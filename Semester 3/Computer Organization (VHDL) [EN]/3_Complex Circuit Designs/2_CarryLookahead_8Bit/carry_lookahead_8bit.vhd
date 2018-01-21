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

ARCHITECTURE structural OF carry_lookahead_8bit IS

COMPONENT carry_lookahead_4bit IS
PORT(
  Cin : IN STD_LOGIC;
  P,G : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout, PG, GG : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL C4 : STD_LOGIC;

BEGIN
  unit0: carry_lookahead_4bit PORT MAP(Cin, P(3 DOWNTO 0), G(3 DOWNTO 0), C4, PG(0), GG(0));
  unit1: carry_lookahead_4bit PORT MAP(C4, P(7 DOWNTO 4), G(7 DOWNTO 4), Cout, PG(1), GG(1));
END structural;
