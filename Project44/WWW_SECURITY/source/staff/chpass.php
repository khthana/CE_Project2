<?php 
include "interface.inc.php";
include "accesscontrol.php";
logo_leftmenu("ISAG (Change Password)"); 
curve_open("<center>");
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------->
if($HTTP_POST_VARS['submit']=="Change Password")
{
	$error=0;
		$pw1=$HTTP_POST_VARS["pw1"];
		$pw2=$HTTP_POST_VARS["pw2"];
		$pw22=$HTTP_POST_VARS["pw22"];
		if (!ereg("^.{12,}$",$pw2) or ($pw2!=$pw22) or !ereg("^.{8,}$",$pw1))
			{
				$error=1;
				print "<font color=\"$error_color\">ตรวจสอบ password ให้ถูกต้อง Password ใหม่ควรมีความยาวไม่น้อยกว่า 8 ตัวอักษร</font><BR>";
			}
		if($error==0) // แสดงว่าพิมพ์ครบ 3 ช่อง โดย 2 ช่องหลังเท่ากัน | ให้ select password แรกจาก db ว่ามีเปล่า
			{
				$uid=$HTTP_SESSION_VARS["uid"];
				$sql = "SELECT * FROM accesslist WHERE Username = '$uid' AND Password = PASSWORD('$pw1')";
				$result = mysql_query($sql);
				if (!$result) { print "cannot query database";  exit;}
					if (mysql_num_rows($result) ==1)
					{
						$sql2 = "update accesslist set Password=PASSWORD('$pw2') where Username='$uid' ";
						$result2 = mysql_query($sql2);
						if($result2) { redirect("../staff/isagstaff.php");	exit; }
						else { print "cannot query database"; exit;}
					}
				if (mysql_num_rows($result) == 0)
					{
						print "<font color=\"$error_color\">Password ไม่ถูกต้อง</font><br>";						
					}			
			}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------->
?>
<form method=post action="<? echo $HTTP_SERVER_VARS['PHP_SELF']; ?>">

<table cellpadding=2 cellspacing=1 width=400>
<tr ID=table3><td colspan=2><b><CENTER>เปลี่ยนรหัสผ่าน</CENTER></b></td></tr>
<tr>
	<td ID=table1> &nbsp;Old Password</td>
	<td ID=table1><input type=password size=12 name=pw1 maxlength=30></td></tr>
<tr>
	<td ID=table1> &nbsp;New Password</td>
	<td ID=table1><input type=password size=12 name=pw2 maxlength=30></td></tr>
<tr>
	<td ID=table1> &nbsp;Confirm New Password</td>
	<td ID=table1><input type=password size=12 name=pw22 maxlength=30></td></tr>
<tr>
	<td colspan=2 ID=table1><br></td></tr>
<tr>
	<td colspan=2 ID=table1><CENTER><input type=submit name="submit" value="Change Password">
	</CENTER></td></tr>
</table>

</form>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<?
	curve_close("</center>");
	staffmenu_5();
?>
