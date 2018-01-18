LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder IS
PORT(
  i1, i2, Cin : IN STD_LOGIC;
  Sum, Cout : OUT STD_LOGIC
);
END full_adder;

ARCHITECTURE structural OF full_adder IS

COMPONENT half_adder IS
PORT(
  i1, i2 : IN STD_LOGIC;
  S, C : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT or2 IS
PORT(
  i1, i2 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL c1, s1, c2: STD_LOGIC;
BEGIN
  unit1: half_adder PORT MAP(i1, i2, s1, c1);
  unit2: half_adder PORT MAP(Cin, s1, Sum, c2);
  unit3: or2 PORT MAP(c1, c2, Cout);
END structural;
