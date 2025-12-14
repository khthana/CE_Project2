library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;

entity I8051ROM is
port( clk         : in  std_logic;
      rst         : in  std_logic;
      ADDRESS_BUS : in  std_logic_vector(15 downto 0);
      RD          : in  std_logic;
      DATA_BUS    : out std_logic_vector(7 downto 0));
end I8051ROM;

architecture RTL of I8051ROM is
     type MY_ROM is array(0 to 24) of std_logic_vector(7 downto 0);
 
     constant PROGRAM : MY_ROM :=
                             (
                             "01110100",         --74
                             "00000011",         --03
                             "01111000",         --78
                             "00000001",         --01
                             "01111001",         --79
                             "00001111",         --0F
                             "11110101",         --F5
                             "00110000",         --30
                             "10001000",         --88
                             "00110001",         --31
                             "10000101",         --85
                             "00110000",         --30
                             "00110010",         --32
                             "10000110",         --86
                             "00110011",         --33
                             "01110101",         --75
                             "00110100",         --34
                             "11110000",         --F0
                             "00000001",         --01
                             "00010010",         --12
                             "00000000",         --00
                             "00000000",         --00
                             "00000000",         --00
                             "00000000",         --00
                             "00000000"          --00
                             );
                             
begin
    process(clk, rst) 
    begin                        
        if( rst = '1' ) then              
          DATA_BUS <= "ZZZZZZZZ";          
        elsif( clk'event and clk = '1' ) then              
           if( rd = '1' ) then        
             DATA_BUS <= PROGRAM(conv_integer(ADDRESS_BUS));    
           else        
             DATA_BUS <= "ZZZZZZZZ";   
           end if;       
        end if;            
      end process;                       
end RTL;
