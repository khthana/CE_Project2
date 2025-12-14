<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	 //Read_logfile($Aid,$Anick,$Apwd);
	viewoutbox($outbox_id);
	CloseDB();
?>