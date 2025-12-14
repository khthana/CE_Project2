<?

	include("config.inc.php");
Chmod("pic/",777);
mysql_connect($host,$user,$passwd) or die("Unable to Connect");

$sql1="CREATE TABLE member (
username varchar(20) NOT NULL,
password varchar(20) NOT NULL,
fullname text,
nickname varchar(20),
email varchar(40) NOT NULL,
icq varchar(15),
tel varchar(20),
pager varchar(10),
addr text,
homepage text,
faculty varchar(40),
department varchar(40),
branch varchar(40),
year varchar(5),
class varchar(5),
id varchar(10),
date_mem varchar(20),
PRIMARY KEY (username))" ;

$sql2="CREATE TABLE book_data (
code varchar(6) NOT NULL,
bookname text,
author text,
publisher text,
condition varchar(40),
percent tinyint(3),
usedyear tinyint(2),
usedmonth tinyint(2),
detail text,
howsend varchar(40),
duration varchar(15),
PRIMARY KEY (code)
) ";

$sql3="CREATE TABLE post (
code varchar(6) NOT NULL,
status varchar(10) NOT NULL,
topic varchar(150) NOT NULL,
price int(10),
date varchar(15) NOT NULL,
reply int(5) NOT NULL,
visit int(5) NOT NULL,
PRIMARY KEY (code)
) ";

$sql4="CREATE TABLE poster (
code varchar(6) NOT NULL,
username varchar(20),
email varchar(40),
ip text,
member tinyint(1),
picture varchar(40),
sendmail tinyint(1),
PRIMARY KEY (code)
) ";	

$sql5="CREATE TABLE toadmin (
no int(11) NOT NULL auto_increment,
detail text,
sender varchar(20),
email varchar(40),
date varchar(20),
topic varchar(150) NOT NULL,
ans tinyint(2),
PRIMARY KEY (no)
) ";

$sql6="CREATE TABLE address_data (
code varchar(6) NOT NULL,
name varchar(40),
type varchar(20),
address text,
no_room tinyint(5),
size varchar(20),
tela varchar(40),
detail text,
duration varchar(15),
PRIMARY KEY (code)
) ";

$sql7="CREATE TABLE equipment_data (
code varchar(6) NOT NULL,
brand varchar(30),
model varchar(30),
condition varchar(40),
percent tinyint(3),
usedyear tinyint(2),
usedmonth tinyint(2),
detail text,
howsend varchar(40),
duration varchar(15),
PRIMARY KEY (code)
) ";
$sql8="CREATE TABLE etc_data (
code varchar(6) NOT NULL,
brand varchar(40),
model varchar(40),
condition varchar(40),
percent tinyint(3),
usedyear tinyint(2),
usedmonth tinyint(2),
detail text,
howsend varchar(40),
duration varchar(15),
PRIMARY KEY (code)
) ";

$sql9="CREATE TABLE friends_data (
code varchar(6) NOT NULL,
fullname text,
nickname varchar(20),
faculty varchar(40),
department varchar(40),
e_mail varchar(40),
icq varchar(15),
tel varchar(20),
pager varchar(10),
detail text,
duration varchar(15),
year varchar(5),
PRIMARY KEY (code)
) ";

$sql10="CREATE TABLE news_data (
code varchar(6) NOT NULL,
detail text,
duration varchar(15),
PRIMARY KEY (code)
) ";
$sql11="CREATE TABLE vehicle_data (
code varchar(6) NOT NULL,
brand varchar(40),
model varchar(40),
color varchar(30),
license varchar(20),
condition varchar(40),
percent tinyint(3),
usedyear tinyint(2),
usedmonth tinyint(2),
detail text,
howsend varchar(40),
duration varchar(15),
PRIMARY KEY (code)
) ";
$sql12="CREATE TABLE date_delete (
code varchar(6) NOT NULL,
date varchar(15) NOT NULL,
PRIMARY KEY (code)
) ";

$sql13="CREATE TABLE vehicle_ans (
no tinyint(4) NOT NULL auto_increment,
code varchar(6) NOT NULL,
detail text,
username varchar(20),
email varchar(40),
ip text,

date varchar(15),
PRIMARY KEY (no)
) ";

$sql14="CREATE TABLE friends_ans (
no tinyint(4) NOT NULL auto_increment,
code varchar(6) NOT NULL,
detail text,

username varchar(20),
email varchar(40),
ip text,

