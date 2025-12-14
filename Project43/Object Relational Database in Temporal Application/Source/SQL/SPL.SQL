--UPDATE DIAGNOSIS TO PATIENCE
create procedure UD2P(ref2dia int,ref2patience int)
	define theset collection;
	define therow row_int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;

	select diagnosis into theset from patience where rowid=ref2patience;
	let now=current;
	foreach cursor1 for
		select * into therow from table(theset)
		if therow.t_sp==forever then
			let therow.t_sp=now;
			update table(theset)(x) set x=therow where current of cursor1;
			let therow=cast(row(ref2dia,now,forever) as row_int);
			exit foreach;
		end if;
	end foreach;
	insert into table(theset) values(therow);
	update patience set diagnosis=theset where rowid=ref2patience;
end procedure;

--execute procedure UD2P(258,16385);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--หาrowidคนไข้ที่เป็นเจ้าของการวินิจฉัยครั้งนั้น		
create function D2P(ref2dia int)
	returning int;
	define therowid int;
	define theset collection;
	define therow row_int;
	foreach cursor1 for
		select rowid,diagnosis into therowid,theset from patience
		foreach cursor2 for	
			select * into therow from table(theset)
			if therow.int_at==ref2dia then
				return therowid;		--return therowid
				exit foreach;
			end if;
		end foreach;
	end foreach;
end function;

--execute function D2P(258);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--insert รูปลงตาราง photo แล้วหา rowid ของรูปที่เพิ่งเอาลงเพื่อใช้เป็นตัวอ้างถึงรูปนั้น
create function newrowidPhoto()
	returning int;
	define therowid int;
	define x int;
	select max(photo_id) into x from photo;
	select rowid into therowid from photo where photo_id=x;
	return therowid;
end function;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SET TO TABLE BY POINT OF TIME FOR DISEASE TABLE
create procedure set2table_disease(time datetime year to minute)
	define therow row_char;	
	define theset collection;
	define therowid int;
	define thecode int;
	
	drop table result_rowchar;
	create table result_rowchar(therowid int,code int,name char(30), t_st datetime year to minute, t_sp datetime year to minute);

	foreach cursor1 for
 		select rowid,dis_code,general_name into therowid,thecode,theset from disease
		foreach cursor2 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st<time) then 
				insert into result_rowchar values(therowid,thecode,therow.char_at ,therow.t_st, therow.t_sp) ;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure set2table_disease('9999-12-31 23:59');
--select rowid,* from result_rowchar;
--select rowid,* from disease
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SET TO TABLE BY POINT OF TIME FOR DOCTOR TABLE
create procedure set2table_doctor(time datetime year to minute)
	define therow row_char;	
	define theset collection;
	define therowid int;
	define thedoc_code int;
	
	drop table result_rowchar;
	create table result_rowchar(therowid int,thecode int,name char(30), t_st datetime year to minute, t_sp datetime year to minute);

	foreach cursor1 for
 		select rowid,doc_code,name into therowid,thedoc_code,theset from doctor
		foreach cursor2 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st<time) then 
				insert into result_rowchar values(therowid,thedoc_code,therow.char_at ,therow.t_st, therow.t_sp) ;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure set2table_doctor('9999-12-31 23:59');
--select rowid,* from result_rowchar;
--select rowid,* from doctor
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SET TO TABLE FOR ALL LAB TABLE
create procedure set2table_lab()
	define therowid int;
	define thecode int;
	define thename char(40);
	define thetype char;
	
	drop table lab_list;
	create table lab_list(therowid int,code int,name char(40),type char);
	
	foreach cursor1 for
		select rowid,lab_code,name into therowid,thecode,thename from lab_number
		let thetype='n';
		insert into lab_list values(therowid,thecode,thename,thetype);
	end foreach;

	foreach cursor1 for
		select rowid,lab_code,name into therowid,thecode,thename from lab_char
		let thetype='c';
		insert into lab_list values(therowid,thecode,thename,thetype);
	end foreach;

	foreach cursor1 for
		select rowid,lab_code,name into therowid,thecode,thename from lab_photo
		let thetype='p';
		insert into lab_list values(therowid,thecode,thename,thetype);
	end foreach;
end procedure;

--execute procedure set2table_lab();
--select rowid,* from lab_list
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FUNCTION FIND ROWID FOR ADMISSION FROM AD_DIAGNOSIS
create function newrowid_ad_dia()
	returning int;
	define therowid int;
	select rowid into therowid from ad_diagnosis where ad_diagnosis_code=(select max(ad_diagnosis_code) from ad_diagnosis);
	return therowid;
end function;

--execute function newrowid_ad_dia()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--UPDATE TO AD_DIAGNOSIS			
create procedure update_ad_dia(ref2admit int,tem int,pul int,rep int,bl int,bh int,np blob,dia blob)
	define theset collection;
	define therowid int;
	define ref2photo int;

	select rowid into therowid from ad_diagnosis where rowid=(select ad_diagnosis from admission where rowid=ref2admit);
	if (tem is not null) then
		select temperature into theset from ad_diagnosis where rowid=therowid;
		call updateinttoset(theset,tem) returning theset;
		update ad_diagnosis set temperature=theset where rowid=therowid;
	end if;
	
	if (pul is not null) then
		select pulse into theset from ad_diagnosis where rowid=therowid;
		call updateinttoset(theset,pul) returning theset;
		update ad_diagnosis set pulse=theset where rowid=therowid;
	end if;
	
	if (rep is not null) then
		select repisitory into theset from ad_diagnosis where rowid=therowid;
		call updateinttoset(theset,rep) returning theset;
		update ad_diagnosis set repisitory=theset where rowid=therowid;
	end if;

	if (bl is not null) then
		select blood_pressure_l into theset from ad_diagnosis where rowid=therowid;
		call updateinttoset(theset,bl) returning theset;
		update ad_diagnosis set blood_pressure_l=theset where rowid=therowid;
	end if;

	if (bh is not null) then
		select blood_pressure_h into theset from ad_diagnosis where rowid=therowid;
		call updateinttoset(theset,bh) returning theset;
		update ad_diagnosis set blood_pressure_h=theset where rowid=therowid;
	end if;

	if (np is not null) then
		insert into photo values(0,np);
		call newrowidPhoto() returning ref2photo;
		select nursing_plan into theset from ad_diagnosis where rowid=therowid;
		call updateinttoset(theset,ref2photo) returning theset;
		update ad_diagnosis set nursing_plan=theset where rowid=therowid;
	end if;

	if (dia is not null) then
		insert into photo values(0,dia);
		call newrowidPhoto() returning ref2photo;
		select diagnosis_record into theset from ad_diagnosis where rowid=therowid;
		call updateinttoset(theset,ref2photo) returning theset;
		update ad_diagnosis set diagnosis_record=theset where rowid=therowid;
	end if;
end procedure;

--execute procedure update_ad_dia(257,null,1,10,5,2,filetoblob('c:\pic4hospital\empty.jpg','client'),filetoblob('c:\pic4hospital\empty.jpg','client'));
--execute procedure update_ad_dia(257,10,null,null,null,null,null,null);
--select rowid,* from ad_diagnosis;
--select * from admission
--delete from ad_diagnosis
----------------------------------------------------------------------------------------------------------------------------------------------------------
--FUNCTION FOR TEMPORAL UPDATE INTO SET BY ADD NEW ELEMENT INTO SET (TYPE INT)
create function updateinttoset(theset collection,theint int)
	returning collection;
	define therow row_int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	foreach cursor1 for
		select * into therow from table(theset)
		if therow.t_sp==forever then
			let therow.t_sp=now;
			update table(theset)(a) set a=therow where current of cursor1;
			let therow=cast(row(theint,now,forever) as row_int);
			exit foreach;
		end if;
	end foreach;
	insert into table(theset) values(therow);
	return theset;
end function;
----------------------------------------------------------------------------------------------------------------------------------------------------------
--UPDATE NUMBER OF MEDICINE TO MOP FROM DIAGNOSIS		
create procedure UMOPD(ref2dia int,ref2med int,meds int)
	define ref2pat int;
	define theset collection;
	define therow row_int;
	define therowid int;	

	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	call D2P(ref2dia) returning ref2pat;

	if not exists(select rowid from MOP where patience=ref2pat and medicine=ref2med) then	
		insert into MOP values(ref2pat,ref2med,"set{row(999,9999-12-31 23:59,9999-12-31 23:59)}");
		select rowid,quantity into therowid,theset from MOP where patience=ref2pat and medicine=ref2med;
		let therow=cast(row(meds,now,forever) as row_int);
		update table(theset)(x) set x=therow;
		update MOP set quantity=theset where rowid=therowid;
	else
		select rowid,quantity into therowid,theset from MOP where patience=ref2pat and medicine=ref2med;
		foreach cursor2 for
			select * into therow from table(theset)
			if therow.t_sp==forever then
				let therow.t_sp=now;
				update table(theset)(x) set x=therow where current of cursor2;
				let therow=cast(row(meds,now,forever) as row_int);
				exit foreach;
			end if;
		end foreach;

		insert into table(theset) values(therow);
		update MOP set quantity=theset where rowid=therowid;		
	end if;
end procedure;

