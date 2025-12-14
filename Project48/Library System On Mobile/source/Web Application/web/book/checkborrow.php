<?php


/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

// ตรวจสอบตัวแปรคุกกี้ numCounter ว่ามีการกำหนดค่าไว้หรือไม่
//if ( isset($_COOKIE[$catalog]) ) {

$sql = "select * from book where code = '$code'";
$db_query = mysql_db_query ($dbname, $sql);
$result = mysql_fetch_array($db_query);


$name_borrow= $result[name_borrow];
echo $name_borrow;
echo $code;



?>