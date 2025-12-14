<?php 
include "interface.inc.php";
include "accesscontrol.php"; 
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open();
 $uid=$HTTP_SESSION_VARS["uid"];
//------------------------------------------------------------------------------------------------------------------------------------------------------------->
?>
<table border=0 cellpadding=1 cellspacing=1>
<tr><td>
<!----------------------------------------------------------------------------------------------------------------------------------------------------------->
<?
// ผู้ใช้กดปุ่ม submit group ใหม่เข้ามา
if (isset($HTTP_POST_VARS["submit"]) && $HTTP_POST_VARS["submit"]=="Add Group")
{
		$group=$HTTP_POST_VARS["group"];

		$Error=0;
		$group = htmlspecialchars(addslashes(trim($group)));
		if (!ereg("^.{3,}$",$group))
			{
					$Error=1;
					print "<CENTER><font color=\"$error_color\"> &nbsp;<B>ยังไม่ได้พิมพ์ชื่อกลุ่ม</B></font></CENTER>";
			}
		if ($Error == 0)
			{		
					$sql1 = "insert into link_group values('','$group',now(),'$uid','$flag2') ";
					$result = mysql_query($sql1);
					if ($result) {
								print "<center><font color=\"$error_color\"><B>เพิ่มกลุ่มใหม่เรียบร้อยแล้ว</B></font></center>";
						}     else { //ตารางเซ็ตไว้ว่าเป็น unique
								print "<center><font color=\"$error_color\"><B>ไม่สามารถเพิ่มได้ กลุ่มนี้มีอยู่แล้ว </B></font></center>";
						}		
			}
}
// ผู้ใช้กดปุ่ม submit link ใหม่เข้ามา
if (isset($HTTP_POST_VARS["submit_link"]) && $HTTP_POST_VARS["submit_link"]=="Add Link")
{
			$linkname=$HTTP_POST_VARS["linkname"];
			$link=$HTTP_POST_VARS["link"];
			$detail=$HTTP_POST_VARS["detail"];
			$group_select=$HTTP_POST_VARS["group_select"];
			$Error_link=0;
			$link = htmlspecialchars(addslashes(trim($link)));
			$linkname = htmlspecialchars(addslashes(trim($linkname)));
			$detail = htmlspecialchars(addslashes(trim($detail)));
			if (!ereg("^http:\/\/.+\..+$",$link))
			{
					$Error_link=1;
					print "<CENTER><font color=\"$error_color\"> &nbsp;<B>ใส่ url ให้ถูกต้อง</B></font></CENTER>";
			}
			if (!ereg("^.{2,}$",$linkname))
			{
					$Error_link=1;
					print "<CENTER><font color=\"$error_color\"> &nbsp;<B>ใส่ชื่อ url ให้ถูกต้อง</B></font></CENTER>";
			}
			if (!ereg("^.{5,}$",$detail))
			{
					$Error_link=1;
					print "<CENTER><font color=\"$error_color\"> &nbsp;<B>ใส่รายละเอียดของ url ให้ถูกต้อง</B></font></CENTER>";
			}
			if(!isset($group_select))  //ถ้าผู้ใช้ยังไม่ได้เลือกหัวข้อของ link ที่จะเพิ่ม
			{
					$Error_link=1;
					print "<CENTER><font color=\"$error_color\"> &nbsp;<B>ยังไม่ได้เลือกหมวดของลิงค์นี้ ด้านซ้ายมือ</B> </font></CENTER>";
			}
			if ($Error_link == 0)
			{		
					$sql1 = "insert into link_each values('','$group_select','$linkname','$link','$detail',now(),'$uid') ";
					$result = mysql_query($sql1);
					if ($result) {
								print "<center><font color=\"$error_color\"><b>เพิ่ม url เรียบร้อยแล้ว</b></font></center>";
						}     else {
								print "<center><font color=\"$error_color\"><b>ไม่สามารถเพิ่มได้ </b><font></center>";
						}
			}
}
?>
<!----------------------------------------------------------------------------------------------------------------------------------------------------------->
<form action="<? echo $PHP_SELF; ?>" method="post">
<?	//แสดงหมวดหมู่ที่ Query มาจาก Database		
		$sql1 =
				"select  link_group.group_name AS groupname,
								link_group.id_group AS idgroup,
								link_group.flag AS flag,
								count(link_each.link) AS numgroup
				from link_group LEFT join link_each on link_group.id_group=link_each.group_name
				group by link_group.group_name";

		$result = mysql_query($sql1);
		print "<b><center>หมวดของ link <br>*** หมายถึง เห็นเฉพาะ Staff</center></b>";
		print "<select size=18 name=\"group_select\" class=\"sty1\">";  //แต่ละหมวดเป็น select 1 อัน
		$sel=0;  //ใช้เพื่อ check ว่าถ้ามีการ SELECTED จาก case แรกแล้วไม่ต้องมา SELECT ที่ case หลังอีก
		while ($row=mysql_fetch_array($result))
			{
				$id_group=$row['idgroup'];
				$group_name=$row['groupname'];		
				$flag=$row['flag'];
				$numgroup=$row['numgroup'];
				print "<option value='$id_group' ";

				//ให้คง select group ไว้หลังจากผู้ใช้ได้เพิ่ม group ใหม่เข้ามา
				if(isset($HTTP_POST_VARS["group"]) && $group_name==$HTTP_POST_VARS["group"]) 
						{ print " SELECTED"; $sel=1;}
		elseif(isset($HTTP_POST_VARS["group_select"]) && $id_group==$HTTP_POST_VARS["group_select"] && $sel==0) 
				//ให้คง select group ไว้หลังจากผู้ใช้ได้ select ที่ group ใด group หนึ่งในขณะที่เพิ่ม link				
					{ print "SELECTED"; }										
				print ">";
				if($flag==1) print "*** ";
				print "$group_name ( $numgroup )</option>";

			}
		print "</select>";		


