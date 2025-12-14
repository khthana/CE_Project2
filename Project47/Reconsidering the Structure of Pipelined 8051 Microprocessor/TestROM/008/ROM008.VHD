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
     type MY_ROM is array(0 to 33) of std_logic_vector(7 downto 0);
 
     constant PROGRAM : MY_ROM :=
                             (
                             "01110100",         --74
                             "11111111",         --FF
                             "01111000",         --78
                             "11111110",         --FE
                             "01110101",         --75
                             "00110001",         --31
                             "11111101",         --FD
                             "01111001",         --79
                             "00000010",         --02
                             "01111010",         --7A
                             "11111011",         --FB
                             "01011000",         --58
                             "01010101",         --55
                             "00110001",         --31
                             "01010111",         --57
                             "01010100",         --54
                             "11110111",         --F7
                             "01110101",         --75
                             "00110001",         --31
                             "11111100",         --FC
                             "01110100",         --74
                             "11111111",         --FF
                             "01010010",         --52
                             "00110001",         --31
                             "01010011",         --53
                             "00110001",         --31
                             "11110000",         --F0
                             "00000001",         --01
                             "00011011",         --1B
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
