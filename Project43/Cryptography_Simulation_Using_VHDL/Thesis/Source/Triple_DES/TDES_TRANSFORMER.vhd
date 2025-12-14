LIBRARY ieee ; -- 102.1 MHz
USE ieee.std_logic_1164.all;
--USE ieee.std_logic_arith.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;

LIBRARY CryptoChip;

ENTITY TDES_TRANSFORMER IS
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
END TDES_TRANSFORMER;

ARCHITECTURE TDES_TRANSFORMER_arch OF TDES_TRANSFORMER IS
--TYPE stateMAIN IS (IDLE, INITIALIZE, SET_curr_LR, Expand_Permute, SBOX_Func, Permutation, SET_next_LR, Check_roundCounter, END_OF_SERVICE);
SIGNAL mainState : std_logic_vector(2 DOWNTO 0); --stateMAIN;
SIGNAL bool_INIT_ENC, bool_INIT_DEC		: boolean;
SIGNAL roundCounter, tmpCounter			: std_logic_vector(4 DOWNTO 0);
SIGNAL next_LRi					: std_logic_vector(0 TO 63);
SIGNAL curr_Li, curr_Ri				: std_logic_vector(0 TO 31); -- next_Li, next_Ri
SIGNAL S_INPUT, E48				: std_logic_vector(0 TO 47);
SIGNAL P_INPUT, P_OUTPUT			: std_logic_vector(0 TO 31);

SUBTYPE row4 IS NATURAL RANGE 0 TO 3;
SUBTYPE col16 IS NATURAL RANGE 0 TO 15;
SIGNAL srow1, srow2, srow3, srow4, srow5, srow6, srow7, srow8 : row4;
SIGNAL scol1, scol2, scol3, scol4, scol5, scol6, scol7, scol8 : col16;
SIGNAL HT1, HT2, HT3, HT4, HT5, HT6, HT7, HT8	: std_logic_vector(1 DOWNTO 0);
TYPE SBOX IS ARRAY(0 to 3, 0 to 15) of std_logic_vector(3 DOWNTO 0);
CONSTANT SBOX1 : SBOX := (
				("1110", "0100", "1101", "0001", "0010", "1111", "1011", "1000", "0011", "1010", "0110", "1100", "0101", "1001", "0000", "0111"),
				("0000", "1111", "0111", "0100", "1110", "0010", "1101", "0001", "1010", "0110", "1100", "1011", "1001", "0101", "0011", "1000"),
				("0100", "0001", "1110", "1000", "1101", "0110", "0010", "1011", "1111", "1100", "1001", "0111", "0011", "1010", "0101", "0000"),
				("1111", "1100", "1000", "0010", "0100", "1001", "0001", "0111", "0101", "1011", "0011", "1110", "1010", "0000", "0110", "1101")
			    );

CONSTANT SBOX2 : SBOX := (
				("1111", "0001", "1000", "1110", "0110", "1011", "0011", "0100", "1001", "0111", "0010", "1101", "1100", "0000", "0101", "1010"),
				("0011", "1101", "0100", "0111", "1111", "0010", "1000", "1110", "1100", "0000", "0001", "1010", "0110", "1001", "1011", "0101"),
				("0000", "1110", "0111", "1011", "1010", "0100", "1101", "0001", "0101", "1000", "1100", "0110", "1001", "0011", "0010", "1111"),
				("1101", "1000", "1010", "0001", "0011", "1111", "0100", "0010", "1011", "0110", "0111", "1100", "0000", "0101", "1110", "1001")
			    );

CONSTANT SBOX3 : SBOX := (
				("1010", "0000", "1001", "1110", "0110", "0011", "1111", "0101", "0001", "1101", "1100", "0111", "1011", "0100", "0010", "1000"),
				("1101", "0111", "0000", "1001", "0011", "0100", "0110", "1010", "0010", "1000", "0101", "1110", "1100", "1011", "1111", "0001"),
				("1101", "0110", "0100", "1001", "1000", "1111", "0011", "0000", "1011", "0001", "0010", "1100", "0101", "1010", "1110", "0111"),
				("0001", "1010", "1101", "0000", "0110", "1001", "1000", "0111", "0100", "1111", "1110", "0011", "1011", "0101", "0010", "1100")
			    );

