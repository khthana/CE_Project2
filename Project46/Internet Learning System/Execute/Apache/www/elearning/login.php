<?php
session_start();
if ($login)
{
	if($user=="" || $pass=="" || strlen($user)>20 || strlen($pass)>40)
	{
		print "<meta http-equiv=\"refresh\" content=\"0;URL=errorck.php?error=1\">";
		exit();
	}
	$user = addslashes($user);
	$pass = addslashes($pass);
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid";
	$result=mysql_query($sql);
	$count=mysql_num_rows($result);
	$find =0;
	for($i=0; $i<$count; $i++)
	{
		$ruser=mysql_result($result,$i,"user");
		if($ruser == $user)
		{
			$find = 1;
		}
	}
	if($find==1)
	{
		$sql = "select * from userid where user='$user';";
		$result=mysql_query($sql);
		$ruser=mysql_result($result,0,"user");
		$rpass=mysql_result($result,0,"pass");
		$cuser = strcmp($user, $ruser);
		$cpass = strcmp(md5($pass), $rpass);
		if ($cuser !=0 || $cpass !=0)
		{
			mysql_close($db);
			print "<meta http-equiv=\"refresh\" content=\"0;URL=errorck.php?error=3\">";
			exit();
		}
		mysql_close($db);
//	session_id();

//	session_unset();

//	session_register("user");
//	$suser = $user;
//	$user[user]=$user;

//	exit; 
//	session_start();
//	global $_SESSION;
		global $user;
		$_SESSION['user'] = $user;
//	$_SESSION['user'] = $user;
//	$HTTP_SESSION_VARS['user'] = $user;
//	print "<a href=\"index.php\">index</a>";
//	header("Location:index.php");  
		print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	}
	else
	{
		print "<meta http-equiv=\"refresh\" content=\"0;URL=errorck.php?error=2\">";
	}
}
else
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>