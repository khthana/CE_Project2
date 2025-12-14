<?
		session_start();
		session_unregister("loginname");
		header ("Location: index.php");  
		exit;
?>