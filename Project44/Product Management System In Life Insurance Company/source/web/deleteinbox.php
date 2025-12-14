<FORM METHOD=POST ACTION="deleteinbox.php">
<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	deleteinbox($inbox_id);
	CloseDB();
echo"Delete This message <INPUT TYPE=\"submit\" name = \" \" value =\" \">"
?>
</FORM>
