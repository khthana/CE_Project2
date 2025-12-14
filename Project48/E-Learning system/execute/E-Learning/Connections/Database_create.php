<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Create database</title>
</head>
<body>
<?php
$hostname_conn = "localhost";
$database_conn = "poadb";
$username_conn = "root";
$password_conn = "poa";
$conn = mysql_pconnect($hostname_conn, $username_conn, $password_conn) or trigger_error(mysql_error(),E_USER_ERROR); 
//สร้างฐานข้อมูล
if (mysql_create_db($database_conn)){ print "ฐานข้อมูล $database_conn ได้ถูกสร้างขึ้นแล้วครับ<br>" ;
} else  {
				print"การสร้างฐานข้อมูล \"$database_conn\" ล้มเหลว<br>";
    			print(mysql_errno() ? "Error no. "  .mysql_errno() . " : " : "").mysql_error();
			}
//เลือก database
mysql_select_db($database_conn,$conn);
//สร้างตาราง users
if (mysql_query("CREATE TABLE users("."user_ID int not null auto_increment primary key"."
																		,username varchar(30) not null "."
																		,password varchar(30) not null "."
																		,status varchar(7) not null "."
																		,que_forget text not null "."
																		,ans_forget text not null )"))
																		{print ("สร้างตาราง users สำเร็จ<br>");}
//สร้างตาราง admin
if (mysql_query("CREATE TABLE admin("."admin_ID int not null auto_increment primary key"."
																		,user_ID int not null"."
																		,name varchar(30) not null"."
																		,surname varchar(30) not null)"))
																		{print ("สร้างตาราง adminสำเร็จ<br>");}
//admin
$user_ID =1;
$username ="Poaheart";
$password  = "SteveG";
$status		= "admin";
$name ="Pongthiti";
$surname  = "Huachai";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO admin SET "."user_ID='$user_ID' ".", name='$name' ".",surname='$surname' ") ;
include("teacher_table.php");
include("subject_table.php");
include("news_table.php");
include("QandA_table.php");
include("webboard_table.php");
if (mysql_query("CREATE TABLE register(	"."register_ID int not null auto_increment primary key"."
																		,student_ID int not null "."
																		,course_ID int not null "."
																		,status varchar(50) "."
																		,grade varchar(7))"))
																		{print ("สร้างตาราง register สำเร็จ<br>");}

//สร้างตาราง student
if (mysql_query("CREATE TABLE student("."student_ID int not null auto_increment primary key"."
																		,user_ID int not null "."
																		,name varchar(30) not null "."
																		,surname varchar(30) not null "."
																		,gender varchar(7) not null "."
																		,birthday varchar(30) not null "."
																		,address text not null "."
																		,telnum varchar(20) not null "."
																		,email varchar(100) not null "."
																		,workplace varchar(50) not null "."
																		,occupation varchar(100) not null )"))
																		{print ("สร้างตาราง student สำเร็จ<br>");}
//student
$user_ID =14;
$username ="Pumpkung";
$password  = "Pumpkung";
$status		= "student";
$name ="Panuwat";
$surname  = "Huachai";
$gender="male";
$birthday ="08/10/1995";
$address ="119/67 นวมินทร์99 แขวงคลองกุ่ม เขตบึงกุ่ม กทม. 10240";
$telnum ="025192873";
$email ="PumpHeart@hotmail.com"; 
$workplace ="PE";
$occupation="นักเรียน";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO student SET "."user_ID='$user_ID' 
".", name='$name' ".",surname='$surname' ".",gender='$gender'
".",birthday='$birthday' ".",address='$address' ".",telnum='$telnum' ".",email='$email' ".",workplace='$workplace' ".",occupation='$occupation' ") ;

//table config
if (mysql_query("CREATE TABLE config(	"."config_ID int not null auto_increment primary key"."
																		,money_require bool not null "."
																		,register_value int not null "."
																		,day int not null "."
																		,fee int not null )"))
																		{print ("สร้างตาราง config สำเร็จ<br>");}
// set default																		
mysql_query("INSERT INTO config SET "."money_require='1' ".",register_value='150' ".",day='7' ".",fee ='100' ") ;

$sql="CREATE TABLE `useronline` (
  `id` mediumint(8) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `expire` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ";
if(mysql_query($sql)){echo "สร้างตาราง chat สำเร็จ";}

// dump ตาราง `useronline`

?>
</body>
</html>
