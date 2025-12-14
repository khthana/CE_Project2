-- **********************************************************************
--  $RCSfile: xor_coreII.vhd,v $
--  $Revision: 2.1 $
--  last change by $Author: sirikhum $
--  at $Date: 2002/12/26 09:14:48 $
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

package xor_core_libII is
  component xor_coreII 
	port (	sys_clk	:in std_logic;
		sys_reset	:in std_logic;
		isa_aen	:in std_logic;
		cs_out	:out std_logic; 
		dir_out	:out std_logic;

		addr_bus	:in std_logic_vector(11 downto 0);
		data_bus	:inout std_logic_vector(15 downto 0);
		irq		:out std_logic :='1';
		ior		:in std_logic;
		iow		:in std_logic;
		iocs16		:out std_logic;
		iochrdy		:out std_logic
		);
  end component;

end xor_core_libII;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.xor_core_libII.all;

entity xor_coreII is 
	port (	sys_clk	:in std_logic;
		sys_reset	:in std_logic;
		isa_aen	:in std_logic;
		cs_out	:out std_logic := '1';
		dir_out	:out std_logic := '0';

-- FOR DEBUGGING PURPOSE ONLY !!!
		cs_key_3_out	:out std_logic := '0';
		cs_out_debug	:out std_logic := '0';
		iocs16_debug	:out std_logic := '0';
-----------------------------------------------------------

		addr_bus	:in std_logic_vector(11 downto 0);
		data_bus	:inout std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ"; 
		irq		:out std_logic :='0';
--		irq_ack		:in std_logic;
		ior		:in std_logic;
		iow		:in std_logic;
		iocs16		:out std_logic;
		iochrdy		:out std_logic := '1'
		);
end xor_coreII;

architecture arch_stub of xor_coreII is
	signal data_bus_buf		:std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ"; 
	signal data_from_bus_buf	:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
	signal data_to_bus_buf		:std_logic_vector(63 downto 0);
--	signal key_from_bus_buf		:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
	signal key_from_bus_buf		:std_logic_vector (63 downto 0); 
	signal fetched		:std_logic := '1'; -- fetch data&key completely
						   -- initialize with 1 to solve
						   -- data_to_xor_valid's issue
	signal cs		:std_logic := '0';
	signal csI		:std_logic := '0';
	signal csII		:std_logic := '0';
	signal irq_wait		:std_logic := '0';
	signal iirq		:std_logic := '0';
	signal isr_ack		:std_logic := '0'; -- our irq_ack-self_gen
	signal cs_datai		:std_logic_vector (3 downto 0) := "0000";
	signal cs_key		:std_logic_vector (3 downto 0) := "0000";
	signal cs_datao		:std_logic_vector (3 downto 0) := "0000";
--	signal en_decrypt	:std_logic := '1';
	
--	signal encrypt_flag		:std_logic;
--	signal decrypt_flag		:std_logic
--	signal fetchinf			:std_logic;

begin
------------------
-- DEBUGING !!! --
------------------
cs_key_3_out <= cs_key(3);
cs_out_debug <= not cs;
iocs16_debug <= not cs;


