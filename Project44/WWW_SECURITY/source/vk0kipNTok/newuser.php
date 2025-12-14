<?php 
include "interface.inc.php"; 
include "admin_accesscontrol.php"; 



logo_adminmenu("Add new user");
curve_open();
		$fullname = htmlspecialchars(trim($HTTP_POST_VARS["fullname"]));
		$nickname = htmlspecialchars(trim($HTTP_POST_VARS["nickname"]));
		$email = htmlspecialchars(trim($HTTP_POST_VARS["email"]));
		$username = htmlspecialchars(trim($HTTP_POST_VARS["username"]));
		$pw1 = htmlspecialchars(trim($HTTP_POST_VARS["pw1"]));
		$pw2 = htmlspecialchars(trim($HTTP_POST_VARS["pw2"]));
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS["Add"]=="Add User")
{
		$Error=0;		
		if (!ereg("^.{5,}$",$fullname))
			{
				$Error=1;
				print "<font color=\"$error_color\">&nbsp;&nbsp; ชื่อจริงไม่ถูกต้อง</font><BR>";
			}
		/*if (!ereg("^.{1,}$",$nickname))
			{
				$Error=1;
				print "<font color=\"#FF0000\">&nbsp;&nbsp; ชื่อเล่นไม่ถูกต้อง</font><BR>";
			}*/
		if (!ereg("^.+@.+\..+$",$email))
			{
				$Error=1;
				print "<font color=\"$error_color\">&nbsp;&nbsp; Email Address ไม่ถูกต้อง </font><BR>";
			}
		if (!ereg("^.{1,}$",$username))
			{
				$Error=1;
				print "<font color=\"$error_color\">&nbsp;&nbsp; username ไม่ถูกต้อง</font><BR>";
			}
		if ((!ereg("^.{8,}$",$pw1)) or ($pw1!=$pw2))
			{
				$Error=1;
				print "<font color=\"$error_color\">&nbsp;&nbsp; password ต้องมีความยาว 8 ตัวขึ้นไปและเท่ากันทั้งสองช่อง</font><BR>";
			}
}
if (($HTTP_POST_VARS["Add"]=="Add User") and ($Error==0))
{
	$sql1 = "insert into accesslist values (NULL,'$fullname','$nickname','$email','$username',PASSWORD('$pw1'),2)";
	$result = mysql_query($sql1);

	//$sql2 = "insert into staff_profile (ID,Staffuser,Name,Nickname,Email,Last_update) values (NULL,'$username','$fullname','$nickname','$email',now())";
	if ($result)
	{
	print "<b><center><font size=3><br><br><br>Add User เรียบร้อยแล้ว <br>";
?>
		<a href="<?=$HTTP_SERVER_VARS['PHP_SELF']?>"> Add other user </a></font></center></b>
<?
	}
	else 
	{
		print "<b><center><font size=3><br><br><br>ไม่สามารถ Add ข้อมูล User ได้ ชื่อนี้มีอยู่ในฐานข้อมูลแล้ว<br>";
?>
		<a href="<?=$HTTP_SERVER_VARS['PHP_SELF']?>"> Add other user </a></font></center></b>
<?
	}
}
if (($HTTP_POST_VARS["Add"]!="Add User") or ($Error==1))
{

?>
<CENTER>
<form method=post action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>">
<table cellpadding=2 cellspacing=1 width=400>
<tr ID=table3><td colspan=2><b><CENTER>Add User</CENTER></b></td></tr>
<tr>
	<td ID=table1 width=140> &nbsp;Fullname</td>	
	<td ID=table1><input type=text  size=25 name=fullname value="<?=stripslashes($fullname)?>"></td></tr>
<tr>
	<td ID=table1> &nbsp;Nickname</td>				
	<td ID=table1><input type=text size=5 name=nickname maxlength=10 value="<?=stripslashes($nickname)?>"></td></tr>
<tr>
	<td ID=table1> &nbsp;Email</td>				
	<td ID=table1><input type=text size=25 name=email value="<?=stripslashes($email)?>"></td></tr>
<tr>
	<td ID=table1> &nbsp;Username :</td>
	<td ID=table1><input type=text size=12 name=username maxlength=30 value="<?=stripslashes($username)?>"></td></tr>
<tr>
	<td ID=table1> &nbsp;Password</td>
	<td ID=table1><input type=password size=12 name=pw1 maxlength=50></td></tr>
<tr>
	<td ID=table1> &nbsp;Confirm Password</td>
	<td ID=table1><input type=password size=12 name=pw2 maxlength=50></td></tr>
<tr>
	<td colspan=2 ID=table1><br></td></tr>
<tr>
	<td colspan=2 ID=table1><CENTER><input type=submit name=Add value="Add User">
	&nbsp;&nbsp;<input type=Reset></CENTER></td></tr>
<tr>
	<td colspan=2><br></td></tr>
</table>
</form>
</CENTER>
<?
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
curve_close();
empty_4();
?>
