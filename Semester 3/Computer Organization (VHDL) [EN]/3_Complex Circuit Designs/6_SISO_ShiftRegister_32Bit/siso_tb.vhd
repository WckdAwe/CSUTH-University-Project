LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY siso_tb IS
END siso_tb;

ARCHITECTURE arc OF siso_tb IS
COMPONENT siso_32 IS
PORT(
  clk, load : IN STD_LOGIC;
  si : IN STD_LOGIC;
  so : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL clk, load, si, so : STD_LOGIC;
BEGIN
  test_unit : siso_32 PORT MAP(clk, load, si, so);
  PROCESS
  BEGIN
    load <= '1';
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '0';
    clk <= '0';
    WAIT FOR 30 ps;
    load <= '0';
    si <= '0';
    clk <= '1';
    WAIT FOR 30 ps;
    si <= '1';
    clk <= '0';
    WAIT FOR 30 ps;

  END PROCESS;

END arc;
