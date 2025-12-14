--ใครที่เคยอยู่ห้อง....บ้าง
create procedure HisRoom(ref2room int)
	define ref2admit,ref2pat,thecode,thehn int;
	define thefrom,theto datetime year to minute;
	define theset collection;
	define thename,thesurname char(50);

	drop table hisroom;
	create table hisroom(hn int,name char(50),surname char(50),admit_code int,from datetime year to minute,to datetime year to minute);
	
	foreach cursor1 for
		select rowid,ad_code,in_time,out_time into ref2admit,thecode,thefrom,theto from admission where room=ref2room
		call A2P(ref2admit) returning ref2pat;
		select hn,name into thehn,theset from patience where rowid=ref2pat;
		call TheCharCurrent(theset) returning thename;
		select surname into theset from patience where rowid=ref2pat;
		call TheCharCurrent(theset) returning thesurname;
		insert into hisroom values(thehn,thename,thesurname,thecode,thefrom,theto);
	end foreach;
end procedure;

--execute procedure HisRoom(257);
--select rowid,* from hisroom	

--select rowid,* from admission;
--select rowid,* from patience
--delete from admission where rowid=274
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--ใครที่เคยอยู่ห้อง....ณเวลาเดียวกัน บ้าง
create procedure MatchRoom(ref2room int)
	define thecode1,thecode2,thehn1,thehn2 int;
	define thename1,thename2,thesurname1,thesurname2 char(50);
	define thefrom1,thefrom2,theto1,theto2,thefrom,theto datetime year to minute;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;
	
	drop table matchRoom;
	create table matchRoom(hn1 int,name1 char(50),surname1 char(50),an1 int,hn2 int,name2 char(50),surname2 char(50),an2 int,from datetime year to minute,to datetime year to minute);
	execute procedure HisRoom(ref2room);
	foreach cursor1 for
		select admit_code,from,to into thecode1,thefrom1,theto1 from hisroom
		if theto1 is null then let theto1=now; end if;
		foreach cursor2 for
			select admit_code,from,to into thecode2,thefrom2,theto2 from hisroom
			if theto2 is null then let theto2=now; end if;
			if (theto1>thefrom2 and theto2>thefrom1 and thecode1<thecode2) then
				 if (thefrom1<thefrom2) then
					let thefrom=thefrom2;
				else	
					let thefrom=thefrom1;
				end if;
				
				if (theto1<theto2) then
					let theto=theto1;
				else	
					let theto=theto2;
				end if;
				
				select hn,name,surname into thehn1,thename1,thesurname1 from hisroom where admit_code=thecode1;
				select hn,name,surname into thehn2,thename2,thesurname2 from hisroom where admit_code=thecode2;
				insert into matchRoom values(thehn1,thename1,thesurname1,thecode1,thehn2,thename2,thesurname2,thecode2,thefrom,theto);
			end if;
		end foreach;
	end foreach;
	
end procedure;

--execute procedure MatchRoom(257);
--select rowid,* from matchRoom;
-------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT NAME,FROM,TO OUTPUT ROWID					คำถาม แบบseq
create procedure NFT2ROWID(thename char(50),from datetime year to minute,to datetime year to minute)
	define therowid,thehn int;
	define theset1,theset2 collection;
	define therow1,therow2 row_char;
	define thefrom,theto,thefrom2,theto2 datetime year to minute;
	
	drop table result;
	create table result(hn int,name char(50),surname char(50),from datetime year to minute,to datetime year to minute);
	
	foreach cursor1 for
		select rowid,name,surname into therowid,theset1,theset2 from patience
		foreach cursor2 for
			select * into therow1 from table(theset1)
			if (therow1.char_at==thename and therow1.t_st<to and therow1.t_sp>from) then
				if therow1.t_st<from then
					let thefrom=from;
				else 	let thefrom=therow1.t_st;
				end if;
				if therow1.t_sp>to then
					let theto=to;
				else	let theto=therow1.t_sp;
				end if;
				foreach cursor3 for
					select * into therow2 from table(theset2)
					if (therow2.t_st<theto and therow2.t_sp>thefrom) then
						if therow2.t_st<thefrom then
							let thefrom2=thefrom;
						else 	let thefrom2=therow2.t_st;
						end if;
						if therow2.t_sp>theto then
							let theto2=theto;
						else	let theto2=therow2.t_sp;
						end if;
						select hn into thehn from patience where rowid=therowid;
						insert into result values(thehn,therow1.char_at,therow2.char_at,thefrom2,theto2);
					end if;
				end foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure NFT2ROWID('Lumjeak','2002-1-1 10:00','2003-1-1 10:00');