--execute procedure UMOPD(258,400,100);
--select rowid,* from mop
----------------------------------------------------------------------------------------------------------------------------------------------------------
--ALLOCATE INTO LAB RESULT FROM ADMISSION	
--NUMBER TYPE
create procedure allocate_LRNA(ref2admit int,ref2lab int)
	define therow row_int;
	define theset collection;
	define therowid int;
	define nothing int;
	define trig boolean;
	

	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;
	let nothing=null;
	let trig='f';

	if not exists(select rowid from LRNA where admission=ref2admit and lab=ref2lab) then
		insert into LRNA values(ref2admit,ref2lab,"set{row(999,9999-12-31 23:59,9999-12-31 23:59)}");
		select rowid,lab_result into therowid,theset from LRNA where admission=ref2admit and lab=ref2lab;
		let therow=cast(row(nothing,now,forever) as row_int);
		update table(theset)(x) set x=therow;
		update LRNA set lab_result=theset where rowid=therowid;
	else	
		select rowid,lab_result into therowid,theset from LRNA where admission=ref2admit and lab=ref2lab;
		foreach cursor2 for
			select * into therow from table(theset)
			if (therow.t_sp==forever and therow.int_at is not null) then
				let therow.t_sp=now;
				update table(theset)(x) set x=therow where current of cursor2;
				let therow=cast(row(nothing,now,forever) as row_int);
				exit foreach;
			elif (therow.t_sp==forever and therow.int_at is null) then
				let trig='t';
				exit foreach;
			end if;
		end foreach;
		if not(trig) then
			insert into table(theset) values(therow);
			update LRNA set lab_result=theset where rowid=therowid;
		end if;
	end if;
end procedure;

--execute procedure allocate_LRNA(258,258);
--select rowid,* from LRNA
--delete from LRNA
--insert into LRNA values (258,258,"set{row(5,1998-4-7 10:00,9999-12-31 23:59),row(5,1900-5-5 10:00,1998-4-7 10:00)}");
----------------------------------------------------------------------------------------------------------------------------------------------------------
--CHAR TYPE
create procedure allocate_LRCA(ref2admit int,ref2lab int)
	define therow row_char;
	define theset collection;
	define therowid int;
	define nothing char(50);
	define trig boolean;
	
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;
	let nothing=null;
	let trig='f';

	if not exists(select rowid from LRCA where admission=ref2admit and lab=ref2lab) then
		insert into LRCA values(ref2admit,ref2lab,"set{row('XXX',9999-12-31 23:59,9999-12-31 23:59)}");
		select rowid,lab_result into therowid,theset from LRCA where admission=ref2admit and lab=ref2lab;
		let therow=cast(row(nothing,now,forever) as row_char);
		update table(theset)(x) set x=therow;
		update LRCA set lab_result=theset where rowid=therowid;
	else	
		select rowid,lab_result into therowid,theset from LRCA where admission=ref2admit and lab=ref2lab;
		foreach cursor2 for
			select * into therow from table(theset)
			if (therow.t_sp==forever and therow.char_at is not null) then
				let therow.t_sp=now;
				update table(theset)(x) set x=therow where current of cursor2;
				let therow=cast(row(nothing,now,forever) as row_char);
				exit foreach;
			elif (therow.t_sp==forever and therow.char_at is null) then
				let trig='t';
				exit foreach;
			end if;
		end foreach;
		if not(trig) then
			insert into table(theset) values(therow);
			update LRCA set lab_result=theset where rowid=therowid;
		end if;
	end if;
end procedure;

--execute procedure allocate_LRCA(258,258);
--select rowid,* from LRCA
--delete from LRCA
--insert into LRCA values (258,258,"set{row('aaa',1900-5-5 10:00,1998-4-7 10:00),row('aaaaaaa',1998-4-7 10:00,9999-12-31 23:59)}");
----------------------------------------------------------------------------------------------------------------------------------------------------------
--PHOTO TYPE
create procedure allocate_LRPA(ref2admit int,ref2lab int)
	define therow row_int;
	define theset collection;
	define therowid int;
	define nothing int;
	define trig boolean;
	
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;
	let nothing=null;
	let trig='f';

	if not exists(select rowid from LRPA where admission=ref2admit and lab=ref2lab) then
		insert into LRPA values(ref2admit,ref2lab,"set{row(999,9999-12-31 23:59,9999-12-31 23:59)}");
		select rowid,lab_result into therowid,theset from LRPA where admission=ref2admit and lab=ref2lab;
		let therow=cast(row(nothing,now,forever) as row_int);
		update table(theset)(x) set x=therow;
		update LRPA set lab_result=theset where rowid=therowid;
	else	
		select rowid,lab_result into therowid,theset from LRPA where admission=ref2admit and lab=ref2lab;
		foreach cursor2 for
			select * into therow from table(theset)
			if (therow.t_sp==forever and therow.int_at is not null) then
				let therow.t_sp=now;
				update table(theset)(x) set x=therow where current of cursor2;
				let therow=cast(row(nothing,now,forever) as row_int);
				exit foreach;
			elif (therow.t_sp==forever and therow.int_at is null) then
				let trig='t';
				exit foreach;
			end if;
		end foreach;
		if not(trig) then
			insert into table(theset) values(therow);
			update LRPA set lab_result=theset where rowid=therowid;
		end if;
	end if;
end procedure;

--execute procedure allocate_LRPA(258,257);
--select rowid,* from LRPA
--delete from LRPA
--insert into LRPA values (258,259,"set{row(5,1900-5-5 10:00,1998-4-7 10:00),row(10,1998-4-7 10:00,9999-12-31 23:59)}");
----------------------------------------------------------------------------------------------------------------------------------------------------------
--NULL LAB TO TABLE FROM ADMISSION 		
create procedure null_LRA2table(ref2admit int)
	define arowid int;
	define theset collection;
	define therow row_int;
	define therow_char row_char;
	define thecode int;
	define thename char(40);
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	drop table lab_list;
	create table lab_list(therowid int,code int,name char(40),type char);

	foreach cursor1 for
		select rowid,lab_result into arowid,theset from LRNA where admission=ref2admit
		foreach cursor12 for
			select * into therow from table(theset)
			if (therow.t_sp==forever and therow.int_at is null) then
				select name,rowid into thename,thecode from lab_number where rowid=(select lab from LRNA where rowid=arowid);
				insert into lab_list values(arowid,thecode,thename,'n');
			end if;
		end foreach;
	end foreach;

	foreach cursor2 for
		select rowid,lab_result into arowid,theset from LRPA where admission=ref2admit
		foreach cursor22 for
			select * into therow from table(theset)
			if (therow.t_sp==forever and therow.int_at is null) then
				select name,rowid into thename,thecode from lab_photo where rowid=(select lab from LRPA where rowid=arowid);
				insert into lab_list values(arowid,thecode,thename,'p');
			end if;
		end foreach;
	end foreach;	

	foreach cursor3 for
		select rowid,lab_result into arowid,theset from LRCA where admission=ref2admit
		foreach cursor32 for
			select * into therow_char from table(theset)
			if (therow_char.t_sp==forever and therow_char.char_at is null) then
				select name,rowid into thename,thecode from lab_char where rowid=(select lab from LRCA where rowid=arowid);
				insert into lab_list values(arowid,thecode,thename,'c');
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure null_LRA2table(258);
----------------------------------------------------------------------------------------------------------------------------------------------------------
--UPDATE ADMISSION TO PATIENCE			
create procedure UA2P(ref2admit int,ref2patience int)
	define theset collection;
	define therow row_int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;

	select admission into theset from patience where rowid=ref2patience;
	let now=current;
	foreach cursor1 for
		select * into therow from table(theset)
		if therow.t_sp==forever then
			let therow.t_sp=now;
			update table(theset)(x) set x=therow where current of cursor1;
			let therow=cast(row(ref2admit,now,forever) as row_int);
			exit foreach;
		end if;
	end foreach;
	insert into table(theset) values(therow);
	update patience set admission=theset where rowid=ref2patience;
end procedure;

--execute procedure UA2P(258,16385);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--หาrowidคนไข้ที่เป็นเจ้าของการadmit ครั้งนั้น		
create function A2P(ref2admit int)
	returning int;
	define therowid int;
	define theset collection;
	define therow row_int;
	foreach cursor1 for
		select rowid,admission into therowid,theset from patience
		foreach cursor2 for	
			select * into therow from table(theset)
			if therow.int_at==ref2admit then
				return therowid;		--return therowid
				exit foreach;
			end if;
		end foreach;
	end foreach;
end function;

--execute function A2P(257);
--------------------------------------------------------------------------------------------------------------------------------------------
--หาrowid การ admit ที่มีค่า valid อยู่ ณ จุดเวลาที่กำหนด
create function P2A(ref2patience int, time datetime year to minute)
	returning int;
	define theset collection;
	define therow row_int;
		select admission into theset from patience where rowid = ref2patience;
		foreach cursor2 for	
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st < time) then
				return therow.int_at;			--return therow.int_at
				exit foreach;
			end if;
		end foreach;
end function;

--select rowid,* from patience
--execute function P2A(16385,'9999-12-31 23:59');
--------------------------------------------------------------------------------------------------------------------------------------------
--TEMPORAL UPDATE IN LAB RESULT WITH PATIENCE 		
--FOR NUMBER TYPE
create procedure ULRP(ref2dia int,ref2lab int,LR int,type char)
	define ref2pat int;
	define therowid int;
	define therow row_int;
	define theset collection;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;
	
	if type=='d' then
		call D2P(ref2dia) returning ref2pat;
	elif type=='a' then
		call A2P(ref2dia) returning ref2pat;
	end if;

	if not exists(select rowid from LRNP where patience=ref2pat and lab=ref2lab) then	
		insert into LRNP values(ref2pat,ref2lab,"set{row(999,9999-12-31 23:59,9999-12-31 23:59)}");
		select rowid,lab_result into therowid,theset from LRNP where patience=ref2pat and lab=ref2lab;
		let therow=cast(row(LR,now,forever) as row_int);
		update table(theset)(x) set x=therow;
		update LRNP set lab_result=theset where rowid=therowid;
	else
		select rowid,lab_result into therowid,theset from LRNP where patience=ref2pat and lab=ref2lab;
		foreach cursor2 for
			select * into therow from table(theset)
			if therow.t_sp==forever then
				let therow.t_sp=now;
				update table(theset)(x) set x=therow where current of cursor2;
				let therow=cast(row(LR,now,forever) as row_int);
				exit foreach;
			end if;
		end foreach;

		insert into table(theset) values(therow);
		update LRNP set lab_result=theset where rowid=therowid;		
	end if;
