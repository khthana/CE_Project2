<?

	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	$sender =$CK[Login];
	compose($sender,$to,$topic,$message,$date);
	CloseDB();

?>

<A HREF="Main_Message.php">Go to Main Message</A>

	