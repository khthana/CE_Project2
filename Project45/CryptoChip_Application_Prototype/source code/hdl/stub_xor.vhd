-- **********************************************************************
--  $RCSfile: stub_xor.vhd,v $
--  $Revision: 1.3 $
--  last change by $Author: sirikhum $
--  at $Date: 2002/10/29 18:40:56 $
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

package xor_stub is
   component stub_xor 
	port (	clk	:in std_logic;
		reset	:in std_logic;

		addr_bus	:in std_logic_vector(15 downto 0);
		data_bus	:inout std_logic_vector(15 downto 0);
		irq		:out std_logic :='0';
--		irq_ack		:in std_logic;
		ior		:in std_logic;
		iow		:in std_logic;
		iocs16		:out std_logic;
		iochrdy		:out std_logic
		);
  end component;
end xor_stub;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.xor_lib.all;
use work.xor_stub.all;

entity stub_xor is 
	port (	clk	:in std_logic;
		reset	:in std_logic;

		addr_bus	:in std_logic_vector(15 downto 0);
		data_bus	:inout std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ"; 
		irq		:out std_logic :='1';
--		irq_ack		:in std_logic;
		ior		:in std_logic;
		iow		:in std_logic;
		iocs16		:out std_logic;
		iochrdy		:out std_logic := '1'
		);
end stub_xor;

architecture arch_stub of stub_xor is
	signal data_from_bus_buf	:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
--	signal crypted_data	:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
	signal key_from_bus_buf		:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
	signal ack		:std_logic := '0';
	signal loaded		:std_logic := '0'; -- crypted data was NOT out
	signal fetched		:std_logic := '0'; -- fetch data&key completely
	signal cs		:std_logic := '0';
	signal csI		:std_logic := '0';
	signal csII		:std_logic := '0';
	signal cs_datai		:std_logic_vector (3 downto 0) := "0000";
	signal cs_key		:std_logic_vector (3 downto 0) := "0000";
	signal cs_datao		:std_logic_vector (3 downto 0) := "0000";

--  signla to DES core
	signal xor_clk			:std_logic;
	signal xor_reset		:std_logic := '0';
	signal en_decrypt		:std_logic := '1';
	signal key_to_xor		:std_logic_vector(55 downto 0);
	signal data_to_xor		:std_logic_vector(63 downto 0);
	signal data_to_xor_valid	:std_logic := '0';
	signal data_to_xor_valid_latched:std_logic := '0';
	signal running_xor		:std_logic;
	signal data_from_xor		:std_logic_vector(63 downto 0);
	signal data_from_xor_buf	:std_logic_vector(63 downto 0);
	signal data_from_xor_valid	:std_logic;
--	signal encrypt_flag		:std_logic;
--	signal decrypt_flag		:std_logic
--	signal fetchinf			:std_logic;

begin
	xor_clk <= clk ;
-- module chip select
-- comment this 'cause of 10-bits ioports-addr limit.
-- our ioport-range are 0x110-0x11f for din and key 
-- and 0x120-0x126 for dout.
-- the last added range 'cause of 16bit data tranfer use 2 address.
-- (which  will easier if we use even addresses)
--	cs := addr_bus(15) and not addr_bus(14) and not addr_bus(13) and
--		not addr_bus(12) and not addr_bus(11) and not addr_bus(10) and
	csI <= not addr_bus(11) and  not addr_bus(10) and  
		not addr_bus(9) and addr_bus(8) and not addr_bus(7) and
		not addr_bus(6) and not addr_bus(5) and addr_bus(4);
	csII <= not addr_bus(11) and  not addr_bus(10) and 
		not addr_bus(9) and addr_bus(8) and not addr_bus(7) and
		not addr_bus(6) and addr_bus(5) and not addr_bus(4);
	cs <= csI or csII;
	iocs16 <= not cs;
		
	-- fetch data chip select 0x110-0x116
	cs_datai(0) 	<= csI and not addr_bus(3) and addr_bus(2) and
				not addr_bus(1) and not addr_bus(0);
	cs_datai(1) 	<= csI and not addr_bus(3) and addr_bus(2) and 
				not addr_bus(1) and addr_bus(0);
	cs_datai(2) 	<= csI and not addr_bus(3) and addr_bus(2) and
				addr_bus(1) and not addr_bus(0);
	cs_datai(3) 	<= csI and not addr_bus(3) and addr_bus(2) and
				addr_bus(1) and addr_bus(0);
				
	-- fetch key chip select 0x118 - 0x11e
	cs_key(0) 	<= csI and addr_bus(3) and not addr_bus(2) and
				not addr_bus(1) and not addr_bus(0);
	cs_key(1)	<= csI and addr_bus(3) and not addr_bus(2) and 
				not addr_bus(1) and addr_bus(0);
	cs_key(2)	<= csI and addr_bus(3) and not addr_bus(2) and 
				addr_bus(1) and not addr_bus(0);
	cs_key(3)	<= csI and addr_bus(3) and not addr_bus(2) and
				addr_bus(1) and addr_bus(0);

	-- out crypted data chip select 0x120 - 0x126
	cs_datao(0)	<= csII and addr_bus(3) and addr_bus(2) and
				not addr_bus(1) and not addr_bus(0);
	cs_datao(1)	<= csII and addr_bus(3) and addr_bus(2) and
				not addr_bus(1) and addr_bus(0);
	cs_datao(2)	<= csII and addr_bus(3) and  addr_bus(2) and
				addr_bus(1) and not addr_bus(0);
	cs_datao(3)	<= csII and addr_bus(3) and addr_bus(2) and
				addr_bus(1) and addr_bus(0);

DES_CORE:xor_crypt port map(xor_clk, xor_reset, en_decrypt, key_to_xor, data_to_xor, data_to_xor_valid, running_xor, data_from_xor, data_from_xor_valid);

