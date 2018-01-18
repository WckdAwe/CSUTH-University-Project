LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ1 IS
PORT(
  a, b, c, d : IN STD_LOGIC;
  e : OUT STD_LOGIC
);
END circ1;

ARCHITECTURE structural OF circ1 IS

COMPONENT and3NRR
PORT(
    i1, i2, i3 : IN STD_LOGIC;
    o1 : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT and3RRR
PORT(
    i1, i2, i3 : IN STD_LOGIC;
    o1 : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT or2
PORT(
    i1, i2 : IN STD_LOGIC;
    o1 : OUT STD_LOGIC
  );
END COMPONENT;

SIGNAL sig1, sig2 : STD_LOGIC;

BEGIN
  unit1: and3NRR PORT MAP(a, b, c, sig1);
  unit2: and3RRR PORT MAP(b, c, d, sig2);
  unit3: or2 PORT MAP(sig1, sig2, e);
END structural;