end procedure;

--execute procedure ULRP(258,12,12,'d');
--select * from LRNP
--select rowid,* from patience
--delete from LRNP
---------------------------------------------------------------------------------------------------------------------------
--FOR CHAR TYPE
create procedure ULRP(ref2dia int,ref2lab int,LR char(50),type char)
	define ref2pat int;
	define therowid int;
	define therow row_char;
	define theset collection;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	if type=='d' then
		call D2P(ref2dia) returning ref2pat;
	elif type=='a' then
		call A2P(ref2dia) returning ref2pat;
	end if;

	if not exists(select rowid from LRCP where patience=ref2pat and lab=ref2lab) then	
		insert into LRCP values(ref2pat,ref2lab,"set{row('XXX',9999-12-31 23:59,9999-12-31 23:59)}");
		select rowid,lab_result into therowid,theset from LRCP where patience=ref2pat and lab=ref2lab;
		let therow=cast(row(LR,now,forever) as row_char);
		update table(theset)(x) set x=therow;
		update LRCP set lab_result=theset where rowid=therowid;
	else
		select rowid,lab_result into therowid,theset from LRCP where patience=ref2pat and lab=ref2lab;
		foreach cursor2 for
			select * into therow from table(theset)
			if therow.t_sp==forever then
				let therow.t_sp=now;
				update table(theset)(x) set x=therow where current of cursor2;
				let therow=cast(row(LR,now,forever) as row_char);
				exit foreach;
			end if;
		end foreach;

		insert into table(theset) values(therow);
		update LRCP set lab_result=theset where rowid=therowid;		
	end if;
end procedure;

--execute procedure ULRP(259,12,'o','a');
--select * from LRCP;
--delete from LRCP;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FOR PHOTO TYPE
create procedure ULRP(ref2dia int,ref2lab int,ref2photo int,type char,p char)
	define ref2pat int;
	define therow row_int;
	define theset collection;
	define therowid int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	if type=='d' then
		call D2P(ref2dia) returning ref2pat;
	elif type=='a' then
		call A2P(ref2dia) returning ref2pat;
	end if;

	if not exists(select rowid from LRPP where patience=ref2pat and lab=ref2lab) then	
		insert into LRPP values(ref2pat,ref2lab,"set{row(999,9999-12-31 23:59,9999-12-31 23:59)}");
		select rowid,lab_result into therowid,theset from LRPP where patience=ref2pat and lab=ref2lab;
		let therow=cast(row(ref2photo,now,forever) as row_int);
		update table(theset)(x) set x=therow;
		update LRPP set lab_result=theset where rowid=therowid;
	else
		select rowid,lab_result into therowid,theset from LRPP where patience=ref2pat and lab=ref2lab;
		foreach cursor2 for
			select * into therow from table(theset)
			if therow.t_sp==forever then
				let therow.t_sp=now;
				update table(theset)(x) set x=therow where current of cursor2;
				let therow=cast(row(ref2photo,now,forever) as row_int);
				exit foreach;
			end if;
		end foreach;

		insert into table(theset) values(therow);
		update LRPP set lab_result=theset where rowid=therowid;		
	end if;
end procedure;

--execute procedure ULRP(259,5,257,'a');
--select * from LRPP
--select rowid,* from photo
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TEMPORAL UPDATE IN LAB RESULT WITH ADMISSION 
--NUMBER TYPE
create procedure ULRNA (ref2lrna int,result int)
	define theset collection;
	define therow row_int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;
	
	select lab_result into theset from LRNA where rowid=ref2lrna;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp==forever and therow.int_at is null) then
			let therow.t_sp=forever;
			let therow.t_st=now;
			let therow.int_at=result;
			update table(theset)(x) set x=therow where current of cursor1;
			exit foreach;
		end if;
	end foreach;
	update LRNA set lab_result=theset where rowid=ref2lrna;
end procedure;

--execute procedure ULRNA(258,10);
--select rowid,* from LRNA
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PHOTO TYPE
create procedure ULRPA (ref2lrpa int,result int)
	define theset collection;
	define therow row_int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;
	
	select lab_result into theset from LRPA where rowid=ref2lrpa;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp==forever and therow.int_at is null) then
			let therow.t_sp=forever;
			let therow.t_st=now;
			let therow.int_at=result;
			update table(theset)(x) set x=therow where current of cursor1;
			exit foreach;
		end if;
	end foreach;
	update LRPA set lab_result=theset where rowid=ref2lrpa;
end procedure;

--execute procedure ULRPA(257,10);
--select rowid,* from LRPA
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--CHAR TYPE
create procedure ULRCA (ref2lrca int,result char(50))
	define theset collection;
	define therow row_char;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;
	
	select lab_result into theset from LRCA where rowid=ref2lrca;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp==forever and therow.char_at is null) then
			let therow.t_sp=forever;
			let therow.t_st=now;
			let therow.char_at=result;
			update table(theset)(x) set x=therow where current of cursor1;
			exit foreach;
		end if;
	end foreach;
	update LRCA set lab_result=theset where rowid=ref2lrca;
end procedure;

--execute procedure ULRCA(257,'a');
--select rowid,* from LRCA
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--UPDATE MEDICINE TO MOP AND MOA
create procedure UMOPA(ref2admit int,ref2med int,meds int)
	define ref2pat int;
	define therowid int;
	define theset collection;
	define therow row_int;

	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	call A2P(ref2admit) returning ref2pat;
--MOP
	if not exists(select rowid from MOP where patience=ref2pat and medicine=ref2med) then	
		insert into MOP values(ref2pat,ref2med,"set{row(999,9999-12-31 23:59,9999-12-31 23:59)}");
		select rowid,quantity into therowid,theset from MOP where patience=ref2pat and medicine=ref2med;
		let therow=cast(row(meds,now,forever) as row_int);
		update table(theset)(x) set x=therow;
		update MOP set quantity=theset where rowid=therowid;
	else
		select rowid,quantity into therowid,theset from MOP where patience=ref2pat and medicine=ref2med;
		call updateinttoset(theset,meds) returning theset;
		update MOP set quantity=theset where rowid=therowid;	
	end if;

--MOA
	if not exists(select rowid from MOA where admission=ref2admit and medicine=ref2med) then	
		insert into MOA values(ref2admit,ref2med,"set{row(999,9999-12-31 23:59,9999-12-31 23:59)}");
		select rowid,quantity into therowid,theset from MOA where admission=ref2admit and medicine=ref2med;
		let therow=cast(row(meds,now,forever) as row_int);
		update table(theset)(x) set x=therow;
		update MOA set quantity=theset where rowid=therowid;
	else
		select rowid,quantity into therowid,theset from MOA where admission=ref2admit and medicine=ref2med;
		call updateinttoset(theset,meds) returning theset;
		update MOA set quantity=theset where rowid=therowid;	
	end if;

end procedure;

--execute procedure UMOPA(259,510,1000);
--select * from MOA;
--select * from MOP;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--QUERY CURRENT PATIENCE NAME FROM HN
create procedure hn2current_name(thehn int)
	define therow row_char;
	define therowid int;
	define theset collection;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	drop table result_rowchar;
	create table result_rowchar(therowid int,code int,name char(40), t_st datetime year to minute, t_sp datetime year to minute);
	select rowid,name into therowid,theset from patience where hn=thehn;
	foreach cursor1 for
		select * into therow from table(theset)
		if therow.t_sp==forever then
			insert into result_rowchar values(therowid,thehn,therow.char_at,therow.t_st,therow.t_sp);
			exit foreach;
		end if;
	end foreach;
end procedure;

--execute procedure hn2current_name(160);
--select * from result_rowchar;
--select * from patience;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--QUERY CURRENT PATIENCE SURNAME FROM HN
create procedure hn2current_surname(thehn int)
	define therow row_char;
	define therowid int;
	define theset collection;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	drop table result_rowchar;
	create table result_rowchar(therowid int,code int,name char(40), t_st datetime year to minute, t_sp datetime year to minute);
	select rowid,surname into therowid,theset from patience where hn=thehn;
	foreach cursor1 for
		select * into therow from table(theset)
		if therow.t_sp==forever then
			insert into result_rowchar values(therowid,thehn,therow.char_at,therow.t_st,therow.t_sp);
			exit foreach;
		end if;
	end foreach;
end procedure;

--execute procedure hn2current_surname(161);
--select * from result_rowchar;
--select * from patience;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--QUERY CURRENT PATIENCE NAME ALL
create procedure current_pat_name(time datetime year to minute)
	define therowid int;
	define theset collection;
	define therow row_char;
	define thehn int;

	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	drop table result_rowchar;
	create table result_rowchar(therowid int,code int,name char(40), t_st datetime year to minute, t_sp datetime year to minute);
	foreach cursor2 for
		select rowid,hn,name into therowid,thehn,theset from patience
		foreach cursor1 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st < time) then
				insert into result_rowchar values(therowid,thehn,therow.char_at,therow.t_st,therow.t_sp);
				exit foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure current_pat_name('1700-9-9 23:59');
--select * from result_rowchar
--drop procedure current_pat_name()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--QUERY CURRENT PATIENCE SURNAME ALL
create procedure current_pat_sur(time datetime year to minute)
	define therowid int;
	define theset collection;
	define therow row_char;
	define thehn int;

	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	drop table result_rowchar;
	create table result_rowchar(therowid int,code int,name char(40), t_st datetime year to minute, t_sp datetime year to minute);
	foreach cursor2 for
		select rowid,hn,surname into therowid,thehn,theset from patience
		foreach cursor1 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st< time) then
				insert into result_rowchar values(therowid,thehn,therow.char_at,therow.t_st,therow.t_sp);
				exit foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure current_pat_sur('2000-12-12 11:00');
