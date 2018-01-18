LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY DIFF IS
PORT(
  i1, i2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  o1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END DIFF;

ARCHITECTURE arc OF DIFF IS
BEGIN
  o1 <= std_logic_vector((unsigned(i1) - unsigned(i2)));
END arc;