---------------------------
-- module chip select     -
---------------------------
-- comment this 'cause of 10-bits ioports-addr limit.
-- our ioport-range are 0x110-0x11f for din and key 
-- and 0x120-0x126 for dout.
-- the last added range 'cause of 16bit data tranfer use 2 address.
-- (which  will easier if we use even addresses)
--	cs := addr_bus(15) and not addr_bus(14) and not addr_bus(13) and
--		not addr_bus(12) and not addr_bus(11) and not addr_bus(10) and
	csI <=  (((not addr_bus(11) and  not addr_bus(10)) and  
		(not addr_bus(9) and addr_bus(8))) and 
		((not addr_bus(7) and not addr_bus(6)) and
		(not addr_bus(5) and addr_bus(4)))) and 
		(not iow and not isa_aen);
	csII <=  (((not addr_bus(11) and  not addr_bus(10)) and  
		(not addr_bus(9) and addr_bus(8))) and 
		((not addr_bus(7) and not addr_bus(6)) and
		(addr_bus(5) and not addr_bus(4)))) and 
		(not ior and not isa_aen);
	-- use aen to make sure that not DMA cycle
		
	-- fetch data chip select 0x110-0x116
	cs_datai(0) 	<= csI and (not addr_bus(3) and not addr_bus(2)) and
				not addr_bus(1);
	cs_datai(1) 	<= csI and (not addr_bus(3) and not addr_bus(2)) and 
				addr_bus(1); 
	cs_datai(2) 	<= csI and (not addr_bus(3) and addr_bus(2)) and
				not addr_bus(1);
	cs_datai(3) 	<= csI and (not addr_bus(3) and addr_bus(2)) and
				addr_bus(1);
				
	-- fetch key chip select 0x118 - 0x11e
	cs_key(0) 	<= csI and (addr_bus(3) and not addr_bus(2)) and
				not addr_bus(1);
	cs_key(1)	<= csI and (addr_bus(3) and not addr_bus(2)) and 
				addr_bus(1);
	cs_key(2)	<= csI and (addr_bus(3) and addr_bus(2)) and 
				not addr_bus(1);
	cs_key(3)	<= csI and (addr_bus(3) and addr_bus(2)) and
				addr_bus(1);

	-- out crypted data chip select 0x120 - 0x126
	cs_datao(0)	<= csII and (not addr_bus(3) and not addr_bus(2)) and
				not addr_bus(1); 
	cs_datao(1)	<= csII and (not addr_bus(3) and not addr_bus(2)) and
				addr_bus(1);
	cs_datao(2)	<= csII and (not addr_bus(3) and addr_bus(2)) and
				not addr_bus(1);
	cs_datao(3)	<= csII and (not addr_bus(3) and addr_bus(2)) and
				addr_bus(1);
	cs <= csI or csII;

	dir_out <= ((cs_datao(0) xor cs_datao(1)) xor (cs_datao(2) xor cs_datao(3)));
	cs_out <= not cs;

----------------------------
-- module 'CTL' signal out -
----------------------------
	iocs16 <= not cs;
        iochrdy	<= not cs;

---------------
-- module XOR -
---------------
	data_to_bus_buf <= (data_from_bus_buf XOR key_from_bus_buf);
--	data_to_bus_buf(63 downto 0) <= data_from_bus_buf(63 downto 0);
--	data_to_bus_buf(63 downto 0) <= key_from_bus_buf(63 downto 0);


-- 	data_to_bus_buf(63 downto 0) <= "0000000100100011010001010110011110001001101010111100110111101111"; 
-- 00000001 00100011  - 01000101 01100111 - 10001001 10101011 - 11001101 11101111"
-- 0x0123 4567 89ab cdef


-- 	data_to_bus_buf(63 downto 0) <= "0000111100000000000011111111111100001111111100001111000000000000"; 
-- 00001111 11110000  - 11110000 00000000 - 00001111 00000000 - 00001111 11111111
-- 0x0f00 0fff 0ff0 f000 

--	data_to_bus_buf(63 downto 0) <= "0000111111111111000011111111000011110000000000000000111100000000";
-- 00001111 11111111 - 00001111 11110000  - 11110000 00000000 - "00001111 00000000;
-- 0x0fff 0ff0 f000 0f00 

------------------------
-- module IRQ steering -
------------------------
	irq <= iirq;
	isr_ack <= (iirq and csII);

--irq1_steering:process(sys_clk)
--begin
--	wait until (sys_clk'event and sys_clk='0' ) or (sys_clk'event and sys_clk='1'); 
--			
--end process;

irq2_steering:process(sys_clk, cs_key(3), isr_ack)
begin
--	wait until ((sys_clk'event and sys_clk='0' ) or (sys_clk'event and sys_clk='1'));

--if ((sys_clk'event and sys_clk='0' ) or (sys_clk'event and sys_clk='1'))then
	if sys_clk'event then
--		iirq <= '1' when cs_key(3)='1'
--			else '0' when isr_ack='1'
--			else iirq;
		
		if (cs_key(3)='1') then
			iirq<='1';
		elsif (isr_ack='1') then
			iirq<='0';
		else iirq<=iirq;
		end if;
	end if;
			
end process;

-------------------------
-- module DATA steering -
-------------------------
	data_bus_buf(15 downto 0) <= data_bus(15 downto 0);
