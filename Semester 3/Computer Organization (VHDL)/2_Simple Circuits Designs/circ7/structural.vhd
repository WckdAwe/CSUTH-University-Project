LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circ7 IS
PORT(
  a, b : IN STD_LOGIC;
  o1, o2 : OUT STD_LOGIC
);
END circ7;

ARCHITECTURE structural OF circ7 IS

COMPONENT nand2
PORT(
    i1, i2 : IN STD_LOGIC;
    o1 : OUT STD_LOGIC
  );
END COMPONENT;

SIGNAL sig1, sig2, sig3, sig4, sig5 : STD_LOGIC;

BEGIN
  unit1: nand2 PORT MAP(a, b, sig1);
  unit2: nand2 PORT MAP(a, a, sig2);
  unit3: nand2 PORT MAP(b, b, sig3);
  unit4: nand2 PORT MAP(sig1, sig1, o1);
  unit5: nand2 PORT MAP(sig2, sig3, sig4);
  unit6: nand2 PORT MAP(sig1, sig4, sig5);
  unit7: nand2 PORT MAP(sig5, sig5, o2);
END structural;
