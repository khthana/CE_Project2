-- 7401 gates for array 4 elements
-- 11030 gates for array 10 elements
-- estimate 60,000 gates for array 200 elements

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY RNG IS
   PORT (
      Clk			: IN	std_logic;
      RNG_REQ			: IN	std_logic;
      Byte_IN			: IN	std_logic_vector(7 DOWNTO 0);
      Rnd_OUT			: OUT	std_logic_vector (0 TO 63);
      Returned			: OUT	std_logic
   );
END RNG;


ARCHITECTURE RNG_arch OF RNG IS

COMPONENT RNG_MIXER
   PORT (
      Clk			: IN	std_logic;
      Salt			: IN	std_logic_vector(7 DOWNTO 0);
      Secret_Salt		: IN	std_logic_vector (0 TO 63);
      Mixed_OUT			: OUT	std_logic_vector (63 DOWNTO 0);
      Dont_Change		: OUT	std_logic
   );
END COMPONENT;

CONSTANT Table_Size : NATURAL := 11;

TYPE RAND_TABLE IS ARRAY(0 TO Table_Size) OF std_logic_vector(31 DOWNTO 0);
SIGNAL MT : RAND_TABLE;

TYPE MAG_Type IS ARRAY(0 TO 1) OF std_logic_vector(31 DOWNTO 0);
CONSTANT MAG01 : MAG_Type := ("00000000000000000000000000000000", "10011001000010001011000011011111");

SUBTYPE bound_MAG01 IS NATURAL RANGE 0 TO 1;
SIGNAL x	: bound_MAG01;

SUBTYPE bound625 IS NATURAL RANGE 0 TO 10;

SIGNAL K, MTi, Kg	: bound625;
CONSTANT N		: NATURAL := 10;
CONSTANT M		: NATURAL := 5;

CONSTANT MATRIX_A		: std_logic_vector(31 DOWNTO 0) := "10011001000010001011000011011111"; -- 9908b0df
CONSTANT UPPER_MASK		: std_logic_vector(31 DOWNTO 0) := "10000000000000000000000000000000"; -- 80000000
CONSTANT LOWER_MASK		: std_logic_vector(31 DOWNTO 0) := "01111111111111111111111111111111"; -- 7fffffff
CONSTANT TEMPERING_MASK_B	: std_logic_vector(31 DOWNTO 0) := "10011101001011000101011010000000"; -- 9d2c5680
CONSTANT TEMPERING_MASK_C	: std_logic_vector(31 DOWNTO 0) := "11101111110001100000000000000000"; -- efc60000

SIGNAL TEMPERING_SHIFT_U	: std_logic_vector(31 DOWNTO 0);
SIGNAL TEMPERING_SHIFT_S	: std_logic_vector(31 DOWNTO 0);
SIGNAL TEMPERING_SHIFT_T	: std_logic_vector(31 DOWNTO 0);
SIGNAL TEMPERING_SHIFT_L	: std_logic_vector(31 DOWNTO 0);
SIGNAL Y, MTk			: std_logic_vector(31 DOWNTO 0);

SIGNAL SGEN_ON, GEN_ON		: std_logic;
SIGNAL bool_SGEN_Completed, bool_GEN_Completed, bool_RAND_READY : boolean;

SIGNAL Seed					: std_logic_vector(7 DOWNTO 0);
SIGNAL MIXED					: std_logic_vector(63 DOWNTO 0);

SIGNAL Secret_Salt				: std_logic_vector(0 TO 63);

--TYPE stateRND IS (IDLE, MIXING, SGEN_RAND, GENERATING_RND);
--TYPE stateSGEN IS (IDLE, Initializing, FullFill_TABLE, CHECK_K, SGEN_COMPLETED);
--TYPE stateGEN IS (IDLE, UPDATING_LOWER_bound, CHECK_INDEX_Bound1, UPDATING_UPPER_bound, CHECK_INDEX_Bound2, PRE_ROUND, GENERATE_OUTPUT, CHECK_MTi, GEN_COMPLETED);

