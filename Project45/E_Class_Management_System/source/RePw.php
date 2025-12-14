<?php
	require('./libraries/grab_globals.lib.php');
	 session_start(); 
?>
<html>
<head>
<title>Re Password</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?php
 	include("./config.inc.php");
	include("./ChkErr.inc.php");

	CheckSpace($User,"USERNAME");
	$User = trim($User);	
	$sql = "SELECT * FROM member WHERE USERNAME = '$User' " ;
	$result = mysql_query($sql,$con);
	if(!$result)
	 	die("ไม่สามารถ select ได้");
	
	$row = mysql_fetch_object($result);
	
	if(!empty($row))	{	 	
		session_register("SESSION");
		$SESSION["username"] = $row->USERNAME;
		$SESSION["password"] = $row->PASSWORD;
		$SESSION["question"] = $row->QUESTION;
		$SESSION["answer"] = $row->ANSWER;
		echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= FrmAsk.php\">";
	 }
	else ShowErr("Username นี้ยังไม่ได้ลงทะเบียน กรุณากรอกใหม่" ) ; 
?>

</body>
</html>
