LIBRARY ieee; -- 97.2
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY TDES_KEY_SCHEDULER IS
   PORT (
      Clk		: IN	std_logic;
      TKEY_ON		: IN	std_logic; -- connect to Keys_Completed of TDES_KEY_READER
      SUBKEY_REQ	: IN	std_logic; -- connect to TDES_TRANSFORMER
      TDES_ENC_DEC	: IN	std_logic; 			-- interact with Algorithm Decoder
      KMode		: IN	std_logic_vector(1 DOWNTO 0);
      Key1		: IN	std_logic_vector(0 TO 63);
      Key2		: IN	std_logic_vector(0 TO 63);
      Key3		: IN	std_logic_vector(0 TO 63);
      Ki		: OUT	std_logic_vector(0 TO 47); 	-- connected to Data Bus of DATA_EXPORT
      SUBKEY_Completed	: OUT	std_logic
   );
END TDES_KEY_SCHEDULER;

ARCHITECTURE TDES_KEY_SCHEDULER_arch OF TDES_KEY_SCHEDULER IS

SIGNAL phaseState : std_logic_vector(2 DOWNTO 0); --statePhase1;

SIGNAL bool_Phase_Completed						: BOOLEAN;
SIGNAL bool_Phase1_Completed, bool_Phase2_Completed, bool_Phase3_Completed	: BOOLEAN;
SIGNAL bool_IDLE, bool_INITIALIZE					: BOOLEAN;

SIGNAL Phase_Number			: std_logic_vector(1 DOWNTO 0);
SIGNAL Round_Counter			: std_logic_vector(5 DOWNTO 0);
SIGNAL tmpCount				: std_logic_vector(4 DOWNTO 0);
SIGNAL tmpFlag, ModeFlag		: std_logic;
SIGNAL CS, DS				: std_logic_vector(0 TO 27);
SIGNAL PC1, PC1a, PC1b, PC1c		: std_logic_vector(55 DOWNTO 0);

BEGIN

-- ==================================================================================== --
--				PHASE 1 STATE MACHINE					--
-- ==================================================================================== --
PROCESS(Clk, TKEY_ON)
BEGIN
IF TKEY_ON = '0' THEN
   phaseState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE phaseState IS
WHEN "000" => --IDLE =>
   IF TKEY_ON = '1' THEN
      phaseState <= "001"; --INITIALIZE;
   END IF;

WHEN "001" => --INITIALIZE =>
   phaseState <= "010"; --GENERATING;

WHEN "010" => --WAIT_REQUEST =>
   IF SUBKEY_REQ = '1' THEN
      phaseState <= "011"; --NOTIFY_Subkey_Completed;
   END IF;

WHEN "011" => --NOTIFY_Subkey_Completed =>
   phaseState <= "100"; --CHECK_COUNTER;

WHEN "100" => --CHECK_COUNTER =>
   IF Round_Counter(4 DOWNTO 0) = "10000" THEN
      phaseState <= "101"; --PHASE_COMPLETED;
   ELSE
      phaseState <= "010"; --WAIT_REQUEST;
   END IF;

WHEN "101" => --PHASE_COMPLETED =>
   IF NOT bool_Phase3_Completed THEN
      phaseState <= "001"; --INITIALIZE;
   ELSE
      phaseState <= "110"; --PHASE_COMPLETED;
   END IF;

WHEN "110" =>
      phaseState <= "000"; --IDLE;

WHEN OTHERS =>
   phaseState <= "000";

END CASE;
END IF;
END PROCESS;

PROCESS (Clk, bool_IDLE, bool_Phase_Completed, bool_Phase1_Completed, bool_Phase2_Completed)
BEGIN
IF Clk'EVENT AND Clk = '1' THEN
IF bool_IDLE THEN
   bool_Phase1_Completed <= FALSE;
   bool_Phase2_Completed <= FALSE;
   bool_Phase3_Completed <= FALSE;