date varchar(15),
PRIMARY KEY (no)
) ";

$sql15="CREATE TABLE news_ans (
no tinyint(4) NOT NULL auto_increment,
code varchar(6) NOT NULL,
detail text,

username varchar(20),
email varchar(40),
ip text,

date varchar(15),
PRIMARY KEY (no)
) ";

$sql16="CREATE TABLE equipment_ans (
no tinyint(4) NOT NULL auto_increment,
code varchar(6) NOT NULL,
detail text,
username varchar(20),
email varchar(40),
ip text,

date varchar(15),
PRIMARY KEY (no)
) ";

$sql17="CREATE TABLE etc_ans (
no tinyint(4) NOT NULL auto_increment,
code varchar(6) NOT NULL,
detail text,

username varchar(20),
email varchar(40),
ip text,

date varchar(15),
PRIMARY KEY (no)
) ";

$sql18="CREATE TABLE book_ans (
no tinyint(4) NOT NULL auto_increment,
code varchar(6) NOT NULL,
detail text,

username varchar(20),
email varchar(40),
ip text,

date varchar(15),
PRIMARY KEY (no)
) ";

$sql19="CREATE TABLE address_ans (
no tinyint(4) NOT NULL auto_increment,
code varchar(6) NOT NULL,
detail text,
username varchar(20),
email varchar(40),
ip text,

date varchar(15),
PRIMARY KEY (no)
) ";

$sql20="CREATE TABLE introduce (
no int(11) NOT NULL auto_increment,
username varchar(20) NOT NULL,
detail text,
sender varchar(20),
email varchar(40),
date varchar(15) NOT NULL,
PRIMARY KEY (no)
) ";

$sql21="CREATE TABLE lost_ans (
no tinyint(4) NOT NULL auto_increment,
code varchar(6) NOT NULL,
detail text,
username varchar(20),
email varchar(40),
ip text,

date varchar(15),
PRIMARY KEY (no)
) ";

$sql22="CREATE TABLE lost_data (
code varchar(6) NOT NULL,
detail text,
duration varchar(15),
PRIMARY KEY (code)
) 	";
	
	$result1 = mysql_db_query($dbname,$sql1);
	$result2 = mysql_db_query($dbname,$sql2);
	$result3 = mysql_db_query($dbname,$sql3);
	$result4 = mysql_db_query($dbname,$sql4);
	$result5 = mysql_db_query($dbname,$sql5);
	$result6 = mysql_db_query($dbname,$sql6);
	$result7 = mysql_db_query($dbname,$sql7);
	$result8 = mysql_db_query($dbname,$sql8);
	$result9 = mysql_db_query($dbname,$sql9);
	$result10 = mysql_db_query($dbname,$sql10);
	$result11 = mysql_db_query($dbname,$sql11);
	$result12 = mysql_db_query($dbname,$sql12);
	$result13 = mysql_db_query($dbname,$sql13);
	$result14 = mysql_db_query($dbname,$sql14);
	$result15 = mysql_db_query($dbname,$sql15);
	$result16 = mysql_db_query($dbname,$sql16);
	$result17 = mysql_db_query($dbname,$sql17);
	$result18 = mysql_db_query($dbname,$sql18);
	$result19 = mysql_db_query($dbname,$sql19);
	$result20 = mysql_db_query($dbname,$sql20);
	$result21 = mysql_db_query($dbname,$sql21);
    $result22 = mysql_db_query($dbname,$sql22);

	



	if($result1!=0 && $result2!=0 && $result3!=0 && $result4!=0 && $result5!=0 && $result6!=0 && $result7!=0  && $result8!=0 && $result9!=0  && $result10!=0  && $result11!=0  && $result12!=0  && $result13!=0 && $result14!=0  && $result15!=0 && $result16!=0  && $result17!=0  && $result18!=0 && $result19!=0 && $result20!=0 && $result21!=0 && $result22!=0) {

		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>ได้สร้างฐานข้อมูลแล้ว</b></font><br><br>";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "</center>";
		exit();
	}
	else {
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>ได้สร้างฐานข้อมูลไปแล้ว</b></font><br><br>";
		echo "หรือมีข้อผิดพลาดที่ระบบ<br><br>";
		echo "กรุณาแจ้ง <font color=blue>admin</font> ให้ตรวจสอบด้วยครับ";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "</center>";
		exit();
	}
?>