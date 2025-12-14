<?php
session_start();
if(!$uid)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
if (isset($_SESSION['user']))
{
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$rstatus=mysql_result($result,0,"status");
}
if(isset($_SESSION['user']) && $rstatus==0)
{
//	print $uid;
	$sql1 = "select * from userid where uid='$uid';";
	$result1=mysql_query($sql1);
	$rustatus=mysql_result($result1,0,"status");
	if($rustatus==1)
	{
		$sql = "delete from userid where uid='$uid';";
		$result=mysql_query($sql);
		$sql = "delete from teacherid where uid='$uid';";
		$result=mysql_query($sql);
	}
	if($rustatus==2)
	{
		$sql = "delete from userid where uid='$uid';";
		$result=mysql_query($sql);
		$sql = "delete from history where uid='$uid';";
		$result=mysql_query($sql);
		$sql = "delete from userskill where uid='$uid';";
		$result=mysql_query($sql);
	}
	mysql_close($db);
	print "<meta http-equiv=\"refresh\" content=\"0;URL=edituser.php\">";
	exit();
}
else
{
	mysql_close($db);
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>