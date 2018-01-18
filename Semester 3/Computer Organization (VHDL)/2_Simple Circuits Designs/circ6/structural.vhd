LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ6 IS
PORT(
  a, b, c, d : IN STD_LOGIC;
  e : OUT STD_LOGIC
);
END circ6;


ARCHITECTURE structural OF circ6 IS

COMPONENT and2
PORT(
    i1, i2 : IN STD_LOGIC;
    o1 : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT nor2
PORT(
    i1, i2 : IN STD_LOGIC;
    o1 : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT and2NR
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

SIGNAL sig1, sig2, sig3 : STD_LOGIC;

BEGIN
  unit1: nor2 PORT MAP(b, c, sig1);
  unit2: and2 PORT MAP(a, sig1, sig2);
  unit3: and2NR PORT MAP(sig1, d, sig3);
  unit4: or2 PORT MAP(sig2, sig3, e);
END structural;
