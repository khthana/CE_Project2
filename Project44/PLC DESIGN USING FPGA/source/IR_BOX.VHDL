----------------------------------------------------------------------------------------------------
-- IRREG                                                                                          --
----------------------------------------------------------------------------------------------------

library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity IRREG is
port( LD_BYTE1        : in std_logic;
      LD_BYTE2        : in std_logic;
      LD_BYTE3        : in std_logic;
      ir              : in DATA_BUS;
      segment1        : out DATA_BUS;
      segment2        : out DATA_BUS;
      segment3        : out DATA_BUS );
end IRREG;

architecture RTL of IRREG is
begin

   process (ir, LD_BYTE1)
   begin
      if (LD_BYTE1'event and LD_BYTE1 = '1') then
         segment1 <= ir;
      end if;
   end process;
   process (ir, LD_BYTE2)
   begin
      if (LD_BYTE2'event and LD_BYTE2 = '1') then
         segment2 <= ir;
      end if;
   end process;
   process (ir, LD_BYTE3)
   begin
      if (LD_BYTE3'event and LD_BYTE3 = '1') then
         segment3 <= ir;
      end if;
   end process;

end RTL;