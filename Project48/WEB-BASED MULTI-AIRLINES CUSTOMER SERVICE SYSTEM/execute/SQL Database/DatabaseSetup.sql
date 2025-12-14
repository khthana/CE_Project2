CREATE TABLE airline
(airlinecode		VARCHAR2(3)	PRIMARY KEY,
 airlinename		VARCHAR2(20)	,
 country		VARCHAR2(20)	);

CREATE TABLE AIRPLANESPEC
(mnf		VARCHAR2(15)	PRIMARY KEY,
 model		VARCHAR2(10)	,
 version	VARCHAR2(10)	,
 aisle		VARCHAR2(3)	,
 engine		VARCHAR2(5)	,
 seating	VARCHAR2(10)	,
 median		VARCHAR2(3)	,
 range		VARCHAR2(10)	,
 speed		VARCHAR2(20)	,
 design_engine	VARCHAR2(25)
);

CREATE TABLE airport
(airportcode		VARCHAR2(3)	PRIMARY KEY,
 airportname		VARCHAR2(20)	,
 airportcity		VARCHAR2(20)	,
 airportcountry		VARCHAR2(20)	,
 airporttax		NUMBER(5)	
);

CREATE TABLE available
(flightid		VARCHAR2(7),
 mdy			VARCHAR2(10)	,
 first			NUMBER(3)	,
 business		NUMBER(3)	,
 economy		NUMBER(3)	,
 dept_actual		VARCHAR2(20)	,
 arr_actual		VARCHAR2(20)	,
 PRIMARY KEY(flightid,mdy)
);

CREATE TABLE bookeddetails
(txid			VARCHAR2(7)	,
bookref			VARCHAR2(7)	,
memberid			VARCHAR2(7),
adult				NUMBER(1)	,
child				NUMBER(1)	,
totalcost			NUMBER(7)	,
ispay				VARCHAR2(1)	,
bookdatetime			VARCHAR2(30)	,
isvalid			VARCHAR2(1)	,
PRIMARY KEY(txid)
);

CREATE TABLE bookedflight
(txid			VARCHAR2(7)	,
bookref			VARCHAR2(7)	,
flightid			VARCHAR2(7)	,
mdy				VARCHAR2(10)	,
cabinclasstype			VARCHAR2(1)	,
webfaretype			VARCHAR2(1)	,
isreturn			VARCHAR2(1)	,
isvalid			VARCHAR2(1)	,
flightsequence			VARCHAR2(1)	,
PRIMARY KEY(bookref,flightid,txid)
);

CREATE TABLE cabinclasstype
(cabinclasstype		VARCHAR2(1)	PRIMARY KEY,
 cabinclassdesc		VARCHAR2(20)
);

CREATE TABLE cancel
(bookref			VARCHAR2(7)	primary key,
 canceltype			VARCHAR2(1)	,
 reason				VARCHAR2(200)	
);

CREATE TABLE flight
(flightid		VARCHAR2(7)	PRIMARY KEY,
 dept_airport		VARCHAR2(20),
 dept_time		VARCHAR2(11)	,
 arr_airport		VARCHAR2(20),
 arr_time		VARCHAR2(11)	,
 aircraft		VARCHAR2(5)	,
 duration		NUMBER(5,0)	,
 a_first		NUMBER(5,0)	,
 a_business		NUMBER(5,0)	,
 a_economy		NUMBER(5,0)	,
 c_first		NUMBER(5,0)	,
 c_business		NUMBER(5,0)	,
 c_economy		NUMBER(5,0)	,
 mile			NUMBER(8,0),
isnextday		VARCHAR2(1)
);

CREATE TABLE member
(memberid			VARCHAR2(7)	PRIMARY KEY,
 mname				VARCHAR2(15)	,
 pwd				VARCHAR2(15)	,
 encryptedpwd			VARCHAR2(50)	,
 firstname			VARCHAR2(20)	,
 lastname			VARCHAR2(15)	,
 sex				VARCHAR2(1)	,
 idcard				VARCHAR2(17)	,
 address			VARCHAR2(250)	,
 membertype			VARCHAR2(1)	REFERENCES membertype(membertype),
 admitdate			VARCHAR2(11)	,
 expiredate			VARCHAR2(11)	,
 country			VARCHAR2(20)	,
 isexpired			VARCHAR2(1)	,
 meal				VARCHAR2(30)	,
 email				VARCHAR2(30)	,
 homephone			VARCHAR2(15)	,
 businessphone			VARCHAR2(25)	,
 fax				VARCHAR2(15)	,
 age				VARCHAR2(1)
);

CREATE TABLE membertype
(membertype		VARCHAR2(1)	PRIMARY KEY,
 memberdesc		VARCHAR2(20),
 mileplus		number(	8,0),
 returnbookcost		number(	8,0)
);

CREATE TABLE webfaretype
(webfaretype		VARCHAR2(1)	PRIMARY KEY,
 webfaredesc		VARCHAR2(20),
 bookedtime		VARCHAR2(10),
 chargerate_a		Number(4),
 chargerate_b		Number(4)
);