<?php
	include("function.php");
	include("database.php");
	
	head_html("แก้ไข ลบ รายการข้อมูลในฐานข้อมูล");
	database_connect();
	
	$db = database_query("select * from ".$table_name." where id = ".$id."");
	$str_query;
	
	if($mode == "edit") {
		if(mysql_num_fields($db) == 3) {
			$f0 = mysql_field_name($db,0);
			$f1 = mysql_field_name($db,1);
			$f2 = mysql_field_name($db,2);
			$str_query = "update `".$table_name."` set `".$f0."` = '".$id."',`".$f1."` = '".$var1."',`".$f2."` = '".$var2."' WHERE `".$f0."` = 	".$old_id.";";
			//print $str_query;
			if(database_query($str_query)) {
				message_box("","แก้ไขข้อมูลและจัดเก็บลงในฐานข้อมูลเรียบร้อยแล้ว","show_data_basic.php?select=".$table_name."&row_start=0&row_limit=20");
			}
			else {
				message_box("","มีข้อผิดพลาดในการแก้ไขข้อมูล กรุณากลับไปแก้ไขข้อมูล","javascript:history.back()");
			}
		}
		else if(mysql_num_fields($db) == 4) {
			$f0 = mysql_field_name($db,0);
			$f1 = mysql_field_name($db,1);
			$f2 = mysql_field_name($db,2);
			$f3 = mysql_field_name($db,3);
			$str_query = "update `".$table_name."` set `".$f0."` = '".$id."',`".$f1."` = '".$var1."',`".$f2."` = '".$var2."',`".$f3."` = '".$var3."' WHERE `".$f0."` = ".$old_id.";";
			//print $str_query;
			if(database_query($str_query)) {
				message_box("","แก้ไขข้อมูลและจัดเก็บลงในฐานข้อมูลเรียบร้อยแล้ว","show_data_basic.php?select=".$table_name."&row_start=0&row_limit=20");
			}
			else {
				message_box("","มีข้อผิดพลาดในการแก้ไขข้อมูล กรุณากลับไปแก้ไขข้อมูล","javascript:history.back()");
			}
		}
	}
	else if($mode == "delete") {
		$str = "delete from ".$table_name." where id = ".$id."";
		if(database_query($str)) {
				message_box("","ลบข้อมูลและจัดเก็บลงในฐานข้อมูลเรียบร้อยแล้ว","show_data_basic.php?select=".$table_name."&row_start=0&row_limit=20");
			}
			else {
				message_box("","มีข้อผิดพลาดในการลบข้อมูล กรุณากลับไปแก้ไขข้อมูล","javascript:history.back()");
			}
	}
	else if($mode == "add") {
		if(mysql_num_fields($db) == 3) {
			$f0 = mysql_field_name($db,0);
			$f1 = mysql_field_name($db,1);
			$f2 = mysql_field_name($db,2);
			$str_query = "INSERT INTO `".$table_name."` ( `".$f0."` , `".$f1."` , `".$f2."` ) VALUES ('".$id."', '".$var1."', '".$var2."')";
			//print $str_query;
			if(database_query($str_query)) {
				message_box("","จัดเก็บลงในฐานข้อมูลเรียบร้อยแล้ว","show_data_basic.php?select=".$table_name."&row_start=0&row_limit=20");
			}
			else {
				message_box("","มีข้อผิดพลาดในการจัดเก็บข้อมูล กรุณากลับไปแก้ไขข้อมูล","javascript:history.back()");
			}
		}
		else if(mysql_num_fields($db) == 4) {
			$f0 = mysql_field_name($db,0);
			$f1 = mysql_field_name($db,1);
			$f2 = mysql_field_name($db,2);
			$f3 = mysql_field_name($db,3);
			$str_query = "INSERT INTO `".$table_name."` ( `".$f0."` , `".$f1."` , `".$f2."`, `".$f3."` ) VALUES ('".$id."', '".$var1."', '".$var2."' , '".$var3."')";
			//print $str_query;
			if(database_query($str_query)) {
				message_box("","จัดเก็บลงในฐานข้อมูลเรียบร้อยแล้ว","show_data_basic.php?select=".$table_name."&row_start=0&row_limit=20");
			}
			else {
				message_box("","มีข้อผิดพลาดในการจัดเก็บข้อมูล กรุณากลับไปแก้ไขข้อมูล","javascript:history.back()");
			}
		}
	}
	
	end_head_html();
?>