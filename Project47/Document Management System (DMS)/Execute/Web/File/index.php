<?php session_start();
if($Log=="1") {session_destroy();}
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
if ($Log=="1") {
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." Log out.<br>";  //echo $LogFile;
$file = fopen("client/Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("client/Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
$endd = "1"; session_register("endd");
}
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
?>
<html>
<head>
<title>DMS Project : Login Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<frameset rows="80,*" frameborder="NO" border="0" framespacing="0">
  <frame src="head.php" name="topFrame" scrolling="NO" noresize >
  <frame src="body.php" name="mainFrame">
</frameset>
<noframes><body>

</body></noframes>
</html>
