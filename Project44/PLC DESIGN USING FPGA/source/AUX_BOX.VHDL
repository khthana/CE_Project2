----------------------------------------------------------------------------------------------------
-- AUX_BOX                                                                                           --
-- want tff1.vhdl for component FF                                                                 --
----------------------------------------------------------------------------------------------------

library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity AUX_BOX is
port( WE     : in std_logic;     -- write = 1
      en     : in std_logic_vector(63 downto 0);
      RESET  : in std_logic;
      AUX_i  : in std_logic;
      AUX_o  : out std_logic );
end AUX_BOX;

architecture RTL of AUX_BOX is

component FF
port( we    : in std_logic;     -- write = 1
      cs    : in std_logic;
      reset : in std_logic;
      d_in  : in std_logic;
      d_out : out std_logic );
end component;

   signal data_o : std_logic_vector(63 downto 0);
begin

   AUX0  : FF port map (WE,en(0) ,RESET,AUX_i,data_o(0) );
   AUX1  : FF port map (WE,en(1) ,RESET,AUX_i,data_o(1) );
   AUX2  : FF port map (WE,en(2) ,RESET,AUX_i,data_o(2) );
   AUX3  : FF port map (WE,en(3) ,RESET,AUX_i,data_o(3) );
   AUX4  : FF port map (WE,en(4) ,RESET,AUX_i,data_o(4) );
   AUX5  : FF port map (WE,en(5) ,RESET,AUX_i,data_o(5) );
   AUX6  : FF port map (WE,en(6) ,RESET,AUX_i,data_o(6) );
   AUX7  : FF port map (WE,en(7) ,RESET,AUX_i,data_o(7) );
   AUX8  : FF port map (WE,en(8) ,RESET,AUX_i,data_o(8) );
   AUX9  : FF port map (WE,en(9) ,RESET,AUX_i,data_o(9) );
   AUX10 : FF port map (WE,en(10),RESET,AUX_i,data_o(10));
   AUX11 : FF port map (WE,en(11),RESET,AUX_i,data_o(11));
   AUX12 : FF port map (WE,en(12),RESET,AUX_i,data_o(12));
   AUX13 : FF port map (WE,en(13),RESET,AUX_i,data_o(13));
   AUX14 : FF port map (WE,en(14),RESET,AUX_i,data_o(14));
   AUX15 : FF port map (WE,en(15),RESET,AUX_i,data_o(15));
   AUX16 : FF port map (WE,en(16),RESET,AUX_i,data_o(16));
   AUX17 : FF port map (WE,en(17),RESET,AUX_i,data_o(17));
   AUX18 : FF port map (WE,en(18),RESET,AUX_i,data_o(18));
   AUX19 : FF port map (WE,en(19),RESET,AUX_i,data_o(19));
   AUX20 : FF port map (WE,en(20),RESET,AUX_i,data_o(20));
   AUX21 : FF port map (WE,en(21),RESET,AUX_i,data_o(21));
   AUX22 : FF port map (WE,en(22),RESET,AUX_i,data_o(22));
   AUX23 : FF port map (WE,en(23),RESET,AUX_i,data_o(23));
   AUX24 : FF port map (WE,en(24),RESET,AUX_i,data_o(24));
   AUX25 : FF port map (WE,en(25),RESET,AUX_i,data_o(25));
   AUX26 : FF port map (WE,en(26),RESET,AUX_i,data_o(26));
   AUX27 : FF port map (WE,en(27),RESET,AUX_i,data_o(27));
   AUX28 : FF port map (WE,en(28),RESET,AUX_i,data_o(28));
   AUX29 : FF port map (WE,en(29),RESET,AUX_i,data_o(29));
   AUX30 : FF port map (WE,en(30),RESET,AUX_i,data_o(30));
   AUX31 : FF port map (WE,en(31),RESET,AUX_i,data_o(31));
   AUX32 : FF port map (WE,en(32),RESET,AUX_i,data_o(32));
   AUX33 : FF port map (WE,en(33),RESET,AUX_i,data_o(33));
   AUX34 : FF port map (WE,en(34),RESET,AUX_i,data_o(34));
   AUX35 : FF port map (WE,en(35),RESET,AUX_i,data_o(35));
   AUX36 : FF port map (WE,en(36),RESET,AUX_i,data_o(36));
   AUX37 : FF port map (WE,en(37),RESET,AUX_i,data_o(37));
   AUX38 : FF port map (WE,en(38),RESET,AUX_i,data_o(38));
   AUX39 : FF port map (WE,en(39),RESET,AUX_i,data_o(39));
   AUX40 : FF port map (WE,en(40),RESET,AUX_i,data_o(40));
   AUX41 : FF port map (WE,en(41),RESET,AUX_i,data_o(41));
   AUX42 : FF port map (WE,en(42),RESET,AUX_i,data_o(42));
   AUX43 : FF port map (WE,en(43),RESET,AUX_i,data_o(43));
   AUX44 : FF port map (WE,en(44),RESET,AUX_i,data_o(44));
   AUX45 : FF port map (WE,en(45),RESET,AUX_i,data_o(45));
   AUX46 : FF port map (WE,en(46),RESET,AUX_i,data_o(46));
   AUX47 : FF port map (WE,en(47),RESET,AUX_i,data_o(47));
   AUX48 : FF port map (WE,en(48),RESET,AUX_i,data_o(48));
   AUX49 : FF port map (WE,en(49),RESET,AUX_i,data_o(49));
   AUX50 : FF port map (WE,en(50),RESET,AUX_i,data_o(50));
   AUX51 : FF port map (WE,en(51),RESET,AUX_i,data_o(51));
   AUX52 : FF port map (WE,en(52),RESET,AUX_i,data_o(52));
   AUX53 : FF port map (WE,en(53),RESET,AUX_i,data_o(53));
   AUX54 : FF port map (WE,en(54),RESET,AUX_i,data_o(54));
   AUX55 : FF port map (WE,en(55),RESET,AUX_i,data_o(55));
   AUX56 : FF port map (WE,en(56),RESET,AUX_i,data_o(56));
   AUX57 : FF port map (WE,en(57),RESET,AUX_i,data_o(57));
   AUX58 : FF port map (WE,en(58),RESET,AUX_i,data_o(58));
   AUX59 : FF port map (WE,en(59),RESET,AUX_i,data_o(59));
   AUX60 : FF port map (WE,en(60),RESET,AUX_i,data_o(60));
   AUX61 : FF port map (WE,en(61),RESET,AUX_i,data_o(61));
   AUX62 : FF port map (WE,en(62),RESET,AUX_i,data_o(62));
   AUX63 : FF port map (WE,en(63),RESET,AUX_i,data_o(63));

   AUX_o <= (en(0)  and data_o(0) ) or (en(1)  and data_o(1) ) or (en(2)  and data_o(2) ) or (en(3)  and data_o(3) )
         or (en(4)  and data_o(4) ) or (en(5)  and data_o(5) ) or (en(6)  and data_o(6) ) or (en(7)  and data_o(7) )
         or (en(8)  and data_o(8) ) or (en(9)  and data_o(9) ) or (en(10) and data_o(10)) or (en(11) and data_o(11))
         or (en(12) and data_o(12)) or (en(13) and data_o(13)) or (en(14) and data_o(14)) or (en(15) and data_o(15))
         or (en(16) and data_o(16)) or (en(17) and data_o(17)) or (en(18) and data_o(18)) or (en(19) and data_o(19))
         or (en(20) and data_o(20)) or (en(21) and data_o(21)) or (en(22) and data_o(22)) or (en(23) and data_o(23))
         or (en(24) and data_o(24)) or (en(25) and data_o(25)) or (en(26) and data_o(26)) or (en(27) and data_o(27))
         or (en(28) and data_o(28)) or (en(29) and data_o(29)) or (en(30) and data_o(30)) or (en(31) and data_o(31))
         or (en(32) and data_o(32)) or (en(33) and data_o(33)) or (en(34) and data_o(34)) or (en(35) and data_o(35))
         or (en(36) and data_o(36)) or (en(37) and data_o(37)) or (en(38) and data_o(38)) or (en(39) and data_o(39))
         or (en(40) and data_o(40)) or (en(41) and data_o(41)) or (en(42) and data_o(42)) or (en(43) and data_o(43))
         or (en(44) and data_o(44)) or (en(45) and data_o(45)) or (en(46) and data_o(46)) or (en(47) and data_o(47))
         or (en(48) and data_o(48)) or (en(49) and data_o(49)) or (en(50) and data_o(50)) or (en(51) and data_o(51))
         or (en(52) and data_o(52)) or (en(53) and data_o(53)) or (en(54) and data_o(54)) or (en(55) and data_o(55))
         or (en(56) and data_o(56)) or (en(57) and data_o(57)) or (en(58) and data_o(58)) or (en(59) and data_o(59))
         or (en(60) and data_o(60)) or (en(61) and data_o(61)) or (en(62) and data_o(62)) or (en(63) and data_o(63));
end RTL;

