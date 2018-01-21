LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY diagram3_tb IS
END diagram3_tb;

ARCHITECTURE tb OF diagram3_tb IS
COMPONENT diagram3 IS
PORT(
  inp, clk, areset : IN STD_LOGIC;
  outpt : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
);
END COMPONENT;

SIGNAL inp, areset : STD_LOGIC;
SIGNAL outpt : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL clk : STD_LOGIC := '0';
BEGIN
  test_unit: diagram3 PORT MAP(inp, clk, areset, outpt);
  clk <=  '1' after 15 ps when clk = '0' else
          '0' after 15 ps when clk = '1';

  PROCESS
  BEGIN
    areset <= '1';
    WAIT FOR 30 ps;
    areset <= '0';
    inp <= '0';
    WAIT FOR 30 ps;
    inp <= '0';
    WAIT FOR 30 ps;
    inp <= '0';
    WAIT FOR 30 ps;
    inp <= '1';
    WAIT FOR 30 ps;
    inp <= '1';
    WAIT FOR 30 ps;
    inp <= '1';
    WAIT FOR 30 ps;
  END PROCESS;
END tb;
