<?php 
	require('./libraries/grab_globals.lib.php');
	session_start(); 
?>
<html>
<head>
<title>E-Learning News</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body >
<?php
	include("./config.inc.php");
	include("./GenHtml.php");
	include("./ChkErr.inc.php");
	
	if(isset($submit)) {
		if(empty($uname) || empty($passwd))
			ShowErr("กรุณาป้อนชื่อผู้ใช้และรหัสผ่านให้ครบถ้วน");
		else {
			$query =  user_auth($uname,$passwd);
			$row = action("get_row",$query);
			if($row <= 0)
				ShowErr("ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง กรุณาป้อนใหม่อีกครั้ง");				
			else {
				$authuser = $uname;
				session_register("authuser");
				echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= WriterSec.php\">";
			}
		}
	}
	login_form();
?>

</body>
</html>
