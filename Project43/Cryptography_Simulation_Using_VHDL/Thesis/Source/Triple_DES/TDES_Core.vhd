LIBRARY ieee ; -- 55.5 MHz
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY TDES_Core IS
   PORT (
      Clk		: IN	std_logic;
      TCore_ON		: IN	std_logic;
      TRANSFORM_ON	: IN	std_logic;
      TDES_ENC_DEC	: IN	std_logic; 			-- interact with Algorithm Decoder
      CoreMode		: IN	std_logic_vector(2 DOWNTO 0);
      Data		: IN	std_logic_vector(0 TO 63); 	-- connected to Data Bus of DATA_IMPORT
      IV		: IN	std_logic_vector(0 TO 63);
      Ki		: IN	std_logic_vector(0 TO 47);
      SUBKEY_Completed	: IN	std_logic;
      DOUT_Completed	: IN	std_logic;
      DOUT_ON		: OUT	std_logic;
      DOUT_Mode		: OUT	std_logic_vector(2 DOWNTO 0);
      SUBKEY_REQ	: OUT	std_logic;
      CryptOUT		: OUT	std_logic_vector(0 TO 63); 	-- connected to Data Bus of DATA_EXPORT
      TCore_Completed	: OUT	std_logic
   );
END TDES_Core;

LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY WORK;

ARCHITECTURE TDES_Core_arch OF TDES_Core IS

COMPONENT TDES_TRANSFORMER
   PORT (
      Clk			: IN	std_logic;
      TRANSFORM_ON		: IN	std_logic;
      ENC_Flag_in		: IN	std_logic;
      TINPUT			: IN	std_logic_vector(0 TO 63);
      Ki			: IN	std_logic_vector(0 TO 47);
      SUBKEY_Completed		: IN	std_logic;
      SUBKEY_REQ		: OUT	std_logic;
      TOUTPUT			: OUT	std_logic_vector(0 TO 63);
      TRANSFORM_Completed	: OUT	std_logic
   );
END COMPONENT;

--FOR ALL : TDES_TRANSFORMER USE ENTITY WORK.TDES_TRANSFORMER;

-- TYPE stateMAIN IS (IDLE, Check_IV_Needed, RUNNING_IN_xIVState, RUNNING_IN_ECBState);
-- TYPE stateECB IS (IDLE, SET_INPUT, Initial_Permutation, TRANSFORMING, Final_Permutation, PRODUCE_OUTPUT, EXPORTING_DATA, NOTIFY_Core_Completed, WAIT_TRANSFORM_ON);
-- TYPE stateXIV IS (IDLE, INITIALIZE, WRITEOUT_IV, SET_INPUT, Initial_Permutation, TRANSFORMING, Final_Permutation, PRODUCE_OUTPUT, EXPORTING_DATA, NOTIFY_Core_Completed, WAIT_TRANSFORM_ON);
--TYPE stateTransform IS (IDLE, INITIAL, PHASE1_ON, PREPARE_Next1, PREPARE_COMPLETED, PHASE1_OFF, Check_PhaseCounter, NOTIFY_Completed);
SIGNAL transState : std_logic_vector(2 DOWNTO 0); --stateTransform;
SIGNAL mainState : std_logic_vector(1 DOWNTO 0); --stateMAIN;
SIGNAL ECBState : std_logic_vector(2 DOWNTO 0); --stateECB;
SIGNAL xIVState : std_logic_vector(3 DOWNTO 0); --stateXIV;

SIGNAL bool_IV_Needed, bool_Mode8, bool_Mode16, bool_Mode32		: boolean;
SIGNAL bool_Transforming						: boolean;
SIGNAL bool_WRITEOUT_IV, bool_WRITE_IV_Completed			: boolean;
SIGNAL bool_RUNNING_IN_ECBState, bool_RUNNING_IN_xIVState		: boolean;
SIGNAL bool_TRANSFORM_Completed, bool_EXPORTING_DATA			: boolean;

SIGNAL curr_IV					: std_logic_vector(0 TO 63);
SIGNAL prev_IV					: std_logic_vector(0 TO 55);

SIGNAL ACTUAL_INPUT, preOUTPUT, ACTUAL_OUTPUT	: std_logic_vector(0 TO 63);
SIGNAL IP, FP, FB, FB_8, FB_16, FB_32		: std_logic_vector(0 TO 63);

