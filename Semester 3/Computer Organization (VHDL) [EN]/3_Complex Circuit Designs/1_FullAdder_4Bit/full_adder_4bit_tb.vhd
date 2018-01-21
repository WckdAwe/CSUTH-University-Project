LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_4bit_tb IS
END full_adder_4bit_tb;

ARCHITECTURE structural OF full_adder_4bit_tb IS

COMPONENT full_adder_4bit IS
PORT(
  i1, i2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL A, B, Sum : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Cout : STD_LOGIC;
BEGIN
  test_unit: full_adder_4bit PORT MAP (A, B, Sum, Cout);
  PROCESS
  BEGIN
    A <= "0000";
    B <= "0000";
    WAIT FOR 100 ps;

    A <= "0001";
    B <= "0000";
    WAIT FOR 100 ps;

    A <= "0010";
    B <= "0010";
    WAIT FOR 100 ps;

    A <= "0011";
    B <= "0001";
    WAIT FOR 100 ps;

    A <= "0010";
    B <= "0001";
    WAIT FOR 100 ps;

    A <= "1000";
    B <= "1000";
    WAIT FOR 100 ps;

    A <= "1111";
    B <= "1111";
    WAIT FOR 100 ps;

    A <= "1111";
    B <= "0001";
    WAIT FOR 100 ps;
  END PROCESS;
END structural;
