LIBRARY ieee; -- Arg_REQ 89 MHz
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY SHA_Kt IS
   PORT(
	Arg_REQ			: IN	std_logic; -- from SHA_HASH_Core
	F_K_Times		: IN	std_logic_vector(4 DOWNTO 0);  -- from SHA_HASH_Core
	Kt			: OUT	std_logic_vector(31 DOWNTO 0); -- to SHA_HASH_Core
	Kt_READY		: OUT	std_logic   -- to SHA_HASH_Core
   );
END SHA_Kt;


ARCHITECTURE SHA_Kt_arch OF SHA_Kt IS

SIGNAL bool_Phase1, bool_Phase2, bool_Phase3	: BOOLEAN;

BEGIN

PROCESS(Arg_REQ) --, bool_Phase1, bool_Phase2, bool_Phase3)
BEGIN
IF Arg_REQ = '1' THEN
   Kt_READY <= '1';
ELSE
   Kt_READY <= '0';
END IF;
END PROCESS;

Kt <= "01011010100000100111100110011001" WHEN bool_Phase1
ELSE "01101110110110011110101110100001" WHEN bool_Phase2
ELSE "10001111000110111011110011011100" WHEN bool_Phase3
ELSE "11001010011000101100000111010110";

bool_Phase1 <= F_K_Times <= "00100";
bool_Phase2 <= NOT bool_Phase1 AND F_K_Times <= "01001";
bool_Phase3 <= NOT bool_Phase2 AND F_K_Times <= "01110";

END SHA_Kt_arch;