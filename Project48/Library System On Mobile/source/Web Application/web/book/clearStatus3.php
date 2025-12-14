<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");
@$sql="update book set status3= 0  where status3=1";
$result = mysql_db_query($dbname, $sql);	
print "<meta http-equiv=\"refresh\" content=\"0;URL=list_addmin.php\">\n";
		
						
?>