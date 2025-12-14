<?php
		session_start();
		include("database.php");
		include("function.php");
		require_once("header.php");
		require_once("check_data.php");
		head_html("ลงทะเบียนใหม่");
		database_connect();
	
		$r = mysql_fetch_array(database_query("select * from user_profile where USER_NAME = '".$USERNAME."'"));
		if($r["USER_NAME" == $USERNAME]) 
			{
			message_box("","มี User name นี้ในฐานข้อมูลแล้ว","javascript:history.back()");
			exit;
			}	
		$str = "INSERT INTO `user_profile` ( `ID` , `FIRST_NAME` , `LAST_NAME` , `USER_NAME` , `PASSWORD` , `ANSWER` , `EMAIL` , `STATUS` )			VALUES ('', '".$FIRSTNAME."', '".$LASTNAME."', '".$USERNAME."', '".$PASSWORD."','".$ANSWER."','".$EMAIL."', '".$STATUS."')";
		
		if(database_query($str)) 
			{
			message_box("","เพิ่มรายชื่อผู้ใช้ในฐานข้อมูลเรียบร้อยเเล้ว","index.php");
			}
		else{ 
			message_box("","เกิดปัญหาในการเพิ่มรายชื่อนี้","javascript:history.back()");
		}
?>