--select * from result_rowchar
--drop procedure current_pat_sur()
--select * from patience
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--ROOM TO TABLE
create procedure room2table(time datetime year to minute)
	define therowid int;	
	define thecode int;
	define theset collection;
	define therow row_int;

	drop table cost_list;
	create table cost_list(therowid int,code int,price int,t_st datetime year to minute,t_sp datetime year to minute);
	foreach cursor1 for
		select rowid,room_id,price into therowid,thecode,theset from room
		foreach cursor2 for	
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st<time) then
				insert into cost_list values(therowid,thecode,therow.int_at,therow.t_st,therow.t_sp);
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure room2table('9999-12-31 23:59');
--select * from cost_list
--select * from room
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--QUERY CURRENT DOCTOR NAME ALL
create procedure current_doc_name(time datetime year to minute)
	define therowid int;
	define theset collection;
	define therow row_char;
	define thecode int;

	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	drop table result_rowchar;
	create table result_rowchar(therowid int,code int,name char(40), t_st datetime year to minute, t_sp datetime year to minute);
	foreach cursor2 for
		select rowid,doc_code,name into therowid,thecode,theset from doctor
		foreach cursor1 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st < time) then
				insert into result_rowchar values(therowid,thecode,therow.char_at,therow.t_st,therow.t_sp);
				exit foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure current_doc_name('9999-12-31 23:59');
--select * from result_rowchar
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--QUERY CURRENT DOCTOR SURNAME ALL
create procedure current_doc_sur(time datetime year to minute)
	define therowid int;
	define theset collection;
	define therow row_char;
	define thecode int;

	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	drop table result_rowchar;
	create table result_rowchar(therowid int,code int,name char(40), t_st datetime year to minute, t_sp datetime year to minute);
	foreach cursor2 for
		select rowid,doc_code,surname into therowid,thecode,theset from doctor
		foreach cursor1 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st< time) then
				insert into result_rowchar values(therowid,thecode,therow.char_at,therow.t_st,therow.t_sp);
				exit foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure current_doc_sur('9999-12-31 23:59');
--select * from result_rowchar
--select * from doctor
--select * from lrna
--select ad_code from admission where rowid=258
--execute function A2P(258)
--delete from photo where photo_id>10
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT NAME,TIME OUTPUT ROWID				
create procedure NT2ROWID(thename char(50),time datetime year to minute)
	define therowid int;
	define theset collection;
	define therow row_char;	
	
	drop table single_int;	
	create table single_int(therowid int);
	foreach cursor1 for
		select rowid,name into therowid,theset from patience
		foreach cursor2 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st<time and therow.char_at==thename) then
				insert into single_int values(therowid);
				exit foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure NT2ROWID('Ratuay','9999-12-31 23:59');
--select * from single_int;
------------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT SURNAME,TIME OUTPUT ROWID			
create procedure ST2ROWID(thesur char(50),time datetime year to minute)
	define therowid int;
	define theset collection;
	define therow row_char;	
	
	drop table single_int;	
	create table single_int(therowid int);
	foreach cursor1 for
		select rowid,surname into therowid,theset from patience
		foreach cursor2 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st<time and therow.char_at==thesur) then
				insert into single_int values(therowid);
				exit foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure ST2ROWID('Deeteedeaow','9999-12-31 23:59');
--select * from single_int
------------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT NAME,SURNAME,TIME OUTPUT ROWID		
create procedure NST2ROWID(thename char(50),thesur char(50),time datetime year to minute)
	define therowid int;
	define thenset collection;
	define thesset collection;
	define thenrow row_char;
	define thesrow row_char;	
	
	drop table single_int;	
	create table single_int(therowid int);
	foreach cursor1 for
		select rowid,name,surname into therowid,thenset,thesset from patience
		foreach cursor2 for
			select * into thenrow from table(thenset)
			if (thenrow.t_sp>=time and thenrow.t_st<time and thenrow.char_at==thename) then
				foreach cursor3 for
					select * into thesrow from table(thesset)
					if (thesrow.t_sp>=time and thesrow.t_st<time and thesrow.char_at==thesur) then
						insert into single_int values(therowid);
						exit foreach;
					end if;
				end foreach;
				exit foreach;
			end if;		
		end foreach;
	end foreach;
end procedure;

--execute procedure NST2ROWID('Ratuay','Deeteedeaow','9999-12-31 23:59');
--select * from single_int;
--select * from patience
------------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT ROWID,TIME OUTPUT ALL PATIENCE ATTRIBUTE	
create procedure R2APA(ref2pat int,time datetime year to minute)
	define thehn,picture,diagnosis,admission int;
	define thepicset,thenameset,thesurset,theadsset,thetelset,thedisset,themedset,thediaset,theadmitset collection;
	define thebirthday date;
	define thesex char;
	define theid_num char(13);
	define theblood_group char(2);
	define introw row_int;
	define charrow row_char;
	define name char(50);

	drop table tmp_patience;
	create table tmp_patience(hn int,picture int,name char(50),surname char(50),birthday date,sex char,id_num char(13)
	,blood_group char(2),address address,tel_num set(char(15) not null),chronic_dis set(int not null)
	,allergy_med set(int not null),diagnosis int,admission int);	
	
	select * into thehn,thepicset,thenameset,thesurset,thebirthday,thesex,theid_num,theblood_group,theadsset,thetelset,thedisset,themedset,thediaset,theadmitset from patience where rowid=ref2pat;
	
	foreach cursor1 for
		select * into introw from table(thepicset)
		if (introw.t_sp>=time and introw.t_st<time) then
			let picture=introw.int_at;
			exit foreach;
		end if;
	end foreach;

	foreach cursor2 for
		select * into charrow from table(thenameset)
		if (charrow.t_sp>=time and charrow.t_st<time) then
			let name=charrow.char_at;
			exit foreach;
		end if;
	end foreach;
	insert into tmp_patience values(thehn,picture,name,null,null,null,null,null,null,"set{'xxxxxxx'}","set{-1}","set{-1}",null,null);	
end procedure;

--execute procedure R2APA(16386,'9999-12-31 23:59')
--select * from tmp_patience;
------------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT PATIENCE'S ROWID OUTPUT DIAGNOSIS LIST		
create procedure R2DI(ref2pat int)
	define theset collection;
	define therow row_int;
	
	drop table result_rowchar;
	create table result_rowchar(therowid int,code int,name char(50),t_st datetime year to minute,t_sp datetime year to minute);	

	select diagnosis into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.int_at is not null) then
			insert into result_rowchar values(therow.int_at,null,null,therow.t_st,therow.t_sp);
		end if;
	end foreach;
end procedure;

--execute procedure R2DI(513);
--select * from result_rowchar;
--select rowid,* from patience
------------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT PATIENCE'S ROWID,TIME OUTPUT LAB RESULT AT THE TIME			
--NUMBER TYPE
create procedure RT2LRN(ref2pat int,time datetime year to minute)
 	define therowid,thelab int;
	define theset collection;
	define therow row_int;
		
	drop table result;
	create table result(therowid int,code int,result int,t_st datetime year to minute,t_sp datetime year to minute);

	foreach cursor1 for
		select rowid,lab,lab_result into therowid,thelab,theset from LRNP where patience=ref2pat
		foreach cursor2 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st<time) then
				insert into result values(therowid,thelab,therow.int_at,therow.t_st,therow.t_sp);
				exit foreach;				
			end if;
		end foreach;
	end foreach;
end procedure;

--select rowid,* from lab_number;
--select * from lrnp;
--execute procedure RT2LRN(16385,'1999-12-31 23:59');
--select * from result;
------------------------------------------------------------------------------------------------------------------------------------------------------------
--CHAR TYPE
create procedure RT2LRC(ref2pat int,time datetime year to minute)
 	define therowid,thelab int;
	define theset collection;
	define therow row_char;
		
	drop table result;
	create table result(therowid int,code int,result char(50),t_st datetime year to minute,t_sp datetime year to minute);

	foreach cursor1 for
		select rowid,lab,lab_result into therowid,thelab,theset from LRCP where patience=ref2pat
		foreach cursor2 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st<time) then
				insert into result values(therowid,thelab,therow.char_at,therow.t_st,therow.t_sp);
				exit foreach;				
			end if;
		end foreach;
	end foreach;
end procedure;

--select * from lrcp;
--execute procedure RT2LRC(16385,'9999-12-31 23:59');
--select * from result;
--select * from lab_number
--select * from lab_list;
------------------------------------------------------------------------------------------------------------------------------------------------------------
--PHOTO TYPE
create procedure RT2LRP(ref2pat int,time datetime year to minute)
 	define therowid,thelab int;
	define theset collection;
	define therow row_int;
		
	drop table result;
	create table result(therowid int,code int,result int,t_st datetime year to minute,t_sp datetime year to minute);

	foreach cursor1 for
		select rowid,lab,lab_result into therowid,thelab,theset from LRPP where patience=ref2pat
		foreach cursor2 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st<time) then
				insert into result values(therowid,thelab,therow.int_at,therow.t_st,therow.t_sp);
				exit foreach;				
			end if;
		end foreach;
	end foreach;
end procedure;

--select * from lrpp;
--execute procedure RT2LRP(16385,'9999-12-31 23:59');
--select * from result;
------------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT PATIENCE'S ROWID,TIME OUTPUT MEDICINE QUANTITY AT THE TIME	
create procedure RT2MOP(ref2pat int,time datetime year to minute)
	define therowid,themed int;
	define theset collection;
	define therow row_int;
		
	drop table result;
	create table result(therowid int,code int,result int,t_st datetime year to minute,t_sp datetime year to minute);

	foreach cursor1 for
		select rowid,medicine,quantity into therowid,themed,theset from MOP where patience=ref2pat
		foreach cursor2 for
			select * into therow from table(theset)
			if (therow.t_sp>=time and therow.t_st<time) then
				insert into result values(therowid,themed,therow.int_at,therow.t_st,therow.t_sp);
				exit foreach;				
			end if;
		end foreach;
	end foreach;
