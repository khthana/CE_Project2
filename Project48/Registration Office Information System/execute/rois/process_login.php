<?php
	include("function.php");
	include("database.php");
	
	head_html("ตรวจสอบ session");
	database_connect();
	
	login($user_name,$pass);
	header("Location: main_report_menu.php"); 

	end_head_html();
?>