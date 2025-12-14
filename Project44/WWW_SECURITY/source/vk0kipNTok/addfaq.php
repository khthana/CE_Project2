<?php 
include "interface.inc.php"; 
include "admin_accesscontrol.php"; 
logo_adminmenu("Add new user");
curve_open();
$uid=$HTTP_SESSION_VARS["uid"];
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="New Category")
{
		$error=0;
		$newgroup=htmlspecialchars(trim($HTTP_POST_VARS["newgroup"]));

		if($newgroup=="")
		{
			$error=1;
			print "<font color='$error_color'><center> ยังไม่ได้พิมพ์ชื่อกลุ่ม</center></font><BR>";
		}
		if($error==0)
		{
				$sql="insert into faq_group values ('','$newgroup','$uid',now())";
				$result=mysql_query($sql);
				if($result)
					{
							print "<font size=3><b><center>สร้างหมวดใหม่เรียบร้อยแล้ว</center></b></font>";
					}
				else
					{
							print "<font size=3 color='$error_color'><b><center>ไม่สามารถ insert ลงในฐานข้อมูลได้</center></b></font>";
					}
		}
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Add FAQ")
{
		$error=0;
		$group=$HTTP_POST_VARS["group"];
		$question=htmlspecialchars(trim($HTTP_POST_VARS["question"]));
		$answer=htmlspecialchars(trim($HTTP_POST_VARS["answer"]));
		if($question=="")
		{
			$error=1;
			print "<font color='$error_color'><center> ยังไม่ได้พิมพ์คำถาม</center></font>";
		}
		if($answer=="")
		{
			$error=1;
			print "<font color='$error_color'><center> ยังไม่ได้พิมพ์คำตอบ</center></font>";
		}
		if($error==0)
		{
				$sql="insert into faq_each values ('','$group','$question','$answer','$uid',now())";
				$result=mysql_query($sql);
				if($result)
					{
							print "<font size=3><b><center>เพิ่มคำถาม - คำตอบ เรียบร้อยแล้ว</center></b></font>";
					}
				else
					{
							print "<font size=3 color='$error_color'><b><center>ไม่สามารถ insert ลงในฐานข้อมูลได้</center></b></font>";
					}
		}
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
?>
<form method=post action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>">
<center><table cellpadding=2 cellspacing=1 width=450>
<tr ID=table3><td colspan=2><b><CENTER>Add new category</CENTER></b></td></tr>
<tr>
	<td ID=table1 width=140> &nbsp;สร้างหมวดคำถามใหม่</td>	
	<td ID=table1><input type=text  size=35 name="newgroup"></td></tr>
<tr>
	<td colspan=2 ID=table1><br></td></tr>
<tr>
	<td colspan=2 ID=table1><CENTER><input type="submit" name="submit" value="New Category">
	</CENTER></td></tr>


<tr>
	<td colspan=2 ID=table3><center>Add new FAQ</center></td></tr>

<tr>
	<td ID=table1 width=140> &nbsp;เลือกหมวดคำถาม</td>	
	<td ID=table1>
<?//----------------------------------------------------------------------

	//select รายชื่อกลุ่มมาแสดง
	$sql="select id,group_name from faq_group order by group_name";
	$result=mysql_query($sql);
	if(($result) and mysql_num_rows($result)>0)
	{
			print "<select name='group'>";
			while($row=mysql_fetch_array($result))
			{
					$id=$row['id'];
					$group_name=$row['group_name'];
					print "<option value='$id' ";

					if (isset($newgroup) and ($group_name==$newgroup)) print " SELECTED"; //ถ้าสร้างกลุ่มใหม่ให้ select ตรงชื่อกลุ่มที่สร้างใหม่ทันที
					if($id==$HTTP_POST_VARS['group'] and !isset($newgroup)) print " SELECTED"; //ถ้าเลือกกลุ่มไหน ก็ให้ยังคงเลือกกลุ่มนั้นอยู่

					print ">$group_name</option>";
			}
			print "</select>&nbsp;&nbsp;&nbsp;"; 
	}
	else print "<font size=3 color='$error_color'><b><center>ยังไม่มีหมวดของ FAQ ให้สร้างหมวดใหม่ขึ้นมาก่อน</center></b></font>";
	//----------------------------------------------------------------------
?>
	</td></tr>
<tr>
	<td ID=table1 width=140> &nbsp;คำถาม</td>	<!--  ถ้ามี เออเรอค่อยพิพม์ตัวเก่าออกมา ถ้าไม่มีก็ไม่ต้อง -->
	<td ID=table1><input type=text  size=55 name="question" <? if($error==1) print " value='$question' "; ?>></td></tr>
<tr>
	<td ID=table1 width=140> &nbsp;คำตอบ</td>	
	<td ID=table1><textarea cols=55 rows=5 name="answer"><? if($error==1) print "$answer"; ?></textarea></td></tr>
<tr>
	<td colspan=2 ID=table1><br></td></tr>
<tr>
	<td colspan=2 ID=table1><CENTER><input type=submit name="submit" value="Add FAQ">
	&nbsp;&nbsp;<input type=Reset></CENTER></td></tr>
</table></center>
</form>

<br><font size=3><b>คำแนะนำ</b></font>
<ul>
<li> ถ้าไม่มีหมวดคำถามที่ตรงกับหัวข้อคำถามก็สามารถสร้างหมวดขึ้นมาใหม่ได้ แต่ถ้ามีหมวดคำถามอยู่แล้วก็ให้เลือกหมวดคำถามและพิมพ์คำถาม-คำตอบได้เลย
</ul>
<?
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close();
empty_4();
?>