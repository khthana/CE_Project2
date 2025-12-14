LIBRARY ieee; -- Arg_REQ 41.2 MHz
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY SHA_Ft IS
   PORT(
	Arg_REQ			: IN	std_logic;			-- from SHA_HASH_Core
	F_K_Times		: IN	std_logic_vector(4 DOWNTO 0);	-- from SHA_HASH_Core
	Buff_B			: IN	std_logic_vector(31 DOWNTO 0);	-- from SHA_HASH_Core
	Buff_C			: IN	std_logic_vector(31 DOWNTO 0);	-- from SHA_HASH_Core
	Buff_D			: IN	std_logic_vector(31 DOWNTO 0);	-- from SHA_HASH_Core
	Ft			: OUT	std_logic_vector(31 DOWNTO 0);	-- to SHA_HASH_Core
	Ft_READY		: OUT	std_logic			-- to SHA_HASH_Core
   );
END SHA_Ft;


ARCHITECTURE SHA_Ft_arch OF SHA_Ft IS

SIGNAL bool_Phase1, bool_Phase3	: BOOLEAN;

BEGIN

PROCESS(Arg_REQ)
BEGIN
IF Arg_REQ = '1' THEN
   Ft_READY <= '1';
ELSE
   Ft_READY <= '0';
END IF;
END PROCESS;

Ft <= (Buff_B AND Buff_C) OR (NOT Buff_B AND Buff_D) WHEN bool_Phase1
	ELSE (Buff_B AND Buff_C) OR (Buff_B AND Buff_D) OR (Buff_C AND Buff_D) WHEN bool_Phase3
	ELSE Buff_B XOR Buff_C XOR Buff_D;

bool_Phase1 <= F_K_Times <= "00100";
bool_Phase3 <= F_K_Times > "01001" AND F_K_Times <= "01110";

END SHA_Ft_arch;