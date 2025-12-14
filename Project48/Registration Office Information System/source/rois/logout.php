<?php
	include("function.php");
	
	head_html("ล๊อกเอาท์จากระบบ");
	
	session_start();
	session_destroy();
	header("Location: login.php"); 
	
	end_head_html();
?>