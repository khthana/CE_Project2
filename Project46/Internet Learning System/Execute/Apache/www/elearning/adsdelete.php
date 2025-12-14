<?php
session_start();
if(!$subid)
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
	$sql = "delete from userskill where subid='$subid';";
	$result=mysql_query($sql);
	$sql = "delete from testsubject where subid='$subid';";
	$result=mysql_query($sql);
	$sql = "delete from ebooksubject where subid='$subid';";
	$result=mysql_query($sql);
	$sql = "delete from subject where subid='$subid';";
	$result=mysql_query($sql);

	mysql_close($db);
	print "<meta http-equiv=\"refresh\" content=\"0;URL=editsubject.php?sort=1\">";
	exit();
}
else
{
	mysql_close($db);
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>