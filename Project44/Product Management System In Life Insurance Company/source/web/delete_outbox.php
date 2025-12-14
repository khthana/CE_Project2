<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	deleteoutbox($outbox_id);
	CloseDB();
?>
<p>  <a href ="main_message.php"><<-- Go to message menu</a></p>
	