CONSTANT SBOX4 : SBOX := (
				("0111", "1101", "1110", "0011", "0000", "0110", "1001", "1010", "0001", "0010", "1000", "0101", "1011", "1100", "0100", "1111"),
				("1101", "1000", "1011", "0101", "0110", "1111", "0000", "0011", "0100", "0111", "0010", "1100", "0001", "1010", "1110", "1001"),
				("1010", "0110", "1001", "0000", "1100", "1011", "0111", "1101", "1111", "0001", "0011", "1110", "0101", "0010", "1000", "0100"),
				("0011", "1111", "0000", "0110", "1010", "0001", "1101", "1000", "1001", "0100", "0101", "1011", "1100", "0111", "0010", "1110")
			    );

CONSTANT SBOX5 : SBOX := (
				("0010", "1100", "0100", "0001", "0111", "1010", "1011", "0110", "1000", "0101", "0011", "1111", "1101", "0000", "1110", "1001"),
				("1110", "1011", "0010", "1100", "0100", "0111", "1101", "0001", "0101", "0000", "1111", "1010", "0011", "1001", "1000", "0110"),
				("0100", "0010", "0001", "1011", "1010", "1101", "0111", "1000", "1111", "1001", "1100", "0101", "0110", "0011", "0000", "1110"),
				("1011", "1000", "1100", "0111", "0001", "1110", "0010", "1101", "0110", "1111", "0000", "1001", "1010", "0100", "0101", "0011")
			    );

CONSTANT SBOX6 : SBOX := (
				("1100", "0001", "1010", "1111", "1001", "0010", "0110", "1000", "0000", "1101", "0011", "0100", "1110", "0111", "0101", "1011"),
				("1010", "1111", "0100", "0010", "0111", "1100", "1001", "0101", "0110", "0001", "1101", "1110", "0000", "1011", "0011", "1000"),
				("1001", "1110", "1111", "0101", "0010", "1000", "1100", "0011", "0111", "0000", "0100", "1010", "0001", "1101", "1011", "0110"),
				("0100", "0011", "0010", "1100", "1001", "0101", "1111", "1010", "1011", "1110", "0001", "0111", "0110", "0000", "1000", "1101")
			    );

CONSTANT SBOX7 : SBOX := (
				("0100", "1011", "0010", "1110", "1111", "0000", "1000", "1101", "0011", "1100", "1001", "0111", "0101", "1010", "0110", "0001"),
				("1101", "0000", "1011", "0111", "0100", "1001", "0001", "1010", "1110", "0011", "0101", "1100", "0010", "1111", "1000", "0110"),
				("0001", "0100", "1011", "1101", "1100", "0011", "0111", "1110", "1010", "1111", "0110", "1000", "0000", "0101", "1001", "0010"),
				("0110", "1011", "1101", "1000", "0001", "0100", "1010", "0111", "1001", "0101", "0000", "1111", "1110", "0010", "0011", "1100")
			    );

CONSTANT SBOX8 : SBOX := (
				("1101", "0010", "1000", "0100", "0110", "1111", "1011", "0001", "1010", "1001", "0011", "1110", "0101", "0000", "1100", "0111"),
				("0001", "1111", "1101", "1000", "1010", "0011", "0111", "0100", "1100", "0101", "0110", "1011", "0000", "1110", "1001", "0010"),
				("0111", "1011", "0100", "0001", "1001", "1100", "1110", "0010", "0000", "0110", "1010", "1101", "1111", "0011", "0101", "1000"),
				("0010", "0001", "1110", "0111", "0100", "1010", "1000", "1101", "1111", "1100", "1001", "0000", "0011", "0101", "0110", "1011")
			    );

