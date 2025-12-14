--	Clk                  : 118.1 MHz
--	Wt_READY             : 209.6 MHz

-- INPUT  : 00000000000000001000000001000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000
--	  : 01000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000
-- OUTPUT : 0100010001000111110111000100001011110101111100101000101000011101010111101000010111101111100000111111000011001011101010011101101001100100110111000110100011110110

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY SHA_HASH_Core IS
   PORT( 
	Clk			: IN	std_logic;
	SHA_HASH_ON		: IN	std_logic; -- from SHA_ON
	CORE_ON			: IN	std_logic; -- from SHA_EXECUTIVE
	Wt			: IN	std_logic_vector(31 DOWNTO 0); -- from SHA_WORD_INITIALIZER
	Wt_READY		: IN	std_logic; -- from SHA_WORD_INITIALIZER
	Kt			: IN	std_logic_vector(31 DOWNTO 0); -- from SHA_Kt
	Kt_READY		: IN	std_logic; -- from SHA_Kt
	Ft			: IN	std_logic_vector(31 DOWNTO 0); -- from SHA_Ft
	Ft_READY		: IN	std_logic; -- from SHA_Ft
	Arg_REQ			: OUT	std_logic; -- Wt_REQ, Ft_REQ, Kt_REQ
	W_Times			: OUT	std_logic_vector(3 DOWNTO 0); -- to SHA_WORD_INITIALIZER
	F_K_Times		: OUT	std_logic_vector(4 DOWNTO 0); -- 0 to 4, 5 to 9, 10 to 14, 15 to 19
	Buff_B			: OUT	std_logic_vector(31 DOWNTO 0); -- to SHA_Ft
	Buff_C			: OUT	std_logic_vector(31 DOWNTO 0); -- to SHA_Ft
	Buff_D			: OUT	std_logic_vector(31 DOWNTO 0); -- to SHA_Ft
	HASH_OUTPUT		: OUT	std_logic_vector(0 TO 159); -- to HASH_EXPORT
	HASH_Completed		: OUT	std_logic -- to SHA_EXECUTIVE;
   );
END SHA_HASH_Core;

ARCHITECTURE SHA_HASH_Core_arch OF SHA_HASH_Core IS

TYPE REG32_ABCDE IS ARRAY(0 TO 4) OF std_logic_vector(31 DOWNTO 0);

SIGNAL REG			: REG32_ABCDE;

SIGNAL coreState				: std_logic_vector(2 DOWNTO 0);
SIGNAL initState				: std_logic_vector(1 DOWNTO 0);
SIGNAL Times, tmpTimes				: std_logic_vector(6 DOWNTO 0);

SIGNAL CORE_HASH_ON, arg_READY			: std_logic;

SIGNAL A, B, C, D, E, xWt, xKt, xFt, sA5	: std_logic_vector(31 DOWNTO 0);
SIGNAL new_A, new_B, new_C, new_D, new_E	: std_logic_vector(31 DOWNTO 0);
SIGNAL tmpA, tmpB, tmpC, tmpD, tmpE		: std_logic_vector(31 DOWNTO 0);

BEGIN

PROCESS(Clk, SHA_HASH_ON)
BEGIN
IF SHA_HASH_ON = '0' THEN
   initState <= "00"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE initState IS
WHEN "00" =>
   IF SHA_HASH_ON = '1' THEN
      initState <= "01"; --INITIAL_REG;
   END IF;

WHEN "01" => --INITIAL_REG =>
   initState <= "10"; --RUNNING_CORE;

WHEN "10" => --RUNNING_CORE =>
   initState <= "10";

WHEN OTHERS =>
   initState <= "00";

END CASE;
END IF;
END PROCESS;

CORE_HASH_ON <= '1' WHEN initState = "10" AND CORE_ON = '1'
	ELSE '0';

PROCESS(Clk, CORE_HASH_ON)
BEGIN
IF CORE_HASH_ON = '0' THEN
   coreState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE coreState IS
WHEN "000" => --IDLE =>
   IF CORE_HASH_ON = '1' THEN
      coreState <= "001"; --Request_Arguments_at_Times;
   END IF;

WHEN "001" => --Request_Arguments_at_Times =>
   IF arg_READY = '1' THEN
      coreState <= "010"; --COMPUTING;
   END IF;

WHEN "010" => --COMPUTING =>
   coreState <= "011"; --Check_Times;

