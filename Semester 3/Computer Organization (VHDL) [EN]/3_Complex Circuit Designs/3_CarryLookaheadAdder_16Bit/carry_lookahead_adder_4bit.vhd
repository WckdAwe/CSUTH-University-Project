LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY carry_lookahead_adder_4bit IS
PORT(
  A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cin : IN STD_LOGIC;
  Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout, PG, GG : OUT STD_LOGIC
);
END carry_lookahead_adder_4bit;

ARCHITECTURE structural OF carry_lookahead_adder_4bit IS
COMPONENT carry_lookahead_4bit IS
PORT(
  Cin : IN STD_LOGIC;
  P,G : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout, PG, GG : OUT STD_LOGIC;
  C : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END COMPONENT;

COMPONENT full_adder_pg IS
PORT(
  i1, i2, Cin : IN STD_LOGIC;
  Sum, P, G : OUT STD_LOGIC
);
END COMPONENT;
SIGNAL P, G : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL C : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
  fa_0: full_adder_pg PORT MAP(A(0), B(0), Cin, Sum(0), P(0), G(0));
  fa_1: full_adder_pg PORT MAP(A(1), B(1), C(0), Sum(1), P(1), G(1));
  fa_2: full_adder_pg PORT MAP(A(2), B(2), C(1), Sum(2), P(2), G(2));
  fa_3: full_adder_pg PORT MAP(A(3), B(3), C(2), Sum(3), P(3), G(3));

  unit_cla_logic: carry_lookahead_4bit PORT MAP(Cin, P, G, Cout, PG, GG, C);
END structural;
