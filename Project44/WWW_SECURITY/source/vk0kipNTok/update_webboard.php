<?php 
include "interface.inc.php"; 
include "admin_accesscontrol.php"; 
logo_adminmenu("Add new user");
curve_open();
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(isset($HTTP_GET_VARS["main"]) and !isset($HTTP_GET_VARS["sub"]) and isset($HTTP_GET_VARS["type"])) 
{		
	//แสดงว่าต้องการแก้ไขหัวข้อกระทู้ หรือลบทั้งกระท
	$main=$HTTP_GET_VARS["main"];
	$type=$HTTP_GET_VARS["type"];
	$sql="delete from board_ques where ID='$main' ";  //ลบกระทู้ตั้งต้น
	$result = mysql_query($sql);
	if($result)
	{
		$sql2="delete from board_ans where Ques='$main' ";  //ลบคำตอบของกระทู้ตั้งต้น
		$result2= mysql_query($sql2);
		if($result2)
		{
			print "<font size=3><CENTER><B>ลบกระทู้นี้พร้อมคำตอบทั้งหมดเรียบร้อยแล้ว</B></CENTER></font>";
			print "<script language='Javascript'>window.location.replace('../webboard/boardlist.php?type=".$type."');  </script>";	
		}
		else
			print "<font size=3><CENTER><B>ลบคำถามแล้วแต่ไม่สามารถลบคำตอบของกระทู้นี้ได้</B></CENTER></font>";
	}
	else 
			print "<font size=3><CENTER><B>ไม่สามารถลบคำถามของกระทู้นี้ได้</B></CENTER></font>";
}
//----------------------------------------------------------------------------------
if(isset($HTTP_GET_VARS["main"]) and isset($HTTP_GET_VARS["sub"]) and isset($HTTP_GET_VARS["type"]))  
{ 	
	//แสดงว่าต้องการแก้ไขคำตอบ หรือว่าลบคำตอบ
	$main=$HTTP_GET_VARS["main"];
	$sub=$HTTP_GET_VARS["sub"];
	//$type=$HTTP_GET_VARS["type"];

	$sql="delete from board_ans where IDans='$sub' ";  //ลบคำตอบ 1 คำตอบตามที่เลือกมา
	$result = mysql_query($sql);
	if($result)
		{			
			$sql2="update board_ques set  Ans=Ans-1 where ID='$main' ";
			$result2=mysql_query($sql2);
				if($result2)
				{
					print "<font size=3><CENTER><B>ลบคำตอบนี้เรียบร้อยแล้ว</B></CENTER></font>";
					print "<script language='Javascript'> window.location.replace('../webboard/view.php?ID=".$main."'); </script>";
				}
		}
	else
			print "<font size=3><CENTER><B>ไม่สามารถลบคำตอบนี้ได้</B></CENTER></font>";	
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(!isset($HTTP_GET_VARS["main"]) and !isset($HTTP_GET_VARS["type"]))  
{
?>
<center><font size=3><b>การลบกระทู้และลบคำตอบในเวบบอร์ด</b></font></center>
<ul>
	<li> เมื่อ Login เข้ามาในระบบเป็น Administrator แล้วให้ไปยังหน้า Webboard และเปิดกระทู้ที่ต้องการจะลบ
	<li> ถ้าต้องการลบกระทู้นี้รวมทั้งคำตอบทั้งหมดให้ไปคลิกที่ <B> ลบทั้งกระทู้ </B> ซึ่งจะอยู่ข้างๆ กับหัวข้อคำถาม
	<li> ถ้าต้องการลบคำตอบบางคำตอบก็ให้คลิกที่ <b>ลบคำตอบ</b> ซึ่งจะมี link อยู่ข้างๆ ของแต่ละคำตอบ



</ul>
<?
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
curve_close();
empty_4();
?>
