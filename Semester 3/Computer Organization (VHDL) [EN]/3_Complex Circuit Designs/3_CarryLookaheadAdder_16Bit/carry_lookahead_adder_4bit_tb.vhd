LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY carry_lookahead_adder_4bit_tb IS
END carry_lookahead_adder_4bit_tb;

ARCHITECTURE tb OF carry_lookahead_adder_4bit_tb IS
COMPONENT carry_lookahead_adder_4bit IS
PORT(
  A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cin : IN STD_LOGIC;
  Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout, PG, GG : OUT STD_LOGIC
);
END COMPONENT;
SIGNAL A, B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Cin : STD_LOGIC;
SIGNAL Sum : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Cout, PG, GG : STD_LOGIC;
BEGIN
  test_unit: carry_lookahead_adder_4bit PORT MAP(A, B, Cin, Sum, Cout, PG, GG);
  PROCESS
  BEGIN
    Cin <= '0';
    A <= "0000";
    B <= "0000";
    WAIT FOR 30 ps;

    A <= "0001";
    B <= "0000";
    WAIT FOR 30 ps;

    A <= "0000";
    B <= "0001";
    WAIT FOR 30 ps;

    A <= "0010";
    B <= "0001";
    WAIT FOR 30 ps;

    A <= "0011";
    B <= "0001";
    WAIT FOR 30 ps;

    A <= "0100";
    B <= "0001";
    WAIT FOR 30 ps;

    A <= "1000";
    B <= "0001";
    WAIT FOR 30 ps;

    A <= "1111";
    B <= "0001";
    WAIT FOR 30 ps;

    A <= "1111";
    B <= "1111";
    WAIT FOR 30 ps;
  END PROCESS;
END tb;
