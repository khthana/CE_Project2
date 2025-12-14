	--Clk                  : 73.0 MHz
	--INIT_ON              : 80.5 MHz
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY SHA_WORD_INITIALIZER IS
   PORT( 
	Clk			: IN	std_logic;
	INIT_ON			: IN	std_logic; -- connect to INIT_ON of SHA_EXECUTIVE
	Wt_REQ			: IN	std_logic; -- Request from HASH_Core
	Times			: IN	std_logic_vector(3 DOWNTO 0);
	DXtIN_Completed		: IN	std_logic; -- from HASH_IMPORT
	DXtIN			: IN	std_logic_vector(0 TO 511); -- from HASH_IMPORT
	DXtIN_REQ		: OUT	std_logic; -- to HASH_IMPORT
	Wt			: OUT	std_logic_vector(31 DOWNTO 0); -- to SHA_HASH_Core
	Wt_READY		: OUT	std_logic  -- to SHA_HASH_Core
   );
END SHA_WORD_INITIALIZER;

ARCHITECTURE SHA_WORD_INITIALIZER_arch OF SHA_WORD_INITIALIZER IS

SIGNAL wtState					: std_logic_vector(2 DOWNTO 0);
SIGNAL provState				: std_logic_vector(1 DOWNTO 0);

SIGNAL bool_PROVIDE_ON, bool_Shift_Bulk_ON		: BOOLEAN;  -- Shift next_Wt onto curr_Wt

SIGNAL tmpWt, curr_Wt0, curr_Wt1, curr_Wt2, curr_Wt3, curr_Wt4, curr_Wt5, curr_Wt6, curr_Wt7 : std_logic_vector(0 TO 31);
SIGNAL curr_Wt8, curr_Wt9, curr_Wt10, curr_Wt11, curr_Wt12, curr_Wt13, curr_Wt14, curr_Wt15 : std_logic_vector(0 TO 31);

SIGNAL next_Wt0, next_Wt1, next_Wt2, next_Wt3, next_Wt4, next_Wt5, next_Wt6, next_Wt7	    : std_logic_vector(0 TO 31);
SIGNAL next_Wt8, next_Wt9, next_Wt10, next_Wt11, next_Wt12, next_Wt13, next_Wt14, next_Wt15 : std_logic_vector(0 TO 31);

SIGNAL Wt_REQ_AVAILABLE,tmpReqCount	: std_logic_vector(4 DOWNTO 0); -- IF request 16 times THEN Shift_Wt_Bulk;
SIGNAL PHASE_PROGRESS, tmpPhaseCounter	: std_logic_vector(2 DOWNTO 0); -- 4 (phases) x 20 (units) = 80 times.

BEGIN
-- Wt = S_1( W(t-3) XOR W(t-8) XOR W(t-14) XOR W(t-16) )

-- ==================================================================================== --
--					Wt STATE MACHINE				--
-- ==================================================================================== --

PROCESS(Clk, INIT_ON)
BEGIN
IF INIT_ON = '0' THEN
   wtState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE wtState IS
WHEN "000" => --IDLE =>
   IF INIT_ON = '1' THEN
      wtState <= "001"; --DXtIN_Request;
   END IF;

WHEN "001" => --DXtIN_Request =>
   IF DXtIN_Completed = '1' THEN
      wtState <= "010"; --PUT_DXtIN_to_curr_Wt;
   END IF;

WHEN "010" => --PUT_DXtIN_to_curr_Wt =>
   wtState <= "011"; --GENERATE_next_Wt;

WHEN "011" => --GENERATE_next_Wt =>
   wtState <= "100"; --PROVIDING_curr_Wt;

WHEN "100" => --PROVIDING_curr_Wt;
   IF Wt_REQ_AVAILABLE = "00000" THEN
      wtState <= "101"; --SHIFT_Wt_Bulk;
   END IF;
   
WHEN "101" => --SHIFT_Wt_Bulk =>
   wtState <= "110"; --Check_PHASE_PROGRESS;

WHEN "110" => --Check_PHASE_PROGRESS =>
   IF PHASE_PROGRESS /= "101" THEN
      wtState <= "011"; --GENERATE_next_Wt;
   ELSE
      wtState <= "111"; --WAIT_HASH_to_Completed;
   END IF;

WHEN "111" =>
   wtState <= "111";

WHEN OTHERS =>
   wtState <= "000";

END CASE;
END IF;
END PROCESS;

--PROCESS(wtState, PHASE_PROGRESS, tmpPhaseCounter)
--BEGIN
--IF wtState = "000" THEN
--   PHASE_PROGRESS <= "000";
--   tmpPhaseCounter <= "000";
--ELSIF wtState = "101" THEN
--   PHASE_PROGRESS <= tmpPhaseCounter +1;
--ELSE
--   tmpPhaseCounter <= PHASE_PROGRESS;
--END IF;
--END PROCESS;

