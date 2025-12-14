<?php 
include "interface.inc.php"; 
include "admin_accesscontrol.php"; 
logo_adminmenu("Add new user");
curve_open("<center>");
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="update")
{
	$info=$HTTP_POST_VARS["info"];
	$sql = "update contact set info='$info' where id=1 ";
	$result = mysql_query($sql);
	if($result) print "<font size=3><b>Update Complete</b></font><br>";
}
else
{
	print "<font size=3><b>Contact Information</b></font>";
}

	
	$sql = "select info from contact where id=1";
	$result = mysql_query($sql);
	if(mysql_num_rows($result)==1)
	{
		$row=mysql_fetch_array($result);
		$info=$row["info"]; 
?>

		<form action="<?=$HTTP_POST_VARS['PHP_SELF']?>" method="post">
			<textarea cols=80 rows=15 name="info"><?=$info?></textarea><br>
			<input type="submit" name="submit" value="update">&nbsp;
			<input type=reset>
		</form>
<?
	}
	else
	{
		print "<font size=3><b><br>Error contact webmaster krab</b></font>";
	}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close("</center>");
empty_4();
?>