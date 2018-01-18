LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY light_controller_tb IS
END light_controller_tb;

ARCHITECTURE tb OF light_controller_tb IS
COMPONENT light_controller IS
PORT(
  reset, clk : IN STD_LOGIC;
  EWCar_in, NSCar_in : IN BOOLEAN;
  EWCar_out, NSCar_out : OUT BOOLEAN
);
END COMPONENT;

SIGNAL reset : STD_LOGIC;
SIGNAL EWCar_in, NSCar_in, EWCar_out, NSCar_out : BOOLEAN := FALSE;
SIGNAL clk : STD_LOGIC := '0';
BEGIN
  test_unit: light_controller PORT MAP(reset, clk, EWCar_in, NSCar_in, EWCar_out, NSCar_out);
  clk <=  '1' after 15 ps when clk = '0' else
          '0' after 15 ps when clk = '1';

  PROCESS
  BEGIN
    reset <= '1';
    WAIT FOR 30 ps;
    reset <= '0';

    EWCAR_in <= TRUE;
    WAIT FOR 90 ps;
    EWCar_in <= FALSE;
    NSCar_in <= TRUE;
    WAIT FOR 90 ps;
    EWCar_in <= TRUE;
    NSCar_in <= TRUE;
    WAIT FOR 3000 ps;
  END PROCESS;
END tb;
