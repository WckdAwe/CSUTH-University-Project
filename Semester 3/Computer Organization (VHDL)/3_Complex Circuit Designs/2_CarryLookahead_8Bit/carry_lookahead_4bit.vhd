LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY carry_lookahead_4bit IS
PORT(
  Cin : IN STD_LOGIC;
  P,G : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout, PG, GG : OUT STD_LOGIC
);
END carry_lookahead_4bit;

ARCHITECTURE structural OF carry_lookahead_4bit IS
COMPONENT and4 IS
PORT(
  i1, i2, i3, i4 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT and3 IS
PORT(
  i1, i2, i3 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT and2 IS
PORT(
  i1, i2 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT or4 IS
PORT(
  i1, i2, i3, i4 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT or2 IS
PORT(
  i1, i2 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL PC0, PC1, PC2, PC3 : STD_LOGIC;
SIGNAL C1, C2, C3 : STD_LOGIC;
SIGNAL GG1, GG2, GG3 : STD_LOGIC;

BEGIN
  unit0_0: and2 PORT MAP(P(0), Cin, PC0);
  unit0_1: or2 PORT MAP(PC0, G(0), C1);
  unit1_0: and2 PORT MAP(P(1), C1, PC1);
  unit1_1: or2 PORT MAP(PC1, G(1), C2);
  unit2_0: and2 PORT MAP(P(2), C2, PC2);
  unit2_1: or2 PORT MAP(PC2, G(2), C3);
  unit3_0: and2 PORT MAP(P(3), C3, PC3);
  unit3_1: or2 PORT MAP(PC3, G(3), Cout);

  unit4: and4 PORT MAP(P(0), P(1), P(2), P(3), PG);
  unit5_0: and4 PORT MAP(G(0), P(1), P(2), P(3), GG1);
  unit5_1: and3 PORT MAP(G(1), P(3), P(2), GG2);
  unit5_2: and2 PORT MAP(G(2), P(3), GG3);
  unit5: or4 PORT MAP(GG1, GG2, GG3, G(3), GG);
END structural;