BEGIN

PROCESS (Clk, TRANSFORM_ON)
BEGIN
IF TRANSFORM_ON = '0' THEN
   mainState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE mainState IS
WHEN "000" => --IDLE =>
   IF TRANSFORM_ON = '1' THEN
      mainState <= "001"; --INITIALIZE;
   END IF;

WHEN "001" => --INITIALIZE =>
   mainState <= "010"; --SET_curr_LR;

WHEN "010" => --SET_curr_LR =>
   IF SUBKEY_Completed = '1' THEN
      mainState <= "011"; --Expand_Permute;
   END IF;

WHEN "011" => --Permutation =>
   mainState <= "100"; --SET_next_LR;

WHEN "100" => --SET_next_LR =>
      mainState <= "101"; --Check_roundCounter;

WHEN "101" => --Check_roundCounter =>
   IF roundCounter /= "00000" THEN
      mainState <= "010"; --SET_curr_LR;
   ELSE
      mainState <= "110"; --END_OF_SERVICE;
   END IF;

WHEN "110" => --END_OF_SERVICE =>
IF TRANSFORM_ON = '0' THEN
   mainState <= "000"; --IDLE;
END IF;

WHEN OTHERS =>
   mainState <= "000";

END CASE;
END IF;
END PROCESS;

roundCounter <= "10000" WHEN mainState = "001"
ELSE tmpCounter - 1 WHEN mainState = "100"
ELSE roundCounter;

tmpCounter <= "10000" WHEN mainState = "001"
ELSE tmpCounter WHEN mainState = "100"
ELSE roundCounter;

-- ==================================================================================== --
--				SIGNAL ASSIGNMENT SPACE					--
-- ==================================================================================== --

SUBKEY_REQ <= '1' WHEN mainState = "010"
	 ELSE '0';

bool_INIT_ENC <= Enc_Flag_in = '1' AND mainState = "001"; --INITIALIZE;
bool_INIT_DEC <= Enc_Flag_in = '0' AND mainState = "001"; --INITIALIZE;

next_LRi  <= TINPUT  WHEN bool_INIT_ENC
	ELSE TINPUT(32 TO 63) & TINPUT(0 TO 31) WHEN bool_INIT_DEC
	ELSE curr_Ri & (P_OUTPUT XOR curr_Li) WHEN mainState = "100" --SET_next_LR
	ELSE next_LRi;

curr_Li <= next_LRi(0 TO 31) WHEN mainState = "010" --SET_curr_LR
	ELSE curr_Li;

curr_Ri <= next_LRi(32 TO 63) WHEN mainState = "010" --SET_curr_LR
	ELSE curr_Ri;

TOUTPUT   <= next_LRi WHEN Enc_Flag_in = '1' AND mainState = "110" --END_OF_SERVICE
	ELSE next_LRi(32 TO 63) & next_LRi(0 TO 31) WHEN Enc_Flag_in = '0' AND mainState = "110" --END_OF_SERVICE
	ELSE (others => '0');

E48  <= curr_Ri(31) & curr_Ri(0)  & curr_Ri(1)  & curr_Ri(2)  & curr_Ri(3)  & curr_Ri(4) &
	curr_Ri(3)  & curr_Ri(4)  & curr_Ri(5)  & curr_Ri(6)  & curr_Ri(7)  & curr_Ri(8) &
	curr_Ri(7)  & curr_Ri(8)  & curr_Ri(9)  & curr_Ri(10) & curr_Ri(11) & curr_Ri(12) &
	curr_Ri(11) & curr_Ri(12) & curr_Ri(13) & curr_Ri(14) & curr_Ri(15) & curr_Ri(16) &
	curr_Ri(15) & curr_Ri(16) & curr_Ri(17) & curr_Ri(18) & curr_Ri(19) & curr_Ri(20) &
	curr_Ri(19) & curr_Ri(20) & curr_Ri(21) & curr_Ri(22) & curr_Ri(23) & curr_Ri(24) &
	curr_Ri(23) & curr_Ri(24) & curr_Ri(25) & curr_Ri(26) & curr_Ri(27) & curr_Ri(28) &
	curr_Ri(27) & curr_Ri(28) & curr_Ri(29) & curr_Ri(30) & curr_Ri(31) & curr_Ri(0);

