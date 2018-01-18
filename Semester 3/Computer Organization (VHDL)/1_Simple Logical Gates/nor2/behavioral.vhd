LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nor2 IS
  PORT ( i1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         o1 : OUT STD_LOGIC );
END nor2;

ARCHITECTURE behavioral OF nor2 IS
BEGIN
  PROCESS (i1)
  BEGIN
    IF i1 = "00" THEN
      o1 <= '1';
    ELSE
      o1 <= '0';
    END IF;
  END PROCESS;
END behavioral;
