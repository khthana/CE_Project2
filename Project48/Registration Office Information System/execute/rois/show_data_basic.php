<?php
	include("function.php");
	include("database.php");
	include("java_script.php");
	
	head_html("แสดงข้อมูลพื้นฐาน");
	database_connect();
	
	print "<link rel='stylesheet' href='css/style.css' type='text/css' />";
	
	//print $row_start . " " . $row_limit;

	if($select == "money_type") {
		gen_table_3_filed("money_type","แหล่งเงิน",$row_start,$row_limit);
	}
	else if($select == "money_type_receipt") {
		gen_table_3_filed("money_type_receipt","แหล่งเงินรายรับ",$row_start,$row_limit);
	}
	else if($select == "sector") {
		gen_table_3_filed("sector","ด้าน",$row_start,$row_limit);
	}
	else if($select == "program") {
		gen_table_4_filed("program","แผนงาน",$row_start,$row_limit);
	}
	else if($select == "project") {
		gen_table_4_filed("project","โครงงาน",$row_start,$row_limit);
	}
	else if($select == "activity") {
		gen_table_3_filed("activity","กิจกรรม",$row_start,$row_limit);
	}
	else if($select == "activity_sub") {
		gen_table_3_filed("activity_sub","กิจกรรมย่อย",$row_start,$row_limit);
	}
	else if($select == "account") {
		gen_table_3_filed("account","ประเภทงบ",$row_start,$row_limit);
	}
	else if($select == "expense_type") {
		gen_table_4_filed("expense_type","ประเภทรายจ่าย",$row_start,$row_limit);
	}
	else if($select == "expense_sub") {
		gen_table_4_filed("expense_sub","หัวข้อรายจ่าย",$row_start,$row_limit);
	}
	else if($select == "receipt_type") {
		gen_table_3_filed("receipt_type","ประเภทรายรับ",$row_start,$row_limit);
	}
	else if($select == "receipt_sub") {
		gen_table_4_filed("receipt_sub","หัวข้อรายรับ",$row_start,$row_limit);
	}
	else if($select == "fund") {
		gen_table_3_filed("fund","ประเภทกองทุน",$row_start,$row_limit);
	}
	else if($select == "department") {
		gen_table_3_filed("department","หน่วยงาน",$row_start,$row_limit);
	}
	else if($select == "side") {
		gen_table_3_filed("side","ฝ่าย",$row_start,$row_limit);
	}
	else if($select == "expense_type_sub") {
		gen_table_4_filed("expense_type_sub","ประเภทรายจ่ายย่อย",$row_start,$row_limit);
	}

	end_head_html();
?>