PHASE_PROGRESS <= "000" WHEN wtState = "000"
	ELSE tmpPhaseCounter +1 WHEN wtState = "101"
	ELSE PHASE_PROGRESS;

tmpPhaseCounter <= "000" WHEN wtState = "000"
	ELSE tmpPhaseCounter WHEN wtState = "101"
	ELSE PHASE_PROGRESS;

-- ==================================================================================== --
--				PROVIDING Wt STATE MACHINE				--
-- ==================================================================================== --
PROCESS(Clk, bool_PROVIDE_ON)
BEGIN
IF NOT bool_PROVIDE_ON THEN
   provState <= "00"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN

CASE provState IS
WHEN "00" => --IDLE =>
   IF bool_PROVIDE_ON THEN
      provState <= "01"; --WAIT_Request;
   END IF;

WHEN "01" => --WAIT_Request =>
   IF Wt_REQ = '1' THEN
      provState <= "10"; --NOTIFY_READY;
   END IF;

WHEN "10" => --NOTIFY_READY =>
   IF Wt_REQ = '0' THEN
      provState <= "01"; --WAIT_Request;
   END IF;

WHEN OTHERS =>
   provState <= "00";

END CASE;
END IF;
END PROCESS;

Wt_REQ_AVAILABLE <= "10000" WHEN provState = "00"
	ELSE tmpReqCount - 1 WHEN provState = "10"
	ELSE Wt_REQ_AVAILABLE;

tmpReqCount <= "10000" WHEN provState = "00"
	ELSE tmpReqCount WHEN provState = "10"
	ELSE Wt_REQ_AVAILABLE;
-- ==================================================================================== --
--					ASSIGNMENT SPACE				--
-- ==================================================================================== --
DXtIN_REQ <= '1' WHEN wtState = "001" -- OR wtState = "010" to hold more one clock --DXtIN_Request
	ELSE '0';
Wt_READY  <= '1' WHEN provState = "10" --NOTIFY_READY
	ELSE '0';

bool_PROVIDE_ON <= wtState = "100"; --PROVIDING_curr_Wt;
bool_Shift_Bulk_ON <= wtState = "101"; --SHIFT_Wt_Bulk;

curr_Wt0  <= DXtIN(0 TO 31) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt0	    WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt0;

curr_Wt1  <= DXtIN(32 TO 63) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt1	    WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt1;

curr_Wt2  <= DXtIN(64 TO 95) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt2		WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt2;

curr_Wt3  <= DXtIN(96 TO 127)	WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt3	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt3;

curr_Wt4  <= DXtIN(128 TO 159) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt4	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt4;

curr_Wt5  <= DXtIN(160 TO 191) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt5	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt5;

curr_Wt6  <= DXtIN(192 TO 223) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt6	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt6;

curr_Wt7  <= DXtIN(224 TO 255) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt7	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt7;

curr_Wt8  <= DXtIN(256 TO 287) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt8	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt8;

curr_Wt9  <= DXtIN(288 TO 319) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt9	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt9;

curr_Wt10  <= DXtIN(320 TO 351) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt10	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt10;

curr_Wt11  <= DXtIN(352 TO 383) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt11	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt11;

curr_Wt12  <= DXtIN(384 TO 415) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt12	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt12;

curr_Wt13  <= DXtIN(416 TO 447) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt13	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt13;

curr_Wt14  <= DXtIN(448 TO 479) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt14	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt14;

curr_Wt15  <= DXtIN(480 TO 511) WHEN wtState = "010" --PUT_DXtIN_to_curr_Wt
	ELSE next_Wt15	    	WHEN bool_Shift_Bulk_ON
	ELSE curr_Wt15;

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx --
-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx --

next_Wt0  <= curr_Wt13 XOR curr_Wt8 XOR curr_Wt2 XOR curr_Wt0	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt0 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt1  <= curr_Wt14 XOR curr_Wt9 XOR curr_Wt3 XOR curr_Wt1	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt1 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt2  <= curr_Wt15 XOR curr_Wt10 XOR curr_Wt4 XOR curr_Wt2	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt2 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt3  <= next_Wt0 XOR curr_Wt11 XOR curr_Wt5 XOR curr_Wt3	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt3 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt4  <= next_Wt1 XOR curr_Wt12 XOR curr_Wt6 XOR curr_Wt4	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt4 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt5  <= next_Wt2 XOR curr_Wt13 XOR curr_Wt7 XOR curr_Wt5	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt5 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt6  <= next_Wt3 XOR curr_Wt14 XOR curr_Wt8 XOR curr_Wt6	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt6 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt7  <= next_Wt4 XOR curr_Wt15 XOR curr_Wt9 XOR curr_Wt7	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt7 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt8  <= next_Wt5 XOR next_Wt0 XOR curr_Wt10 XOR curr_Wt8	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt8 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt9  <= next_Wt6 XOR next_Wt1 XOR curr_Wt11 XOR curr_Wt9	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt9 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt10 <= next_Wt7 XOR next_Wt2 XOR curr_Wt12 XOR curr_Wt10	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt10 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt11 <= next_Wt8 XOR next_Wt3 XOR curr_Wt13 XOR curr_Wt11	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt11 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt12 <= next_Wt9 XOR next_Wt4 XOR curr_Wt14 XOR curr_Wt12	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt12 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt13 <= next_Wt10 XOR next_Wt5 XOR curr_Wt15 XOR curr_Wt13	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt13 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt14 <= next_Wt11 XOR next_Wt6 XOR next_Wt0 XOR curr_Wt14	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt14 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

