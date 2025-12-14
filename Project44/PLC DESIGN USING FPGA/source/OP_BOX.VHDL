----------------------------------------------------------------------------------------------------
-- OUTPUT_BOX                                                                                           --
-- want okff.vhdl for component FF                                                                 --
----------------------------------------------------------------------------------------------------

library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity OUTPUT_BOX is
port( WE     : in std_logic;     -- write = 1
      en     : in std_logic_vector(6 downto 0);
      RESET  : in std_logic;
      OP_i   : in std_logic;
      OP_o   : out std_logic;
      OUTPUT : out std_logic_vector(6 downto 0) );
end OUTPUT_BOX;

architecture RTL of OUTPUT_BOX is

component FF
port( we    : in std_logic;     -- write = 1
      cs    : in std_logic;
      reset : in std_logic;
      d_in  : in std_logic;
      d_out : out std_logic );
end component;

   signal data_o : std_logic_vector(6 downto 0);
begin

   OUTPUT0  : FF port map (WE,en(0),RESET,OP_i,data_o(0));
   OUTPUT1  : FF port map (WE,en(1),RESET,OP_i,data_o(1));
   OUTPUT2  : FF port map (WE,en(2),RESET,OP_i,data_o(2));
   OUTPUT3  : FF port map (WE,en(3),RESET,OP_i,data_o(3));
   OUTPUT4  : FF port map (WE,en(4),RESET,OP_i,data_o(4));
   OUTPUT5  : FF port map (WE,en(5),RESET,OP_i,data_o(5));
   OUTPUT6  : FF port map (WE,en(6),RESET,OP_i,data_o(6));
   OP_o <= (en(0) and data_o(0)) or (en(1) and data_o(1)) or (en(2) and data_o(2)) or
           (en(3) and data_o(3)) or (en(4) and data_o(4)) or (en(5) and data_o(5)) or 
           (en(6) and data_o(6));
   OUTPUT <= data_o;

end RTL;

