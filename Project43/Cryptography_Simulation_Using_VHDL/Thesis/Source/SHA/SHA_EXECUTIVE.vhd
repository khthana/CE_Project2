LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY SHA_EXECUTIVE IS
   PORT( 
      Clk			: IN	std_logic; -- from Ext System
      SHA_ON			: IN	std_logic; -- from Algorithm Decoder
      HASH_Completed		: IN	std_logic; -- from SHA_HASH_Core
      LAST_Block		: IN	std_logic; -- from HASH_IMPORT
      DXtOUT_Completed		: IN	std_logic; -- from HASH_EXPORT
      DXtOUT_ON			: OUT	std_logic; -- to HASH_EXPORT
      INIT_ON			: OUT	std_logic; -- to SHA_WORD_INITIALIZER
      CORE_ON			: OUT	std_logic; -- to SHA_HASH_CORE
      End_Operate		: OUT	std_logic; -- to External System
      SHA_RUNNING		: OUT	std_logic  -- to External System
   );
END SHA_EXECUTIVE;


ARCHITECTURE SHA_EXECUTIVE_arch OF SHA_EXECUTIVE IS

SIGNAL mainState : std_logic_vector(2 DOWNTO 0);

BEGIN

PROCESS(Clk, SHA_ON)
BEGIN
IF SHA_ON = '0' THEN
   mainState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE mainState IS
WHEN "000" => --IDLE =>
   IF SHA_ON = '1' THEN
      mainState <= "001"; --READ_BLOCK_THEN_HASH;
   END IF;

WHEN "001" => --READ_BLOCK_THEN_HASH =>
   IF HASH_Completed = '1' THEN
      mainState <= "010"; --Check_LAST_Block;
   END IF;

WHEN "010" => --Check_LAST_Block =>
   IF LAST_Block /= '1' THEN
      mainState <= "001"; --READING_MSG_Block;
   ELSE
      mainState <= "011"; -- WRITING_OUTPUT
   END IF;

WHEN "011" => -- WRITING_OUTPUT
   IF DXtOUT_Completed = '1' THEN
      mainState <= "100";
   END IF;

WHEN "100" => --END_SERVICE;
   mainState <= "100";

WHEN OTHERS =>
   mainState <= "000";
END CASE;
END IF;
END PROCESS;

CORE_ON <= '1' WHEN mainState = "001"
	ELSE '0';

INIT_ON <= '1' WHEN mainState = "001"
	ELSE '0';

DXtOUT_ON <= '1' WHEN mainState = "011"
	ELSE '0';

End_Operate <= '1' WHEN mainState = "100"
	  ELSE '0';

SHA_RUNNING <= '1' WHEN SHA_ON = '1'
	  ELSE '0';

END SHA_EXECUTIVE_arch;