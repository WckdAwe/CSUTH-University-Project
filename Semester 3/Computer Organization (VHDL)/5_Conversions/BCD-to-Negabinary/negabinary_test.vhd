LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY negabinary IS
PORT(
  inp1 : IN INTEGER;
  outpt : OUT INTEGER
);
END negabinary;

ARCHITECTURE behavioral OF negabinary IS
BEGIN
  PROCESS(inp1)
  VARIABLE inp, out1, remainder : INTEGER;
  VARIABLE i : INTEGER;
  BEGIN
    inp := inp1;
    i := 1;
    WHILE(inp /= 0) LOOP
      remainder := inp mod (-2);
      inp := inp rem (-2);
      out1 := out1 + (remainder * i);
      i := i * 10;
    END LOOP;
    outpt <= out1;
  END PROCESS;
END behavioral;
