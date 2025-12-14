-- **********************************************************************
--  $RCSfile: stub_xor_testb.vhd,v $
--  $Revision: 1.2 $
--  last change by $Author: sirikhum $
--  at $Date: 2002/10/28 14:31:49 $
-- **********************************************************************
--
--   GNU Lesser General Public License Version 2.1
--   ===============================================
--   Copyright 2002 by Noppadon Sirikhum
--
--   This library is free software; you can redistribute it and/or
--   modify it under the terms of the GNU Lesser General Public
--   License version 2.1, as published by the Free Software Foundation.
--
--   This library is distributed in the hope that it will be useful,
--   but WITHOUT ANY WARRANTY; without even the implied warranty of
--   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--   Lesser General Public License for more details.
--
--   You should have received a copy of the GNU Lesser General Public
--   License along with this library; if not, write to the Free Software
--   Foundation, Inc., 59 Temple Place, Suite 330, Boston,
--   MA  02111-1307  USA
--
-- **********************************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.xor_lib.all;
use work.xor_stub.all;
--use work.xor_lib.all;

entity xor_stub_testb is
-- port();
end xor_stub_testb;


architecture arch_xor_stub_testb of xor_stub_testb is
-- these signals were connected to stub
  signal clk	:std_logic := '1';
  signal reset	:std_logic := '0';
  signal addr_bus	:std_logic_vector(15 downto 0) := "0000000000000000";
  signal data_bus	:std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ";
  signal irq		:std_logic;
--  signal irq_ack	:std_logic := '1';
  signal ior		:std_logic := '1';
  signal iow		:std_logic := '1';
  signal iocs16		:std_logic := '1';
  signal iochrdy	:std_logic;

--  signal data		:std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  signal fetching_data  :std_logic := '0';
  signal fetch_state	:std_logic_vector(3 downto 0) := "0000";
  signal crypted_data	:std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
--  signal key		:std_logic_vector(55 downto 0) := "00000000000000000000000000000000000000000000000000000000";

-- this PERIOD (full clock cycle period) from Freexor-Testb
  constant PERIOD	:time := 40 ns;

--  signal data_delay	:std_logic_vector(32 downto 0) := 5;
--  signal clk_couter	:std_logic_vector(32 downto 0) := 0;

begin 

--STUB0: stub_xor_small port map (clk, reset, addr_bus, data_bus, irq, irq_ack, ior, iow, iochrdy);
STUB0: stub_xor port map (clk, reset, addr_bus, data_bus, irq, ior, iow, iocs16, iochrdy);

reset <= '1' after 0 ns, '0' after 5*PERIOD;
clk <= not clk after PERIOD/2;

--data_bus(15 downto 0) <= "0000000000000000" after 2*PERIOD;
--addr_bus(11 downto 0) <= "000000000000" after 2*PERIOD;

--- X value correction
--addr_bus(15 downto 0) <= "0000000100010100" after 2*PERIOD;
--iochrdy <= '0' after 2*PERIOD;

-- use addressbus as in stub'r
addr_bus(11 downto 0) <= "000100010100" after 6*PERIOD, -- 0x114
	"000100010101" after 9*PERIOD,  -- 0x115
	"000100010110" after 12*PERIOD, -- 0x116
	"000100010111" after 15*PERIOD, -- 0x117
	-- fetch key
	"000100011000" after 18*PERIOD, -- 0x118
	"000100011001" after 21*PERIOD, -- 0x119
	"000100011010" after 24*PERIOD, -- 0x11A
	"000100011011" after 27*PERIOD, -- start encrypt here.
	-- fetch cyrpted data
	"000100011100" after 44*PERIOD, -- 0x11c
	"000100011101" after 47*PERIOD, -- 0x11d
	"000100011110" after 50*PERIOD, -- 0x11e
	"000100011111" after 53*PERIOD; -- 0x11f

-- use data as in Freexor'testbench
data_bus(15 downto 0) <= "0001010010011011" after 6*PERIOD, -- 0x149B

	"ZZZZZZZZZZZZZZZZ" after 8*PERIOD,
	"0001001011011001" after 9*PERIOD,  -- 0x12D9

	"ZZZZZZZZZZZZZZZZ" after 11*PERIOD,
	"1110010110010011" after 12*PERIOD, -- 0xE593

	"ZZZZZZZZZZZZZZZZ" after 14*PERIOD,
	"0001001010001100" after 15*PERIOD, -- 0x128C
	-- fetch key
	"ZZZZZZZZZZZZZZZZ" after 17*PERIOD,
	"0101001010100100" after 18*PERIOD, -- 0x52A4

	"ZZZZZZZZZZZZZZZZ" after 20*PERIOD,
	"1010010101000110" after 21*PERIOD, -- 0xA546

	"ZZZZZZZZZZZZZZZZ" after 23*PERIOD,
	"1010001011001111" after 24*PERIOD, -- 0xA2CF

	"ZZZZZZZZZZZZZZZZ" after 26*PERIOD,
	"1100001110000000" after 27*PERIOD, -- 0xC3_80

	"ZZZZZZZZZZZZZZZZ" after 29*PERIOD;

-- iow'signal, requied to completed stub operation
iow <= '0' after 7*PERIOD, '1' after 8*PERIOD,
  	'0' after 10*PERIOD, '1' after 11*PERIOD,
	'0' after 13*PERIOD, '1' after 14*PERIOD,
	'0' after 16*PERIOD, '1' after 17*PERIOD,
	-- key
	'0' after 19*PERIOD, '1' after 20*PERIOD,
	'0' after 22*PERIOD, '1' after 23*PERIOD,
	'0' after 25*PERIOD, '1' after 26*PERIOD,
	'0' after 28*PERIOD, '1' after 29*PERIOD;

ior <= '0' after 45*PERIOD, '1' after 46*PERIOD,
  	'0' after 48*PERIOD, '1' after 49*PERIOD,
	'0' after 51*PERIOD, '1' after 52*PERIOD,
	'0' after 54*PERIOD, '1' after 55*PERIOD;

handle_irq:process(clk)
begin
	if irq = '0' and addr_bus(3 downto 0) = "1100" then
--		irq_ack <= '0';
		crypted_data(63 downto 48) <= data_bus;
--		fetch_state <= "0001";
		fetching_data <= '1';
--	elsif fetching_data = '1' and iochrdy = '1' then
	elsif fetching_data = '1' and data_bus /= "ZZZZZZZZZZZZZZZZ" then
		if addr_bus(3 downto 0) = "1101" then
--			irq_ack <= '1';
			crypted_data(47 downto 32) <= data_bus;
--			fetch_state <= "0010";
		elsif addr_bus(3 downto 0) = "1110" then
			crypted_data(31 downto 16) <= data_bus;
--			fetch_state <= "0100";
		elsif addr_bus(3 downto 0) = "1111" then
			crypted_data(15 downto 0) <= data_bus;
			fetching_data <= '0';
		end if;
	end if;
end process; --handle_irq

end; -- architecture 

-- delay putting data 'cause of iochrdy
--delay_put_data:process(clk, iochrdy)
--begin
--	if clk = '1' and clk'event and iochrdy='1' then
--		data_delay <= data_delay + 1;
--	end if;
--end process;
--
-- increment counter every clock trig
--clk_trig: process(clk)
--begin
--	if clk = '1' and clk'event then
--		clk_counter <= clk_couter +1;
--	end if;
--end process;
--
-- putting data onto data_bus by using data_delay counter
--putting_data: process(clk)
--begin
--	if clk_couter = 