end procedure;

--select * from mop;
--execute procedure RT2MOP(1282,'9999-12-31 23:59');
--select * from result;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT PATIENCE'S ROWID,LAB'S ROWID OUTPUT ALL  RESULT OF THE LAB		
--NUMBER TYPE
create procedure RL2LRN(ref2pat int,ref2lab int)
	define theset collection;
	define therow row_int;
	
	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	

	select lab_result into theset from LRNP where patience=ref2pat and lab=ref2lab;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure RL2LRN(16385,257);
--select * from result;
--select * from lrnp
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--CHAR TYPE								
create procedure RL2LRC(ref2pat int,ref2lab int)
	define theset collection;
	define therow row_char;
	
	drop table result;
	create table result(result char(50),t_st datetime year to minute,t_sp datetime year to minute);	

	select lab_result into theset from LRCP where patience=ref2pat and lab=ref2lab;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.char_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure RL2LRC(16385,123);
--select * from result;
--select * from lrcp
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--PHOTO TYPE									
create procedure RL2LRP(ref2pat int,ref2lab int)
	define theset collection;
	define therow row_int;
	
	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	

	select lab_result into theset from LRPP where patience=ref2pat and lab=ref2lab;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure RL2LRP(16385,257);
--select * from result;
--select * from lrpp
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT PATIENCE'S ROWID,MEDICINE'S ROWID OUTPUT ALL  QUANTITY OF THE MEDICINE	
create procedure RM2Q(ref2pat int,ref2med int)
	define theset collection;
	define therow row_int;
	
	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	

	select quantity into theset from MOP where patience=ref2pat and medicine=ref2med;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure RM2Q(16385,12);
--select * from result;
--select * from MOP;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--ข้อที่1 ต้องแบ่งเป็น 9 procedures ตามแต่ละ attribute ดังนี้				
--INPUT PATIENCE'S ROWID OUTPUT EACH ATTRIBUTE ALL OF TIME

--PICTURE ATTRIBUTE
create procedure allpicture(ref2pat int);
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	
	
	select picture into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure allpicture(16385);
--select rowid,* from patience;
--select * from result;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--NAME ATTRIBUTE
create procedure allname(ref2pat int);
	define theset collection;
	define therow row_char;

	drop table result;
	create table result(result char(50),t_st datetime year to minute,t_sp datetime year to minute);	
	
	select name into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.char_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure allname(16385);
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--SURNAME ATTRIBUTE
create procedure allsurname(ref2pat int);
	define theset collection;
	define therow row_char;

	drop table result;
	create table result(result char(50),t_st datetime year to minute,t_sp datetime year to minute);	
	
	select surname into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.char_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure allsurname(16386);
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--DIAGNOSIS ATTRIBUTE
create procedure alldiagnosis(ref2pat int);
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	
	
	select diagnosis into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure alldiagnosis(16385);
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--ADMISSION ATTRIBUTE
create procedure alladmission(ref2pat int);
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	
	
	select admission into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure alladmission(16385);
--select rowid,* from patience;
--select * from result
--drop table result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--ADDRESS ATTRIBUTE
create procedure alladdress(ref2pat int);
	define theset collection;
	define therow address;

	drop table result;
	create table result(house_id int,road char(40),district char(40),amphur char(40),province char(40),zip_code char(5),t_st datetime year to minute,t_sp datetime year to minute);
	
	select address into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.house_id,therow.road,therow.district,therow.amphur,therow.province,therow.zip_code,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure alladdress(16385);
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--TEL_NUM ATTRIBUTE
create procedure alltel(ref2pat int);
	define theset collection;
	define therow row_char_s;

	drop table result;
	create table result(result char(15),t_st datetime year to minute,t_sp datetime year to minute);	
	
	select tel_num into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.char_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure alltel(16385);
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--CHRONIC_DIS ATTRIBUTE
create procedure alldis(ref2pat int);
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	
	
	select chronic_dis into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure alldis(16385);
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--ALLERGY_MED ATTRIBUTE
create procedure allmed(ref2pat int);
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	
	
	select allergy_med into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure allmed(16386);
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--ข้อที่5 ต้องแบ่งเป็น 9 procedures ตามแต่ละ attribute ดังนี้						
--INPUT PATIENCE'S ROWID,TIME OUTPUT EACH ATTRIBUTE AT THE TIME

--PICTURE ATTRIBUTE
create procedure atpicture(ref2pat int,time datetime year to minute)
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);
	
	select picture into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp>=time and therow.t_st<time) then
			insert into result values(therow.int_at,therow.t_st,therow.t_sp);
			exit foreach;
		end if;
	end foreach;
end procedure;

--execute procedure atpicture(16385,'9999-12-31 23:59');
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--NAME ATTRIBUTE
create procedure atname(ref2pat int,time datetime year to minute)
	define theset collection;
	define therow row_char;

	drop table result;
	create table result(result char(50),t_st datetime year to minute,t_sp datetime year to minute);
	
	select name into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp>=time and therow.t_st<time) then
			insert into result values(therow.char_at,therow.t_st,therow.t_sp);
			exit foreach;
		end if;
	end foreach;
end procedure;

--execute procedure atname(16385,'1998-12-31 23:59');
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--SURNAME ATTRIBUTE
create procedure atsurname(ref2pat int,time datetime year to minute)
	define theset collection;
	define therow row_char;

	drop table result;
	create table result(result char(50),t_st datetime year to minute,t_sp datetime year to minute);
	
	select surname into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp>=time and therow.t_st<time) then
			insert into result values(therow.char_at,therow.t_st,therow.t_sp);
			exit foreach;
		end if;
	end foreach;
end procedure;

--execute procedure atsurname(16386,'1980-12-31 23:59');
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--DIAGNOSIS ATTRIBUTE
create procedure atdiagnosis(ref2pat int,time datetime year to minute)
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);
	
	select diagnosis into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp>=time and therow.t_st<time) then
			insert into result values(therow.int_at,therow.t_st,therow.t_sp);
			exit foreach;
		end if;
	end foreach;
end procedure;

--execute procedure atdiagnosis(16385,'9999-12-31 23:59');
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--ADMISSION ATTRIBUTE
create procedure atadmission(ref2pat int,time datetime year to minute)
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);
	
	select admission into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp>=time and therow.t_st<time) then
			insert into result values(therow.int_at,therow.t_st,therow.t_sp);
			exit foreach;
		end if;
	end foreach;
end procedure;

--execute procedure atadmission(1026,'2001-3-13 23:59');
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--ADDRESS ATTRIBUTE
create procedure ataddress(ref2pat int,time datetime year to minute)
	define theset collection;
	define therow address;

	drop table result;
	create table result(house_id int,road char(40),district char(40),amphur char(40),province char(40),zip_code char(5),t_st datetime year to minute,t_sp datetime year to minute);
	
	select address into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp>=time and therow.t_st<time) then
			insert into result values(therow.house_id,therow.road,therow.district,therow.amphur,therow.province,therow.zip_code,therow.t_st,therow.t_sp);
			exit foreach;
		end if;
	end foreach;
end procedure;

--execute procedure ataddress(16385,'1998-3-13 23:59');
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--TEL_NUM ATTRIBUTE
create procedure attel(ref2pat int,time datetime year to minute)
	define theset collection;
	define therow row_char_s;

	drop table result;
	create table result(result char(15),t_st datetime year to minute,t_sp datetime year to minute);
	
	select tel_num into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp>=time and therow.t_st<time) then
			insert into result values(therow.char_at,therow.t_st,therow.t_sp);
		end if;
	end foreach;
end procedure;

--execute procedure attel(16385,'9999-12-31 23:59');
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--CHRONIC_DIS ATTRIBUTE
create procedure atdis(ref2pat int,time datetime year to minute)
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);
	
	select chronic_dis into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp>=time and therow.t_st<time) then
			insert into result values(therow.int_at,therow.t_st,therow.t_sp);
		end if;
	end foreach;
end procedure;

--execute procedure atdis(16385,'9999-12-31 23:59');
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--ALLERGY_MED ATTRIBUTE
create procedure atmed(ref2pat int,time datetime year to minute)
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);
	
	select allergy_med into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.t_sp>=time and therow.t_st<time) then
			insert into result values(therow.int_at,therow.t_st,therow.t_sp);
		end if;
	end foreach;
end procedure;

--execute procedure atmed(16386,'9999-12-31 23:59');
--select rowid,* from patience;
--select * from result
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--COUNT ALL OF PATIENCE NAME
create function CAPN()
	returning int;
	define theset collection;
	define answer int;
	define x int;
	
	let answer=0;
	foreach cursor1 for
		select name into theset from patience
		let x=cardinality(theset);
		let answer=answer+x;
	end foreach;
	return answer;
end function;

--execute function CAPN();
--select * from patience
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--COUNT ALL OF PATIENCE SURNAME
create function CAPS()
	returning int;
	define theset collection;
	define answer int;
	define x int;
	
	let answer=0;
	foreach cursor1 for
		select surname into theset from patience
		let x=cardinality(theset);
		let answer=answer+x;
	end foreach;
	return answer;
end function;

--execute function CAPS();
--select * from patience
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT PATIENCE's NAME OUTPUT ALL PATIENCE's ROWID ที่เคยชื่อนั้น
create procedure nameNSEQ(thename char(50));
	define theset collection;
	define therow row_char;
	define therowid int;
	
	drop table single_int;
	create table single_int (therowid int);
	
	foreach cursor1 for
		select rowid,name into therowid,theset from patience
		foreach cursor2 for
			select * into therow from table(theset)
			if therow.char_at==thename then
				insert into single_int values(therowid);
				exit foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure nameNSEQ('Ratuay');
