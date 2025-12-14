-- **********************************************************************
--  $RCSfile: stub_des.vhd,v $
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

package des_stub is
   component stub_des_small
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
end des_stub;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.des_lib.all;
use work.des_stub.all;

entity stub_des_small is 
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
end stub_des_small;

architecture arch_stub of stub_des_small is
	signal data_from_bus_buf	:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
--	signal crypted_data	:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
	signal key_from_bus_buf		:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
	signal ack		:std_logic := '0';
	signal loaded		:std_logic := '0'; -- crypted data was NOT out
	signal fetched		:std_logic := '0'; -- fetch data&key completely
	signal cs		:std_logic := '0';
	signal cs_datai		:std_logic_vector (3 downto 0) := "0000";
	signal cs_key		:std_logic_vector (3 downto 0) := "0000";
	signal cs_datao		:std_logic_vector (3 downto 0) := "0000";

--  signla to DES core
	signal des_clk			:std_logic;
	signal des_reset		:std_logic := '0';
	signal en_decrypt		:std_logic := '1';
	signal key_to_des		:std_logic_vector(55 downto 0);
	signal data_to_des		:std_logic_vector(63 downto 0);
	signal data_to_des_valid	:std_logic := '0';
	signal data_to_des_valid_latched:std_logic := '0';
	signal running_des		:std_logic;
	signal data_from_des		:std_logic_vector(63 downto 0);
	signal data_from_des_buf	:std_logic_vector(63 downto 0);
	signal data_from_des_valid	:std_logic;
--	signal encrypt_flag		:std_logic;
--	signal decrypt_flag		:std_logic
--	signal fetchinf			:std_logic;

begin
	des_clk <= clk ;
-- module chip select
-- comment this 'cause of 10-bits ioports-addr limit.
-- our ioport-range is 0x110-0x11f
--	cs := addr_bus(15) and not addr_bus(14) and not addr_bus(13) and
--		not addr_bus(12) and not addr_bus(11) and not addr_bus(10) and
	cs <= not addr_bus(11) and  not addr_bus(10) and 
		not addr_bus(9) and addr_bus(8) and not addr_bus(7) and
		not addr_bus(6) and not addr_bus(5) and addr_bus(4);
	iocs16 <= not cs;
		
	-- fetch data chip select 0x114-0x117
	cs_datai(0) 	<= cs and not addr_bus(3) and addr_bus(2) and
				not addr_bus(1) and not addr_bus(0);
	cs_datai(1) 	<= cs and not addr_bus(3) and addr_bus(2) and 
				not addr_bus(1) and addr_bus(0);
	cs_datai(2) 	<= cs and not addr_bus(3) and addr_bus(2) and
				addr_bus(1) and not addr_bus(0);
	cs_datai(3) 	<= cs and not addr_bus(3) and addr_bus(2) and
				addr_bus(1) and addr_bus(0);
				
	-- fetch key chip select 0x118 - 0x11b
	cs_key(0) 	<= cs and addr_bus(3) and not addr_bus(2) and
				not addr_bus(1) and not addr_bus(0);
	cs_key(1)	<= cs and addr_bus(3) and not addr_bus(2) and 
				not addr_bus(1) and addr_bus(0);
	cs_key(2)	<= cs and addr_bus(3) and not addr_bus(2) and 
				addr_bus(1) and not addr_bus(0);
	cs_key(3)	<= cs and addr_bus(3) and not addr_bus(2) and
				addr_bus(1) and addr_bus(0);

	-- out crypted data chip select 0x11c - 0x11f
	cs_datao(0)	<= cs and addr_bus(3) and addr_bus(2) and
				not addr_bus(1) and not addr_bus(0);
	cs_datao(1)	<= cs and addr_bus(3) and addr_bus(2) and
				not addr_bus(1) and addr_bus(0);
	cs_datao(2)	<= cs and addr_bus(3) and  addr_bus(2) and
				addr_bus(1) and not addr_bus(0);
	cs_datao(3)	<= cs and addr_bus(3) and addr_bus(2) and
				addr_bus(1) and addr_bus(0);

DES_CORE:des_small port map(des_clk, des_reset, en_decrypt, key_to_des, data_to_des, data_to_des_valid, running_des, data_from_des, data_from_des_valid);

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

get_data:process(clk, reset, cs ,iow)
begin
	if reset = '1' then 
	 data_from_bus_buf 	<="0000000000000000000000000000000000000000000000000000000000000000";
--	 data_to_des 	<="0000000000000000000000000000000000000000000000000000000000000000";
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
			data_bus(15 downto 0) <= data_from_des_buf(63 downto 48);
		elsif cs_datao(1) = '1' then
			data_bus(15 downto 0) <= data_from_des_buf(47 downto 32);
		elsif cs_datao(2) = '1' then
			data_bus(15 downto 0) <= data_from_des_buf(31 downto 16);
		elsif cs_datao(3) = '1' then
			data_bus(15 downto 0) <= data_from_des_buf(15 downto 0);
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
	 data_to_des 	<="0000000000000000000000000000000000000000000000000000000000000000";
	 key_to_des    	<="00000000000000000000000000000000000000000000000000000000";
	 data_to_des_valid <='0';

	elsif fetched'event and fetched='1' then
		data_to_des <= data_from_bus_buf;
		key_to_des <= key_from_bus_buf;
		data_to_des_valid <= '1';
--		running_des <= '1';
	elsif clk'event and clk = '0' then
		if data_to_des_valid_latched = '1' then
			data_to_des_valid <= '0';
			data_to_des_valid_latched <= '0';
		elsif data_to_des_valid = '1' then
			data_to_des_valid_latched <= '1';
		end if;
	end if;
end process; --begin_crypt()


-- handle crypto completed
-- handle interrupt ack
-- fetch data and 
--end_crypt:process(data_from_des_valid, irq_ack)
--end_crypt:process(clk, data_from_des_valid)
end_crypt:process(clk)
begin
	if data_from_des_valid = '1' and clk'event then
--		crypted_data <= data_from_des;
		data_from_des_buf <= data_from_des;
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