SIGNAL Phase_ON								: std_logic;
SIGNAL PhaseCounter, tmpPhCounter					: std_logic_vector(1 DOWNTO 0);
SIGNAL TRANSFORM_Completed1, TRANSFORM_Completed3 : std_logic;
SIGNAL tmpFlag, ENC_Flag					: std_logic;
SIGNAL TINPUT1								: std_logic_vector(0 TO 63);

BEGIN

-- ==================================================================================== --
--					MAIN STATE MACHINE				--
-- ==================================================================================== --
PROCESS(Clk, TCore_ON)
BEGIN
IF TCore_ON = '0' THEN
   mainState <= "00"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE mainState IS
WHEN "00" => --IDLE =>
   IF TCore_ON = '1' THEN
      mainState <= "01"; --Check_IV_Needed;
   END IF;

WHEN "01" => --Check_IV_Needed =>
   IF bool_IV_Needed THEN
      mainState <= "10"; --RUNNING_IN_xIVState;
   ELSE
      mainState <= "11"; --RUNNING_IN_ECBState;
   END IF;

WHEN "10" => --RUNNING_IN_xIVState =>
   mainState <= "10";

WHEN "11" => --RUNNING_IN_ECBState =>
   mainState <= "11";

WHEN OTHERS =>
   mainState <= "00";

END CASE;
END IF;
END PROCESS;

-- ==================================================================================== --
--					ECB STATE MACHINE				--
-- ==================================================================================== --
PROCESS(Clk, bool_RUNNING_IN_ECBState)
BEGIN
IF NOT bool_RUNNING_IN_ECBState THEN
   ECBState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE ECBState IS
WHEN "000" => --IDLE =>
   IF bool_RUNNING_IN_ECBState AND TRANSFORM_ON = '1' THEN
      ECBState <= "001"; --SET_INPUT;
   END IF;

WHEN "001" => --SET_INPUT =>
   ECBState <= "010"; --Initial_Permutation;

WHEN "010" => --Initial_Permutation =>
   ECBState <= "011"; --TRANSFORMING;

WHEN "011" => --TRANSFORMING =>
   IF TRANSFORM_Completed3 = '1' THEN
      ECBState <= "100"; --PRODUCE_OUTPUT;
   END IF;

WHEN "100" => --PRODUCE_OUTPUT =>
   ECBState <= "101"; --Final_Permutation;

WHEN "101" => --Final_Permutation =>
   ECBState <= "110"; --EXPORTING_DATA;

WHEN "110" => --EXPORTING_DATA =>
   IF DOUT_Completed = '1' THEN
      ECBState <= "111"; --NOTIFY_Core_Completed;
   END IF;

WHEN "111" => --NOTIFY_Core_Completed =>
   IF TRANSFORM_ON = '0' THEN
      ECBState <= "000"; --WAIT_TRANSFORM_ON;
   END IF;

WHEN OTHERS =>
   ECBState <= "000";

END CASE;
END IF;
END PROCESS;

-- ==================================================================================== --
--					XIV STATE MACHINE				--
-- ==================================================================================== --

PROCESS(Clk, bool_RUNNING_IN_xIVState)
BEGIN
IF NOT bool_RUNNING_IN_xIVState THEN
   xIVState <= "0000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE xIVState IS
WHEN "0000" => --IDLE =>
   IF bool_RUNNING_IN_xIVState AND TRANSFORM_ON = '1' THEN
      xIVState <= "0001"; --INITIALIZE;
   END IF;

-- 0: OFB, 1 : CFB
WHEN "0001" => --INITIALIZE =>
   IF TDES_ENC_DEC = '1' THEN
      xIVState <= "0010"; --WRITEOUT_IV;
   ELSE
      xIVState <= "0011";
   END IF;

WHEN "0010" => --WRITEOUT_IV =>
   IF bool_WRITE_IV_Completed THEN
      xIVState <= "0011"; --SET_INPUT;
   END IF;

WHEN "0011" => --SET_INPUT =>
   xIVState <= "0100"; --Initial_Permutation;

WHEN "0100" => --Initial_Permutation =>
   xIVState <= "0101"; --TRANSFORMING;

WHEN "0101" => --TRANSFORMING =>
   IF TRANSFORM_Completed3 = '1' THEN
      xIVState <= "0110"; --Final_Permutation;
   END IF;

WHEN "0110" => --Final_Permutation =>
   xIVState <= "0111"; --PRODUCE_OUTPUT;

WHEN "0111" => --PRODUCE_OUTPUT =>
   xIVState <= "1000"; --EXPORTING_DATA;

