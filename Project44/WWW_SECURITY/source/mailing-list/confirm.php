<?php
include "db.php";
		
		// ทำงานต่อจากไฟล์ subscribe.php มีการรับตัวแปร ng มาด้วย  เพื่อนำมาหาว่าต้อง update การ confirm ที่ row ไหน

		// ติดต่อฐานข้อมูล ให้กำหนดชื่อผู้ใช้ และ รหัสผ่านให้ถูกต้อง
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

if ($HTTP_GET_VARS["v"] == '1') {	//  ผู้ใช้ยืนยันว่าจะสมัครรับ mailing list
	$sql = "SELECT confirm  FROM subscribers WHERE num_gen=".$HTTP_GET_VARS["ng"];
	$sql_result = mysql_query($sql, $connection) or die ("เอ็กซิคิวต์คำสั่ง SELECT ไม่ได้");

	$num_row = mysql_num_rows($sql_result);
//	echo "num row = $num_row";

	if ($num_row != 0) {
		$arr = mysql_fetch_array($sql_result);
		$confirm = $arr["confirm"];
	}

	if ( ($num_row != 0)  && ($confirm == 'N') ) {		// ถ้า $num_row เป็น 0 แสดงว่า email นี้ถูกลบไปแล้ว
		$sql2 = "UPDATE subscribers SET confirm='Y'  WHERE num_gen=".$HTTP_GET_VARS["ng"];
		mysql_query($sql2, $connection) or die ("เอ็กซิคิวต์คำสั่ง UPDATE ไม่ได้");
	
		echo "คุณได้ตอบยืนยันที่จะรับสมัครประกาศรับข่าวสารจากทาง Web ISAG แล้ว<br>";
		echo "ทางเราจะแจ้งข้อมูลข่าวสารให้คุณทราบทาง email";
	}

	mysql_free_result($sql_result);
	
}
elseif ($HTTP_GET_VARS["v"] == '0') {	// ไม่สมัคร
	$sql3 = "SELECT confirm  FROM subscribers WHERE num_gen=".$HTTP_GET_VARS["ng"];	//  หาว่า email นี้ถูกลบไปหรือยัง
	$sql3_result = mysql_query($sql3, $connection) or die ("เอ็กซิคิวต์คำสั่ง SELECT ไม่ได้");
	
	$num_row = mysql_num_rows($sql3_result);
	
	if ($num_row != 0) {
		$arr3 = mysql_fetch_array($sql3_result);
		$confirm = $arr3["confirm"];
	}

//	echo "num row = $num_row<br>";

	if ( ($num_row != 0) && ($confirm == 'N') ) {		// ถ้า confirm เป็น 'Y' ก็จะไม่ลบ email นี้ เพราะผู้ใช้ได้ยืนยันว่าสมัครแล้ว 
		$sql4 = "DELETE FROM subscribers WHERE num_gen=".$HTTP_GET_VARS["ng"];
		mysql_query($sql4, $connection) or die ("เอ็กซิคิวต์คำสั่ง DELETE ไม่ได้");

		echo "คุณได้ยกเลิกที่จะรับ mailing list แจ้งข่าวสารแล้ว";
	}

	mysql_free_result($sql3_result);
}
	mysql_close($connection);

?>
