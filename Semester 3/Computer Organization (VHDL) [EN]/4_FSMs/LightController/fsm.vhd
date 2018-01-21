LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY light_controller IS
PORT(
  reset, clk : IN STD_LOGIC;
  EWCar_in, NSCar_in : IN BOOLEAN;
  EWCar_out, NSCar_out : OUT BOOLEAN
);
END light_controller;

ARCHITECTURE fsm OF light_controller IS
TYPE state_type IS (IDLE, CHNG_SEL,
                          EWRED, EWYELLOW, EWGREEN,
                          NSRED, NSYELLOW, NSGREEN);
SIGNAL current_state, next_state : state_type;
SIGNAL sel : BOOLEAN := FALSE;
BEGIN
  PROCESS(reset, clk, current_state)
  BEGIN
    next_state <= current_state;
    NSCar_out <= FALSE;
    EWCar_out <= FALSE;
    IF( reset = '1' ) THEN next_state <= IDLE;
    ELSE
      CASE current_state IS
        WHEN IDLE =>
          IF (EWCar_in) THEN
            next_state <= CHNG_SEL;
          ELSIF (EWCar_in) THEN
            next_state <= NSGREEN;
          ELSE
            next_state <= IDLE;
          END IF;
        WHEN CHNG_SEL =>
          IF (sel AND EWCAR_in) THEN
            next_state <= NSGREEN;
          ELSE
            next_state <= EWGREEN;
          END IF;
        WHEN EWGREEN =>
          next_state <= EWYELLOW;
        WHEN EWYELLOW =>
          next_state <= EWRED;
        WHEN EWRED =>
          sel <= TRUE;
          EWCar_out <= TRUE;
          next_state <= IDLE;
        WHEN NSGREEN =>
          next_state <= NSYELLOW;
        WHEN NSYELLOW =>
          next_state <= NSRED;
        WHEN NSRED =>
          sel <= FALSE;
          NSCar_out <= TRUE;
          next_state <= IDLE;
      END CASE;
    END IF;
  END PROCESS;

  PROCESS
  BEGIN
    WAIT UNTIL RISING_EDGE(clk);
    current_state <= next_state;
  END PROCESS;
END fsm;