--select * from single_int;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT PATIENCE's SURNAME OUTPUT ALL PATIENCE's ROWID ที่เคยนามสกุลนั้น
create procedure surnameNSEQ(thesur char(50));
	define theset collection;
	define therow row_char;
	define therowid int;
	
	drop table single_int;
	create table single_int (therowid int);
	
	foreach cursor1 for
		select rowid,surname into therowid,theset from patience
		foreach cursor2 for
			select * into therow from table(theset)
			if therow.char_at==thesur then
				insert into single_int values(therowid);
				exit foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure surnameNSEQ('Deeteedeaow');
--select * from single_int;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--INPUT PATIENCE's NAME,SURNAME OUTPUT ALL PATIENCE's ROWID ที่เคยชื่อและนามสกุล(2อย่างพร้อมกัน)นั้น
create procedure nameNSEQ(thename char(50),thesur char(50));
	define trig char;
	define thenrow,thesrow row_char;
	define thesset,thenset collection;	
	define therowid int;
	
	drop table single_int;
	create table single_int (therowid int);
	
	foreach cursor1 for
		select rowid,name,surname into therowid,thenset,thesset from patience
		foreach cursor2 for
			select * into thenrow from table(thenset)
			if thenrow.char_at==thename then
				foreach cursor3 for	
					select * into thesrow from table(thesset)
					if (thesrow.char_at==thesur and thesrow.t_sp>thenrow.t_st and thesrow.t_st<thenrow.t_sp) then
						insert into single_int values(therowid);
						exit foreach;
					end if;
				end foreach;
			end if;
		end foreach;
	end foreach;
end procedure;

--execute procedure nameNSEQ('Ratuay','Deeteedeaow');
--select * from single_int;
--select rowid,* from patience;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--NOTHING
create procedure checksingle_int()
	define x int;
	let x=0;
	select count(*) into x from single_int;
	if x==0 then
		drop table single_int;
		create table single_int(a char(7));
		insert into single_int values('nothing');
	end if;
end procedure;

--execute procedure checksingle_int();
--select * from single_int;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--NOTHING
create procedure checkresult()
	define x int;
	let x=0;
	select count(*) into x from result;
	if x==0 then
		drop table result;
		create table result(a char(7));
		insert into result values('nothing');
	end if;
end procedure;

--execute procedure checkresult();
--select * from result;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--NOTHING
create procedure checklab_list()
	define x int;
	let x=0;
	select count(*) into x from lab_list;
	if x==0 then
		drop table lab_list;
		create table lab_list(a char(7));
		insert into lab_list values('nothing');
	end if;
end procedure;

--execute procedure checklab_list();
--select * from lab_list;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--NOTHING
create procedure checkusedtos()
	define x int;
	let x=0;
	select count(*) into x from usedtosleep;
	if x==0 then
		drop table usedtosleep;
		create table usedtosleep(a char(7));
		insert into usedtosleep values('nothing');
	end if;
end procedure;

--execute procedure checkusedtos();
--select * from usedtosleep;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--check ว่าคนไข้เคยadmit หรือไม่ถ้าเคย การ admit ล่าสุดสิ้นสุดหรือยัง
create procedure admitOkorNot(ref2pat int)
	define theset collection;
	define x datetime year to minute;
	define ref2admit int;
	
	drop table result;
	create table result(a char);

	select admission into theset from patience where rowid=ref2pat;
	call TheIntCurrent(theset) returning ref2admit;
	if ref2admit is not null then
		select out_time into x from admission where rowid=ref2admit;
		if x is null then
			insert into result values('f');
		else
			insert into result values('t');
		end if;
	else
		insert into result values('t');
	end if;
end procedure;

--execute procedure admitOkorNot(1538);
--select rowid,* from patience;
--select * from result;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--QUERY LAB NAME FROM ROWID ที่คนนั้นเคยตรวจทั้งหมด
create procedure QLN(ref2pat int)
	define therowid,thecode,x int;
	define thename char(50);

	drop table lab_list;
	create table lab_list(therowid int,code int,name char(50),type char);
	
	foreach cursor1 for
		select lab into x from lrnp where patience=ref2pat
		select rowid,lab_code,name into therowid,thecode,thename from lab_number where rowid=x;
		insert into lab_list values(therowid,thecode,thename,'n');
	end foreach;

	foreach cursor1 for
		select lab into x from lrcp where patience=ref2pat
		select rowid,lab_code,name into therowid,thecode,thename from lab_char where rowid=x;
		insert into lab_list values(therowid,thecode,thename,'c');
	end foreach;

	foreach cursor1 for
		select lab into x from lrpp where patience=ref2pat
		select rowid,lab_code,name into therowid,thecode,thename from lab_photo where rowid=x;
		insert into lab_list values(therowid,thecode,thename,'p');
	end foreach;
end procedure;

--select * from lab_number;
--select rowid,* from lrpp;
--execute procedure QLN(1282);
--select * from lab_list;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--TEMPERATURE ATTRIBUTE FROM ROWID_ADMISSION					- การ ADMIT
create procedure alltemp(ref2admit int);
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	
	
	
	select temperature into theset from ad_diagnosis where rowid=
		(select ad_diagnosis from admission where rowid = ref2admit);
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;

--execute procedure alltemp(263);
--select * from result;
--select rowid,* from patience
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--PULSE ATTRIBUTE FROM ROWID_ADMISSION
create procedure allpulse(ref2admit int);
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	
	
	
	select pulse into theset from ad_diagnosis where rowid=
		(select ad_diagnosis from admission where rowid = ref2admit);
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--REPISITORY ATTRIBUTE FROM ROWID_ADMISSION
create procedure allrep(ref2admit int);
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	
	
	
	select repisitory into theset from ad_diagnosis where rowid=
		(select ad_diagnosis from admission where rowid = ref2admit);
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--BLOOD PRESSURE ATTRIBUTE FROM ROWID_ADMISSION
create procedure allbp(ref2admit int);
	define theset1 collection;
	define theset2 collection;
	define therow1 row_int;
	define therow2 row_int;

	drop table result;
	create table result(result1 int,result2 int,t_st datetime year to minute,t_sp datetime year to minute);	
	
	
	select blood_pressure_l,blood_pressure_h into theset1,theset2 from ad_diagnosis where rowid=
		(select ad_diagnosis from admission where rowid = ref2admit);
	foreach cursor1 for
		select * into therow1 from table(theset1)
			foreach cursor2 for
				select * into therow2 from table(theset2)
				if therow1.t_st = therow2.t_st then 
					insert into result values(therow1.int_at,therow2.int_at,therow1.t_st,therow1.t_sp);
					exit foreach;
				end if;
			end foreach;
	end foreach;
end procedure;

--execute procedure allbp(263);
--select * from result;
--select * from patience;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--NURSING PLAN ATTRIBUTE FROM ROWID_ADMISSION
create procedure allnurse(ref2admit int);
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	
		
	select nursing_plan into theset from ad_diagnosis where rowid=
		(select ad_diagnosis from admission where rowid = ref2admit);
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--DIAGNOSIS RECORD PLAN ATTRIBUTE FROM ROWID_ADMISSION
create procedure alldiag(ref2admit int);
	define theset collection;
	define therow row_int;

	drop table result;
	create table result(result int,t_st datetime year to minute,t_sp datetime year to minute);	
		
	select diagnosis_record into theset from ad_diagnosis where rowid=
		(select ad_diagnosis from admission where rowid = ref2admit);
	foreach cursor1 for
		select * into therow from table(theset)
		insert into result values(therow.int_at,therow.t_st,therow.t_sp);
	end foreach;
end procedure;
---------------------------------------------------------------------------------------------------------------------------------------------------------
--NONTEMPORAL UPDATE (SINGLE VALUES ATTRIBUTE ONLY)
create procedure updateNT(ref2pat int,thepicture int,thename char(50),thesurname char(50),thebirthday date,thesex char,theid_num char(13),theblood_group char(2),thehouse_id int,theroad char(40),thedistrict char(40),theamphur char(40),theprovince char(40),thezip_code char(5))
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define theset collection;
	define therow address;

	if (thepicture is not null) then
		select picture into theset from patience where rowid=ref2pat;
		call editinttoset(theset,thepicture) returning theset;
		update patience set picture=theset where rowid=ref2pat;
	end if;

	if (thename is not null) then
		select name into theset from patience where rowid=ref2pat;
		call editchartoset(theset,thename) returning theset;
		update patience set name=theset where rowid=ref2pat;
	end if;

	if (thesurname is not null) then
		select surname into theset from patience where rowid=ref2pat;
		call editchartoset(theset,thesurname) returning theset;
		update patience set surname=theset where rowid=ref2pat;
	end if;
	
	if (thebirthday is not null) then
		update patience set birthday=thebirthday where rowid=ref2pat;
	end if;

	if (thesex is not null) then
		update patience set sex=thesex where rowid=ref2pat;
	end if;

	if (theid_num is not null) then
		update patience set id_num=theid_num where rowid=ref2pat;
	end if;

	if (theblood_group is not null) then
		update patience set blood_group=theblood_group where rowid=ref2pat;
	end if;

	--address
	if (thehouse_id is not null or theroad is not null or thedistrict is not null or theamphur is not null or theprovince is not null or thezip_code is not null) then
		select address into theset from patience where rowid=ref2pat;
		foreach cursor1 for
			select * into therow from table(theset)
			if therow.t_sp==forever then
				if thehouse_id is not null then
					let therow.house_id=thehouse_id;
				end if;
				if theroad is not null then
					let therow.road=theroad;
				end if;
				if thedistrict is not null then
					let therow.district=thedistrict;
				end if;
				if theamphur is not null then
					let therow.amphur=theamphur;
				end if;
				if theprovince is not null then
					let therow.province=theprovince;
				end if;
				if thezip_code is not null then
					let therow.zip_code=thezip_code;
				end if;
				update table(theset)(a) set a=therow where current of cursor1;
				exit foreach;
			end if;
		end foreach;
		update patience set address=theset where rowid=ref2pat;
	end if;
	--address
