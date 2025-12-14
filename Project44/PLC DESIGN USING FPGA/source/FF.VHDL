----------------------------------------------------------------------------------------------------
-- FLIP FLOP                                                                                      --
----------------------------------------------------------------------------------------------------

library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity FF is
port( we    : in std_logic;     -- write = 1
      cs    : in std_logic;
      reset : in std_logic;
      d_in  : in std_logic;
      d_out : out std_logic );
end FF;

architecture RTL of FF is
   signal data : std_logic;
begin

   d_out <= data;
   
   process (cs, we, d_in, reset)
   begin
      if (reset = '1') then
         data <= '0';
      elsif (cs = '1') then
         if (we'event and we = '1') then
            data   <= d_in;
         end if;
      end if;
   end process;

end RTL;

