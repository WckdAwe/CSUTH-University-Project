LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY carry_skip_adder_16bit_tb IS
END carry_skip_adder_16bit_tb;

ARCHITECTURE tb OF carry_skip_adder_16bit_tb IS

COMPONENT carry_skip_adder_16bit IS
PORT(
  A, B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  Cin : IN STD_LOGIC;
  Sum : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
  Cout : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL A, B, Sum : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Cin, Cout :  STD_LOGIC;
BEGIN
  test_unit : carry_skip_adder_16bit PORT MAP (A, B, Cin, Sum, Cout);
  PROCESS
  BEGIN
    Cin <= '1';
    A <= "0000000000000001";
    B <= "0000000000000001";
    WAIT FOR 30 ps;

    Cin <= '0';
    A <= "0000000000000000";
    B <= "0000000000000000";
    WAIT FOR 30 ps;


    A <= "1111111111111111";
    B <= "0000000000000001";
    WAIT FOR 30 ps;


    A <= "1111111111111111";
    B <= "1111111111111111";
    WAIT FOR 30 ps;

  END PROCESS;
END tb;
