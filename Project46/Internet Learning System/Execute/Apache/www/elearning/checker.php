<?php
session_start();
if(!$send)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
include "connectdb.php";
mysql_query("use elearning;");
if(isset($_SESSION['user']))
{
$sql = "select * from userid where user='$user';";
$result=mysql_query($sql);
$ruid=mysql_result($result,0,"uid");
$rstatus=mysql_result($result,0,"status");
}
if (isset($_SESSION['user']) && $rstatus==2)
{
	if(isset($_COOKIE["authen"]))
	{
		$sql = "select * from testsubject where subid='$subid' and numid='$numid';";
		$result=mysql_query($sql);
		$ranswer = mysql_result($result,0,"answer");
		$sql = "select * from userskill where subid='$subid' and uid='$ruid';";
		$result=mysql_query($sql);
		$rlvget = mysql_result($result,0,"lvget");
		
		if($answer == $ranswer)
		{
			$rlvget++;
			if($rlvget > 10)
				$rlvget = 10;
		}
		else
		{
			$rlvget--;
			if($rlvget < 0)
				$rlvget =0;
		}
		
		$sql = "update userskill set lvget='$rlvget' where uid='$ruid' and subid='$subid';";
		$result = mysql_query($sql);
		$ctemp = $_COOKIE["ctemp"]+1;
		setcookie("ctemp","$ctemp");
		print "<meta http-equiv=\"refresh\" content=\"0;URL=tester.php?subid=".$subid."\">";
		mysql_close($db);
		exit();		
	}
	else
	{
		print "<meta http-equiv=\"refresh\" content=\"0;URL=tester.php?subid=".$subid."\">";
		mysql_close($db);
		exit();
	}
}
else
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=tester.php?subid=".$subid."\">";
	mysql_close($db);
	exit();
}
mysql_close($db);
?>