end procedure;

--execute procedure updateNT(513,55,'hi','kitty','12/31-9999','x','55555','lr',555,'Lumtarn','Lumpai','Lumjeak','Lumthani','44444');
--select rowid,* from patience
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FUNCTION FOR NONTEMPORAL UPDATE INTO SET BY EDIT NEW VALUES INTO CURRENT ROW IN SET (TYPE INT)
create function editinttoset(theset collection,theint int)
	returning collection;
	define therow row_int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	foreach cursor1 for
		select * into therow from table(theset)
		if therow.t_sp==forever then
			let therow.int_at=theint;
			update table(theset)(a) set a=therow where current of cursor1;
			exit foreach;
		end if;
	end foreach;
	return theset;
end function;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FUNCTION FOR NONTEMPORAL UPDATE INTO SET BY EDIT NEW VALUES INTO CURRENT ROW IN SET (TYPE CHAR)
create function editchartoset(theset collection,thechar char(50))
	returning collection;
	define therow row_char;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	foreach cursor1 for
		select * into therow from table(theset)
		if therow.t_sp==forever then
			let therow.char_at=thechar;
			update table(theset)(a) set a=therow where current of cursor1;
			exit foreach;
		end if;
	end foreach;
	return theset;
end function;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FUNCTION FOR TEMPORAL UPDATE INTO SET BY ADD NEW ELEMENT INTO SET (TYPE CHAR)
create function updatechartoset(theset collection,thechar char(50))
	returning collection;
	define therow row_char;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;

	foreach cursor1 for
		select * into therow from table(theset)
		if therow.t_sp==forever then
			let therow.t_sp=now;
			update table(theset)(a) set a=therow where current of cursor1;
			let therow=cast(row(thechar,now,forever) as row_char);
			exit foreach;
		end if;
	end foreach;
	insert into table(theset) values(therow);
	return theset;
end function;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TEMPORAL UPDATE (SINGLE VALUES ATTRIBUTE ONLY)
create procedure updateT(ref2pat int,thepicture int,thename char(50),thesurname char(50),thehouse_id int,theroad char(40),thedistrict char(40),theamphur char(40),theprovince char(40),thezip_code char(5))
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	define theset collection;
	define therow address;
	let now=current;

	if (thepicture is not null) then
		select picture into theset from patience where rowid=ref2pat;
		call updateinttoset(theset,thepicture) returning theset;
		update patience set picture=theset where rowid=ref2pat;
	end if;

	if (thename is not null) then
		select name into theset from patience where rowid=ref2pat;
		call updatechartoset(theset,thename) returning theset;
		update patience set name=theset where rowid=ref2pat;
	end if;

	if (thesurname is not null) then
		select surname into theset from patience where rowid=ref2pat;
		call updatechartoset(theset,thesurname) returning theset;
		update patience set surname=theset where rowid=ref2pat;
	end if;

	--address
	if (thehouse_id is not null or theroad is not null or thedistrict is not null or theamphur is not null or theprovince is not null or thezip_code is not null) then
		select address into theset from patience where rowid=ref2pat;
		foreach cursor1 for
			select * into therow from table(theset)
			if therow.t_sp==forever then
				let therow.t_sp=now;
				update table(theset)(a) set a=therow where current of cursor1;				
				if thehouse_id is not null then
					let therow.house_id=thehouse_id;
				end if;
				if theroad is not null then
					let therow.road=theroad;
				end if;
				if thedistrict is not null then
					let therow.district=thedistrict;
				end if;
				if theamphur is not null then
					let therow.amphur=theamphur;
				end if;
				if theprovince is not null then
					let therow.province=theprovince;
				end if;
				if thezip_code is not null then
					let therow.zip_code=thezip_code;
				end if;
				let therow.t_st=now;
				let therow.t_sp=forever;
				exit foreach;
			end if;
		end foreach;
		insert into table(theset) values(therow);
		update patience set address=theset where rowid=ref2pat;
	end if;
	--address
end procedure;

--execute procedure updateT(513,54,'ih','kiddy',57948,null,null,null,null,null);
--execute procedure updateT(513,null,'สุภาวดี',null,null,null,null,null,null,null)
--select rowid,* from patience
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--NONTEMPORAL UPDATE (MULTIVALUES ATTRIBUTE: TEL,โรค,ยา)
create procedure updateNTtel(ref2pat int,number char(15))			--ลบelement นั้นออกไปจาก set เลย		--NONTEMPORAL FOR TEL
	define theset collection;
	define therow row_char_s;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	
	select tel_num into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.char_at==number and therow.t_sp==forever) then
			delete from table(theset) where current of cursor1;
			exit foreach;
		end if;
	end foreach;
	update patience set tel_num=theset where rowid=ref2pat;
end procedure;

--execute procedure updateNTtel(513,'4512547');
--select rowid,* from patience
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure updateNTdis(ref2pat int,ref2dis int)			--ลบelement นั้นออกไปจาก set เลย		--NONTEMPORAL FOR DISEASE
	define theset collection;
	define therow row_int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	
	select chronic_dis into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.int_at==ref2dis and therow.t_sp==forever) then
			delete from table(theset) where current of cursor1;
			exit foreach;
		end if;
	end foreach;
	update patience set chronic_dis=theset where rowid=ref2pat;
end procedure;

--execute procedure updateNTdis(1282,259);
--select rowid,* from patience
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure updateNTmed(ref2pat int,ref2med int)			--ลบelement นั้นออกไปจาก set เลย		--NONTEMPORAL FOR MEDICINE
	define theset collection;
	define therow row_int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	
	select allergy_med into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		if (therow.int_at==ref2med and therow.t_sp==forever) then
			delete from table(theset) where current of cursor1;
			exit foreach;
		end if;
	end foreach;
	update patience set allergy_med=theset where rowid=ref2pat;
end procedure;

--execute procedure updateNTmed(1282,257);
--select rowid,* from patience
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TEMPORAL UPDATE (MULTIVALUES ATTRIBUTE: TEL,โรค,ยา)	--ก่อน run ต้องสร้างค่สที่จะ input ในตาราง set_table ก่อน โดยสร้างที่ procedure createsettable(); 
							--และต้อง insert ข้อมูลที่จะ update ลงไปก่อนด้วย

create procedure updateTtel(ref2pat int)				--TEMPORAL FOR TEL
	define theset,number collection;
	define therow row_char_s;
	define trig char;
	define thenew char(15);
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;
	
	select a into number from set_table where x=1;
	insert into table(number) values('-1');	--ตัว joker ให้ไม่เท่าใครเลยจะได้เหลืออยู่ (not null)
	select tel_num into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		let trig='f';
		if therow.t_sp==forever then
			foreach cursor2 for
				select * into thenew from table(number)
				if therow.char_at==thenew then
					let trig='t';
					delete from table(number) where current of cursor2;
					exit foreach;
				end if;
			end foreach;
			if trig=='f' then
				let therow.t_sp=now;
				update table(theset)(a) set a=therow where current of cursor1;
			end if;
		end if;
	end foreach;
	foreach cursor3 for
		select * into thenew from table(number)
		if not(thenew=='-1') then
			insert into table(theset) values(cast(row(thenew,now,forever) as row_char_s));
		end if;
	end foreach;
	update patience set tel_num=theset where rowid=ref2pat;
end procedure;

--execute procedure updateTtel(769);
--select rowid,* from patience;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure updateTdis(ref2pat int)			--TEMPORAL FOR DISEASE
	define theset,number collection;
	define therow row_int;
	define trig char;
	define thenew int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;
	
	select a into number from set_table where x=1;
	insert into table(number) values(-1);	--ตัว joker ให้ไม่เท่าใครเลยจะได้เหลืออยู่ (not null)
	select chronic_dis into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		let trig='f';
		if therow.t_sp==forever then
			foreach cursor2 for
				select * into thenew from table(number)
				if therow.int_at==thenew then
					let trig='t';
					delete from table(number) where current of cursor2;
					exit foreach;
				end if;
			end foreach;
			if trig=='f' then
				let therow.t_sp=now;
				update table(theset)(a) set a=therow where current of cursor1;
			end if;
		end if;
	end foreach;
	foreach cursor3 for
		select * into thenew from table(number)
		if not(thenew==-1) then
			insert into table(theset) values(cast(row(thenew,now,forever) as row_int));
		end if;
	end foreach;
	update patience set chronic_dis=theset where rowid=ref2pat;
end procedure;

--execute procedure updateTdis(769);
--select rowid,* from patience;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure updateTmed(ref2pat int)			--TEMPORAL FOR MEDICINE
	define theset,number collection;
	define therow row_int;
	define trig char;
	define thenew int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define global now datetime year to minute default current year to minute;
	let now=current;
	
	select a into number from set_table where x=1;
	insert into table(number) values(-1);	--ตัว joker ให้ไม่เท่าใครเลยจะได้เหลืออยู่ (not null)
	select allergy_med into theset from patience where rowid=ref2pat;
	foreach cursor1 for
		select * into therow from table(theset)
		let trig='f';
		if therow.t_sp==forever then
			foreach cursor2 for
				select * into thenew from table(number)
				if therow.int_at==thenew then
					let trig='t';
					delete from table(number) where current of cursor2;
					exit foreach;
				end if;
			end foreach;
			if trig=='f' then
				let therow.t_sp=now;
				update table(theset)(a) set a=therow where current of cursor1;
			end if;
		end if;
	end foreach;
	foreach cursor3 for
		select * into thenew from table(number)
		if not(thenew==-1) then
			insert into table(theset) values(cast(row(thenew,now,forever) as row_int));
		end if;
	end foreach;
	update patience set allergy_med=theset where rowid=ref2pat;