S_INPUT <= E48 XOR Ki;

-- SBOX 8
HT8	<= S_INPUT(42) & S_INPUT(47);
srow8 <= to_integer(UNSIGNED(HT8));
scol8 <= to_integer(UNSIGNED(S_INPUT(43 TO 46)));
P_INPUT(28 TO 31) <= SBOX8(srow8, scol8);

-- SBOX 7
HT7	<= S_INPUT(36) & S_INPUT(41);
srow7 <= to_integer(UNSIGNED(HT7));
scol7 <= to_integer(UNSIGNED(S_INPUT(37 TO 40)));
P_INPUT(24 TO 27) <= SBOX7(srow7, scol7);

-- SBOX 6
HT6	<= S_INPUT(30) & S_INPUT(35);
srow6 <= to_integer(UNSIGNED(HT6));
scol6 <= to_integer(UNSIGNED(S_INPUT(31 TO 34)));
P_INPUT(20 TO 23) <= SBOX6(srow6, scol6);


-- SBOX 5
HT5	<= S_INPUT(24) & S_INPUT(29);
srow5 <= to_integer(UNSIGNED(HT5));
scol5 <= to_integer(UNSIGNED(S_INPUT(25 TO 28)));
P_INPUT(16 TO 19) <= SBOX5(srow5, scol5);

-- SBOX 4
HT4	<= S_INPUT(18) & S_INPUT(23);
srow4 <= to_integer(UNSIGNED(HT4));
scol4 <= to_integer(UNSIGNED(S_INPUT(19 TO 22)));
P_INPUT(12 TO 15) <= SBOX4(srow4, scol4);


-- SBOX 3
HT3	<= S_INPUT(12) & S_INPUT(17);
srow3 <= to_integer(UNSIGNED(HT3));
scol3 <= to_integer(UNSIGNED(S_INPUT(13 TO 16)));
P_INPUT(8 TO 11)  <= SBOX3(srow3, scol3);

-- SBOX 2
HT2	<= S_INPUT(6) & S_INPUT(11);
srow2 <= to_integer(UNSIGNED(HT2));
scol2 <= to_integer(UNSIGNED(S_INPUT(7 TO 10)));
P_INPUT(4 TO 7)   <= SBOX2(srow2, scol2);

-- SBOX 1
HT1	<= S_INPUT(0) & S_INPUT(5);
srow1 <= to_integer(UNSIGNED(HT1));
scol1 <= to_integer(UNSIGNED(S_INPUT(1 TO 4)));
P_INPUT(0 TO 3)   <= SBOX1(srow1, scol1);

P_OUTPUT <= P_INPUT(15) & P_INPUT(6)  & P_INPUT(19) & P_INPUT(20) &
	    P_INPUT(28) & P_INPUT(11) & P_INPUT(27) & P_INPUT(16) &
	    P_INPUT(0)  & P_INPUT(14) & P_INPUT(24) & P_INPUT(25) &
	    P_INPUT(4)  & P_INPUT(17) & P_INPUT(30) & P_INPUT(9)  &
	    P_INPUT(1)  & P_INPUT(7)  & P_INPUT(23) & P_INPUT(13) &
	    P_INPUT(31) & P_INPUT(26) & P_INPUT(2)  & P_INPUT(8)  &
	    P_INPUT(18) & P_INPUT(12) & P_INPUT(29) & P_INPUT(5)  &
	    P_INPUT(21) & P_INPUT(10) & P_INPUT(3)  & P_INPUT(24);

TRANSFORM_Completed <= '1' WHEN mainState = "110" --END_OF_SERVICE;
		  ELSE '0';

END TDES_TRANSFORMER_arch;