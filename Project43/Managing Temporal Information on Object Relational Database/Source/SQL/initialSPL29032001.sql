---ส่วนของ ภาษา   SPL      เขียนเสร็จแล้ว--------------------------------
--****************************************************************หา firstname ปัจจุบัน*******ได้แล้ว**************************************
--Drop Procedure Findname;
Create Procedure Findname(x_serial  integer);   --x_serial ='100'
define  name char(20);
define  n smallint;
define thelist  list(row(name1 varchar(30),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(30),vts2 date ,vte2 date);

	drop table result;
	create table result(First_name char(20) );
	SELECT Firstname INTO thelist  FROM Student
	WHERE std_serial = x_serial;

	Foreach cursor1 for
		select * into therow from table(thelist)
		if   (therow.vte2 is Null ) then
			LET name=therow.name2;
			insert into  result values (name);
		Exit Foreach;
		End if;				
	End Foreach
END PROCEDURE;
--   execute Procedure findname(100);
--   select rowid,* from result
--    select rowid,* from  student 
--*********************************************************************************************************************
--SELECT std_Serial  from Student
--*********************************************************ใส่ serial  หา current name  ของ table Student   ok************************************************
--Drop Function  CurrentStudent;
Create Function  CurrentStudent(x_serial  integer)   --x_serial ='100'
RETURNING  varchar(8) ,varchar(5) ,varchar(30) ,varchar(30) ,varchar(50),varchar(70);
DEFINE Output_StdID  varchar(8);
DEFINE Output_Prename varchar(5);
DEFINE Output_Firstname varchar(30);
DEFINE Output_Lastname varchar(30);
DEFINE Output_Major varchar(50);
DEFINE Output_Address varchar(70);

define  name char(30);
define  n smallint;
define check  integer;
define data  varchar(70);
define thelist1  collection;
define thelist2  collection;
define therow1    row(name1 varchar(70),vts1 date ,vte1 date);
define therow2    row(name2 varchar(70),vts2 date ,vte2 date);
Drop table result;
Create table result(StdID varchar(8),Prename varchar(5),First_name char(20),Output_Lastname varchar(20),Output_Major varchar(20),Output_Address varchar(40));
--StdID
	SELECT StdID INTO thelist1  FROM Student
	WHERE std_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow1 from table(thelist1)
		if   (therow1.vte1 is Null ) then
			LET Output_StdID=therow1.name1;
			LET check=1;
		else  LET data=therow1.name1;	
		Exit Foreach;
		End if;				
	End Foreach
	IF  check=0 then
	LET Output_StdID=data;
	End if;
--Prename
	LET Output_Prename=(SELECT Prename   FROM  Student
			WHERE std_serial = x_serial);
	

--Firstname
	SELECT Firstname INTO thelist2  FROM Student
	WHERE std_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_Firstname=therow2.name2;
			LET check=1;
		else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	IF  check=0 then
	LET Output_Firstname=data;
	End if;
--Lastname
SELECT Lastname INTO thelist2  FROM Student
	WHERE std_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_Lastname=therow2.name2;
			LET check=1;
		else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	IF  check=0 then
	LET Output_Lastname=data;
	End if;
--Major
SELECT Major  INTO thelist1  FROM Student
	WHERE std_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow1 from table(thelist1)
		if   (therow1.vte1 is Null ) then
			LET Output_Major=therow1.name1;
			LET check=1;
		else  LET data=therow1.name1;	
		Exit Foreach;
		End if;				
	End Foreach
	IF  check=0 then
	LET Output_Major=data;
	End if;
--Address
	SELECT Address INTO thelist2  FROM Student
	WHERE std_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_Address=therow2.name2;
			LET check=1;
		else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	IF  check=0 then
	LET Output_Address=data;
	End if;
insert into result values(Output_StdID,Output_Prename,Output_Firstname ,Output_Lastname,Output_Major ,Output_Address);
RETURN Output_StdID,Output_Prename,Output_Firstname ,Output_Lastname,Output_Major ,Output_Address with resume;
END FUNCTION;
--EXECUTE  FUNCTION CurrentStudent(100);
--select * from result
--Create table result(StdID varchar(8));
--select rowid,* from  student 
--*********************************************************************************end ใส่ serial  หา current name ของ table Student***********************************
--*******************************************************เรียกค้นเอาข้มูลปัจจุบัน
--Drop Function  CurrentStudentQuery;
Create Function  CurrentStudentQuery(x_serial  integer)   --x_serial ='100'
RETURNING  varchar(8) ,varchar(5) ,varchar(30) ,varchar(30) ,varchar(50),varchar(70);
DEFINE Output_StdID  varchar(8);
DEFINE Output_Prename varchar(5);
DEFINE Output_Firstname varchar(30);
DEFINE Output_Lastname varchar(30);
DEFINE Output_Major varchar(50);
DEFINE Output_Address varchar(70);

define  name char(30);
define  n smallint;
define check  integer;
define data  varchar(70);
define thelist1  collection;
define thelist2  collection;
define therow1    row(name1 varchar(70),vts1 date ,vte1 date);
define therow2    row(name2 varchar(70),vts2 date ,vte2 date);
Drop table result;
Create table result(StdID varchar(8),Prename varchar(5),First_name char(20),Output_Lastname varchar(20),Output_Major varchar(20),Output_Address varchar(40));
--StdID
	SELECT StdID INTO thelist1  FROM Student
	WHERE std_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow1 from table(thelist1)
		if   (therow1.vte1 is Null ) then
			LET Output_StdID=therow1.name1;
			LET check=1;
		--else  LET data=therow1.name1;	
		Exit Foreach;
		End if;				
	End Foreach
	--IF  check=0 then
	--LET Output_StdID=data;
	--End if;
--Prename
	LET Output_Prename=(SELECT Prename   FROM  Student
			WHERE std_serial = x_serial);
	

--Firstname
	SELECT Firstname INTO thelist2  FROM Student
	WHERE std_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_Firstname=therow2.name2;
			LET check=1;
		--else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	--IF  check=0 then
	--LET Output_Firstname=data;
	--End if;
--Lastname
SELECT Lastname INTO thelist2  FROM Student
	WHERE std_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_Lastname=therow2.name2;
			LET check=1;
		--else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	--IF  check=0 then
	--LET Output_Lastname=data;
	--End if;
--Major
SELECT Major  INTO thelist1  FROM Student
	WHERE std_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow1 from table(thelist1)
		if   (therow1.vte1 is Null ) then
			LET Output_Major=therow1.name1;
			LET check=1;
		--else  LET data=therow1.name1;	
		Exit Foreach;
		End if;				
	End Foreach
	--IF  check=0 then
	--LET Output_Major=data;
	--End if;
--Address
	SELECT Address INTO thelist2  FROM Student
	WHERE std_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_Address=therow2.name2;
			LET check=1;
		--else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	--IF  check=0 then
	--LET Output_Address=data;
	--End if;
insert into result values(Output_StdID,Output_Prename,Output_Firstname ,Output_Lastname,Output_Major ,Output_Address);
RETURN Output_StdID,Output_Prename,Output_Firstname ,Output_Lastname,Output_Major ,Output_Address with resume;
END FUNCTION;
--EXECUTE  FUNCTION CurrentStudentQuery(100);
--select * from result
--Create table result(StdID varchar(8));
--select rowid,* from  student 



--*********************************************************ใส่ serial  หา current name  ของ table Subject ************************************************
--Drop Function  CurrentSubject;
Create Function  CurrentSubject(x_serial  integer)   --x_serial ='100'
RETURNING  varchar(8) ,varchar(40) ,varchar(1) ,varchar(40) ,varchar(40),varchar(50);
DEFINE Output_SubID  varchar(8);
DEFINE Output_Subname varchar(40);
DEFINE Output_Credit  varchar(1);
DEFINE Output_Teacher  varchar(40);
DEFINE Output_Times  varchar(40);
DEFINE Output_Books varchar(50);
define check  integer;
define data  varchar(70);
define  name char(30);
define  n smallint;
define thelist1  collection;
define thelist2  collection;
define therow1    row(name1 varchar(50),vts1 date ,vte1 date);
define therow2    row(name2 varchar(50),vts2 date ,vte2 date);
Drop table result;
Create table result(SubID varchar(8),Subname varchar(40),Credit varchar(1),Teacher varchar(40),Times varchar(40),Books varchar(50));
--SubID
	SELECT SubID INTO thelist2  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_SubID=therow2.name2;
			LET check=1;
		else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	IF  check=0 then
	LET Output_SubID=data;
	End if;
--Subname
	SELECT Subname INTO thelist1  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow1 from table(thelist1)
		if   (therow1.vte1 is Null ) then
			LET Output_Subname=therow1.name1;
			LET check=1;
		else  LET Output_Subname=therow1.name1;
		Exit Foreach;
		End if;				
	End Foreach
	IF  check=0 then                   
	LET Output_Subname=data;
	End if;
--Credit
SELECT Credit INTO thelist1  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow1  from table(thelist1)
		if   (therow1.vte1 is Null ) then
			LET Output_Credit=therow1.name1;
			LET check=1;
		else  LET data=therow1.name1;	
		Exit Foreach;
		End if;				
	End Foreach
	IF  check=0 then
	LET Output_Credit=data;
	End if;
--Teacher
SELECT Teacher INTO thelist2  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_Teacher=therow2.name2;
			LET check=1;
		else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	IF  check=0 then
	LET Output_Teacher=data;
	End if;
--Times
SELECT Times INTO thelist2  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_Times=therow2.name2;
			LET check=1;
		else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	IF  check=0 then
	LET Output_Times=data;
	End if;
--Books
SELECT Books INTO thelist1  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow1 from table(thelist1)
		if   (therow1.vte1 is Null ) then
			LET Output_Books=therow1.name1;
			LET check=1;
		else  LET data=therow1.name1;	
		Exit Foreach;
		End if;				
	End Foreach
	IF  check=0 then
	LET Output_Books=data;
	End if;
Insert into result values(Output_SubID,Output_Subname,Output_Credit,Output_Teacher,Output_Times ,Output_Books);
RETURN Output_SubID,Output_Subname,Output_Credit ,Output_Teacher,Output_Times ,Output_Books with resume;
END FUNCTION;
--     EXECUTE  FUNCTION CurrentSubject(200);
--    select rowid,* from result
--    select rowid, teacher  from result
--    select rowid,* from  Subject
--*********************************************************************************end ใส่ serial  หา current name ของ table Subject***********************************

---Drop Function  CurrentSubjectQuery;
Create Function  CurrentSubjectQuery(x_serial  integer)   --x_serial ='100'
RETURNING  varchar(8) ,varchar(40) ,varchar(1) ,varchar(40) ,varchar(40),varchar(50);
DEFINE Output_SubID  varchar(8);
DEFINE Output_Subname varchar(40);
DEFINE Output_Credit  varchar(1);
DEFINE Output_Teacher  varchar(40);
DEFINE Output_Times  varchar(40);
DEFINE Output_Books varchar(50);
define check  integer;
define data  varchar(70);
define  name char(30);
define  n smallint;
define thelist1  collection;
define thelist2  collection;
define therow1    row(name1 varchar(50),vts1 date ,vte1 date);
define therow2    row(name2 varchar(50),vts2 date ,vte2 date);
Drop table result;
Create table result(SubID varchar(8),Subname varchar(40),Credit varchar(1),Teacher varchar(40),Times varchar(40),Books varchar(50));
--SubID
	SELECT SubID INTO thelist2  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_SubID=therow2.name2;
			LET check=1;
		--else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	--IF  check=0 then
	--LET Output_SubID=data;
	--End if;
--Subname
	SELECT Subname INTO thelist1  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow1 from table(thelist1)
		if   (therow1.vte1 is Null ) then
			LET Output_Subname=therow1.name1;
			LET check=1;
		--else  LET Output_Subname=therow1.name1;
		Exit Foreach;
		End if;				
	End Foreach
	--IF  check=0 then                   
	--LET Output_Subname=data;
	--End if;
--Credit
SELECT Credit INTO thelist1  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow1  from table(thelist1)
		if   (therow1.vte1 is Null ) then
			LET Output_Credit=therow1.name1;
			LET check=1;
		--else  LET data=therow1.name1;	
		Exit Foreach;
		End if;				
	End Foreach
	--IF  check=0 then
	--LET Output_Credit=data;
	--End if;
--Teacher
SELECT Teacher INTO thelist2  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_Teacher=therow2.name2;
			LET check=1;
		--else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	--IF  check=0 then
	--LET Output_Teacher=data;
	--End if;
--Times
SELECT Times INTO thelist2  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow2 from table(thelist2)
		if   (therow2.vte2 is Null ) then
			LET Output_Times=therow2.name2;
			LET check=1;
		--else  LET data=therow2.name2;	
		Exit Foreach;
		End if;				
	End Foreach
	--IF  check=0 then
	--LET Output_Times=data;
	--End if;
--Books
SELECT Books INTO thelist1  FROM Subject
	WHERE sub_serial = x_serial;
	LET check = 0;
	Foreach cursor1 for
		select * into therow1 from table(thelist1)
		if   (therow1.vte1 is Null ) then
			LET Output_Books=therow1.name1;
			LET check=1;
		--else  LET data=therow1.name1;	
		Exit Foreach;
		End if;				
	End Foreach
	--IF  check=0 then
	--LET Output_Books=data;
	--End if;
Insert into result values(Output_SubID,Output_Subname,Output_Credit,Output_Teacher,Output_Times ,Output_Books);
RETURN Output_SubID,Output_Subname,Output_Credit ,Output_Teacher,Output_Times ,Output_Books with resume;
END FUNCTION;
--     EXECUTE  FUNCTION CurrentSubjectQuery(200);
--    select rowid,* from result
--    select rowid, teacher  from result
--    select rowid,* from  Subject

--*********************************************************###################### Update student 
---รหัส นศ
--Drop Procedure UpdateStdID;
Create Procedure UpdateStdID(data1 varchar(8) ,ts date ,tp date,x_serial  varchar(5));
define  n smallint;
define thelist  list(row(name1 varchar(8),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(8),vts2 date ,vte2 date);
	SELECT StdID  INTO thelist  FROM Student
		WHERE std_serial = x_serial;

	SELECT CARDINALITY(StdID)  INTO n  FROM  student
		WHERE  std_serial =x_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Student SET  StdID= thelist
		WHERE  std_serial=x_serial;
END PROCEDURE;
--execute Procedure UpdateStdID('666666','05/05/2000',Null,'100');
--select rowid,* from  student 

--ชื่อ
--Drop Procedure UpdateFirstname;
Create Procedure UpdateFirstname(data1 varchar(30) ,ts date ,tp date,x_serial  integer);
define  n smallint;
define thelist  list(row(name1 varchar(30),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(30),vts2 date ,vte2 date);
	SELECT Firstname  INTO thelist  FROM Student
		WHERE std_serial = x_serial;

	SELECT CARDINALITY(Firstname)  INTO n  FROM  student
		WHERE  std_serial =x_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Student SET  Firstname= thelist
		WHERE  std_serial=x_serial;
END PROCEDURE;
---execute Procedure UpdateFirstname('Tuksin','05/05/2000',Null,'100');
---select rowid,* from  student 

--นามสกุล
---Drop Procedure UpdateLastname;
Create Procedure UpdateLastname(data1 varchar(30) ,ts date ,tp date,x_serial  integer);
define  n smallint;
define thelist  list(row(name1 varchar(30),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(30),vts2 date ,vte2 date);
	SELECT Lastname INTO thelist  FROM Student
		WHERE std_serial = x_serial;

	SELECT CARDINALITY(Lastname)  INTO n  FROM  student
		WHERE  std_serial =x_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Student SET  Lastname= thelist
		WHERE  std_serial=x_serial;
END PROCEDURE;
--execute Procedure UpdateLastname('Tuksin','05/05/2000',Null,'100');
--select rowid,* from  student 


--Major
--Drop Procedure UpdateMajor;
Create Procedure UpdateMajor(data1 varchar(40) ,ts date ,tp date,x_serial  integer);
define  n smallint;
define thelist  list(row(name1 varchar(40),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(40),vts2 date ,vte2 date);
	SELECT Major INTO thelist  FROM Student
		WHERE std_serial = x_serial;

	SELECT CARDINALITY(Major)  INTO n  FROM  student
		WHERE  std_serial =x_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Student SET Major= thelist
		WHERE  std_serial=x_serial;
END PROCEDURE;
--execute Procedure UpdateMajor('Tuksin','05/05/2000',Null,'100');
--select rowid,* from  student 


--Address
--Drop Procedure UpdateAddress;
Create Procedure UpdateAddress(data1 varchar(50) ,ts date ,tp date,x_serial  integer);
define  n smallint;
define thelist  list(row(name1 varchar(50),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(50),vts2 date ,vte2 date);
	SELECT Address INTO thelist  FROM Student
		WHERE std_serial = x_serial;

	SELECT CARDINALITY(Address)  INTO n  FROM  student
		WHERE  std_serial =x_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Student SET Address= thelist
		WHERE  std_serial=x_serial;
END PROCEDURE;
--execute Procedure UpdateAddress('Tuksin','05/05/2000',Null,'100');
--select rowid,* from  student 

--#################################################################  Update Subject

--รหัสวิชา
--Drop Procedure UpdateSubID;
Create Procedure UpdateSubID(data1 varchar(30) ,ts date ,tp date,x_serial  integer);
define  n smallint;
define thelist  list(row(name1 varchar(30),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(30),vts2 date ,vte2 date);
	SELECT SubID  INTO thelist  FROM Subject
		WHERE sub_serial = x_serial;

	SELECT CARDINALITY(SubID)  INTO n  FROM Subject
		WHERE  sub_serial =x_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Subject SET SubID= thelist
		WHERE  sub_serial=x_serial;
END PROCEDURE;
--execute Procedure UpdateSubID('12356','05/05/2000',Null,'200');
--select rowid,* from  Subject

--ชื่อ วิชา
--Drop Procedure UpdateSubname;
Create Procedure UpdateSubname(data1 varchar(40) ,ts date ,tp date,x_serial  integer);
define  n smallint;
define thelist  list(row(name1 varchar(40),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(40),vts2 date ,vte2 date);
	SELECT Subname  INTO thelist  FROM Subject
		WHERE sub_serial = x_serial;

	SELECT CARDINALITY(Subname)  INTO n  FROM Subject
		WHERE  sub_serial =x_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Subject SET Subname= thelist
		WHERE  sub_serial=x_serial;
END PROCEDURE;
--execute Procedure UpdateSubname('12356','05/05/2000',Null,'200');
--select rowid,* from  Subject


--  Credit
--Drop Procedure UpdateCredit;
Create Procedure UpdateCredit(data1 varchar(40) ,ts date ,tp date,x_serial  integer);
define  n smallint;
define thelist  list(row(name1 varchar(40),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(40),vts2 date ,vte2 date);
	SELECT Credit  INTO thelist  FROM Subject
		WHERE sub_serial = x_serial;

	SELECT CARDINALITY(Credit)  INTO n  FROM Subject
		WHERE  sub_serial =x_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Subject SET Credit= thelist
		WHERE  sub_serial=x_serial;
END PROCEDURE;
--execute Procedure UpdateCredit('3','05/05/2000',Null,'200');
--select rowid,* from  Subject

--  Teacher
--Drop Procedure UpdateTeachert;
Create Procedure UpdateTeacher(data1 varchar(40) ,ts date ,tp date,x_serial  integer);
define  n smallint;
define thelist  list(row(name1 varchar(40),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(40),vts2 date ,vte2 date);
	SELECT Teacher  INTO thelist  FROM Subject
		WHERE sub_serial = x_serial;

	SELECT CARDINALITY(Teacher)  INTO n  FROM Subject
		WHERE  sub_serial =x_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Subject SET Teacher= thelist
		WHERE  sub_serial=x_serial;
END PROCEDURE;
--execute Procedure UpdateTeacher('Tuksin3','05/05/2000',Null,'200');
--select rowid,* from  Subject


--  Times
--Drop Procedure UpdateTimes;
Create Procedure UpdateTimes(data1 varchar(40) ,ts date ,tp date,x_serial  integer);
define  n smallint;
define thelist  list(row(name1 varchar(40),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(40),vts2 date ,vte2 date);
	SELECT Times  INTO thelist  FROM Subject
		WHERE sub_serial = x_serial;

	SELECT CARDINALITY(Times)  INTO n  FROM Subject
		WHERE  sub_serial =x_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Subject SET Times= thelist
		WHERE  sub_serial=x_serial;
END PROCEDURE;
--execute Procedure UpdateTimes('12.30-16.30 (Thuesday)','05/05/2000',Null,'200');
--select rowid,* from  Subject



--  Books
--Drop Procedure UpdateBooks;
Create Procedure UpdateBooks(data1 varchar(40) ,ts date ,tp date,x_serial  integer);
define  n smallint;
define thelist  list(row(name1 varchar(40),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(40),vts2 date ,vte2 date);
	SELECT Books  INTO thelist  FROM Subject
		WHERE sub_serial = x_serial;

	SELECT CARDINALITY(Books)  INTO n  FROM Subject
		WHERE  sub_serial =x_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Subject SET Books= thelist
		WHERE  sub_serial=x_serial;
END PROCEDURE;
--execute Procedure UpdateBooks('Sports  book','05/05/2000',Null,'200');
--select rowid,* from  Subject
--###################################################### Query  ข้อมูลที่อยู่ใน list แต่ล่ะตัว  student
--หาข้อมูลใน StdID  เก็บใน  result    return coun *
--Drop Function GetStdID;  
Create Function  GetStdID(x_serial  integer)   --x_serial ='100'
RETURNING int;
DEFINE n  int;
define thelist  collection;
define therow    row(at  varchar(70),vts date ,vte date);

Drop table ListResult;
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

	SELECT StdID  INTO thelist  FROM Student
	WHERE std_serial = x_serial;
	
	Foreach cursor1 for
		select * into therow from table(thelist)
		Insert into Listresult values(therow.at,therow.vts,therow.vte);
	End Foreach
LET n=(select count(*) from Listresult);

RETURN   n;
END FUNCTION ;
--EXECUTE FUNCTION GetStdID('101'); select * from Listresult;
--select * from Listresult;
--select count(*) from Listresult
--select * from student

--  หา firstname 
--Drop Function GetFirstname;  
Create Function  GetFirstname(x_serial  integer)   --x_serial ='100'
RETURNING int;
DEFINE n  int;
define thelist  collection;
define therow    row(at  varchar(70),vts date ,vte date);
Drop table ListResult;
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

	SELECT Firstname  INTO thelist  FROM Student
	WHERE std_serial = x_serial;
	
	Foreach cursor1 for
		select * into therow from table(thelist)
		Insert into ListResult values(therow.at,therow.vts,therow.vte);
	End Foreach
LET n=(select count(*) from ListResult); 
RETURN n ;
END FUNCTION ;
--EXECUTE FUNCTION GetFirstname('100'); 
--select * from ListResult;


--  หา Lastname 
--Drop Function GetLastname;  
Create Function  GetLastname(x_serial  integer)   --x_serial ='100'
RETURNING int;
DEFINE n  int;
define thelist  collection;
define therow    row(at  varchar(70),vts date ,vte date);
Drop table ListResult;
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

	SELECT Lastname  INTO thelist  FROM Student
	WHERE std_serial = x_serial;
	
	Foreach cursor1 for
		select * into therow from table(thelist)
		Insert into ListResult values(therow.at,therow.vts,therow.vte);
	End Foreach
LET n=(select count(*) from ListResult); 
RETURN n ;
END FUNCTION ;
--EXECUTE FUNCTION GetLastname('100'); 
--select * from ListResult;

--  หา Major 
--Drop Function GetMajor;  
Create Function  GetMajor(x_serial  integer)   --x_serial ='100'
RETURNING int;
DEFINE n  int;
define thelist  collection;
define therow    row(at  varchar(70),vts date ,vte date);
Drop table ListResult;
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

	SELECT Major   INTO thelist  FROM Student
	WHERE std_serial = x_serial;
	
	Foreach cursor1 for
		select * into therow from table(thelist)
		Insert into ListResult values(therow.at,therow.vts,therow.vte);
	End Foreach
LET n=(select count(*) from ListResult); 
RETURN n ;
END FUNCTION ;
--EXECUTE FUNCTION GetMajor('100'); 
--select * from ListResult;


--  หา Address 
--Drop Function GetAddress;  
Create Function  GetAddress(x_serial  integer)   --x_serial ='100'
RETURNING int;
DEFINE n  int;
define thelist  collection;
define therow    row(at  varchar(70),vts date ,vte date);
Drop table ListResult;
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

	SELECT Address   INTO thelist  FROM Student
	WHERE std_serial = x_serial;
	
	Foreach cursor1 for
		select * into therow from table(thelist)
		Insert into ListResult values(therow.at,therow.vts,therow.vte);
	End Foreach
LET n=(select count(*) from ListResult); 
RETURN n ;
END FUNCTION ;
--EXECUTE FUNCTION GetAddress('100'); 
--select * from ListResult;

--###################################################### Query  ข้อมูลที่อยู่ใน list แต่ล่ะตัว  Subject
--  หา SubID 
--Drop Function GetSubID;  
Create Function  GetSubID(x_serial  integer)   --x_serial ='100'
RETURNING int;
DEFINE n  int;
define thelist  collection;
define therow    row(at  varchar(70),vts date ,vte date);
Drop table ListResult;
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

	SELECT SubID   INTO thelist  FROM Subject
	WHERE sub_serial = x_serial;
	
	Foreach cursor1 for
		select * into therow from table(thelist)
		Insert into ListResult values(therow.at,therow.vts,therow.vte);
	End Foreach
LET n=(select count(*) from ListResult); 
RETURN n ;
END FUNCTION ;
--EXECUTE FUNCTION GetSubID('200'); 
--select * from ListResult;
--select * from Subject;

--  หา Subname
--Drop Function GetSubname;  
Create Function  GetSubname(x_serial  integer)   --x_serial ='100'
RETURNING int;
DEFINE n  int;
define thelist  collection;
define therow    row(at  varchar(70),vts date ,vte date);
Drop table ListResult;
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

	SELECT Subname   INTO thelist  FROM Subject
	WHERE sub_serial = x_serial;
	
	Foreach cursor1 for
		select * into therow from table(thelist)
		Insert into ListResult values(therow.at,therow.vts,therow.vte);
	End Foreach
LET n=(select count(*) from ListResult); 
RETURN n ;
END FUNCTION ;
--EXECUTE FUNCTION GetSubname('200'); 
--select * from ListResult;


--  หา Credit
--Drop Function GetCredit;  
Create Function  GetCredit(x_serial  integer)   --x_serial ='100'
RETURNING int;
DEFINE n  int;
define thelist  collection;
define therow    row(at  varchar(70),vts date ,vte date);
Drop table ListResult;
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

	SELECT Credit   INTO thelist  FROM Subject
	WHERE sub_serial = x_serial;
	
	Foreach cursor1 for
		select * into therow from table(thelist)
		Insert into ListResult values(therow.at,therow.vts,therow.vte);
	End Foreach
LET n=(select count(*) from ListResult); 
RETURN n ;
END FUNCTION ;
--EXECUTE FUNCTION GetCredit('200'); 
--select * from ListResult;


--  หา Teacher
--Drop Function GetTeacher;  
Create Function  GetTeacher(x_serial  integer)   --x_serial ='100'
RETURNING int;
DEFINE n  int;
define thelist  collection;
define therow    row(at  varchar(70),vts date ,vte date);
Drop table ListResult;
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

	SELECT Teacher   INTO thelist  FROM Subject
	WHERE sub_serial = x_serial;
	
	Foreach cursor1 for
		select * into therow from table(thelist)
		Insert into ListResult values(therow.at,therow.vts,therow.vte);
	End Foreach
LET n=(select count(*) from ListResult); 
RETURN n ;
END FUNCTION ;
--EXECUTE FUNCTION GetTeacher('200'); 
--select * from ListResult;

--  หา Times
--Drop Function GetTimes;  
Create Function  GetTimes(x_serial  integer)   --x_serial ='100'
RETURNING int;
DEFINE n  int;
define thelist  collection;
define therow    row(at  varchar(70),vts date ,vte date);
Drop table ListResult;
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

	SELECT Times   INTO thelist  FROM Subject
	WHERE sub_serial = x_serial;
	
	Foreach cursor1 for
		select * into therow from table(thelist)
		Insert into ListResult values(therow.at,therow.vts,therow.vte);
	End Foreach
LET n=(select count(*) from ListResult); 
RETURN n ;
END FUNCTION ;
--EXECUTE FUNCTION GetTimes('200'); 
--select * from ListResult;


--  หา Books
--Drop Function GetBooks;  
Create Function  GetBooks(x_serial  integer)   --x_serial ='100'
RETURNING int;
DEFINE n  int;
define thelist  collection;
define therow    row(at  varchar(70),vts date ,vte date);
Drop table ListResult;
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

	SELECT Books   INTO thelist  FROM Subject
	WHERE sub_serial = x_serial;
	
	Foreach cursor1 for
		select * into therow from table(thelist)
		Insert into ListResult values(therow.at,therow.vts,therow.vte);
	End Foreach
LET n=(select count(*) from ListResult); 
RETURN n ;
END FUNCTION ;
--EXECUTE FUNCTION GetBooks('200'); 
--select * from ListResult;
--select * from student
--select * from subject
--======================================================================Delete student

--Drop Procedure DeleteStudent;
Create Procedure DeleteStudent(x_serial integer,vte  date);
define  n smallint;

define thelist1  collection;
define thelist2  collection;
define thelist3  collection;
define thelist4  collection;
define thelist5  collection;
define therow1    row(name1 varchar(50),vts1 date ,vte1 date);
define therow2    row(name2 varchar(50),vts2 date ,vte2 date);
define therow3    row(name3 varchar(50),vts3 date ,vte3 date);
define therow4    row(name4 varchar(50),vts4 date ,vte4 date);
define therow5    row(name5 varchar(50),vts5 date ,vte5 date);
--stdID
	SELECT StdID  INTO thelist1  FROM Student
		WHERE std_serial = x_serial;

	FOREACH cursor1 FOR
		SELECT * INTO therow1  FROM TABLE(thelist1)
		IF (therow1.vte1 is NULL) THEN
			LET  therow1.vte1 =vte;	
			UPDATE TABLE(thelist1)(x)  SET   x= therow1 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

UPDATE Student SET  StdID= thelist1
		WHERE  std_serial=x_serial;

--Firstname
SELECT Firstname  INTO thelist2  FROM Student
		WHERE std_serial = x_serial;

	FOREACH cursor1 FOR
		SELECT * INTO therow2  FROM TABLE(thelist2)
		IF (therow2.vte2 is NULL) THEN
			LET  therow2.vte2 =vte;	
			UPDATE TABLE(thelist2)(x)  SET   x= therow2 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

UPDATE Student SET Firstname = thelist2
		WHERE  std_serial=x_serial;

--Lastname
SELECT Lastname  INTO thelist3  FROM Student
		WHERE std_serial = x_serial;

	FOREACH cursor1 FOR
		SELECT * INTO therow3  FROM TABLE(thelist3)
		IF (therow3.vte3 is NULL) THEN
			LET  therow3.vte3 =vte;	
			UPDATE TABLE(thelist3)(x)  SET   x= therow3 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

UPDATE Student SET Lastname = thelist3
		WHERE  std_serial=x_serial;


--Major
SELECT Major  INTO thelist4  FROM Student
		WHERE std_serial = x_serial;

	FOREACH cursor1 FOR
		SELECT * INTO therow4  FROM TABLE(thelist4)
		IF (therow4.vte4  is NULL) THEN
			LET  therow4.vte4 =vte;	
			UPDATE TABLE(thelist4)(x)  SET   x= therow4 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

UPDATE Student SET Major = thelist4
		WHERE  std_serial=x_serial;


--Address
SELECT Address  INTO thelist5  FROM Student
		WHERE std_serial = x_serial;

	FOREACH cursor1 FOR
		SELECT * INTO therow5  FROM TABLE(thelist5)
		IF (therow5.vte5  is NULL) THEN
			LET  therow5.vte5 =vte;	
			UPDATE TABLE(thelist5)(x)  SET   x= therow5 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

UPDATE Student SET Address = thelist5
		WHERE  std_serial=x_serial;

END PROCEDURE;
--execute Procedure DeleteStudent('100','06/06/2001');
--select rowid,* from  student 

--======================================================================Delete subject

--Drop Procedure DeleteSubject;
Create Procedure DeleteSubject(x_serial integer,vte  date);
define  n smallint;

define thelist1  collection;
define thelist2  collection;
define thelist3  collection;
define thelist4  collection;
define thelist5  collection;
define therow1    row(name1 varchar(50),vts1 date ,vte1 date);
define therow2    row(name2 varchar(50),vts2 date ,vte2 date);
define therow3    row(name3 varchar(50),vts3 date ,vte3 date);
define therow4    row(name4 varchar(50),vts4 date ,vte4 date);
define therow5    row(name5 varchar(50),vts5 date ,vte5 date);
--subID
	SELECT SubID  INTO thelist1  FROM Subject
		WHERE sub_serial = x_serial;

	FOREACH cursor1 FOR
		SELECT * INTO therow1  FROM TABLE(thelist1)
		IF (therow1.vte1 is NULL) THEN
			LET  therow1.vte1 =vte;	
			UPDATE TABLE(thelist1)(x)  SET   x= therow1 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

UPDATE Subject SET  SubID= thelist1
		WHERE  sub_serial=x_serial;

--Subname
SELECT Subname  INTO thelist2  FROM Subject
		WHERE sub_serial = x_serial;

	FOREACH cursor1 FOR
		SELECT * INTO therow2  FROM TABLE(thelist2)
		IF (therow2.vte2 is NULL) THEN
			LET  therow2.vte2 =vte;	
			UPDATE TABLE(thelist2)(x)  SET   x= therow2 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

UPDATE Subject SET Subname = thelist2
		WHERE  sub_serial=x_serial;

--Credit
SELECT Credit  INTO thelist3  FROM Subject
		WHERE sub_serial = x_serial;

	FOREACH cursor1 FOR
		SELECT * INTO therow3  FROM TABLE(thelist3)
		IF (therow3.vte3 is NULL) THEN
			LET  therow3.vte3 =vte;	
			UPDATE TABLE(thelist3)(x)  SET   x= therow3 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

UPDATE Subject  SET Credit = thelist3
		WHERE  sub_serial=x_serial;


--Teacher
SELECT Teacher  INTO thelist4  FROM Subject
		WHERE sub_serial = x_serial;

	FOREACH cursor1 FOR
		SELECT * INTO therow4  FROM TABLE(thelist4)
		IF (therow4.vte4  is NULL) THEN
			LET  therow4.vte4 =vte;	
			UPDATE TABLE(thelist4)(x)  SET   x= therow4 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

UPDATE Subject  SET Teacher = thelist4
		WHERE  sub_serial=x_serial;


--Times
SELECT Times  INTO thelist5  FROM Subject
		WHERE sub_serial = x_serial;

	FOREACH cursor1 FOR
		SELECT * INTO therow5  FROM TABLE(thelist5)
		IF (therow5.vte5  is NULL) THEN
			LET  therow5.vte5 =vte;	
			UPDATE TABLE(thelist5)(x)  SET   x= therow5 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

UPDATE Subject  SET Times = thelist5
		WHERE  sub_serial=x_serial;

--Books
SELECT Books  INTO thelist5  FROM Subject
		WHERE sub_serial = x_serial;

	FOREACH cursor1 FOR
		SELECT * INTO therow5  FROM TABLE(thelist5)
		IF (therow5.vte5  is NULL) THEN
			LET  therow5.vte5 =vte;	
			UPDATE TABLE(thelist5)(x)  SET   x= therow5 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH

UPDATE Subject  SET Books = thelist5
		WHERE  sub_serial=x_serial;

END PROCEDURE;
--execute Procedure DeleteSubject('200','06/06/2001');
--select rowid,* from  subject


--====================================================================== Update Register   ---> Grade
--- เกรด 
--Drop Procedure UpdateGrade;
Create Procedure UpdateGrade(data1 varchar(40) ,ts date ,tp date,xstd_serial  integer,xsub_serial integer,term_serial  integer,Year_serial integer);
define  n smallint;
define thelist  list(row(name1 varchar(40),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(40),vts2 date ,vte2 date);
	SELECT Grade  INTO thelist  FROM Register
		WHERE Std_serial =xstd_serial and  sub_serial = xsub_serial and Term=term_serial and  Year = Year_serial;

	SELECT CARDINALITY(Grade)  INTO n  FROM Register
		WHERE  Std_serial =xstd_serial and  sub_serial = xsub_serial and Term=term_serial and  Year = Year_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH
	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Register SET Grade= thelist
		WHERE Std_serial =xstd_serial and  sub_serial = xsub_serial and Term=term_serial and  Year = Year_serial;
END PROCEDURE;
--execute Procedure UpdateGrade('A','05/05/2000',Null,'100','200','1','1');
--select * from register


--- section 
--Drop Procedure UpdateSection;
Create Procedure UpdateSection(data1 varchar(40) ,ts date ,tp date,xstd_serial  integer,xsub_serial integer,term_serial  integer,Year_serial integer);
define  n smallint;
define thelist  list(row(name1 varchar(40),vts1 date ,vte1 date) not null);
define therow     row(name2 varchar(40),vts2 date ,vte2 date);
	SELECT Section  INTO thelist  FROM Register
		WHERE Std_serial =xstd_serial and  sub_serial = xsub_serial and Term=term_serial and  Year = Year_serial;

	SELECT CARDINALITY(Section)  INTO n  FROM Register
		WHERE  Std_serial =xstd_serial and  sub_serial = xsub_serial and Term=term_serial and  Year = Year_serial;
	FOREACH cursor1 FOR
		SELECT * INTO therow  FROM TABLE(thelist)
		IF (therow.vte2 is NULL) THEN
			LET  therow.vte2 =ts;	
			UPDATE TABLE(thelist)(x)  SET   x= therow 
				WHERE CURRENT OF cursor1;
			EXIT FOREACH;
		END IF;
	END FOREACH
	LET n=n+1;
Insert AT n  INTO TABLE(thelist) Values(Row(data1,ts,Null ) );
UPDATE Register SET Section= thelist
		WHERE Std_serial =xstd_serial and  sub_serial = xsub_serial and Term=term_serial and  Year = Year_serial;
END PROCEDURE;
--    execute Procedure UpdateSection('1','05/05/2000',Null,'100','200','1','1');
--    select * from register
--    select * from listresult
----    select distinct std_serial   from  Register where sub_serial =200
--  select * from student
--  select * from  subject
