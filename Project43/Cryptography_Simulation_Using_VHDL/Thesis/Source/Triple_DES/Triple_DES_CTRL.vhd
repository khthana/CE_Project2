LIBRARY ieee ; -- 113.8 MHz
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Triple_DES_CTRL IS
   PORT(
      Clk			: IN	std_logic; -- Clock signal
      TDES_ON			: IN	std_logic; -- interact with Algorithm Decoder
      Modes			: IN	std_logic_vector (2 DOWNTO 0); -- interact with Algorithm Decoder
      TDES_ENC_DEC		: IN	std_logic; -- interact with Algorithm Decoder
      TCore_Completed		: IN	std_logic; -- control for TDES_Core
      Keys_Completed		: IN	std_logic;
      IV_Completed		: IN	std_logic;
      DBUS_IN_Completed		: IN	std_logic; -- control for DATA_IMPORT
      LAST_Data			: IN	std_logic; -- control for DATA_IMPORT
      TCore_ON			: OUT	std_logic; -- control for TDES_Core
      TRANSFORM_ON		: OUT	std_logic; -- control for TDES_Core
      CoreMode			: OUT	std_logic_vector(2 DOWNTO 0); -- control for TDES_Core
      KIN_ON			: OUT	std_logic; -- control for TDES_KEY_READER
      IVIN_ON			: OUT	std_logic;
      DIN_ON			: OUT	std_logic; -- control for DATA_IMPORT
      IV_Mode			: OUT	std_logic;
      DBUS_Mode			: OUT	std_logic_vector(2 DOWNTO 0); -- control for DATA_IMPORT & DATA_EXPORT (key/data selected)
      End_Operate		: OUT	std_logic; -- interact with external system "3DES has finished operation!!!"
      TDES_RUNNING		: OUT	std_logic  -- interact with external system
   );
END Triple_DES_CTRL;

-- renoir interface_end

--LIBRARY ieee ;
--USE ieee.std_logic_1164.ALL;
--USE ieee.std_logic_arith.ALL;

LIBRARY CryptoChip;

ARCHITECTURE Triple_DES_CTRL_arch OF Triple_DES_CTRL IS

   -- Architecture declarations

--   TYPE stateMode IS (IDLE, SET_Mode, READING_DATA, CORE_RUNNING, Check_LAST_Data, NO_More_Operation);
   SIGNAL modeState	  : std_logic_vector(2 DOWNTO 0);--stateMode;

-- Control signal for Core State Machine start --
   SIGNAL bool_TDES_ON : boolean;
   SIGNAL bool_IV_Needed, bool_Mode8, bool_Mode16, bool_Mode32 : boolean;

-- Control signal for Core State Machine end --
   SIGNAL Mode, Mode_buff	  : std_logic_vector(2 DOWNTO 0);

BEGIN

-- Architecture concurrent statements

-- ================================================================================================================= --
--			    			Initialize status
-- ================================================================================================================= --
bool_TDES_ON	<= TDES_ON = '1';
bool_Mode8	<= Mode(2 DOWNTO 1) = "01";
bool_Mode16	<= Mode(2 DOWNTO 1) = "10";
bool_Mode32	<= Mode(2 DOWNTO 1) = "11";
bool_IV_Needed	<= Mode /= "000";

Mode		  <= Modes WHEN modeState = "001" --SET_Mode
		ELSE Mode_buff;
Mode_buff	  <= Mode;

CoreMode	  <= Mode;
TDES_RUNNING	  <= '1' WHEN bool_TDES_ON -- control signal for external system
		ELSE '0';

IV_Mode   <= '1' WHEN TDES_ENC_DEC = '0' -- Read from files
	ELSE '0';

KIN_ON    <= '1' WHEN bool_TDES_ON -- Turn ON DATA_IMPORT switch
	ELSE '0';		   -- Turn OFF DATA_IMPORT switch

IVIN_ON   <= '1' WHEN bool_IV_Needed AND Keys_Completed = '1'
	ELSE '0';

DIN_ON	  <= '1' WHEN (Keys_Completed = '1' AND NOT bool_IV_Needed) OR (IV_Completed = '1')
	ELSE '0';

-- Initialize completed!
-- Start our tasks, now!
-- We use the domino (or serial) reset model : godzider@yahoo.com
-- ================================================================================================================= --
--			 			 Flow Control State Machine					     --
-- ================================================================================================================= --

DBUS_Mode(2) <= '1' WHEN modeState = "010" --READING_DATA
	   ELSE '0';

DBUS_Mode(1 DOWNTO 0) <= "00" WHEN bool_Mode8
		    ELSE "01" WHEN bool_Mode16
		    ELSE "10" WHEN bool_Mode32
		    ELSE "11";

End_Operate <= '1' WHEN modeState = "101" --NO_More_Operation
	  ELSE '0';

TCore_ON  <= '1' WHEN modeState /= "000" --IDLE -- TURN ON Core Switch
	ELSE '0';

TRANSFORM_ON <= '1' WHEN modeState = "011" --CORE_RUNNING
	  ELSE '0';

PROCESS (Clk, bool_TDES_ON)
BEGIN
IF NOT bool_TDES_ON THEN -- serial reset connected from Read Key Process (see above)
   modeState <= "000"; --IDLE;

ELSIF Clk'EVENT AND Clk = '1' THEN

CASE modeState IS

WHEN "000" => --IDLE =>
   IF bool_TDES_ON THEN
      modeState <= "001"; --SET_Mode;
   END IF;

WHEN "001" => --SET_Mode =>
   modeState <= "010"; --READING_DATA;

WHEN "010" => --READING_DATA =>
   IF DBUS_IN_Completed = '1' AND Keys_Completed = '1' THEN
      modeState <= "011"; --CORE_RUNNING;
   END IF;

WHEN "011" => --CORE_RUNNING =>
   IF TCore_Completed = '1' THEN
      modeState <= "100"; --Check_LAST_Data;
   END IF;

WHEN "100" => --Check_LAST_Data =>
   IF LAST_Data = '0' THEN
      modeState <= "010"; --READING_DATA;
   ELSE
      modeState <= "101"; --NO_More_Operation;
   END IF;

WHEN "101" => --NO_More_Operation =>
   IF NOT bool_TDES_ON THEN
      modeState <= "000"; --SET_Mode;
   END IF;

WHEN OTHERS =>
   modeState <= "111";

END CASE;

END IF;
END PROCESS;

END Triple_DES_CTRL_arch;