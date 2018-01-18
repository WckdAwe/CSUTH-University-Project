LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ5 IS
PORT(
  a, b : IN STD_LOGIC;
  d0, d1, d2, d3 : OUT STD_LOGIC
);
END circ5;


ARCHITECTURE structural OF circ5 IS

COMPONENT and2
PORT(
    i1, i2 : IN STD_LOGIC;
    o1 : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT not1
PORT(
    i1 : IN STD_LOGIC;
    o1 : OUT STD_LOGIC
  );
END COMPONENT;

SIGNAL sig1, sig2 : STD_LOGIC;

BEGIN
  unit1: not1 PORT MAP(a, sig1);
  unit2: not1 PORT MAP(b, sig2);
  unit3: and2 PORT MAP(sig1, sig2, d0);
  unit4: and2 PORT MAP(a, sig2, d1);
  unit5: and2 PORT MAP(sig1, b, d2);
  unit6: and2 PORT MAP(a, b, d3);
END structural;
