  --  create database temporal
--         drop database temporal
--==============================================================================================
--    drop table Student;
CREATE TABLE STUDENT
(	Std_serial		Serial(100)  Primary key ,
	StdID		List(Row( StdID_at    CHAR(8)  ,Vtime_Start     DATE ,Vtime_End         DATE) NOT NULL),	
	PreName		 CHAR(5),
	FirstName		List(Row( FirstName_at    CHAR(30)  ,Vtime_Start     DATE ,Vtime_End         DATE) NOT NULL),	
	LastName 	List(Row( LastName_at    CHAR(30)  ,Vtime_Start    DATE ,Vtime_End          DATE) NOT NULL),	
	Major		List(Row( Major_at           CHAR(50)  ,Vtime_Start   DATE ,Vtime_End           DATE) NOT NULL ),	
	Address		List(Row( Address_at       CHAR(70)  ,Vtime_Start    DATE ,Vtime_End          DATE) NOT NULL)
);create table result(Name_at char(30),vts date,vte date);
Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);

--  select rowid,*   from Student
--  drop table Student;
--  drop table result;
--  drop table listresult;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--===============================================================================================
--  drop table Subject;
CREATE TABLE SUBJECT
(
	Sub_serial	Serial(200)  Primary key ,
	SubID		List(Row(SubID_at          CHAR(8),     Vtime_Start      DATE  ,Vtime_End    DATE) NOT NULL),	
	SubName		List(Row(SubName_at    CHAR(40),    Vtime_Start      DATE  ,Vtime_End   DATE) NOT NULL),
	Credit		List(Row(Credit_at           CHAR(1),      Vtime_Start      DATE  ,Vtime_End       DATE) NOT NULL),
	Teacher		List(Row(Teacher_at       CHAR(40),  Vtime_Start       DATE  ,Vtime_End   DATE) NOT NULL),
	Times		List(Row(Times_at           CHAR(40),   Vtime_Start      DATE  ,Vtime_End     DATE) NOT NULL),
	Books		List(Row(Books_at          CHAR(50),   Vtime_Start      DATE  ,Vtime_End      DATE) NOT NULL)
);

--   select rowid,*   from Subject
--   delete from subject where sub_serial >0
--   drop table Subject
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--   drop table Register;
CREATE TABLE REGISTER
(	Regis_serial	Serial (300),  
	Std_serial		Integer ,	
	Sub_serial	Integer ,		
	Term		Integer,	
	Year		Integer,	
	Grade		List(Row(Grade_at        CHAR(2),   Vtime_Start       DATE,Vtime_End       DATE) NOT NULL),	
	Section		List(Row(Section_at      CHAR(8),   Vtime_Start       DATE,Vtime_End       DATE) NOT NULL),
	Primary key(Regis_serial,Std_serial,Sub_serial,Term,Year)
);

--   select rowid,*   from  Register
--   delete from Register where Regis_serial >0
--   drop table Register
--insert into Register values(0,'100','200','1','2',"list{row('A','06/05/2001',null)}","list{row('B','08/08/2001',Null)}")
--  select rowid,*   from  Register;
--  select rowid,*  from  student
--  select rowid,*  from  subject 