WHEN "1000" => --EXPORTING_DATA =>
   IF DOUT_Completed = '1' THEN
      xIVState <= "1001"; --NOTIFY_Core_Completed;
   END IF;

WHEN "1001" => --NOTIFY_Core_Completed =>
   IF TRANSFORM_ON = '0' THEN
      xIVState <= "1010"; --WAIT_TRANSFORM_ON;
   END IF;

WHEN "1010" => --WAIT_TRANSFORM_ON =>
   IF TRANSFORM_ON = '1' THEN
      xIVState <= "0011"; --SET_INPUT;
   END IF;

WHEN OTHERS =>
   xIVState <= "0000";

END CASE;
END IF;
END PROCESS;

--PROCESS(xIVState, IV, FB, FP, curr_IV, CoreMode)
--BEGIN
--IF xIVState = "0001" THEN
--   curr_IV <= IV;
--ELSIF xIVState = "1001" THEN
--   IF CoreMode(2 DOWNTO 1) /= "00" THEN
--      curr_IV <= FB;
--   ELSE
--      curr_IV <= FP;
--   END IF;
--ELSIF xIVState = "0011" THEN
--   prev_IV <= curr_IV(8 TO 63);
--END IF;
--END PROCESS;

curr_IV <= IV WHEN xIVState = "0001"
ELSE FB WHEN xIVState = "1001" AND CoreMode(2 DOWNTO 1) /= "00"
ELSE FP WHEN xIVState = "1001" AND CoreMode(2 DOWNTO 1) = "00"
ELSE curr_IV;

prev_IV <= curr_IV(8 TO 63) WHEN xIVState = "0011"
ELSE prev_IV;

-- ============================================== xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
bool_Transforming <= xIVState = "0101" OR ECBState = "011";

PROCESS(Clk, bool_Transforming)
BEGIN
IF NOT bool_Transforming THEN
   transState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE transState IS
WHEN "000" => --IDLE =>
   IF bool_Transforming THEN
      transState <= "001"; --INITIAL;
   END IF;

WHEN "001" => --INITIAL =>
   transState <= "010"; --PHASE1_ON;

WHEN "010" => --PHASE1_ON =>
   IF TRANSFORM_Completed1 = '1' THEN
      transState <= "011"; --PREPARE_Next1;
   END IF;

WHEN "011" => --PREPARE_Next1 =>
   transState <= "100"; --PREPARE_COMPLETED;

WHEN "100" => --PREPARE_COMPLETED =>
   transState <= "101"; --PHASE1_OFF;

WHEN "101" => --PHASE1_OFF =>
   transState <= "110"; --Check_PhaseCounter;

WHEN "110" => --Check_PhaseCounter =>
   IF PhaseCounter /= "00" THEN
      transState <= "010"; --PHASE1_ON;
   ELSE
      transState <= "111"; --NOTIFY_Completed;
   END IF;

WHEN "111" => --NOTIFY_Completed =>
   transState <= "111"; --NOTIFY_Completed;

WHEN OTHERS =>
   transState(0) <= '0';

END CASE;
END IF;
END PROCESS;

TINPUT1   <= IP WHEN transState = "001"
	ELSE preOUTPUT WHEN transState = "011"
	ELSE TINPUT1;

--PROCESS (transState, tmpFlag, ENC_Flag, PhaseCounter, tmpPhCounter, ECBState, xIVState, TDES_ENC_DEC)
--BEGIN
--IF transState = "000" THEN
--   tmpPhCounter <= "11";
--ELSIF transState = "001" THEN
--   ENC_Flag <= TDES_ENC_DEC;
--ELSIF transState = "010" THEN
--   tmpFlag <= ENC_Flag;
--   Phase_ON <= '1';
--ELSIF transState = "100" THEN
--   PhaseCounter <= tmpPhCounter - 1;
--ELSIF transState = "101" THEN
--   IF PhaseCounter /= "00" THEN
--      Phase_ON <= '0';
--   END IF;
--ELSIF transState = "110" THEN
--   ENC_Flag <= NOT tmpFlag;
--   tmpPhCounter <= PhaseCounter;
--ELSIF transState = "111" THEN
--   IF ECBState < "011" AND xIVState < "0101" THEN
--      Phase_ON <= '0';
--   END IF;
--END IF;
--END PROCESS;

ENC_Flag <= TDES_ENC_DEC WHEN transState = "001" AND CoreMode(2 DOWNTO 1) = "00"
	ELSE '1' WHEN transState = "001" AND CoreMode(2 DOWNTO 1) /= "00"
	ELSE NOT tmpFlag WHEN transState = "110"
	ELSE ENC_Flag;

