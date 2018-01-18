LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ3 IS
PORT(
  a, b, c : IN STD_LOGIC;
  y : OUT STD_LOGIC
);
END circ3;


ARCHITECTURE structural OF circ3 IS

COMPONENT and2
PORT(
    i1, i2 : IN STD_LOGIC;
    o1 : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT or2
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

SIGNAL sig1, sig2, sig3 : STD_LOGIC;

BEGIN
  unit1: and2 PORT MAP(a, b, sig1);
  unit2: not1 PORT MAP(c, sig2);
  unit3: or2 PORT MAP(sig1, sig2, sig3);
  unit4: not1 PORT MAP(sig3, y);
END structural;