ELSIF bool_Phase_Completed THEN
   IF bool_Phase2_Completed THEN
      bool_Phase3_Completed <= TRUE;
   ELSIF bool_Phase1_Completed THEN
      bool_Phase2_Completed <= TRUE;
   ELSIF NOT bool_Phase1_Completed THEN
      bool_Phase1_Completed <= TRUE;
   END IF;
END IF;
END IF;
END PROCESS;

-- ==================================================================================== --
--				SIGNAL ASSIGNMENT SPACE					--
-- ==================================================================================== --
Round_Counter(5) <= NOT tmpFlag WHEN phaseState = "001"
	ELSE Round_Counter(5);

tmpFlag <= ModeFlag WHEN phaseState = "000"
	ELSE Round_Counter(5) WHEN phaseState = "010"
	ELSE tmpFlag;

ModeFlag <= NOT TDES_ENC_DEC WHEN KMode = "00"
	ELSE '0';

Round_Counter(4 DOWNTO 0) <= "00000" WHEN phaseState = "001"
	ELSE tmpCount + 1 WHEN phaseState = "011"
	ELSE Round_Counter(4 DOWNTO 0);

tmpCount <= "00000" WHEN phaseState = "001"
	ELSE Round_Counter(4 DOWNTO 0) WHEN phaseState = "100"
	ELSE tmpCount;

bool_IDLE <= phaseState = "000"; --IDLE;
bool_Phase_Completed <= phaseState = "101"; --PHASE_COMPLETED;

SUBKEY_Completed  <= '1' WHEN phaseState = "011" OR phaseState = "100"
		ELSE '0';

Phase_Number <= "01" WHEN TKEY_ON = '1' AND NOT bool_Phase1_Completed
	ELSE "10" WHEN bool_Phase1_Completed AND NOT bool_Phase2_Completed
	ELSE "11" WHEN bool_Phase2_Completed
	ELSE "00";

PC1	  <= PC1a WHEN (Phase_Number = "01" AND ModeFlag = '0') OR (Phase_Number = "11" AND ModeFlag = '1')
	ELSE PC1b WHEN Phase_Number = "10"
	ELSE PC1c WHEN (Phase_Number = "11" AND ModeFlag = '0') OR (Phase_Number = "01" AND ModeFlag = '1')
	ELSE (OTHERS => '0');

PC1a <= Key1(56) & Key1(48) & Key1(40) & Key1(32) & Key1(24) & Key1(16) & Key1(8)  & Key1(0)  & Key1(57) & Key1(49) & Key1(41) & Key1(33) & Key1(25) & Key1(17) &
	Key1(9)  & Key1(1)  & Key1(58) & Key1(50) & Key1(42) & Key1(34) & Key1(26) & Key1(18) & Key1(10) & Key1(2)  & Key1(59) & Key1(51) & Key1(43) & Key1(35) &
	Key1(62) & Key1(54) & Key1(46) & Key1(38) & Key1(30) & Key1(22) & Key1(14) & Key1(6)  & Key1(61) & Key1(53) & Key1(45) & Key1(37) & Key1(29) & Key1(21) &
	Key1(13) & Key1(5)  & Key1(60) & Key1(52) & Key1(44) & Key1(36) & Key1(28) & Key1(20) & Key1(12) & Key1(4)  & Key1(27) & Key1(19) & Key1(11) & Key1(3);