tmpFlag <= ENC_Flag WHEN transState = "010"
	ELSE tmpFlag;

Phase_ON <= '1' WHEN transState = "010"
	ELSE '0' WHEN transState = "101"
	ELSE Phase_ON;

tmpPhCounter <= "11" WHEN transState = "000"
	ELSE PhaseCounter WHEN transState = "110"
	ELSE tmpPhCounter;

PhaseCounter <= tmpPhCounter - 1 WHEN transState = "100"
	ELSE PhaseCounter;

TRANSFORM_Completed3 <= '1' WHEN transState = "111" --NOTIFY_Completed
		   ELSE '0';

-- ==================================================================================== --
--					ASSIGNMENT SPACE				--
-- ==================================================================================== --

bool_IV_Needed	<= CoreMode /= "000";
bool_Mode8	<= CoreMode(2 DOWNTO 1) = "01";
bool_Mode16	<= CoreMode(2 DOWNTO 1) = "10";
bool_Mode32	<= CoreMode(2 DOWNTO 1) = "11";

bool_Transform_Completed <= ECBState = "111" OR xIVState = "1001"; --NOTIFY_Core_Completed;

TCore_Completed <= '1' WHEN bool_Transform_Completed
	ELSE '0';

bool_RUNNING_IN_ECBState <= mainState = "11"; --RUNNING_IN_xIVState;
bool_RUNNING_IN_xIVState <= mainState = "10"; --RUNNING_IN_xIVState;

FB	  <= FB_8 WHEN bool_Mode8
	ELSE FB_16 WHEN bool_Mode16
	ELSE FB_32;

FB_8 	     <= prev_IV & ACTUAL_OUTPUT(0 TO 7) WHEN CoreMode(0) = '1' AND TDES_ENC_DEC = '1'
	ELSE prev_IV & DATA(0 TO 7) WHEN CoreMode(0) = '1' AND TDES_ENC_DEC = '0'
	ELSE prev_IV & FP(0 TO 7);

FB_16	     <= prev_IV(8 TO 55) & ACTUAL_OUTPUT(0 TO 15) WHEN CoreMode(0) = '1'
	ELSE prev_IV(8 TO 55) & DATA(0 TO 15) WHEN CoreMode(0) = '1' AND TDES_ENC_DEC = '0'
	ELSE prev_IV(8 TO 55) & FP(0 TO 15);

FB_32	     <= prev_IV(24 TO 55) & ACTUAL_OUTPUT(0 TO 31) WHEN CoreMode(0) = '1'
	ELSE prev_IV(24 TO 55) & DATA(0 TO 31) WHEN CoreMode(0) = '1' AND TDES_ENC_DEC = '0'
	ELSE prev_IV(24 TO 55) & FP(0 TO 31);

bool_WRITEOUT_IV <= xIVState = "0010"; --WRITEOUT_IV;

bool_WRITE_IV_Completed <= bool_WRITEOUT_IV AND DOUT_Completed = '1';

ACTUAL_INPUT <= (curr_IV XOR DATA) WHEN CoreMode = "001" AND TDES_ENC_DEC = '1'
	   ELSE curr_IV WHEN CoreMode(2 DOWNTO 1) /= "00"
	   ELSE Data;

IP   <= ACTUAL_INPUT(57) & ACTUAL_INPUT(49) & ACTUAL_INPUT(41) & ACTUAL_INPUT(33) & ACTUAL_INPUT(25) & ACTUAL_INPUT(17) & ACTUAL_INPUT(9)  & ACTUAL_INPUT(1) &
	ACTUAL_INPUT(59) & ACTUAL_INPUT(51) & ACTUAL_INPUT(43) & ACTUAL_INPUT(35) & ACTUAL_INPUT(27) & ACTUAL_INPUT(19) & ACTUAL_INPUT(11) & ACTUAL_INPUT(3) &
	ACTUAL_INPUT(61) & ACTUAL_INPUT(53) & ACTUAL_INPUT(45) & ACTUAL_INPUT(37) & ACTUAL_INPUT(29) & ACTUAL_INPUT(21) & ACTUAL_INPUT(13) & ACTUAL_INPUT(5) &
	ACTUAL_INPUT(63) & ACTUAL_INPUT(55) & ACTUAL_INPUT(47) & ACTUAL_INPUT(39) & ACTUAL_INPUT(31) & ACTUAL_INPUT(23) & ACTUAL_INPUT(15) & ACTUAL_INPUT(7) &
	ACTUAL_INPUT(56) & ACTUAL_INPUT(48) & ACTUAL_INPUT(40) & ACTUAL_INPUT(32) & ACTUAL_INPUT(24) & ACTUAL_INPUT(16) & ACTUAL_INPUT(8)  & ACTUAL_INPUT(0) &
	ACTUAL_INPUT(58) & ACTUAL_INPUT(50) & ACTUAL_INPUT(42) & ACTUAL_INPUT(34) & ACTUAL_INPUT(26) & ACTUAL_INPUT(18) & ACTUAL_INPUT(10) & ACTUAL_INPUT(2) &
	ACTUAL_INPUT(60) & ACTUAL_INPUT(52) & ACTUAL_INPUT(44) & ACTUAL_INPUT(36) & ACTUAL_INPUT(28) & ACTUAL_INPUT(20) & ACTUAL_INPUT(12) & ACTUAL_INPUT(4) &
	ACTUAL_INPUT(62) & ACTUAL_INPUT(54) & ACTUAL_INPUT(46) & ACTUAL_INPUT(38) & ACTUAL_INPUT(30) & ACTUAL_INPUT(22) & ACTUAL_INPUT(14) & ACTUAL_INPUT(6);

