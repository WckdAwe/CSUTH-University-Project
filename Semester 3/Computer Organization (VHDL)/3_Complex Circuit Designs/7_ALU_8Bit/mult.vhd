LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MULT IS
PORT(
  i1, i2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  o1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END MULT;

ARCHITECTURE arc OF MULT IS
BEGIN
  o1 <= std_logic_vector((unsigned(i1) * unsigned(i2)));
END arc;