PC1b <= Key2(56) & Key2(48) & Key2(40) & Key2(32) & Key2(24) & Key2(16) & Key2(8)  & Key2(0)  & Key2(57) & Key2(49) & Key2(41) & Key2(33) & Key2(25) & Key2(17) &
	Key2(9)  & Key2(1)  & Key2(58) & Key2(50) & Key2(42) & Key2(34) & Key2(26) & Key2(18) & Key2(10) & Key2(2)  & Key2(59) & Key2(51) & Key2(43) & Key2(35) &
	Key2(62) & Key2(54) & Key2(46) & Key2(38) & Key2(30) & Key2(22) & Key2(14) & Key2(6)  & Key2(61) & Key2(53) & Key2(45) & Key2(37) & Key2(29) & Key2(21) &
	Key2(13) & Key2(5)  & Key2(60) & Key2(52) & Key2(44) & Key2(36) & Key2(28) & Key2(20) & Key2(12) & Key2(4)  & Key2(27) & Key2(19) & Key2(11) & Key2(3);

PC1c <= Key3(56) & Key3(48) & Key3(40) & Key3(32) & Key3(24) & Key3(16) & Key3(8)  & Key3(0)  & Key3(57) & Key3(49) & Key3(41) & Key3(33) & Key3(25) & Key3(17) &
	Key3(9)  & Key3(1)  & Key3(58) & Key3(50) & Key3(42) & Key3(34) & Key3(26) & Key3(18) & Key3(10) & Key3(2)  & Key3(59) & Key3(51) & Key3(43) & Key3(35) &
	Key3(62) & Key3(54) & Key3(46) & Key3(38) & Key3(30) & Key3(22) & Key3(14) & Key3(6)  & Key3(61) & Key3(53) & Key3(45) & Key3(37) & Key3(29) & Key3(21) &
	Key3(13) & Key3(5)  & Key3(60) & Key3(52) & Key3(44) & Key3(36) & Key3(28) & Key3(20) & Key3(12) & Key3(4)  & Key3(27) & Key3(19) & Key3(11) & Key3(3);

CS	  <= PC1(26 DOWNTO 0) & PC1(27)		  WHEN Round_Counter = "000001" OR Round_Counter = "110000"
	ELSE PC1(25 DOWNTO 0) & PC1(27 DOWNTO 26) WHEN Round_Counter = "000010" OR Round_Counter = "101111"
	ELSE PC1(23 DOWNTO 0) & PC1(27 DOWNTO 24) WHEN Round_Counter = "000011" OR Round_Counter = "101110"
	ELSE PC1(21 DOWNTO 0) & PC1(27 DOWNTO 22) WHEN Round_Counter = "000100" OR Round_Counter = "101101"
	ELSE PC1(19 DOWNTO 0) & PC1(27 DOWNTO 20) WHEN Round_Counter = "000101" OR Round_Counter = "101100"
	ELSE PC1(17 DOWNTO 0) & PC1(27 DOWNTO 18) WHEN Round_Counter = "000110" OR Round_Counter = "101011"
	ELSE PC1(15 DOWNTO 0) & PC1(27 DOWNTO 16) WHEN Round_Counter = "000111" OR Round_Counter = "101010"
	ELSE PC1(13 DOWNTO 0) & PC1(27 DOWNTO 14) WHEN Round_Counter = "001000" OR Round_Counter = "101001"
	ELSE PC1(12 DOWNTO 0) & PC1(27 DOWNTO 13) WHEN Round_Counter = "001001" OR Round_Counter = "101000"
	ELSE PC1(10 DOWNTO 0) & PC1(27 DOWNTO 11) WHEN Round_Counter = "001010" OR Round_Counter = "100111"
	ELSE PC1(8 DOWNTO 0)  & PC1(27 DOWNTO 9)  WHEN Round_Counter = "001011" OR Round_Counter = "100110"
	ELSE PC1(6 DOWNTO 0)  & PC1(27 DOWNTO 7)  WHEN Round_Counter = "001100" OR Round_Counter = "100101"
	ELSE PC1(4 DOWNTO 0)  & PC1(27 DOWNTO 5)  WHEN Round_Counter = "001101" OR Round_Counter = "100100"
	ELSE PC1(2 DOWNTO 0)  & PC1(27 DOWNTO 3)  WHEN Round_Counter = "001110" OR Round_Counter = "100011"
	ELSE PC1(0)	      & PC1(27 DOWNTO 1)  WHEN Round_Counter = "001111" OR Round_Counter = "100010"
	ELSE PC1(27 DOWNTO 0)			  WHEN Round_Counter = "010000" OR Round_Counter = "100001"
	ELSE "0000000000000000000000000000";

