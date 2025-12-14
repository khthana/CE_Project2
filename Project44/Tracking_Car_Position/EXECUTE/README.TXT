ขั้นตอนการติดตั้ง
1. Copy File gps.exe และ  map.bmp ลงบนเครื่องใน Directory เดียวกัน
2. สร้างฐานข้อมูลมีรายละเอียดดังนี้
	ตาราง gps 
	code 	 	number 		10
	latitude 	char 		10
	direction_n 	char 		10
	longitude 	char 		10
	direction_e 	char 		10
	speed 		char 		10
	time 		char 		10
	that_date 	char 		10
	track_id 	number 		10
	notice1 	varchar2 	30
	notice2 	varchar2 	30
	notice3 	varchar2	30

	ตาราง gps_path
	p_id 		number 		10
	path_name 	varchar2 	10
	xpoint1 	varchar2	10
	ypoint1 	varchar2	10
	xpoint2 	varchar2	10
	ypoint2 	varchar2	10
	length 		char 		10

	ตาราง report
	r_id 		number 		10
	driver 		varchar2 	25
	carid 		char 		10
	route 		varchar2 	25
	startdate 	char 		10
	starttime 	char 		10
	enddate 	char 		10
	endtime 	char		10
3. ตั้งรหัสผ่านเข้าฐานข้อมูลเป็น
  	user name : system
 	password  : manager
4. สร้าง DSN เพื่อเชื่อมต่อไปยังฐานข้อมูลที่สร้างไว้ ให้ชื่อว่า GPS
5. Import gps_path.txt มายัง ตาราง gps_path ที่สร้างไว้
6. อ่านคู่มือการใช้งานเพื่อเริ่มต้นการใช้งาน

