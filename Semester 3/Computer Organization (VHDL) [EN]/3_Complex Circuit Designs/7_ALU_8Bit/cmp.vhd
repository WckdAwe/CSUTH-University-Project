LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY CMP IS
PORT(
  i1, i2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  o1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END CMP;

ARCHITECTURE arc OF CMP IS
BEGIN
  o1 <= "00000000" WHEN (unigned(i1) = unsigned(i2)) ELSE
        "00000001" WHEN (unsigned(i1) < unsigned(i2)) ELSE
        "10000000";
END arc;
