LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_tb IS
END ALU_tb;

ARCHITECTURE tb OF ALU_tb IS
COMPONENT ALU IS
PORT(
  A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  funct : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  res : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

SIGNAL A, B : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL funct : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL res : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  test_unit: ALU PORT MAP(A, B, funct, res);
  PROCESS
  BEGIN
    funct <= "00" ;
    A <= "00000111";
    B <= "00000001";
    WAIT FOR 100 ps;

    funct <= "01" ;
    A <= "00000111";
    B <= "00000001";
    WAIT FOR 100 ps;

    funct <= "10" ;
    A <= "00000111";
    B <= "00000010";
    WAIT FOR 100 ps;

    funct <= "11" ;
    A <= "00000111";
    B <= "00000001";
    WAIT FOR 100 ps;
  END PROCESS;
END tb;
