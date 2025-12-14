<?php
	include("function.php");
	include("database.php");
	
	head_html("บันทึก แก้ไข ลบ ผู้ใช้งาน");
	database_connect();
	//print "$status";
	
	if($mode == "edit") {
		$opass = mysql_fetch_array(database_query("select * from user_profile where id = ".$id.""));
		if($opass["PASSWORD"] == $old_pass) {
			$str = "UPDATE `user_profile` SET `FIRST_NAME` = '".$first_name."',`LAST_NAME` = '".$last_name."',`USER_NAME` = '".$user_name."',`PASSWORD` = '".$new_pass."',`STATUS` = '".$status."' WHERE `ID` = ".$id."";
			if(database_query($str)) {
				message_box("","แก้ไขรายชื่อผุ้ใช้ในฐานข้อมูลเรียบร้อยแล้ว","show_user_profile.php");
			}
			else {
				message_box("","เกิดปัญหาในการแก้ไขรายชื่อนี้","javascript:history.back()");
			}
		}
		else
			message_box("","รหัสผ่านไม่ถูกต้อง","javascript:history.back()");
	}
	else if($mode == "add") {
		$r = mysql_fetch_array(database_query("select * from user_profile where user_name = '".$user_name."'"));
		if($r["USER_NAME" == $user_name]) {
			message_box("","มี User name นี้ในฐานข้อมูลแล้ว","javascript:history.back()");
			exit;
		}	
		$str = "INSERT INTO `user_profile` ( `ID` , `FIRST_NAME` , `LAST_NAME` , `USER_NAME` , `PASSWORD` , `STATUS` ) VALUES ('', '".$first_name."', '".$last_name."', '".$user_name."', '".$pass."', '".$status."')";
		if(database_query($str)) {
			message_box("","เพิ่มรายชื่อผุ้ใช้ในฐานข้อมูลเรียบร้อยแล้ว","show_user_profile.php");
		}
		else {
			message_box("","เกิดปัญหาในการเพิ่มรายชื่อนี้","javascript:history.back()");
		}
	}
	else if($mode == "delete") {
		$str = "delete from user_profile where id = ".$id."";
		if(database_query($str)) {
			message_box("","ลบรายชื่อผุ้ใช้ในฐานข้อมูลเรียบร้อยแล้ว","show_user_profile.php");
		}
		else {
			message_box("","เกิดปัญหาในการลบรายชื่อนี้","javascript:history.back()");
		}
	}
	
	end_head_html();
?>