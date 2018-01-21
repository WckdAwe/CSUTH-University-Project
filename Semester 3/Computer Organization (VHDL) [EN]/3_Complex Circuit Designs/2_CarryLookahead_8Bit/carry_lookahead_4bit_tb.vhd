LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY carry_lookahead_4bit_tb IS
END carry_lookahead_4bit_tb;

ARCHITECTURE tb OF carry_lookahead_4bit_tb IS
COMPONENT carry_lookahead_4bit IS
PORT(
  Cin : IN STD_LOGIC;
  P,G : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout, PG, GG : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL P, G : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Cin, Cout, PG, GG : STD_LOGIC;
BEGIN
  test_unit: carry_lookahead_4bit PORT MAP (Cin, P, G, Cout, PG, GG);
  PROCESS
  BEGIN
    Cin <= '0';

    P <= "0000";
    G <= "0000";
    WAIT FOR 100 ps;

    P <= "0001";
    G <= "0000";
    WAIT FOR 100 ps;

    P <= "0010";
    G <= "0010";
    WAIT FOR 100 ps;

    P <= "0001";
    G <= "0001";
    WAIT FOR 100 ps;

    P <= "0110";
    G <= "0110";
    WAIT FOR 100 ps;

    P <= "1111";
    G <= "1111";
    WAIT FOR 100 ps;

    P <= "1100";
    G <= "0001";
    WAIT FOR 100 ps;
  END PROCESS;
END tb;