--iocs16_hdl:process(reset, cs)
--begin
--	if reset = '1' then
--		iocs16 = '1';
--	elsif cs = '1' then
--		iocs16 = '0';
--	else 
--		iocs16 = '1';
--	end if;
--end;


-- get_data() load both data and key from 
-- It load datas every positive'edge of clock
--get_data:process(data_bus, clk, reset, cs_datai, cs_key, iow)

get_data:process(clk, reset, cs, iow)
begin
	if reset = '1' then 
	 data_from_bus_buf 	<="0000000000000000000000000000000000000000000000000000000000000000";
--	 data_to_xor 	<="0000000000000000000000000000000000000000000000000000000000000000";
	 key_from_bus_buf	<="00000000000000000000000000000000000000000000000000000000";
	 ack      	<='0';
--	 is_ok    	<='1';
	elsif cs = '1' and iow'event and iow = '0' then
		iochrdy<='0'; -- ask uP to wait for fetch complete
		-- start loading data
		if  cs_datai(0) = '1' then
		 	data_from_bus_buf(63 downto 48) <= data_bus(15 downto 0);
			fetched <= '0';
		elsif cs_datai(1)  = '1' then
		 	data_from_bus_buf(47 downto 32) <= data_bus(15 downto 0);
			fetched <= '0';
		elsif cs_datai(2) = '1' then
 			data_from_bus_buf(31 downto 16) <= data_bus(15 downto 0);
			fetched <= '0';
		elsif cs_datai(3) = '1' then
			data_from_bus_buf(15 downto 0) <= data_bus(15 downto 0);
			fetched <= '0';
			
		-- start loading key
		elsif cs_key(0) = '1' then
	 		key_from_bus_buf(55 downto 40) <= data_bus(15 downto 0);
			fetched <= '0';
 		elsif cs_key(1) = '1' then
		  	key_from_bus_buf(39 downto 24) <= data_bus(15 downto 0);
			fetched <= '0';
		elsif cs_key(2) = '1' then
		 	key_from_bus_buf(23 downto 8) <= data_bus(15 downto 0);
			fetched <= '0';
		elsif cs_key(3) = '1' then
			key_from_bus_buf(7 downto 0) <= data_bus(15 downto 8);
			-- en/de-crypt : 1=encrypt, 0=decrypt
			en_decrypt <= data_bus(7);
			fetched <= '1';
		end if;
	elsif cs='1' and ior'event and ior='0' then
		iochrdy <= '0';
		if cs_datao(0) = '1' then
			data_bus(15 downto 0) <= data_from_xor_buf(63 downto 48);
		elsif cs_datao(1) = '1' then
			data_bus(15 downto 0) <= data_from_xor_buf(47 downto 32);
		elsif cs_datao(2) = '1' then
			data_bus(15 downto 0) <= data_from_xor_buf(31 downto 16);
		elsif cs_datao(3) = '1' then
			data_bus(15 downto 0) <= data_from_xor_buf(15 downto 0);
		end if;
	elsif clk'event and clk = '0' and ior = '1' then
		iochrdy <= '1';
		data_bus(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";
	end if;

	iochrdy<='1'; -- ok fetch completed
end process;


-- start encrypt data after datas were fetched completely
begin_crypt:process(reset, clk, fetched)
begin
	if reset = '1' then
	 data_to_xor 	<="0000000000000000000000000000000000000000000000000000000000000000";
	 key_to_xor    	<="00000000000000000000000000000000000000000000000000000000";
	 data_to_xor_valid <='0';

	elsif fetched'event and fetched='1' then
		data_to_xor <= data_from_bus_buf;
		key_to_xor <= key_from_bus_buf;
		data_to_xor_valid <= '1';
--		running_xor <= '1';
	elsif clk'event and clk = '0' then
		if data_to_xor_valid_latched = '1' then
			data_to_xor_valid <= '0';
			data_to_xor_valid_latched <= '0';
		elsif data_to_xor_valid = '1' then
			data_to_xor_valid_latched <= '1';
		end if;
	end if;
end process; --begin_crypt()


-- handle crypto completed
-- handle interrupt ack
-- fetch data and 
--end_crypt:process(data_from_xor_valid, irq_ack)
--end_crypt:process(clk, data_from_xor_valid)
end_crypt:process(clk)
begin
	if data_from_xor_valid = '1' and clk'event then
--		crypted_data <= data_from_xor;
		data_from_xor_buf <= data_from_xor;
		loaded <='1';
		irq <= '0'; 
--	elsif irq_ack = '0' then
--		irq <= '1';
	end if;
end process; -- end_crypt()


-- send crypted data back
--write_data:process(reset, clk, cs, ior, cs_datao)
--begin
--	if reset = '1' then
--		iochrdy <= '1';
--		data_bus(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";
--	elsif cs='1' and ior'event and ior='0' then
--		iochrdy <= '0';
--		if cs_datao(0) = '1' then
--			data_bus(15 downto 0) <= crypted_data(63 downto 48);
--		elsif cs_datao(1) = '1' then
--			data_bus(15 downto 0) <= crypted_data(47 downto 32);
--		elsif cs_datao(2) = '1' then
--			data_bus(15 downto 0) <= crypted_data(31 downto 16);
--		elsif cs_datao(3) = '1' then
--			data_bus(15 downto 0) <= crypted_data(15 downto 0);
--		end if;
--	elsif clk'event and clk = '0' and ior = '0' then
--		iochrdy <= '1';
--	elsif clk'event and clk = '0' and ior = '1' then
--		iochrdy <= '1';
--		data_bus(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";
--	end if;
--end process; -- write_data()

end; -- architecture
