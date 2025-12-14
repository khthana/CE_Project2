<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	view_news($type);
	CloseDB();
?>