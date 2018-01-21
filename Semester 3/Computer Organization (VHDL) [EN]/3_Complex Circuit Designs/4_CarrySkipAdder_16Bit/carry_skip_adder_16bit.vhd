LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY carry_skip_adder_16bit IS
PORT(
  A, B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  Cin : IN STD_LOGIC;
  Sum : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
  Cout : OUT STD_LOGIC
);
END carry_skip_adder_16bit;

ARCHITECTURE structural OF carry_skip_adder_16bit IS

COMPONENT carry_skip_adder_4bit IS
PORT(
  A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cin : IN STD_LOGIC;
  Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL C : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
  unit0: carry_skip_adder_4bit PORT MAP(A(3 DOWNTO 0), B(3 DOWNTO 0), Cin, Sum(3 DOWNTO 0), C(0));
  unit1: carry_skip_adder_4bit PORT MAP(A(7 DOWNTO 4), B(7 DOWNTO 4), C(0), Sum(7 DOWNTO 4), C(1));
  unit2: carry_skip_adder_4bit PORT MAP(A(11 DOWNTO 8), B(11 DOWNTO 8), C(1), Sum(11 DOWNTO 8), C(2));
  unit3: carry_skip_adder_4bit PORT MAP(A(15 DOWNTO 12), B(15 DOWNTO 12), C(2), Sum(15 DOWNTO 12), Cout);

END structural;