next_Wt15 <= next_Wt12 XOR next_Wt7 XOR next_Wt1 XOR curr_Wt15	WHEN NOT bool_Shift_Bulk_ON
	ELSE next_Wt15 WHEN INIT_ON = '1'
	ELSE (OTHERS => '0');

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx --
-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx --

--tmpWt	  <= curr_Wt0(1 TO 31)  & curr_Wt0(0)  WHEN provState = "10" AND Times = "0000"
--	ELSE curr_Wt1(1 TO 31)  & curr_Wt1(0)  WHEN provState = "10" AND Times = "0001"
--	ELSE curr_Wt2(1 TO 31)  & curr_Wt2(0)  WHEN provState = "10" AND Times = "0010"
--	ELSE curr_Wt3(1 TO 31)  & curr_Wt3(0)  WHEN provState = "10" AND Times = "0011"
--	ELSE curr_Wt4(1 TO 31)  & curr_Wt4(0)  WHEN provState = "10" AND Times = "0100"
--	ELSE curr_Wt5(1 TO 31)  & curr_Wt5(0)  WHEN provState = "10" AND Times = "0101"
--	ELSE curr_Wt6(1 TO 31)  & curr_Wt6(0)  WHEN provState = "10" AND Times = "0110"
--	ELSE curr_Wt7(1 TO 31)  & curr_Wt7(0)  WHEN provState = "10" AND Times = "0111"
--	ELSE curr_Wt8(1 TO 31)  & curr_Wt8(0)  WHEN provState = "10" AND Times = "1000"
--	ELSE curr_Wt9(1 TO 31)  & curr_Wt9(0)  WHEN provState = "10" AND Times = "1001"
--	ELSE curr_Wt10(1 TO 31) & curr_Wt10(0) WHEN provState = "10" AND Times = "1010"
--	ELSE curr_Wt11(1 TO 31) & curr_Wt11(0) WHEN provState = "10" AND Times = "1011"
--	ELSE curr_Wt12(1 TO 31) & curr_Wt12(0) WHEN provState = "10" AND Times = "1100"
--	ELSE curr_Wt13(1 TO 31) & curr_Wt13(0) WHEN provState = "10" AND Times = "1101"
--	ELSE curr_Wt14(1 TO 31) & curr_Wt14(0) WHEN provState = "10" AND Times = "1110"
--	ELSE curr_Wt15(1 TO 31) & curr_Wt15(0) WHEN provState = "10" AND Times = "1111"
--	ELSE tmpWt;

tmpWt	  <= curr_Wt0  WHEN provState = "10" AND Times = "0000"
	ELSE curr_Wt1  WHEN provState = "10" AND Times = "0001"
	ELSE curr_Wt2  WHEN provState = "10" AND Times = "0010"
	ELSE curr_Wt3  WHEN provState = "10" AND Times = "0011"
	ELSE curr_Wt4  WHEN provState = "10" AND Times = "0100"
	ELSE curr_Wt5  WHEN provState = "10" AND Times = "0101"
	ELSE curr_Wt6  WHEN provState = "10" AND Times = "0110"
	ELSE curr_Wt7  WHEN provState = "10" AND Times = "0111"
	ELSE curr_Wt8  WHEN provState = "10" AND Times = "1000"
	ELSE curr_Wt9  WHEN provState = "10" AND Times = "1001"
	ELSE curr_Wt10 WHEN provState = "10" AND Times = "1010"
	ELSE curr_Wt11 WHEN provState = "10" AND Times = "1011"
	ELSE curr_Wt12 WHEN provState = "10" AND Times = "1100"
	ELSE curr_Wt13 WHEN provState = "10" AND Times = "1101"
	ELSE curr_Wt14 WHEN provState = "10" AND Times = "1110"
	ELSE curr_Wt15 WHEN provState = "10" AND Times = "1111"
	ELSE tmpWt;

Wt <= tmpWt;

END SHA_WORD_INITIALIZER_arch;