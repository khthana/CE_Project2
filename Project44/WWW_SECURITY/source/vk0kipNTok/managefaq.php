<?php 
include "interface.inc.php"; 
include "admin_accesscontrol.php"; 
logo_adminmenu("Add new user");
curve_open();
?>
		<form action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>" method="post">
<?
//เริ่มแรกจะส่งตัวแปรมาผ่านทาง get
$group=$HTTP_GET_VARS["group"];
//พอครั้งต่อไปเมื่อมีการ submit จะมีการส่งตัวแปรผ่านทาง post 
if(isset($HTTP_POST_VARS["submit"])) $group=$HTTP_POST_VARS["group"];
//-----------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Move")  //เมื่อมีการกดปุ่ม Move ต้องเอาไว้บน select ที่จะ Quey จาก db ข้างล่าง ค่าจะได้ไม่ซ้อนกัน
{
		$faq=$HTTP_POST_VARS["faq"];
		$group_select=$HTTP_POST_VARS["group_select"];
		
		if (count($faq)==0)
			print "<center><font size=3><b>กรุณาเลือก คำถาม-คำตอบ ที่ต้องการจะย้ายกลุ่ม</b></font></center><br>";
		else
		{
			foreach($faq as $key => $val)
			{	//group_select เป็น value ที่ได้มาจาก select ข้างล่าง
				$sql4="update faq_each set id_group='$group_select' where id='$val' ";
				$result = mysql_query($sql4);
				if($result) print "<center>Change group already $key</center>";
			}
		}
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Delete selected FAQ") //ถ้ามีการกดปุ่ม Delete
{
		$faq=$HTTP_POST_VARS["faq"];
		if (count($faq)==0)  //เช็คว่าได้ทำการ check faq ที่จะลบหรือไม่ ต้องเอาไว้บน select ที่จะ Quey จาก db ข้างล่าง ค่าจะได้ไม่ซ้อนกัน
			print "<center><font size=3><b>กรุณาเลือก FAQ ที่ต้องการจะลบ</b></font></center><br> ";
		else //ถ้ามีการเช็ค
		{	
			foreach($faq as $key => $val) 
			{				
				$sql3="delete from faq_each where id='$val' "; //ลบแต่ละ link ตาม id ของ link ที่ select
				$result = mysql_query($sql3);
				if($result) echo "ทำการลบลิงค์ $val แล้ว <br>";
			}
		}
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Delete Group") //ถ้ามีการกดปุ่ม Delete Group
{
		$group_check=$HTTP_POST_VARS["group_check"];
		if (count($group_check)==0)  //เช็คว่าได้ทำการ check หมวดที่จะลบหรือไม่ ต้องเอาไว้บน select ที่จะ Quey จาก db ข้างล่าง ค่าจะได้ไม่ซ้อนกัน
		print "<center><font size=3><b>กรุณาเลือกกลุ่มที่ต้องการจะลบ</b></font></center><br> ";
		else //ถ้ามีการเช็ค
		{
			foreach($group_check as $key => $val) 
			{				
				$sql3 = "delete from faq_group where id='$val' "; //ลบแต่ละกลุ่มตาม id ของกลุ่มที่ select
				$sql4 = "delete from faq_each where id_group='$val' "; //ลบทุก link ที่สังกัดใน group นี้ 
				$result3 = mysql_query($sql3);
				$result4 = mysql_query($sql4);
				if($result3) echo "<center>ทำการลบกลุ่ม $val แล้ว <center>";
				if($result4) echo "<center>ทำการลบ FAQ ที่อยู่ในกลุ่ม $val แล้ว </center><br>";
			}	
		}
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Edit group name") //ถ้ามีการกดปุ่ม Edit group name
{
		$group_check=$HTTP_POST_VARS["group_check"];
		if (count($group_check)!=1)  //เช็คว่าได้ทำการ check หมวดที่จะเปลี่ยนชื่อกลุ่มหรือไม่ เปลี่ยนได้ทีละอันเท่านั้น
			print "<center><font size=3>เลือกหมวด 1 หมวดที่ต้องการเปลี่ยนชื่อ</font></center><br> ";
		else //ถ้ามีการเช็ค
		{
			foreach($group_check as $key => $val) //เนื่องจาก input เป็นอะเรย์ต้องใช้วิธีนี้เท่านั้น
			{
				$sql="select group_name from faq_group where id='$val' ";
				$result=mysql_query($sql);
				if (($result) and mysql_num_rows($result) ==1)
				{ 
					while($row=mysql_fetch_array($result))
					$group_name=$row['group_name'];
					print "<center><font size=3><b>แก้ไขพิมพ์ชื่อกลุ่ม FAQ ใหม่</b></font><br>";
					print "<input type=hidden name='group_check' value='$group_check[0]'>";
					print "<input type=text  size=40 name='group_name' value='$group_name'><br><br>";
					print "<input type=submit name='submit' value='Edit name'></center><br>";
				}
			}
		}
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Edit name") //ถ้ามีการกดปุ่ม Edit name เพื่อยืนยันที่จะแก้ไขชื่อกลุ่มจริงๆ
{
		$group_name=$HTTP_POST_VARS["group_name"];
		$group_check=$HTTP_POST_VARS["group_check"];
		$group_name=htmlspecialchars(trim($group_name));
		if($group_name=="") print "<center><font size=3><b>กรุณาพิมพ์ชื่อกลุ่มด้วย<b></font></center>";
		else
		{
			$sql="update faq_group set group_name='$group_name' where id='$group_check' ";
			$result = mysql_query($sql);
			if($result) print "<center><font size=3><b>เปลี่ยนชื่อกลุ่มเรียบร้อยแล้ว<b></font></center>";
			else print "<center><font size=3><b>ไม่สามารถเปลี่ยนกลุ่มได้<b></font></center>";
		}
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Edit Ques-Ans") //ถ้ามีการกดปุ่ม Edit link info 
{
		$faq=$HTTP_POST_VARS["faq"];
		if (count($faq)!=1)  //เช็คว่าได้ทำการ check ลิงค์ที่จะเปลี่ยนหรือไม่  1 อัน
			print "<center><font size=3><b>เลือก 1 คำถาม-คำตอบ ที่ต้องการจะแก้ไขข้อมูล</b></font></center><br> ";
		else //ถ้ามีการเช็ค 1 อัน
		{ 
			foreach($faq as $key => $val) 
			{
				$sql="select id,question,answer from faq_each where id='$val' ";
				$result=mysql_query($sql);
				if (($result) and mysql_num_rows($result) ==1)
				{ 
					while($row=mysql_fetch_array($result))
					{
						$id=$row['id'];
						$question=$row['question'];
						$answer=$row['answer'];						
					}
					print "<center><font size=3><b>แก้ไขข้อมูลที่ต้องการ</b></font><br><br>";
					print "<input type=hidden name='id' value='$id'>";
					print "<input type=text  size=40 name='question' value='$question'><br>";
					
					print "<textarea name='answer' cols=60 rows=5>$answer</textarea><br><br>";
					print "<input type=submit name='submit' value='Edit FAQ'></center>";
				}
			}
		}
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Edit FAQ") //ถ้ามีการกดปุ่ม Edit link จริงๆเลย ***************************
{
	$id=htmlspecialchars(trim($HTTP_POST_VARS["id"]));
	$question=htmlspecialchars(trim($HTTP_POST_VARS["question"]));
	$answer=htmlspecialchars(trim($HTTP_POST_VARS["answer"]));

	$error=0;
	if($question=="") { print "<center><font size=3><b>กรุณาพิมพ์คำถามด้วย<b></font></center>"; $error=1; }
	if($answer=="") { print "<center><font size=3><b>กรุณาพิมพ์คำตอบด้วย<b></font></center>"; $error=1; }
	if($error==0)
		{
			$sql="update faq_each set question='$question', answer='$answer' where id='$id' ";
			$result = mysql_query($sql);
			if($result) print "<center><font size=3><b>Update FAQ เรียบร้อยแล้ว<b></font></center>";
			else print "<center><font size=3><b>ไม่สามารถ update FAQ ได้<b></font></center>";
		}
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
?>
	<!--  <input type="hidden" name="group" value=" =$group ">  
		ถ้าต้องการให้ทำอะไรแล้วอยู่ที่หมวดเดิม เช่น ลบ แก้ไขชื่อ ก็ให้เอา comment ออก แต่มันจะพิมพ์ชื่อ FAQ หมวดทุกครั้ง
		ถ้าไม่ต้องการให้พิมพ์ก็ต้อง comment ไว้
	-->
<?
$sql0 = "select group_name from faq_group where id='$group' ";
$result = mysql_query($sql0);

if ((($result) and mysql_num_rows($result) ==1) or isset($HTTP_POST_VARS["submit"])) 
//ถ้าเลขที่ post มามีในหมวดก็ print หมวด พร้อม all link
{
	$row=mysql_fetch_array($result);
	$group_name=$row['group_name'];

	if(mysql_num_rows($result)==1) print "<B><font size=3> <CENTER>FAQ หมวด $group_name</CENTER> </font></B>";
		
	// select question and answer
			$sql2="select id,question,answer from faq_each where id_group='$group' ";
			$result = mysql_query($sql2);
			if(($result) and mysql_num_rows($result) > 0)
			{
				print "<table border=0 cellpadding=3 cellspacing=0 width=100%>";
				while ($row=mysql_fetch_array($result))
					{
							$id=$row['id'];
							$question=$row['question'];
							$answer=$row['answer']; 
							print "<tr><td valign=top ID=w2><input type='checkbox' name='faq[]' value='$id'> <img src=$path_web_img"."bullet.gif> <b>$question </b></td></tr>";
							print "<tr><td><font color='black'>$answer</font><br><br></td></tr>";
					}
					print "</table>";
//-----------------------------------------*******************************************
					  print "<center> <b>Move to Catagory</b>  &nbsp;&nbsp;";
	//แสดงหมวดหมู่ที่ Query มาจาก Database	แบบ select  อันเดียว เช็คก่อนนะว่าต้องมี link ถึงจะแสดง
	$sql1 = "select id,group_name from faq_group order by group_name";
		$result = mysql_query($sql1);
		if(($result) and mysql_num_rows($result) > 0) //ถ้ามีหมวดค่อย print select 
		{
			print "<select name='group_select'>";  //แต่ละหมวดเป็น select 1 อัน
			while ($row=mysql_fetch_array($result))
				{
					$id=$row['id'];
					$group_name=$row['group_name'];	
				
					print "<option value='$id' ";
					//ถ้า id=ค่าของ group_select ที่เคย select ไปก่อนนี้ก็ให้แสดง selected ที่ตัวนั้น
					if($id_group==$HTTP_POST_VARS["group_select"]) print " SELECTED";
					print ">$group_name</option> ";
				}
			print "</select>";		
		}
	print " <input type=submit name='submit' value='Move'><br><br>";
//-----------------------------------------*******************************************
?>
				<input type=submit name='submit' value='Edit Ques-Ans'>&nbsp;<input type=submit name='submit' value='Delete selected FAQ' onclick="return confirm('คุณต้องการที่จะลบ คำถาม-คำตอบ ที่เลือกออกจากฐานข้อมูล?')"></center>
<?
			}
			else // มีกลุ่มที่ถูกต้อง แต่ไม่มี faq ในกลุ่มนั้น
			{
					print " ";
			}
}
else
	{	print "<table border=0 cellpadding=0 cellspacing=0 width=100%><tr><td id=w2><B><font size=3> <CENTER>เลือกหมวด FAQ ด้านขวามือ</CENTER> </font></B></td></tr></table>"; }

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
curve_close();
other_5("faq_admin");
print "</form>";
?>