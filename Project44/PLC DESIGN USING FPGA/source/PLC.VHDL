----------------------------------------------------------------------------------------------------
-- PACKAGE PLC                                                                                    --
----------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

package PLC is

   subtype  CONTROL_STATE is std_logic_vector(4 downto 0);
      constant ERR    : std_logic_vector(4 downto 0) := "11111";  --FF
      constant INIT   : std_logic_vector(4 downto 0) := "00000";  --0
      constant FETCH1 : std_logic_vector(4 downto 0) := "00001";  --1
      constant FETCH2 : std_logic_vector(4 downto 0) := "00010";  --2
      constant DECODE1: std_logic_vector(4 downto 0) := "00011";  --3
      constant DECODE2: std_logic_vector(4 downto 0) := "00100";  --4
      constant EXLD   : std_logic_vector(4 downto 0) := "00101";  --5
      constant EXLDI  : std_logic_vector(4 downto 0) := "00110";  --6
      constant EXAND  : std_logic_vector(4 downto 0) := "00111";  --7
      constant EXANI  : std_logic_vector(4 downto 0) := "01000";  --8
      constant EXOR   : std_logic_vector(4 downto 0) := "01001";  --9
      constant EXORI  : std_logic_vector(4 downto 0) := "01010";  --10 A
      constant EXANB  : std_logic_vector(4 downto 0) := "01011";  --11 b
      constant EXORB  : std_logic_vector(4 downto 0) := "01100";  --12 C
      constant EXOUT  : std_logic_vector(4 downto 0) := "01101";  --13 d
      constant EXOUI  : std_logic_vector(4 downto 0) := "01110";  --14 E
      constant SETTIM : std_logic_vector(4 downto 0) := "01111";  --15 F
      constant SETCNT : std_logic_vector(4 downto 0) := "10000";  --16 10
      constant EXNOP1 : std_logic_vector(4 downto 0) := "10001";  --17 11
      constant EXNOP2 : std_logic_vector(4 downto 0) := "10010";  --18 12
   subtype  REG_TYPE is std_logic_vector(1 downto 0);
      constant rINPUT : std_logic_vector(1 downto 0) := "00";
      constant rOUTPUT: std_logic_vector(1 downto 0) := "01";
      constant rAUX   : std_logic_vector(1 downto 0) := "10";
      constant rTC    : std_logic_vector(1 downto 0) := "11";
   subtype  STACK_OPERATIONS is std_logic_vector(1 downto 0);
      constant sCLR   : std_logic_vector(1 downto 0) := "00";
      constant sPUSH  : std_logic_vector(1 downto 0) := "01";
      constant sPOP   : std_logic_vector(1 downto 0) := "10";
      constant sNOP   : std_logic_vector(1 downto 0) := "11";
   subtype  TC_OPERATIONS is std_logic;
      constant tcSET_C: std_logic := '0';
      constant tcSET_T: std_logic := '1';
   subtype  CPU_OPERATIONS is std_logic_vector(7 downto 0);
      constant iLD    : std_logic_vector(7 downto 0) := "00000000"; --TYPE 1
      constant iLDI   : std_logic_vector(7 downto 0) := "00000001"; --TYPE 1
      constant iAND   : std_logic_vector(7 downto 0) := "00000010"; --TYPE 1
      constant iANI   : std_logic_vector(7 downto 0) := "00000011"; --TYPE 1
      constant iOR    : std_logic_vector(7 downto 0) := "00000100"; --TYPE 1
      constant iORI   : std_logic_vector(7 downto 0) := "00000101"; --TYPE 1
      constant iOUT   : std_logic_vector(7 downto 0) := "00000110"; --TYPE 1
      constant iOUI   : std_logic_vector(7 downto 0) := "00000111"; --TYPE 1
      constant iTIM   : std_logic_vector(7 downto 0) := "01000000"; --TYPE 2
      constant iCNT   : std_logic_vector(7 downto 0) := "01000001"; --TYPE 2
      constant iANB   : std_logic_vector(7 downto 0) := "10000000"; --TYPE 3
      constant iORB   : std_logic_vector(7 downto 0) := "10000001"; --TYPE 3
      constant iNOP   : std_logic_vector(7 downto 0) := "11111110"; --TYPE 3
      constant iEND   : std_logic_vector(7 downto 0) := "11111111"; --TYPE 3
   subtype  ALU_OPERATIONS is std_logic_vector(2 downto 0);
      constant aLD    : std_logic_vector(2 downto 0) := "000";
      constant aLDI   : std_logic_vector(2 downto 0) := "001";
      constant aAND   : std_logic_vector(2 downto 0) := "010";
      constant aANI   : std_logic_vector(2 downto 0) := "011";
      constant aOR    : std_logic_vector(2 downto 0) := "100";
      constant aORI   : std_logic_vector(2 downto 0) := "101";
      constant aNOP   : std_logic_vector(2 downto 0) := "111";
   constant STACK_DEPTH : integer := 31; -- stack depth
   subtype  DATA_BUS is std_logic_vector(7 downto 0);
   subtype  ADDRESS_BUS is std_logic_vector(14 downto 0);
   subtype  IN_ALU_CTRL is std_logic_vector(2 downto 0);
   subtype  OUT_ALU_CTRL is std_logic_vector(1 downto 0);
   subtype  NUMBER is std_logic_vector(13 downto 0);

end PLC;