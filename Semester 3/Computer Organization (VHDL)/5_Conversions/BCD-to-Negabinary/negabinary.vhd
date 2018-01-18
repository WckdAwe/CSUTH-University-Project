LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY negabinary IS
PORT(
  inp1 : IN INTEGER RANGE 0 TO 9;
  outpt : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
);
END negabinary;

ARCHITECTURE behavioral OF negabinary IS
BEGIN
  PROCESS(inp1)
  BEGIN
    IF inp1 = 0 THEN
      outpt <= "00000";
    ELSIF inp1 = 1 THEN
      outpt <= "00001";
    ELSIF inp1 = 2 THEN
      outpt <= "00110";
    ELSIF inp1 = 3 THEN
      outpt <= "00111";
    ELSIF inp1 = 4 THEN
      outpt <= "00100";
    ELSIF inp1 = 5 THEN
      outpt <= "00101";
    ELSIF inp1 = 6 THEN
      outpt <= "11010";
    ELSIF inp1 = 7 THEN
      outpt <= "11011";
    ELSIF inp1 = 8 THEN
      outpt <= "11000";
    ELSIF inp1 = 9 THEN
      outpt <= "11001";
    END IF;
  END PROCESS;
END behavioral;
