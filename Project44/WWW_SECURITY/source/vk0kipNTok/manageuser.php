<?php 
include "interface.inc.php"; 
include "admin_accesscontrol.php"; 
logo_adminmenu("Add new user");
curve_open();
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Delete user") //ถ้ามีการกดปุ่ม Delete user
{
		$link=$HTTP_POST_VARS["link"];
		if (count($link)==0)  //เช็คว่าได้ทำการ check ที่จะลบหรือไม่
			print "<center><font size=3 color='$error_color'><b>กรุณาเลือก User ที่ต้องการจะลบ</b></font></center><br> ";
		else //ถ้ามีการเช็ค
		{	
			foreach($link as $key => $val)  //เวลาลบต้องลบทั้งสองตารางด้วย
			{				
				$sql1="delete from accesslist where Username='$val' "; //ลบ user ในตาราง accesslist
				$result = mysql_query($sql1);
				if($result)
				{	//--------------------------------------------------------------------------------------------
					//ลบรูปทิ้งก่อนแล้วค่อยเข้าไปลบประวัติจริงๆ
					$query = "select * from staff_profile where Staffuser='$val' ";
					$result = mysql_query($query);
					$row = mysql_fetch_array($result);
					$picturestaff = $row['Picturestaff'];		
					if ($picturestaff!="")
					{
						if (!unlink("$path_staff_pic$picturestaff"))  echo "<font size=3><center>ไม่สามารถลบรูปของ $val ทิ้งได้</center></font>";
					}			
					//เข้าไปลบประวัติจริงๆ 
					$sql2="delete from staff_profile where Staffuser='$val' "; //ลบ user ในตาราง staff_profile
					$result2 = mysql_query($sql2);
					//--------------------------------------------------------------------------------------------
					//ลบรูปทิ้งก่อนแล้วค่อยเข้าไปลบประวัติจริงๆ
					$query = "select * from advisor_profile where user='$val' ";
					$result = mysql_query($query);
					$row = mysql_fetch_array($result);
					$picturestaff = $row['Picturestaff'];		
					if ($picturestaff!="")
					{
						if (!unlink("$path_staff_pic$picturestaff"))  echo "<font size=3><center>ไม่สามารถลบรูปของ $val ทิ้งได้</center></font>";
					}			
					//เข้าไปลบประวัติจริงๆ 
					$sql3="delete from advisor_profile where user='$val' "; //ลบ user ในตาราง staff_profile
					$result3 = mysql_query($sql3);
					//--------------------------------------------------------------------------------------------
					if(($result2) and ($result3))
						{
							print "<font size=3><CENTER> ลบ User <B> $val </B> เรียบร้อยแล้ว </CENTER></font>";
						}

				}
			}
		}
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Set new password") //ถ้ามีการกดปุ่ม Assign new password
{
		$link=$HTTP_POST_VARS["link"];
		if (count($link)!=1)  //เช็คว่าได้ทำการ check ที่จะลบหรือไม่
			print "<center><font size=3 color='$error_color'><b>เลือก User 1 คนที่ต้องการจะกำหนด Password ให้ใหม่</b></font></center><br> ";
		else //ถ้ามีการเช็ค
		{	
			foreach($link as $key => $val)  //เวลาลบต้องลบทั้งสองตารางด้วย
			{				
				print "<font size=3><center><b>User : $val</b></center></font>";
?>
			<form action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>" method="post">
					<center><table cellpadding=2 cellspacing=1 width=300 border=0>
					<tr id=table3><td colspan=2>&nbsp;</td></tr>
					<tr id=w2><td>&nbsp;Password :</td><td align=left>&nbsp;<input type=password size=15 name=pw1 maxlength=50></td></tr>
					<tr id=w2><td>&nbsp;Password Again:</td><td align=left>&nbsp;<input type=password size=15 name=pw2 maxlength=50></td></tr>
					<tr id=w2><td colspan=2>&nbsp;</td></tr>
					<input type=hidden name="Username" value="<?=$val?>">
					<tr id=w2><td colspan=2><CENTER><input type=submit name="submit" value="Set password"></CENTER></td></tr>
					</table></center>
			</form>			
<?
			}
		}
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Set password") //ถ้าได้พิมพ์ password ลงไปและกดปุ่ม set password แล้ว
{
		$val=$HTTP_POST_VARS["Username"];
		$pw1=$HTTP_POST_VARS["pw1"];
		$pw2=$HTTP_POST_VARS["pw2"];
		if ((!ereg("^.{8,}$",$pw1)) or ($pw1!=$pw2))
			{	//ถ้า pw ผิด จะคงค่า  username และ ตัวแปร submit ข้างบนไว้ เพื่อให้ไปฟอร์มข้างบนเหมือนเดิม
				print "<font color='$error_color'><CENTER>password ต้องมีความยาว 8 ตัวขึ้นไปและเท่ากันทั้งสองช่อง</CENTER></font>";
?>
				<form action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>" method="post">
				<input type=hidden name='link[]' value="<?=$HTTP_POST_VARS['Username']?>">
				<input type=hidden name="submit" value="Set new password">
				<CENTER><input type=submit name="try" value="Try again"></CENTER>
				</form>
<?
			}
		else
			{
				$sql1=  "update accesslist set Password=PASSWORD('$pw1') where Username='$val' "; 
				$result = mysql_query($sql1);
				if ($result) print "<font size=3><center><b>Set Password ใหม่ของ $val เรียบร้อยแล้ว</b></center></font>";
			}
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Change privilege") //ถ้ามีการกดปุ่ม Change type
{
		$link=$HTTP_POST_VARS["link"];
		if (count($link)!=1)  //เช็คว่าได้ทำการ check ที่จะลบหรือไม่
			print "<center><font size=3 color='$error_color'><b>เลือก User 1 คนที่ต้องการจะเปลี่ยนสิทธิ์การใช้งานใหม่</b></font></center><br>";
		else //ถ้ามีการเช็ค
		{	
			foreach($link as $key => $val)  //เวลาลบต้องลบทั้งสองตารางด้วย
			{				
?>			<center><font size=3><b>เปลี่ยนสิทธิ์ User <?=$val?></b></font></center><br>
				<form action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>" method="post">
						<center>เปลี่ยนเป็น <select name="priv">
								<option value="0">&nbsp;</option>
								<option value="1">Administrator</option>
								<option value="2">General staff</option>
						</select>&nbsp;
						<input type=hidden name="user" value="<?=$val?>">
						<input type=submit name="submit" value="Change"></center>
				</form>
<?				
			}
		}
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Change")  //ถ้าเลื่อกชนิดที่จะเปลี่ยนสิทธิ์แล้ว OK
{
		$priv = $HTTP_POST_VARS["priv"];
		$user = $HTTP_POST_VARS["user"];
		if($priv==0) print "<font size=3><b><center>คุณยังไม่ได้ Select อะไรเลย</center></b></font>";
		if($priv==1 or $priv==2)
		{
				$sql1=  "update accesslist set Level='$priv' where Username='$user' "; 
				$result = mysql_query($sql1);
				if ($result) 
					{
						print "<font size=3><center><b>Set Privilege ของ $user เป็น";
							if($priv==1) print " <font color='red'> Administrator </font>"; else print " <font color='red'>General Staff </font>";
						print "เรียบร้อยแล้ว</b><br> ตรวจสอบโดยการคลิกดูชื่อที่เมนูด้านขวาอีกครั้ง</center></font>";
					}
		}
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(isset($HTTP_GET_VARS['type'])) //@@@@@@
{
?>
	<form action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>" method="post">
<?
	$type=$HTTP_GET_VARS['type'];
	//----------------------------------------------------------------------->>>>>>>>>>>>
	if($type==0)
	{
			$sql1 = "select Username,Fullname,Nickname,Email from accesslist order by Username";
			$result = mysql_query($sql1);
			if (($result) and (mysql_num_rows($result) >0))
				{
						print "<center><font size=3><b>List all user</b></font><br>";
						print "<table cellpadding=2 cellspacing=1 border=0 width=85%>";
						print "<tr ID=table3><td colspan=5>&nbsp;</td></tr>";
						while ($row=mysql_fetch_array($result))
								{
										$Username=stripslashes($row['Username']);
										$Fullname=stripslashes($row['Fullname']);
										$Nickname=stripslashes($row['Nickname']);
										$Email=stripslashes($row['Email']);
										print "<tr ID=table1><td><input type='checkbox' name='link[]' value='$Username'></td><td>";
										print "&nbsp;$Username</td><td>&nbsp;$Fullname</td><td>&nbsp;$Nickname</td><td>&nbsp;$Email</td></tr>";
								}	
						print "</table></center>";
				}
			else
				{		print "ไม่สามารถ Query ข้อมูลจากฐานข้อมูลได้หรือไม่มี user ในฐานข้อมูล";		}
	}
	//----------------------------------------------------------------------->>>>>>>>>>>>
	if($type==1)
	{
			$sql1 = "select Username,Fullname,Nickname,Email from accesslist where Level=1 order by Username";
			$result = mysql_query($sql1);
			if (($result) and (mysql_num_rows($result) >0))
				{
						print "<center><font size=3><b>List all Administrator</b></font><br>";
						print "<table cellpadding=2 cellspacing=1 border=0 width=85%>";
						print "<tr ID=table3><td colspan=5>&nbsp;</td></tr>";
						while ($row=mysql_fetch_array($result))
								{
										$Username=stripslashes($row['Username']);
										$Fullname=stripslashes($row['Fullname']);
										$Nickname=stripslashes($row['Nickname']);
										$Email=stripslashes($row['Email']);
										print "<tr ID=table1><td><input type='checkbox' name='link[]' value='$Username'></td><td>";
										print "&nbsp;$Username</td><td>&nbsp;$Fullname</td><td>&nbsp;$Nickname</td><td>&nbsp;$Email</td></tr>";
								}	
						print "</table></center>";
				}
			else
				{		print "ไม่สามารถ Query ข้อมูลจากฐานข้อมูลได้";		}
	}
	//----------------------------------------------------------------------->>>>>>>>>>>>
	if($type==2)
	{
			$sql1 = "select Username,Fullname,Nickname,Email from accesslist where Level=2 order by Username";
			$result = mysql_query($sql1);
			if (($result) and (mysql_num_rows($result) >0))
				{
						print "<center><font size=3><b>List all General Staff</b></font><br>";
						print "<table cellpadding=2 cellspacing=1 border=0 width=85%>";
						print "<tr ID=table3><td colspan=5>&nbsp;</td></tr>";
						while ($row=mysql_fetch_array($result))
								{
										$Username=stripslashes($row['Username']);
										$Fullname=stripslashes($row['Fullname']);
										$Nickname=stripslashes($row['Nickname']);
										$Email=stripslashes($row['Email']);
										print "<tr ID=table1><td><input type='checkbox' name='link[]' value='$Username'></td><td>";
										print "&nbsp;$Username</td><td>&nbsp;$Fullname</td><td>&nbsp;$Nickname</td><td>&nbsp;$Email</td></tr>";
								}	
						print "</table></center>";
				}
			else
				{		print "ไม่สามารถ Query ข้อมูลจากฐานข้อมูลได้";		}
	}
	//----------------------------------------------------------------------->>>>>>>>>>>>
?><br><center>
	<input type="submit" name="submit" value="Delete user"  onclick="return confirm('คุณต้องการที่จะลบ User ที่เลือกออกจากฐานข้อมูล?')">&nbsp;
	<input type="submit" name="submit" value="Set new password">&nbsp;
	<input type="submit" name="submit" value="Change privilege">
	</center></form>
<?
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(!isset($HTTP_GET_VARS['type']) and !isset($HTTP_POST_VARS['submit'])) //@@@@@@
{
	print "<b><center><font size=3>เลือกประเภทของ User ที่ต้องการในช่องขวามือ</font></center></b>";
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
curve_close();
other_5("manageuser");
?>