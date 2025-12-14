<?
	include("phpFunctionDB.php");
   $sender =$CK[Login];
	compose($sender,$to,$topic,$message);
?>
<p><a href="Manager_message.php">Manager main message</a></p>