DS	  <= PC1(54 DOWNTO 28)		 & PC1(55) WHEN Round_Counter = "000001" OR Round_Counter = "110000"
	ELSE PC1(53 DOWNTO 28) & PC1(55 DOWNTO 54) WHEN Round_Counter = "000010" OR Round_Counter = "101111"
	ELSE PC1(51 DOWNTO 28) & PC1(55 DOWNTO 52) WHEN Round_Counter = "000011" OR Round_Counter = "101110"
	ELSE PC1(49 DOWNTO 28) & PC1(55 DOWNTO 50) WHEN Round_Counter = "000100" OR Round_Counter = "101101"
	ELSE PC1(47 DOWNTO 28) & PC1(55 DOWNTO 48) WHEN Round_Counter = "000101" OR Round_Counter = "101100"
	ELSE PC1(45 DOWNTO 28) & PC1(55 DOWNTO 46) WHEN Round_Counter = "000110" OR Round_Counter = "101011"
	ELSE PC1(43 DOWNTO 28) & PC1(55 DOWNTO 44) WHEN Round_Counter = "000111" OR Round_Counter = "101010"
	ELSE PC1(41 DOWNTO 28) & PC1(55 DOWNTO 42) WHEN Round_Counter = "001000" OR Round_Counter = "101001"
	ELSE PC1(40 DOWNTO 28) & PC1(55 DOWNTO 41) WHEN Round_Counter = "001001" OR Round_Counter = "101000"
	ELSE PC1(38 DOWNTO 28) & PC1(55 DOWNTO 39) WHEN Round_Counter = "001010" OR Round_Counter = "100111"
	ELSE PC1(36 DOWNTO 28) & PC1(55 DOWNTO 37) WHEN Round_Counter = "001011" OR Round_Counter = "100110"
	ELSE PC1(34 DOWNTO 28) & PC1(55 DOWNTO 35) WHEN Round_Counter = "001100" OR Round_Counter = "100101"
	ELSE PC1(32 DOWNTO 28) & PC1(55 DOWNTO 33) WHEN Round_Counter = "001101" OR Round_Counter = "100100"
	ELSE PC1(30 DOWNTO 28) & PC1(55 DOWNTO 31) WHEN Round_Counter = "001110" OR Round_Counter = "100011"
	ELSE PC1(28)	       & PC1(55 DOWNTO 29) WHEN Round_Counter = "001111" OR Round_Counter = "100010"
	ELSE PC1(55 DOWNTO 28)			   WHEN Round_Counter = "010000" OR Round_Counter = "100001"
	ELSE "0000000000000000000000000000";

Ki	  <= CS(13) & CS(16) & CS(10) & CS(23) & CS(0)  & CS(4) &
	     CS(2)  & CS(27) & CS(14) & CS(5)  & CS(20) & CS(9) &
	     CS(22) & CS(18) & CS(11) & CS(3)  & CS(25) & CS(7) &
	     CS(15) & CS(6)  & CS(26) & CS(19) & CS(12) & CS(1) &
	     DS(12) & DS(23) & DS(2)  & DS(8)  & DS(18) & DS(26) &
	     DS(1)  & DS(11) & DS(22) & DS(16) & DS(4)  & DS(19) &
	     DS(15) & DS(20) & DS(10) & DS(27) & DS(5)  & DS(24) &
	     DS(17) & DS(13) & DS(21) & DS(7)  & DS(0)  & DS(3);

--Ki <= "100001001010110101010100010101001100101001101010";

END TDES_KEY_SCHEDULER_arch;