SIGNAL rndState : std_logic_vector(1 DOWNTO 0); --stateRND;
SIGNAL sgenState : std_logic_vector(2 DOWNTO 0); --stateSGEN;
SIGNAL genState : std_logic_vector(3 DOWNTO 0); --stateGEN;

SIGNAL Dont_Change	: std_logic;

BEGIN

RNG_MIXER_01 : RNG_MIXER -- Always generate mixed output
   PORT MAP (
      Clk			=> Clk,
      Salt			=> Seed,
      Secret_Salt		=> Secret_Salt,
      Mixed_OUT			=> MIXED,	  -- always mixed by itself
      Dont_Change		=> Dont_Change
   );

PROCESS(Clk,rndState)
BEGIN
IF Clk'EVENT AND Clk = '1' THEN
CASE rndState IS
WHEN "00" => --IDLE =>
   rndState <= "01"; --MIXING;

WHEN "01" => --MIXING =>
   IF (MIXED(32) AND MIXED(24) AND MIXED(16)) = '1' THEN
      rndState <= "10"; --SGEN_RAND;
   END IF;

WHEN "10" => --SGEN_RAND =>
   IF bool_SGEN_Completed THEN
      rndState <= "11"; --GENERATING_RND;
   END IF;

WHEN "11" => --GENERATING_RND =>
   IF bool_GEN_Completed THEN
      rndState <= "01"; --MIXING;
   END IF;

WHEN OTHERS =>
   rndState <= "00";

END CASE;
END IF;
END PROCESS;

-- =============================================================== --
--		      CONCURRNET ASSIGNMENT SPACE		   --
-- =============================================================== --
Seed <= BYTE_IN + Secret_Salt(0 TO 7) XOR Secret_Salt(4 TO 11); -- always change value
	-- BYTE IN is the true seed

Secret_Salt <= "1100100100010001010110101100110101001001000001100101010000011101" WHEN rndState = "00" --IDLE
	ELSE TEMPERING_SHIFT_L & TEMPERING_SHIFT_S WHEN Dont_Change = '0' AND genState = "0111"
	ELSE Secret_Salt; -- C9115ACD4906541D

-- =============================================================== --
--		       SGENERATOR state machine			   --
-- =============================================================== --

PROCESS(Clk, SGEN_ON)
BEGIN
IF SGEN_ON = '0' THEN
   sgenState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE sgenState IS
WHEN "000" => --IDLE =>
   IF SGEN_ON = '1' THEN
      sgenState <= "001"; --Initializing;
   END IF;

WHEN "001" => --Initializing =>
   sgenState <= "010"; --FullFill_TABLE;

WHEN "010" => --FullFill_TABLE =>
   sgenState <= "011"; --CHECK_K;

WHEN "011" => --CHECK_K =>
   IF K = N THEN
      sgenState <= "100"; --SGEN_COMPLETED;
   ELSE
      sgenState <= "010"; --FullFill_TABLE;
   END IF;

WHEN "100" => --SGEN_COMPLETED =>
   sgenState <= "100"; --SGEN_COMPLETED;

WHEN OTHERS =>
   sgenState <= "000";

END CASE;
END IF;
END PROCESS;

-- =============================================================== --
--			GENERATOR state machine			   --
-- =============================================================== --

PROCESS(Clk, GEN_ON)
BEGIN
IF GEN_ON = '0' THEN
   genState <= "0000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE genState IS
WHEN "0000" => --IDLE =>
   IF GEN_ON = '1' THEN
      genState <= "0001"; --UPDATING_LOWER_bound;
   END IF;

WHEN "0001" => --UPDATING_LOWER_bound =>
   genState <= "0010"; --CHECK_INDEX_Bound1;

WHEN "0010" => --CHECK_INDEX_Bound1 =>
   IF Kg = N - M THEN
      genState <= "0011"; --UPDATING_UPPER_bound;
   ELSE
      genState <= "0001"; --UPDATING_LOWER_bound;
   END IF;

WHEN "0011" => --UPDATING_UPPER_bound =>
   genState <= "0100"; --CHECK_INDEX_Bound2;

