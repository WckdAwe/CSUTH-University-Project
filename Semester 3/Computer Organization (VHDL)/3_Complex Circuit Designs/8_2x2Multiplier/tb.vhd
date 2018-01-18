LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Multiplier2x2_tb IS
END Multiplier2x2_tb;

ARCHITECTURE structural OF Multiplier2x2_tb IS

COMPONENT Multiplier2x2 IS
PORT(
  A, B: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  O : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END COMPONENT;

SIGNAL A, B : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL O : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
  test_unit: Multiplier2x2 PORT MAP (A, B, O);

  PROCESS
  BEGIN
    A <= "00";
    B <= "00";
    WAIT FOR 30 ps;

    A <= "00";
    B <= "01";
    WAIT FOR 30 ps;

    A <= "00";
    B <= "10";
    WAIT FOR 30 ps;

    A <= "00";
    B <= "11";
    WAIT FOR 30 ps;

    A <= "01";
    B <= "00";
    WAIT FOR 30 ps;

    A <= "01";
    B <= "01";
    WAIT FOR 30 ps;

    A <= "01";
    B <= "10";
    WAIT FOR 30 ps;

    A <= "01";
    B <= "11";
    WAIT FOR 30 ps;

    A <= "10";
    B <= "00";
    WAIT FOR 30 ps;

    A <= "10";
    B <= "01";
    WAIT FOR 30 ps;

    A <= "10";
    B <= "10";
    WAIT FOR 30 ps;

    A <= "10";
    B <= "11";
    WAIT FOR 30 ps;

    A <= "11";
    B <= "00";
    WAIT FOR 30 ps;

    A <= "11";
    B <= "01";
    WAIT FOR 30 ps;

    A <= "11";
    B <= "10";
    WAIT FOR 30 ps;

    A <= "11";
    B <= "11";
    WAIT FOR 30 ps;
  END PROCESS;
END structural;
