<?php 
include "interface.inc.php";
include "db.php";
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open();

if($HTTP_POST_VARS["submit"]=="Search")
{
		$error=0;
		$keyword=htmlspecialchars(trim($HTTP_POST_VARS["keyword"]));
		$choice=$HTTP_POST_VARS["choice"];

		if($keyword=="") $error=1;
		else
		{
			//=======================================================================================
			if($choice==1) //ค้นหาข้อมูลทั้งหมด
				{

				}
			//=======================================================================================
			if($choice==2) //ข่าวประกาศต่างๆ
				{

				}
			//=======================================================================================
			if($choice==3) //บทความ
				{ 
						$sql = "select id_articles,ar_name from articles_each where ar_name like ('%$keyword%') or ar_key like ('%$keyword%') or ar_detail like ('%$keyword%') ";
						$result = mysql_query($sql);
						if(mysql_num_rows($result)>0)
						{
							$order=1;
							print "<center><font size=3>ค้นพบบทความทั้งสิ้น <b>".mysql_num_rows($result)."</b> บทความ จากคีย์เวิร์ด <b>$keyword</b></font></center><br><br>";
							while ($row=mysql_fetch_array($result))
							{
									$id_articles=$row['id_articles'];											
									$ar_name=$row['ar_name'];					
									print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>$order. <a href='../articles/articlelist.php?id=$id_articles' target=\'_new_\'>$ar_name</a></b> <br><br>";
									$order++;

							}
						}
						else
						{
							print "<center>ไม่พบข้อมูลที่ค้นหา</center>";
						}
				}
			//=======================================================================================
			if($choice==4) //บทความตีพิมพ์
				{

				}
			//=======================================================================================
			if($choice==5) //ไฟล์และโปรแกรม
				{

				}
			//=======================================================================================
			if($choice==6) //สมาชิก
				{
						$sql = "select ID,Name,Nickname,Email from staff_profile where Name like ('%$keyword%') or Nickname like ('%$keyword%') ";
						$result = mysql_query($sql);
						if(mysql_num_rows($result)>0)
						{
							$order=1;
							print "<center><font size=3>ค้นพบสมาชิกทั้งสิ้น <b>".mysql_num_rows($result)."</b> คน จากคีย์เวิร์ด <b>$keyword</b></font></center><br><br>";
							while ($row=mysql_fetch_array($result))
							{
									$ID=$row['ID'];											
									$Name=$row['Name'];	
									$Nickname=$row['Nickname'];		
									$Email=$row['Email'];

									print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>$order. <a href='../staff/staff.php?id=$ID' target=\'_new_\'>$Name $Nickname</a></b> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $Email <br><br>";
									$order++;

							}
						}
						else
						{
							print "<center>ไม่พบข้อมูลที่ค้นหา</center>";
						}
				}
			//=======================================================================================
			if($choice==7) //ข้อมูลโปรเจค
				{
						$sql = "select IDProject,Name_Thai,Name_Eng from add_project where Name_Thai like ('%$keyword%') or Name_Eng like ('%$keyword%') or Detail like ('%$keyword%') ";
						$result = mysql_query($sql);
						if(mysql_num_rows($result)>0)
						{
							$order=1;
							print "<center><font size=3>ค้นพบโปรเจคทั้งสิ้น <b>".mysql_num_rows($result)."</b> โปรเจค จากคีย์เวิร์ด <b>$keyword</b></font></center><br><br>";
							while ($row=mysql_fetch_array($result))
							{
									$IDProject=$row['IDProject'];											
									$Name_Thai=$row['Name_Thai'];											
									$Name_Eng=$row['Name_Eng'];		

									print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>$order. <a href='../project/projects.php?id=$IDProject' target=\'_new_\'>$Name_Thai</a></b> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $Name_Eng <br><br>";
									$order++;

							}
						}
						else
						{
							print "<center>ไม่พบข้อมูลที่ค้นหา</center>";
						}
				}
			//=======================================================================================
			if($choice==8) //กระทู้ในเว็บบอร์ด
				{

				}
			//=======================================================================================
		}
}
//--------------------------------------------------------------------------------------------------------------------------------------------->>
if($HTTP_POST_VARS["submit"]!="Search" or $error==1)
{
print "<center>";
if ($error==1) print "<font size=3><b>คุณยังไม่ได้ใส่คีย์เวิร์ดที่ต้องการค้นหา</b></font>";
else print "<font size=3><b>ค้นหาข้อมูล</b></font>";
?>
<form action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>" method="post">
		<input type=text name="keyword" size=30>&nbsp;
		<select name="choice">
				<!-- <option value="1">ค้นหาข้อมูลทั้งหมด</option> -->
				<!-- <option value="2">ข่าวประกาศต่างๆ</option> -->
				<option value="3">บทความ</option>
				<!-- <option value="4">บทความตีพิมพ์</option> -->
				<!-- <option value="5">ไฟล์และโปรแกรม</option> -->
				<option value="6">สมาชิก</option>
				<option value="7">ข้อมูลโปรเจค</option>
				<!-- <option value="8">กระทู้ในเวบบอร์ด</option> -->
		</select><br>
		<input type=submit name="submit" value="Search">&nbsp;<input type=reset  value="Reset">
</form></center>
<?
}
curve_close();
empty_4();
?>