-- fetch din
fetching_din: process(sys_clk, cs_datai, data_bus_buf)
begin
	if (sys_clk'event and sys_clk = '0') then
		if (cs_datai(0) = '1') then
			data_from_bus_buf(63 downto 48) <= data_bus_buf(15 downto 0);
		elsif (cs_datai(1) = '1') then
			data_from_bus_buf(47 downto 32) <= data_bus_buf(15 downto 0);
		elsif (cs_datai(2) = '1') then
			data_from_bus_buf(31 downto 16) <= data_bus_buf(15 downto 0);
		elsif (cs_datai(3) = '1') then
			data_from_bus_buf(15 downto 0) <= data_bus_buf(15 downto 0);
		end if;
	end if;
end process;
--	data_from_bus_buf(63 downto 48) <= data_bus(15 downto 0) when (cs_datai(0)='1') else data_from_bus_buf(63 downto 48);
--	data_from_bus_buf(47 downto 32) <= data_bus(15 downto 0) when (cs_datai(1)='1') else data_from_bus_buf(47 downto 32);
--	data_from_bus_buf(31 downto 16) <= data_bus(15 downto 0) when (cs_datai(2)='1') else data_from_bus_buf(31 downto 16);
--	data_from_bus_buf(15 downto 0) <= data_bus(15 downto 0) when (cs_datai(3)='1') else data_from_bus_buf(15 downto 0);

-- fetch key(in)
fetching_key: process(sys_clk, cs_key, data_bus_buf)
begin
	if (sys_clk'event and sys_clk = '0' ) then
		if (cs_key(0) = '1') then
			key_from_bus_buf(63 downto 48) <= data_bus_buf(15 downto 0);
		elsif (cs_key(1) = '1') then
			key_from_bus_buf(47 downto 32) <= data_bus_buf(15 downto 0);
		elsif (cs_key(2) = '1') then
			key_from_bus_buf(31 downto 16) <= data_bus_buf(15 downto 0);
		elsif (cs_key(3) = '1') then
			key_from_bus_buf(15 downto 0) <= data_bus_buf(15 downto 0);
--0			en_decrypt <= data_bus_buf(8);
		end if;
	end if;
--	if (cs_key(0) = '1') then
--		key_from_bus_buf(55 downto 40) <= data_bus_buf;
--	elsif (cs_key(1) = '1') then
--		key_from_bus_buf(39 downto 24) <= data_bus_buf;
--	elsif (cs_key(2) = '1') then
--		key_from_bus_buf(23 downto 8) <= data_bus_buf;
--	elsif (cs_key(3) = '1') then
--		key_from_bus_buf(7 downto 0) <= data_bus_buf(7 downto 0);
--		en_decrypt <= data_bus_buf(8);
--	end if;
end process;
--	key_from_bus_buf(55 downto 40) <= data_bus(15 downto 0) when (cs_key(0)='1') else key_from_bus_buf(55 downto 40);
--	key_from_bus_buf(39 downto 24) <= data_bus(15 downto 0) when (cs_key(1)='1') else key_from_bus_buf(39 downto 24);
--	key_from_bus_buf(23 downto 8) <= data_bus(15 downto 0) when (cs_key(2)='1') else key_from_bus_buf(23 downto 8);
--	key_from_bus_buf(7 downto 0) <= data_bus(15 downto 8) when (cs_key(3)='1') else key_from_bus_buf(7 downto 0);

--	en_decrypt <= data_bus(7) when (cs_key(3)='1') else en_decrypt;

-- out cdata
out_datao: process(sys_clk, cs_datao(0), cs_datao(1), cs_datao(2), cs_datao(3), data_to_bus_buf)
begin
	if sys_clk'event and sys_clk='0' then 
		if (cs_datao(0) = '1') then
			data_bus(15 downto 0) <= data_to_bus_buf(63 downto 48);
		elsif (cs_datao(1) = '1') then
			data_bus(15 downto 0) <= data_to_bus_buf(47 downto 32);
		elsif (cs_datao(2) = '1') then
			data_bus(15 downto 0) <= data_to_bus_buf(31 downto 16);
		elsif (cs_datao(3) = '1') then
			data_bus(15 downto 0) <= data_to_bus_buf(15 downto 0);
		else 
			data_bus <= "ZZZZZZZZZZZZZZZZ";
		end if;
	end if;
end process;
-- this is using with testing purpose only
--	data_bus(15 downto 0) <= "0000000000000000" when (cs_datao(0)='1') 
-- 		else "1111111111111111" when (cs_datao(1)='1') 
--		else "0000111100001111" when (cs_datao(2)='1')
--		else "0011001101010101" when (cs_datao(3)='1');


--	data_bus(15 downto 0) <= data_to_bus_buf(63 downto 48) when (cs_datao(0)='1') 
-- 		else data_to_bus_buf(47 downto 32) when (cs_datao(1)='1') 
--		else data_to_bus_buf(31 downto 16) when (cs_datao(2)='1')
--		else data_to_bus_buf(15 downto 0) when (cs_datao(3)='1');
--		else data_bus(15 downto 0);  when (csI='1');
--		else "ZZZZZZZZZZZZZZZZ"; 


	

--DES_CORE:xor_crypt port map(xor_clk, xor_reset, en_decrypt, key_to_xor, data_to_xor, data_to_xor_valid, running_xor, data_from_xor, data_from_xor_valid);


-- get_data() load both data and key from 
-- It load datas every positive'edge of clock
--get_data:process(data_bus, clk, reset, cs_datai, cs_key, iow)
--get_data:process(sys_clk, sys_reset, cs, iow, ior)
--get_data:process(sys_clk, sys_reset)
--begin
--	if sys_reset = '1' then 
----	 dir_out	<= '0';
--	 data_bus(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";
--	 data_from_bus_buf 	<="0000000000000000000000000000000000000000000000000000000000000000";
----	 data_to_xor 	<="0000000000000000000000000000000000000000000000000000000000000000";
--	 key_from_bus_buf	<="00000000000000000000000000000000000000000000000000000000";
----	 ack      	<='0';
--	 fetched	<='1';
--	 en_decrypt	<='1';
----	 is_ok    	<='1';
--	elsif sys_clk'event then
--	 if cs = '1' then
--	   if iow = '0' then 	-- read data from BUS
--		-- start loading data
--		if  cs_datai(0) = '1' then
--		 	data_from_bus_buf(63 downto 48) <= data_bus(15 downto 0);
--			fetched <= '0';
--		elsif cs_datai(1)  = '1' then
--		 	data_from_bus_buf(47 downto 32) <= data_bus(15 downto 0);
--			fetched <= '0';
--		elsif cs_datai(2) = '1' then
-- 			data_from_bus_buf(31 downto 16) <= data_bus(15 downto 0);
--			fetched <= '0';
--		elsif cs_datai(3) = '1' then
--			data_from_bus_buf(15 downto 0) <= data_bus(15 downto 0);
--			fetched <= '0';
--			
--		-- start loading key
--		elsif cs_key(0) = '1' then
--	 		key_from_bus_buf(55 downto 40) <= data_bus(15 downto 0);
--			fetched <= '0';
-- 		elsif cs_key(1) = '1' then
--		  	key_from_bus_buf(39 downto 24) <= data_bus(15 downto 0);
--			fetched <= '0';
--		elsif cs_key(2) = '1' then
--		 	key_from_bus_buf(23 downto 8) <= data_bus(15 downto 0);
--			fetched <= '0';
--		elsif cs_key(3) = '1' then
--			key_from_bus_buf(7 downto 0) <= data_bus(15 downto 8);
--			-- en/de-crypt : 1=encrypt, 0=decrypt
--			en_decrypt <= data_bus(7);
--			fetched <= '1';	-- fetched was used as 'START_NOW'
--		end if;
--	   elsif ior='0' then -- write data to BUS
--		if cs_datao(0) = '1' then
--			data_bus(15 downto 0) <= data_to_bus_buf(63 downto 48);
--		elsif cs_datao(1) = '1' then
--			data_bus(15 downto 0) <= data_to_bus_buf(47 downto 32);
--		elsif cs_datao(2) = '1' then
--			data_bus(15 downto 0) <= data_to_bus_buf(31 downto 16);
--		elsif cs_datao(3) = '1' then
--			data_bus(15 downto 0) <= data_to_bus_buf(15 downto 0);
--		end if;
--	   end if;
--	 end if;
--	elsif ior = '1' and iow='1' then
--		data_bus(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";
--	end if;
--
----	iochrdy<='1'; -- ok fetch completed
--end process;


-- handle crypto completed
-- handle interrupt ack
-- fetch data and 
--end_crypt:process(data_from_xor_valid, irq_ack)
--end_crypt:process(clk, data_from_xor_valid)

--end_crypt:process(sys_reset, sys_clk, fetched)
--begin
--	if sys_reset = '1' then
--		irq <= '0';
--		irq_wait <= '0';
--	elsif sys_clk'event and sys_clk='1' then
--		if fetched = '1' then
--			irq_wait <= '1';
--		elsif irq_wait <= '1' then
--			irq <= '1'; 
--			irq_wait <= '0';
--		elsif isr_ack = '1' then
--			irq <= '0';
--		end if;
--	end if;
--end process; -- end_crypt()


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