end procedure;

--execute procedure updateTmed(769);
--select rowid,* from patience;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--drop procedure createsettable();	--สร้างตาราง set 
create procedure createsettable (x char)
	drop table set_table;
	if x=='c' then
		create table set_table (x int,a set(char(15) not null));
	end if;
	if x=='n' then
		create table set_table (x int,a set(int not null));
	end if;
end procedure;

--execute procedure createsettable('c');
--insert into set_table values(1,"set{'4','5'}");

--execute procedure createsettable('n');
--insert into set_table values(1,"set{4,5}");
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--BILL FOR DIAGNOSIS
create procedure bill_diagnosis(ref2dia int)
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	define ref2pat,theint,thedoctor,ref2lab,thecode,theprice,ref2med int;
	define theset1,theset2,theset3 collection;
	define thename,thesurname char(50);

	drop table bill;
	create table bill(attribute_name char(20),code int,name char(50),units int,price_unit int);
	drop table pat_name;
	create table pat_name(hn int,name char(50),surname char(50));
	
	--patience part
	call D2P(ref2dia) returning ref2pat;
	select hn,name,surname into theint,theset1,theset2 from patience where rowid=ref2pat;
	call TheCharCurrent(theset1) returning thename;
	call TheCharCurrent(theset2) returning thesurname;
	insert into pat_name values(theint,thename,thesurname);
	--patience part
	
	--doctor part
	select doctor into thedoctor from diagnosis where rowid=ref2dia;
	select doc_code,name,charge into thecode,theset1,theset3 from doctor where rowid=thedoctor;
	call TheCharCurrent(theset1) returning thename;
	call TheIntCurrent(theset3) returning theprice;	
	insert into bill values('doctor',thecode,thename,1,theprice);
	--doctor part

	--lab part
	foreach cursor1 for
		select lab into ref2lab from LRND where diagnosis=ref2dia
		select lab_code,name,price into thecode,thename,theset3 from lab_number where rowid=ref2lab;
		call TheIntCurrent(theset3) returning theprice;
		insert into bill values('lab',thecode,thename,1,theprice);
	end foreach;

	foreach cursor2 for
		select lab into ref2lab from LRCD where diagnosis=ref2dia
		select lab_code,name,price into thecode,thename,theset3 from lab_char where rowid=ref2lab;
		call TheIntCurrent(theset3) returning theprice;
		insert into bill values('lab',thecode,thename,1,theprice);
	end foreach;

	foreach cursor3 for
		select lab into ref2lab from LRPD where diagnosis=ref2dia
		select lab_code,name,price into thecode,thename,theset3 from lab_photo where rowid=ref2lab;
		call TheIntCurrent(theset3) returning theprice;
		insert into bill values('lab',thecode,thename,1,theprice);
	end foreach;
	--lab part

	--medicine part
	foreach cursor1 for
		select medicine,quantity into ref2med,theint from MOD where diagnosis=ref2dia
		select med_code,comm_name,price into thecode,theset1,theset3 from medicine where rowid=ref2med;
		call TheCharCurrent(theset1) returning thename;
		call TheIntCurrent(theset3) returning theprice;
		insert into bill values('medicine',thecode,thename,theint,theprice);
	end foreach;
	--medicine part
end procedure;

--execute procedure bill_diagnosis(257);
--select * from bill;
--select * from pat_name;
--select rowid,* from diagnosis where rowid = 257
--select rowid,* from lrnd 

--select * from doctor;
--select rowid,* from patience;
--select rowid,* from diagnosis;
--select * from LRND;
--select * from lab_number;

--select rowid,* from MOD;
--select rowid,* from medicine;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--RETURN CURRENT OF THESET (INT)
create function TheIntCurrent(theset collection)
	returning int;
	define therow row_int;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	foreach cursor1 for
		select * into therow from table(theset)
		if therow.t_sp==forever then
			return therow.int_at;
			exit foreach;
		end if;
	end foreach;
end function;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--RETURN CURRENT OF THESET (CHAR)
--drop function TheCharCurrent(collection);
create function TheCharCurrent(theset collection)
	returning char(50);
	define therow row_char;
	define global forever datetime year to minute default datetime(9999-12-31 23:59)year to minute;
	foreach cursor1 for
		select * into therow from table(theset)
		if therow.t_sp==forever then
			return therow.char_at;
			exit foreach;
		end if;
	end foreach;
end function;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--BILL FOR ADMISSION
create procedure bill_admission(ref2admit int);
	define ref2pat,theint,dateunit,thedoctor,thecode,theprice,thetotal,ref2med,ref2lab int;
	define x,y datetime year to minute;
	define thename,thesurname char(50);
	define theset1,theset2,theset3 collection;
	define therow_int row_int;
	define therow_char row_char;
	
	drop table bill;
	create table bill(attribute_name char(20),code int,name char(50),units int,price_unit int);
	drop table pat_name;
	create table pat_name(hn int,name char(50),surname char(50));

	select in_time,out_time into x,y from admission where rowid=ref2admit;
	let dateunit=cast(y as date)-cast(x as date);

	--patience part
	call A2P(ref2admit) returning ref2pat;
	select hn,name,surname into theint,theset1,theset2 from patience where rowid=ref2pat;
	call TheCharCurrent(theset1) returning thename;
	call TheCharCurrent(theset2) returning thesurname;
	insert into pat_name values(theint,thename,thesurname);
	--patience part

	--package part
	select package into theint from admission where rowid=ref2admit;
	select package_code,package_name,price into thecode,thename,theset3 from admission_package where rowid=theint;
	call TheIntCurrent(theset3) returning theprice;
	insert into bill values('package',thecode,thename,dateunit,theprice);
	--package part

	--room part
	select room into theint from admission where rowid=ref2admit;
	select room_id,price into thecode,theset3 from room where rowid=theint;
	call TheIntCurrent(theset3) returning theprice;
	insert into bill values('room',thecode,thecode,dateunit,theprice);
	--room part

	--doctor part
	select doctor into thedoctor from admission where rowid=ref2admit;
	select doc_code,name,charge into thecode,theset1,theset3 from doctor where rowid=thedoctor;
	call TheCharCurrent(theset1) returning thename;
	call TheIntCurrent(theset3) returning theprice;	
	insert into bill values('doctor',thecode,thename,dateunit,theprice);
	--doctor part

	--medicine part
	foreach cursor1 for
		select medicine,quantity into ref2med,theset3 from MOA where admission=ref2admit
		let thetotal=0;
		foreach curor2 for
			select * into therow_int from table(theset3)
			let thetotal=thetotal+therow_int.int_at;
		end foreach;
		select med_code,comm_name,price into thecode,theset1,theset3 from medicine where rowid=ref2med;
		call TheCharCurrent(theset1) returning thename;
		call TheIntCurrent(theset3) returning theprice;
		insert into bill values('medicine',thecode,thename,thetotal,theprice);
	end foreach;
	--medicine part

	--lab part
	foreach cursor1 for
		select lab,lab_result into ref2lab,theset3 from LRNA where admission=ref2admit
		let thetotal=0;
		foreach cursor2 for
			select * into therow_int from table(theset3)
			let thetotal=thetotal+1;
		end foreach;
		select lab_code,name,price into thecode,thename,theset3 from lab_number where rowid=ref2lab;
		call TheIntCurrent(theset3) returning theprice;
		insert into bill values('lab',thecode,thename,thetotal,theprice);
	end foreach;

	foreach cursor1 for
		select lab,lab_result into ref2lab,theset3 from LRCA where admission=ref2admit
		let thetotal=0;
		foreach cursor2 for
			select * into therow_char from table(theset3)
			let thetotal=thetotal+1;
		end foreach;
		select lab_code,name,price into thecode,thename,theset3 from lab_char where rowid=ref2lab;
		call TheIntCurrent(theset3) returning theprice;
		insert into bill values('lab',thecode,thename,thetotal,theprice);
	end foreach;

	foreach cursor1 for
		select lab,lab_result into ref2lab,theset3 from LRPA where admission=ref2admit
		let thetotal=0;
		foreach cursor2 for
			select * into therow_int from table(theset3)
			let thetotal=thetotal+1;
		end foreach;
		select lab_code,name,price into thecode,thename,theset3 from lab_photo where rowid=ref2lab;
		call TheIntCurrent(theset3) returning theprice;
		insert into bill values('lab',thecode,thename,thetotal,theprice);
	end foreach;
	--lab part
end procedure;

--execute procedure bill_admission(257);
--select rowid,* from bill;
--select rowid,* from pat_name;
--select rowid,* from admission where rowid = 257;

--select rowid,* from admission;
--select rowid,* from admission_package;
--select rowid,* from MOA;
--select rowid,* from LRNA;
--select rowid,* from LRCA;
--select rowid,* from LRPA;
--select rowid,* from medicine;
--select rowid,* from room;

--update admission set out_time='2001-12-31 23:59' where rowid=259
--update moa set medicine=257 where rowid=258
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--คำนวณจำนวนวันการadmit ถึงเวลาที่ใส่
create function numofDay(ref2admit int,to_date datetime year to minute)
	returning int;
	define x datetime year to minute;
	define dateunit int;

	select in_time into x from admission where rowid=ref2admit;
	let dateunit=cast(to_date as date)-cast(x as date);
	return dateunit;	
end function;

--execute function numofDay(258,'2001-3-15 20:00');
--select rowid,* from admission
---------------------------------------------------------------------------------------------------------------------------------------------------------------