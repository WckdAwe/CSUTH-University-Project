LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY BCDToExcess3 IS
PORT(
  inp1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END BCDToExcess3;

ARCHITECTURE behavioral OF BCDToExcess3 IS
BEGIN
  PROCESS(inp1)
  BEGIN
    IF inp1 = "0000" THEN
      out1 <= "0011";
    ELSIF inp1 = "0001" THEN
      out1 <= "0100";
    ELSIF inp1 = "0010" THEN
      out1 <= "0101";
    ELSIF inp1 = "0011" THEN
      out1 <= "0110";
    ELSIF inp1 = "0100" THEN
      out1 <= "0111";
    ELSIF inp1 = "0101" THEN
      out1 <= "1000";
    ELSIF inp1 = "0110" THEN
      out1 <= "1001";
    ELSIF inp1 = "0111" THEN
      out1 <= "1010";
    ELSIF inp1 = "1000" THEN
      out1 <= "1011";
    ELSIF inp1 = "1001" THEN
      out1 <= "1100";
    END IF;
  END PROCESS;
END behavioral;
