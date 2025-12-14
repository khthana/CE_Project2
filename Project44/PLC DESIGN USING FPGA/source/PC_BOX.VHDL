----------------------------------------------------------------------------------------------------
-- MEMORY_MANAGEMENT                                                                              --
----------------------------------------------------------------------------------------------------

library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity PC_MANAGEMENT is
port( PC_RESET : in std_logic;
      PC_INC   : in std_logic;
      addr     : out ADDRESS_BUS );
end PC_MANAGEMENT;

architecture RTL of PC_MANAGEMENT is
   signal PC : ADDRESS_BUS;
begin

   addr <= PC;

   process (PC_INC, PC_RESET)
   begin
      if (PC_RESET = '1') then
         PC <= "000000000000000";
      elsif (PC_INC'event and PC_INC = '1') then
         PC <= PC + 1;
      end if;
   end process;

end RTL;