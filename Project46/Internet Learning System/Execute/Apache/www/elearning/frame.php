<?php
//ob_start();
session_start();
if(!$subid)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=teslist.php\">";
	exit();
}
if(isset($_SESSION['user']))
{
include "connectdb.php";
mysql_query("use elearning;");
$sql = "select * from userid where user='$user';";
$result=mysql_query($sql);
$ruid=mysql_result($result,0,"uid");
$rstatus=mysql_result($result,0,"status");
}
if (isset($_SESSION['user']) && $rstatus==2)
//if(session_is_registered("user"))
{
?>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel='stylesheet' type='text/css' href='style.css' />
</head>

<frameset rows="50,*" cols="*" framespacing="0" frameborder="NO" border="0">
  <frame src="timer.php" name="timer" scrolling="NO" noresize>
  <frame src="tester.php?subid=<?php print $subid; ?>" name="tester">
</frameset>
<noframes><body>

</body></noframes>
</html>
<?php
}
else
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>