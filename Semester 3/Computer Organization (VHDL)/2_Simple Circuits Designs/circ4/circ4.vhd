LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ4 IS
PORT(
  a, b, c : IN STD_LOGIC;
  y : OUT STD_LOGIC
);
END circ4;

ARCHITECTURE behavioral OF circ4 IS
BEGIN
  y <= (NOT (a AND b)) AND (NOT (NOT c));
END behavioral;

ARCHITECTURE structural OF circ4 IS

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

SIGNAL sig1, sig2, sig3, sig4 : STD_LOGIC;

BEGIN
  unit1: and2 PORT MAP(a, b, sig1);
  unit2: not1 PORT MAP(c, sig2);
  unit3: not1 PORT MAP(sig1, sig3);
  unit4: not1 PORT MAP(sig2, sig4);
  unit5: and2 PORT MAP(sig3, sig4, y);
END structural;
