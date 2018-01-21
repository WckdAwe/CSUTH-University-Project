LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY carry_lookahead_8bit_tb IS
END carry_lookahead_8bit_tb;

ARCHITECTURE tb OF carry_lookahead_8bit_tb IS

COMPONENT carry_lookahead_8bit IS
PORT(
  Cin : IN STD_LOGIC;
  P,G : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  Cout : OUT STD_LOGIC;
  PG, GG : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
);
END COMPONENT;

SIGNAL P, G : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL PG, GG : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Cin, Cout : STD_LOGIC;
BEGIN
  test_unit: carry_lookahead_8bit PORT MAP (Cin, P, G, Cout, PG, GG);
  PROCESS
  BEGIN
    Cin <= '0';

    P <= "00000000";
    G <= "00000000";
    WAIT FOR 100 ps;

    P <= "00001100";
    G <= "00001110";
    WAIT FOR 100 ps;

    P <= "11111111";
    G <= "11111111";
    WAIT FOR 100 ps;

    P <= "00111111";
    G <= "00000111";
    WAIT FOR 100 ps;

    P <= "01111111";
    G <= "11111100";
    WAIT FOR 100 ps;

    P <= "00111000";
    G <= "00000110";
    WAIT FOR 100 ps;

    P <= "00111101";
    G <= "00001110";
    WAIT FOR 100 ps;

    P <= "01010100";
    G <= "00101010";
    WAIT FOR 100 ps;

    P <= "00101011";
    G <= "01111001";
    WAIT FOR 100 ps;
  END PROCESS;
END tb;
