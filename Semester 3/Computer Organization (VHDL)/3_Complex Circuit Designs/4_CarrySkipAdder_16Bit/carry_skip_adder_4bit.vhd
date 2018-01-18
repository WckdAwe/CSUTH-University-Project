LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY carry_skip_adder_4bit IS
PORT(
  A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cin : IN STD_LOGIC;
  Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout : OUT STD_LOGIC
);
END carry_skip_adder_4bit;

ARCHITECTURE structural OF carry_skip_adder_4bit IS

COMPONENT and4 IS
PORT(
  i1, i2, i3, i4 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT full_adder_pg IS
PORT(
  i1, i2, Cin : IN STD_LOGIC;
  Sum, Cout, P, G : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT mux2to1 IS
PORT(
  a, b : IN STD_LOGIC;
  s : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END COMPONENT;
SIGNAL P, G : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL C : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL p_logic : STD_LOGIC;
BEGIN
  fa_0: full_adder_pg PORT MAP(A(0), B(0), Cin, Sum(0), C(0), P(0), G(0));
  fa_1: full_adder_pg PORT MAP(A(1), B(1), C(0), Sum(1), C(1), P(1), G(1));
  fa_2: full_adder_pg PORT MAP(A(2), B(2), C(1), Sum(2), C(2), P(2), G(2));
  fa_3: full_adder_pg PORT MAP(A(3), B(3), C(2), Sum(3), C(3), P(3), G(3));

  unit_and: and4 PORT MAP(P(0), P(1), P(2), P(3), p_logic);
  mux_unit: mux2to1 PORT MAP(C(3), Cin, p_logic, Cout);
END structural;
