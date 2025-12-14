<?php
	include("function.php");
	include("database.php");
	
	head_html("ตรวจสอบ session");
	database_connect();
	
	login($user_name,$pass);
	header("Location: show.php"); 

	end_head_html();
?>