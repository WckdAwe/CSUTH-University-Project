LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Multiplier2x2 IS
PORT(
  A, B: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  O : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END Multiplier2x2;

ARCHITECTURE structural OF Multiplier2x2 IS

COMPONENT or2 IS
PORT(
  i1, i2 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT and2 IS
PORT(
  i1, i2 : IN STD_LOGIC;
  o1 : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL sig1, sig2 : STD_LOGIC;
BEGIN
  unit1: and2 PORT MAP (B(1), A(1), O(2));
  unit2_0: and2 PORT MAP (B(0), A(1), sig1);
  unit2_1: and2 PORT MAP (B(1), A(0), sig2);
  unit2: or2 PORT MAP (sig1, sig2, O(1));
  unit3: and2 PORT MAP (B(0), A(0), O(0));
END structural;
