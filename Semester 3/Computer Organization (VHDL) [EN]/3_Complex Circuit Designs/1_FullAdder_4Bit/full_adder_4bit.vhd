LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_4bit IS
PORT(
  i1, i2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout : OUT STD_LOGIC
);
END full_adder_4bit;

ARCHITECTURE structural OF full_adder_4bit IS

COMPONENT full_adder IS
PORT(
  i1, i2, Cin : IN STD_LOGIC;
  Sum, Cout : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL c1, c2, c3: STD_LOGIC;
BEGIN
  unit0: full_adder PORT MAP(i1(0), i2(0), '0', Sum(0), c1); -- Hard code Cin1 as '0'
  unit1: full_adder PORT MAP(i1(1), i2(1), c1, Sum(1), c2);
  unit2: full_adder PORT MAP(i1(2), i2(2), c2, Sum(2), c3);
  unit3: full_adder PORT MAP(i1(3), i2(3), c3, Sum(3), Cout);
END structural;
