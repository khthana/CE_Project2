<?
	include("phpFunctionDB.php");
	Conn2DB();
	Read_logfile($Aid,$Anick,$Apwd);
	outbox($Aid);
	CloseDB();
?>

<p>  <a href ="agent_menu.html"><<-- Go to Agent menu</a></p>
	