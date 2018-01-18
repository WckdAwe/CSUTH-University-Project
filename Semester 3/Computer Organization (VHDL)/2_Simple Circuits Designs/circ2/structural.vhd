LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ2 IS
PORT(
  a, b, c : IN STD_LOGIC;
  q : OUT STD_LOGIC
);
END circ2;

ARCHITECTURE structural OF circ2 IS

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

SIGNAL sig1, sig2, sig3, sig4 : STD_LOGIC;

BEGIN
  unit1: and2 PORT MAP(a, b, sig1);
  unit2: or2 PORT MAP(b, c, sig2);
  unit3: and2 PORT MAP(b, c, sig3);
  unit4: and2 PORT MAP(sig2, sig3, sig4);
  unit5: or2 PORT MAP(sig1, sig4, q);
END structural;