?>    
</td>
<td width=10>&nbsp;</td>
<td valign=top>
<!--------------------------------------------------------ยังฟอร์มเดียวกัน------------------------------------------------------------------------>
		<!-- แบบฟอร์มที่ใช้เพิ่ม link ใหม่ -->
		<B>Add Link </B><br>
		 <!-- ให้คงค่าเดิมไว้ในกรณีที่มีการ Error เท่านั้น -->

		<B>ชื่อ :</B>&nbsp;<input type=text name="linkname" size=40  class="sty1"
			value="<? echo (isset($HTTP_POST_VARS["linkname"]) && $Error_link==1) ? $HTTP_POST_VARS["linkname"] : ""; ?>" ><br>
		<B>url :</B> <input type=text name="link" size=40  class="sty1"
			value="<? echo (isset($HTTP_POST_VARS["link"]) && $Error_link==1) ? $HTTP_POST_VARS["link"] : ""; ?>" ><br>
		
		คำอธิบาย link (ไม่เกิน 5 บรรทัด) <br>
		<textarea name="detail" cols=40 rows=4 class="sty1"><? echo (isset($HTTP_POST_VARS["detail"]) && $Error_link==1) ? $HTTP_POST_VARS["detail"] : ""; ?></textarea><br><br>
		<input type=submit  name="submit_link" value="Add Link">

<hr>
<!----------------------------------------------------------------------------------------------------------------------------------------------------------->
		<!-- แบบฟอร์มที่ใช้เพิ่ม group ใหม่ -->
	<B><font color="#0066FF">Add new group</B><br>
	<input type="text" name="group" size=30 maxlength=30 class="sty2"><br>
	ประเภทของหมวดนี้ <br>
	<input type=radio name="flag2" value="0" 
		<? echo (isset($HTTP_POST_VARS["flag2"]) && $HTTP_POST_VARS["flag2"]==0) ? "CHECKED" : "CHECKED"; ?>>
			หมวดนี้ผู้ใช้ทั่วไปสามารถเข้ามาดูได้ <br>
	<input type=radio name="flag2" value="1" 
		<? echo (isset($HTTP_POST_VARS["flag2"]) && $HTTP_POST_VARS["flag2"]==1) ? "CHECKED" : ""; ?>>ให้เฉพาะ Staff ที่ login เข้ามาเท่านั้นสามารถดูได้<br><br>
	<input type=submit name="submit" value="Add Group"><br></font>
</form>

</td>
</tr></table><br>

<b><font size=3>คำแนะนำในการใช้งาน</font></b>
<ul>
<li>  กรอบสี่เหลี่ยมด้านบนนี้จะแสดงหมวดของลิงค์ที่มีอยู่ พร้อมด้วยจำนวนของลิงค์ที่มีอยู่ในหมวดนั้น เช่น <b>Hardware (3)</b> หมายความว่ามีหมวด <b>Hardware</b> และในหมวดนี้มีลิงค์อยู่ <b>3</b> ลิงค์  ถ้าหมวดไหนมีเครื่องหมาย <b>***</b> นำหน้า หมายความว่า ต้องเป็น staff ที่ login เข้ามาจึงจะเห็นหมวดนั้นและลิงค์ทั้งหมดในหมวดนั้น <br><br>

<li>  ถ้าต้องการเพิ่มลิงค์แต่ไม่มีหมวดที่เกี่ยวข้อง สามารถสร้างหมวดใหม่ขึ้นมาได้ โดยพิพม์ชื่อหมวดใหม่ลงไปในช่อง <b>Add new group</b>แล้วเลือกประเภทของหมวด  แล้วคลิกปุ่ม  <b> Add Group</b><br><br>

<li> ถ้าต้องการเพิ่มลิงค์และมีหมวดที่ตรงกับลิงค์ในกล่องทางด้านซ้ายแล้วให้คลิกเลือกหมวดทางด้านซ้ายแล้วกรอกข้อมูลเกี่ยวกับลิงค์ทั้ง 3 ช่องลงไปแล้วคลิกปุ่ม <b> Add link </b><br><br>

</ul>
<!----------------------------------------------------------------------------------------------------------------------------------------------------------->
<?
curve_close();
staffmenu_5();
?>
<!--
ลบกลุ่มถ้ายังมีข้างในให้เตือนด้วย
-->
<style type="text/css"> .sty1 {
background-color:#ddddee;
font-family:MS Sans Serif;
font-size:14px;
color:000000;
}.sty2 {
background-color:#99CCFF;
font-family:MS Sans Serif;
font-size:14px;
color:000000;
}
</style> 