<FORM METHOD=POST ACTION="deleteinbox.php">
<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
viewinbox($inbox_id);
	CloseDB();
echo"Delete This message <INPUT TYPE=\"submit\" name = \"inbox_id \" value =\" $inbox_id\">";
?>
</FORM>