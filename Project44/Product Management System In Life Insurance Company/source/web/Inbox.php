
<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	Read_logfile($Aid,$Anick,$Apwd);
	 inbox($Aid,$Date,$From,$Topic,$Mid,$count);
	CloseDB();
?>

<p>  <a href ="agent_menu.html"><<-- Go to Agent menu</a></p>
	