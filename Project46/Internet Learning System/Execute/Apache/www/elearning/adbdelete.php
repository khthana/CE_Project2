<?php
session_start();
if(!$subid && !$numid)
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
if(isset($_SESSION['user']) && ($rstatus==0 || $rstatus==1))
{
	$sql = "delete from ebooksubject where subid='$subid' and ebookid='$ebookid';";//here(and)
	$result=mysql_query($sql);

	mysql_close($db);
	print "<meta http-equiv=\"refresh\" content=\"0;URL=editsbook.php?subid=$subid;\">";
	exit();
}
else
{
	mysql_close($db);
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>