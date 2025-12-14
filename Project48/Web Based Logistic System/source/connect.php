
<?
$host="localhost";
$user="root";
$pw="";
$dbname="express";

$link= mysql_connect ($host,$user,$pw);

if (!$link){
	print("<H3>ERROR : ไม่สามารถติดต่อฐานข้อมูลได้");
	exit();
}

?>