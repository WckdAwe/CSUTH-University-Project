LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY carry_lookahead_adder_16bit IS
PORT(
  A, B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  Cin : IN STD_LOGIC;
  Sum : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
  Cout: OUT STD_LOGIC
);
END carry_lookahead_adder_16bit;

ARCHITECTURE structural OF carry_lookahead_adder_16bit IS
COMPONENT carry_lookahead_adder_4bit IS
PORT(
  A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cin : IN STD_LOGIC;
  Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout, PG, GG : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL C1, C2, C3 : STD_LOGIC;
SIGNAL tmp : STD_LOGIC;
BEGIN
  cla_0: carry_lookahead_adder_4bit PORT MAP (A(3 DOWNTO 0), B(3 DOWNTO 0), Cin, Sum(3 DOWNTO 0), tmp, C1);
  cla_1: carry_lookahead_adder_4bit PORT MAP (A(7 DOWNTO 4), B(7 DOWNTO 4), C1, Sum(7 DOWNTO 4), tmp, C2);
  cla_2: carry_lookahead_adder_4bit PORT MAP (A(11 DOWNTO 8), B(11 DOWNTO 8), C2, Sum(11 DOWNTO 8), tmp, C3);
  cla_3: carry_lookahead_adder_4bit PORT MAP (A(15 DOWNTO 12), B(15 DOWNTO 12), C3, Sum(15 DOWNTO 12), tmp, Cout);
END structural;