--select * from result;
------------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT SURNAME,FROM,TO OUTPUT ROWID					คำถาม แบบseq
create procedure SNFT2ROWID(thesurname char(50),from datetime year to minute,to datetime year to minute)
	define therowid,thehn int;
	define theset1,theset2 collection;
	define therow1,therow2 row_char;
	define thefrom,theto,thefrom2,theto2 datetime year to minute;
	
	drop table result;
	create table result(hn int,name char(50),surname char(50),from datetime year to minute,to datetime year to minute);
	
	foreach cursor1 for
		select rowid,name,surname into therowid,theset1,theset2 from patience
		foreach cursor2 for
			select * into therow2 from table(theset2)
			if (therow2.char_at==thesurname and therow2.t_st<to and therow2.t_sp>from) then
				if therow2.t_st<from then
					let thefrom=from;
				else 	let thefrom=therow2.t_st;
				end if;
				if therow2.t_sp>to then
					let theto=to;
				else	let theto=therow2.t_sp;
				end if;
				foreach cursor3 for
					select * into therow1 from table(theset1)
					if (therow1.t_st<theto and therow1.t_sp>thefrom) then
						if therow1.t_st<thefrom then
							let thefrom2=thefrom;
						else 	let thefrom2=therow1.t_st;
						end if;
						if therow1.t_sp>theto then
							let theto2=theto;
						else	let theto2=therow1.t_sp;
						end if;
						select hn into thehn from patience where rowid=therowid;
						insert into result values(thehn,therow1.char_at,therow2.char_at,thefrom2,theto2);
					end if;
				end foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure SNFT2ROWID('Rtype','2002-1-1 10:00','2003-1-1 10:00');
--select * from result;
-------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT NAME,SURNAME,FROM,TO OUTPUT ROWID					คำถาม แบบseq
create procedure NSFT2ROWID(thename char(50),thesurname char(50),from datetime year to minute,to datetime year to minute)
	define therowid,thehn int;
	define theset1,theset2 collection;
	define therow1,therow2 row_char;
	define thefrom,theto,thefrom2,theto2 datetime year to minute;
	
	drop table result;
	create table result(hn int,name char(50),surname char(50),from datetime year to minute,to datetime year to minute);
	
	foreach cursor1 for
		select rowid,name,surname into therowid,theset1,theset2 from patience
		foreach cursor2 for
			select * into therow1 from table(theset1)
			if (therow1.char_at==thename and therow1.t_st<to and therow1.t_sp>from) then
				if therow1.t_st<from then
					let thefrom=from;
				else 	let thefrom=therow1.t_st;
				end if;
				if therow1.t_sp>to then
					let theto=to;
				else	let theto=therow1.t_sp;
				end if;
				foreach cursor3 for
					select * into therow2 from table(theset2)
					if (therow2.t_st<theto and therow2.t_sp>thefrom and therow2.char_at==thesurname) then
						if therow2.t_st<thefrom then
							let thefrom2=thefrom;
						else 	let thefrom2=therow2.t_st;
						end if;
						if therow2.t_sp>theto then
							let theto2=theto;
						else	let theto2=therow2.t_sp;
						end if;
						select hn into thehn from patience where rowid=therowid;
						insert into result values(thehn,therow1.char_at,therow2.char_at,thefrom2,theto2);
					end if;
				end foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure NSFT2ROWID('Lumjeak','Somdee','2002-1-1 10:00','2003-1-1 10:00');
--select * from result;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--ใครที่เคยอยู่ห้องเดียวกับคนไข้(rowid) ณเวลาเดียวกัน บ้าง
create procedure UsedtoSleepwith(ref2pat int)
	define thehn,thehn1,thehn2,thean1,thean2,theroom,theint int;
	define thename1,thename2,thesurname2,thesurname1 char(50);
	define therow1 row_int;
	define theset1 collection;
	define thefrom,theto datetime year to minute;

	drop table distinctroom;
	drop table roomlist;
	drop table usedtosleep;
	create table usedtosleep(room int,hn1 int,name1 char(50),surname1 char(50),an1 int,hn2 int,name2 char(50),surname2 char(50),an2 int,from datetime year to minute,to datetime year to minute);
	create table roomlist(room int);
	create table distinctroom(room int);

	select hn,admission into thehn,theset1 from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow1 from table(theset1)
		select room into theroom from admission where rowid=therow1.int_at;
		insert into roomlist values(theroom);
	end foreach;
	insert into distinctroom select distinct(room) from roomlist;
	foreach cursor2 for
		select room into theroom from distinctroom
		execute procedure MatchRoom(theroom);
		foreach cursor3 for
			select * into thehn1,thename1,thesurname1,thean1,thehn2,thename2,thesurname2,thean2,thefrom,theto from matchroom
			if (thehn1==thehn or thehn2==thehn) then
				select room_id into theint from room where rowid=theroom;
				insert into usedtosleep values(theint,thehn1,thename1,thesurname1,thean1,thehn2,thename2,thesurname2,thean2,thefrom,theto);
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure UsedtoSleepwith(257);
--select * from usedtosleep;