WHEN "011" => --Count_UP_Times =>
   coreState <= "100";

WHEN "100" => --Check_Times =>
   IF Times /= "1010000" THEN
      coreState <= "001"; --Request_Arguments_at_Times;
   ELSE
      coreState <= "101";
   END IF;

WHEN "101" =>
   coreState <= "101";

WHEN OTHERS =>
   coreState <= "000";

END CASE;
END IF;
END PROCESS;

REG(0) <= tmpA WHEN coreState = "000"
	ELSE REG(0);

REG(1) <= tmpB WHEN coreState = "000"
	ELSE REG(1);

REG(2) <= tmpC WHEN coreState = "000"
	ELSE REG(2);

REG(3) <= tmpD WHEN coreState = "000"
	ELSE REG(3);

REG(4) <= tmpE WHEN coreState = "000"
	ELSE REG(4);

tmpA <= "01100111010001010010001100000001" WHEN initState = "00"
  ELSE new_A WHEN coreState = "100"
  ELSE new_A + REG(0) WHEN coreState = "101"
  ELSE tmpA;

tmpB <= "11101111110011011010101110001001" WHEN initState = "00"
  ELSE new_B WHEN coreState = "100"
  ELSE new_B + REG(1) WHEN coreState = "101"
  ELSE tmpB;

tmpC <= "10011000101110101101110011111110" WHEN initState = "00"
  ELSE new_C WHEN coreState = "100"
  ELSE new_C + REG(2) WHEN coreState = "101"
  ELSE tmpC;

tmpD <= "00010000001100100101010001110110" WHEN initState = "00"
  ELSE new_D WHEN coreState = "100"
  ELSE new_D + REG(3) WHEN coreState = "101"
  ELSE tmpD;

tmpE <= "11000011110100101110000111110000" WHEN initState = "00"
  ELSE new_E WHEN coreState = "100"
  ELSE new_E + REG(4) WHEN coreState = "101"
  ELSE tmpE;

A <= tmpA(31 DOWNTO 0) WHEN coreState = "001"
ELSE A;

B <= tmpB(31 DOWNTO 0) WHEN coreState = "001"
ELSE B;

C <= tmpC(31 DOWNTO 0) WHEN coreState = "001"
ELSE C;

D <= tmpD(31 DOWNTO 0) WHEN coreState = "001"
ELSE D;

E <= tmpE(31 DOWNTO 0) WHEN coreState = "001"
ELSE E;

xWt <= Wt WHEN Wt_READY = '1'
  ELSE xWt;

xKt <= Kt WHEN coreState = "001"
  ELSE xKt;

xFt <= Ft WHEN coreState = "001"
  ELSE xFt;

new_A <= E + sA5 + xWt + xKt + xFt WHEN coreState = "010"
	ELSE new_A;

new_B <= A(31 DOWNTO 0) WHEN coreState = "010"
	ELSE new_B;

new_C <= B(1 DOWNTO 0) & B(31 DOWNTO 2) WHEN coreState = "010"
	ELSE new_C;

new_D <= C WHEN coreState = "010"
	ELSE new_D;

new_E <= D WHEN coreState = "010"
	ELSE new_E;

sA5   <= A(26 DOWNTO 0) & A(31 DOWNTO 27);

arg_READY <= Wt_READY AND Ft_READY AND Kt_READY;

Arg_REQ <= '1' WHEN coreState = "001" OR coreState = "010"
	ELSE '0';

W_Times <= Times(3 DOWNTO 0);
F_K_Times <= Times(6 DOWNTO 2);

Buff_B <= tmpB;
Buff_C <= tmpC;
Buff_D <= tmpD;

HASH_OUTPUT <= REG(0) & REG(1) & REG(2) & REG(3) & REG(4);-- WHEN coreState = "101"
--	ELSE (OTHERS => '0');

HASH_Completed    <= '1' WHEN coreState = "101" AND Times(6 DOWNTO 4) = "101"
		ELSE '0';

Times	  <= "0000000" WHEN coreState = "000"
	ELSE tmpTimes + 1 WHEN coreState = "011"
	ELSE Times;

tmpTimes  <= "0000000" WHEN coreState = "000"
	ELSE Times WHEN coreState = "100"
	ELSE tmpTimes;

-- c025ad4f 
END SHA_HASH_Core_arch;