TDES_TRANSFORMER_01 : TDES_TRANSFORMER PORT MAP (Clk, Phase_ON, ENC_Flag, TINPUT1, Ki, SUBKEY_Completed, SUBKEY_REQ, preOUTPUT, TRANSFORM_Completed1);

FP   <= TINPUT1(39) & TINPUT1(7) & TINPUT1(47) & TINPUT1(15) & TINPUT1(55) & TINPUT1(23) & TINPUT1(63) & TINPUT1(31) &
	TINPUT1(38) & TINPUT1(6) & TINPUT1(46) & TINPUT1(14) & TINPUT1(54) & TINPUT1(22) & TINPUT1(62) & TINPUT1(30) &
	TINPUT1(37) & TINPUT1(5) & TINPUT1(45) & TINPUT1(13) & TINPUT1(53) & TINPUT1(21) & TINPUT1(61) & TINPUT1(29) &
	TINPUT1(36) & TINPUT1(4) & TINPUT1(44) & TINPUT1(12) & TINPUT1(52) & TINPUT1(20) & TINPUT1(60) & TINPUT1(28) &
	TINPUT1(35) & TINPUT1(3) & TINPUT1(43) & TINPUT1(11) & TINPUT1(51) & TINPUT1(19) & TINPUT1(59) & TINPUT1(27) &
	TINPUT1(34) & TINPUT1(2) & TINPUT1(42) & TINPUT1(10) & TINPUT1(50) & TINPUT1(18) & TINPUT1(58) & TINPUT1(26) &
	TINPUT1(33) & TINPUT1(1) & TINPUT1(41) & TINPUT1(9)  & TINPUT1(49) & TINPUT1(17) & TINPUT1(57) & TINPUT1(25) &
	TINPUT1(32) & TINPUT1(0) & TINPUT1(40) & TINPUT1(8)  & TINPUT1(48) & TINPUT1(16) & TINPUT1(56) & TINPUT1(24) WHEN ECBState = "101" OR xIVState = "0110"
	ELSE FP;

ACTUAL_OUTPUT <= FP WHEN CoreMode = "000" OR (CoreMode = "001" AND TDES_ENC_DEC = '1')
	ELSE FP XOR curr_IV WHEN CoreMode = "001" AND TDES_ENC_DEC = '0'
	ELSE FP XOR DATA;

bool_EXPORTING_DATA <= ECBState = "110" OR xIVState = "1000"; --EXPORTING_DATA;

DOUT_ON <= '1' WHEN bool_WRITEOUT_IV OR bool_EXPORTING_DATA
	ELSE '0';

DOUT_Mode <= "011" WHEN CoreMode(2 DOWNTO 1) = "00" OR bool_WRITEOUT_IV
	ELSE "000" WHEN bool_Mode8 AND NOT bool_WRITEOUT_IV
	ELSE "001" WHEN bool_Mode16 AND NOT bool_WRITEOUT_IV
	ELSE "010" WHEN bool_Mode32 AND NOT bool_WRITEOUT_IV
	ELSE "100";

CryptOUT <= ACTUAL_OUTPUT WHEN bool_EXPORTING_DATA
	ELSE curr_IV WHEN bool_WRITEOUT_IV
	ELSE "0000000000000000000000000000000000000000000000000000000000000000";

END TDES_Core_arch;