WHEN "0100" => --CHECK_INDEX_Bound2 =>
   IF Kg = N - 1 THEN
      genState <= "0101"; --PRE_ROUND;
   ELSE
      genState <= "0011"; --UPDATING_UPPER_bound;
   END IF;

WHEN "0101" => --PRE_ROUND =>
   genState <= "0110"; --GENERATE_OUTPUT;

WHEN "0110" => --GENERATE_OUTPUT =>
   genState <= "0111"; --CHECK_MTi;

WHEN "0111" => --CHECK_MTi =>
   IF MTi = N-1 THEN
      genState <= "1000"; --GEN_COMPLETED;
   ELSE
      genState <= "0110"; --GENERATE_OUTPUT;
   END IF;

WHEN "1000" => --GEN_COMPLETED =>
   bool_RAND_READY <= TRUE;

WHEN OTHERS =>
   genState <= "0000";

END CASE;
END IF;
END PROCESS;

PROCESS(Clk, sgenState, genState)
BEGIN
IF Clk'EVENT AND Clk = '1' THEN
   IF sgenState = "000" THEN
      K <= 0;
   ELSIF sgenState = "001" THEN
      MT(K) <= MIXED(47 DOWNTO 16);
      --MTk  <= MT(K);
   ELSIF sgenState = "010" THEN
      MT(K+1) <= MIXED(32 DOWNTO 1) + MT(K);
      K	<= K + 1;
   ELSE
      MTk <= MT(K);
   END IF;
   IF genState = "0000" THEN
      MTi <= 0;
      Kg <= 0;
   ELSIF genState = "0001" THEN
      MT(Kg) <= MT(Kg+M) XOR ('0' & Y(31 DOWNTO 1)) XOR MAG01(x);
      Kg <= Kg + 1;
   ELSIF genState = "0011" THEN
      MT(Kg) <= MT(Kg+M-N) XOR ('0' & Y(31 DOWNTO 1)) XOR MAG01(x);
      Kg <= Kg + 1;
   ELSIF genState = "0101" THEN
      MT(N - 1) <= MT(M - 1) XOR ('0' & Y(31 DOWNTO 1)) XOR MAG01(x);
   ELSIF genState = "0110" THEN
      MTi <= MTi + 1;
   END IF;

END IF;
END PROCESS;

Y <= (MT(Kg) AND UPPER_MASK) OR (MT(Kg+1) AND LOWER_MASK) WHEN genState = "0001" OR genState = "0011"
ELSE (MT(N - 1) AND UPPER_MASK) OR (MT(0) AND LOWER_MASK) WHEN genState = "0101"
ELSE MT(Mti) WHEN genState = "0110"
ELSE Y;

TEMPERING_SHIFT_U <= Y XOR ("00000000000" & Y(31 DOWNTO 11));

TEMPERING_SHIFT_S <= TEMPERING_SHIFT_U XOR (TEMPERING_SHIFT_U(24 DOWNTO 0) & "0000000");

TEMPERING_SHIFT_T <= TEMPERING_SHIFT_S XOR (TEMPERING_SHIFT_S(16 DOWNTO 0) & "000000000000000");

TEMPERING_SHIFT_L <= "00000000000000000000000000000000" WHEN rndState = "00" --IDLE
	ELSE TEMPERING_SHIFT_T XOR ("000000000000000000" & TEMPERING_SHIFT_T(31 DOWNTO 18));

x <= conv_integer(Y(0));

GEN_ON <= '1' WHEN rndState = "11" --GENERATING_RND
	ELSE '0';

SGEN_ON <= '1' WHEN rndState = "10" --SGEN_RAND
	ELSE '0';

bool_SGEN_Completed <= sgenState = "100"; --SGEN_COMPLETED;
bool_GEN_Completed <= genState = "1000";

Rnd_OUT <= TEMPERING_SHIFT_L + (TEMPERING_SHIFT_S(15 DOWNTO 0) & MIXED(47 DOWNTO 16) & TEMPERING_SHIFT_S(23 DOWNTO 8)) WHEN RNG_REQ = '1' AND bool_RAND_READY
	ELSE (OTHERS => '0');

Returned <= '1' WHEN RNG_REQ = '1'
	ELSE '0';

END RNG_arch;