<?php 
include "interface.inc.php";
include "admin_accesscontrol.php";
logo_adminmenu("Information Security Advisory Group (ISAG)");
curve_open();
//เริ่มแรกจะส่งตัวแปรมาผ่านทาง get
$group=$HTTP_GET_VARS["group"];
//พอครั้งต่อไปเมื่อมีการ submit จะมีการส่งตัวแปรผ่านทาง post 
if(isset($HTTP_POST_VARS["submit"])) $group=$HTTP_POST_VARS["group"];
?>
<form action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>" method="post">
<?
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Delete selected Link") //ถ้ามีการกดปุ่ม Delete
{
		$link=$HTTP_POST_VARS["link"];
		if (count($link)==0)  //เช็คว่าได้ทำการ check ลิงค์ที่จะลบหรือไม่ ต้องเอาไว้บน select ที่จะ Quey จาก db ข้างล่าง ค่าจะได้ไม่ซ้อนกัน
			print "<center><font size=3><b>กรุณาเลือกลิงค์ที่ต้องการจะลบ</b></font></center><br> ";
		else //ถ้ามีการเช็ค
		{	
			foreach($link as $key => $val) 
			{				
				$sql3="delete from link_each where id_link='$val' "; //ลบแต่ละ link ตาม id ของ link ที่ select
				$result = mysql_query($sql3);
				if($result) echo "ทำการลบลิงค์ $val แล้ว <br>";
			}
		}
}
//-----------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Move")  //เมื่อมีการกดปุ่ม Move ต้องเอาไว้บน select ที่จะ Quey จาก db ข้างล่าง ค่าจะได้ไม่ซ้อนกัน
{
		$link=$HTTP_POST_VARS["link"];
		$group_select=$HTTP_POST_VARS["group_select"];
		if (count($link)==0)
			print "<center><font size=3><b>กรุณาเลือกลิงค์ที่ต้องการจะย้ายกลุ่ม</b></font></center><br>";
		else
		{
			foreach($link as $key => $val)
			{	//group_select เป็น value ที่ได้มาจาก select ข้างล่าง
				$sql4="update link_each set group_name='$group_select' where id_link='$val' ";
				$result = mysql_query($sql4);
				if($result) print "<center>Change group already $key</center>";
			}
		}
}
//-----------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Delete Group") //ถ้ามีการกดปุ่ม Delete Group
{
		$group_check=$HTTP_POST_VARS["group_check"];
		if (count($group_check)==0)  //เช็คว่าได้ทำการ check หมวดที่จะลบหรือไม่ ต้องเอาไว้บน select ที่จะ Quey จาก db ข้างล่าง ค่าจะได้ไม่ซ้อนกัน
			print "<center><font size=3><b>กรุณาเลือกกลุ่มที่ต้องการจะลบ</b></font></center><br> ";
		else //ถ้ามีการเช็ค
		{
			foreach($group_check as $key => $val) 
			{				
				$sql3 = "delete from link_group where id_group='$val' "; //ลบแต่ละกลุ่มตาม id ของกลุ่มที่ select
				$sql4 = "delete from link_each where group_name='$val' "; //ลบทุก link ที่สังกัดใน group นี้ 
				$result3 = mysql_query($sql3);
				$result4 = mysql_query($sql4);
				if($result3) echo "<center>ทำการลบกลุ่ม $val แล้ว <center>";
				if($result4) echo "<center>ทำการลบลิงค์ย่อยสังกัดกลุ่ม $val แล้ว </center><br>";
			}	
		}
}
//-----------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Edit group name") //ถ้ามีการกดปุ่ม Edit group name
{
		$group_check=$HTTP_POST_VARS["group_check"];
		if (count($group_check)!=1)  //เช็คว่าได้ทำการ check หมวดที่จะเปลี่ยนชื่อกลุ่มหรือไม่ เปลี่ยนได้ทีละอันเท่านั้น
			print "<center><font size=3>เลือกหมวด 1 หมวดที่ต้องการเปลี่ยนชื่อ</font></center><br> ";
		else //ถ้ามีการเช็ค
		{
			foreach($group_check as $key => $val) //เนื่องจาก input เป็นอะเรย์ต้องใช้วิธีนี้เท่านั้น
			{
				$sql="select group_name from link_group where id_group='$val' ";
				$result=mysql_query($sql);
				if (($result) and mysql_num_rows($result) ==1)
				{ 
					while($row=mysql_fetch_array($result))
					$group_name=$row['group_name'];
					print "<center><font size=3><b>พิมพ์ชื่อกลุ่มใหม่ที่ต้องการแก้ไข</b></font><br>";
					print "<input type=hidden name='group_check' value='$group_check[0]'>";
					print "<input type=text  size=40 name='group_name' value='$group_name'><br><br>";
					print "<input type=submit name='submit' value='Edit name'></center><br>";
				}
			}
		}
}
//-----------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Edit name") //ถ้ามีการกดปุ่ม Edit name เพื่อยืนยันที่จะแก้ไขชื่อกลุ่มจริงๆ
{
		$group_name=$HTTP_POST_VARS["group_name"];
		$group_check=$HTTP_POST_VARS["group_check"];
		$group_name=htmlspecialchars(trim($group_name));
		if($group_name=="") print "<center><font size=3><b>กรุณาพิมพ์ชื่อกลุ่มด้วย<b></font></center>";
		else
		{
			$sql="update link_group set group_name='$group_name' where id_group='$group_check' ";
			$result = mysql_query($sql);
			if($result) print "<center><font size=3><b>เปลี่ยนชื่อกลุ่มเรียบร้อยแล้ว<b></font></center>";
			else print "<center><font size=3><b>ไม่สามารถเปลี่ยนกลุ่มได้<b></font></center>";
		}
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Edit link info") //ถ้ามีการกดปุ่ม Edit link info 
{
		$link=$HTTP_POST_VARS["link"];
		if (count($link)!=1)  //เช็คว่าได้ทำการ check ลิงค์ที่จะเปลี่ยนหรือไม่  1 อัน
			print "<center><font size=3><b>เลือกลิงค์ 1 ลิงค์ที่ต้องการจะแก้ไขข้อมูล</b></font></center><br> ";
		else //ถ้ามีการเช็ค 1 อัน
		{ 
			foreach($link as $key => $val) 
			{
				$sql="select id_link,linkname,link,link_detail from link_each where id_link='$val' ";
				$result=mysql_query($sql);
				if (($result) and mysql_num_rows($result) ==1)
				{ 
					while($row=mysql_fetch_array($result))
					{
						$id_link=$row['id_link'];
						$linkname=$row['linkname'];
						$link=$row['link'];
						$link_detail=$row['link_detail'];
					}
					print "<center><font size=3><b>แก้ไขข้อมูลที่ต้องการ</b></font><br><br>";
					print "<input type=hidden name='id_link' value='$id_link'>";
					print "<input type=text  size=40 name='linkname' value='$linkname'><br>";
					print "<input type=text  size=40 name='link' value='$link'><br>";
					print "<textarea name='link_detail' cols=50 rows=4>$link_detail</textarea><br><br>";
					print "<input type=submit name='submit' value='Edit link'></center>";
				}
			}
		}
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Edit link") //ถ้ามีการกดปุ่ม Edit link จริงๆเลย ***************************
{
	$id_link=htmlspecialchars(trim($HTTP_POST_VARS["id_link"]));
	$linkname=htmlspecialchars(trim($HTTP_POST_VARS["linkname"]));
	$link=htmlspecialchars(trim($HTTP_POST_VARS["link"]));
	$link_detail=htmlspecialchars(trim($HTTP_POST_VARS["link_detail"]));

	$error=0;
	if($linkname=="") { print "<center><font size=3><b>กรุณาพิมพ์ชื่อลิงค์ด้วย<b></font></center>"; $error=1; }
	if(!ereg("^http:\/\/.+\..+$",$link)) { print "<center><font size=3><b>กรุณาพิมพ์ชื่อ url ให้ถูกต้อง<b></font></center>"; $error=1; }
	if($link_detail=="") { print "<center><font size=3><b>กรุณาพิมพ์รายละเอียดของลิงค์ด้วย<b></font></center>"; $error=1; }
	if($error==0)
		{
			$sql="update link_each set linkname='$linkname', link='$link', link_detail='$link_detail' where id_link='$id_link' ";
			$result = mysql_query($sql);
			if($result) print "<center><font size=3><b>Update link เรียบร้อยแล้ว<b></font></center>";
			else print "<center><font size=3><b>ไม่สามารถ update link ได้<b></font></center>";
		}


}
//------------------------------------------------------------------------------------------------------------------------------------------------------------
// ส่วนนี้จะ print หมวด จากหมายเลข group ที่ได้รับเข้ามา

//echo "group = $group<br>";                //--------------------------   echo เพื่อ test  ------------------------

$sql0 = "select group_name from link_group where id_group='$group' ";
$result = mysql_query($sql0);

if ((($result) and mysql_num_rows($result) ==1) and !isset($HTTP_POST_VARS["submit"])) //ถ้าเลขที่ post มามีในหมวดก็ print หมวด พร้อม all link หรือ click submit ใดๆ ก็เข้ามาจะได้ไม่ไป print ตรงส่วน else ที่บอกว่าไม่มี
{
	while($row=mysql_fetch_array($result))
	$group_name=$row['group_name'];

	if(mysql_num_rows($result)==1) print "<center><b><font size=3>link หมวด $group_name </font></b></center><br>";

//------------------------------------------------------------------------------------------------------------------------------------------------------------
			// select link และคำอธิบาย มาแสดง
			$sql2="select id_link,linkname,link,link_detail,date_format(day_add,'%e %b %Y, %H:%i') AS day_add,user_add from link_each where group_name='$group' order by day_add desc";
			$result = mysql_query($sql2);
			if(($result) and mysql_num_rows($result) > 0)
			{
?>
					<table border=0 cellpadding=2 cellspacing=0 width=100%>				
					<!-- ค่า id ของ group ที่ได้เคยคลิกลิงค์ไว้  เพื่อให้ลิงค์แสดงอยู่ที่ Group เดิมไม่ว่าจะ Del หรือ Move แล้ว-->
					<input type="hidden" name="group" value="<?php echo $group; ?>">
	<?
					while ($row=mysql_fetch_array($result))
					{
							$idlink=$row['id_link'];
							$link=stripslashes($row['link']);
							$linkname=stripslashes($row['linkname']);
							$detail=stripslashes($row['link_detail']);
							$day_add=$row['day_add'];
							$user_add=$row['user_add'];
					
							print "<tr><td valign=top ID=table1>";
							print "<input type='checkbox' name='link[]' value='$idlink'>";
							print "<img src='$path_web_img"."bullet.gif'> <b><a href='$link' target='_new_'>$linkname</a></b></td></tr>"; 
							print "<tr><td><font color='black'> $detail </font><br><font color='brown'> <B>by</B> $user_add ($day_add) <br><br></font></td></tr>";
					}
					print "</table>";
 //------------- Staff Option  ---------แสดงปุ่ม Move Delete ---------------------------------------------------------------------------------------------------
    print "<center><b>Move to Catagory</b>  &nbsp;&nbsp;";
	//แสดงหมวดหมู่ที่ Query มาจาก Database	แบบ select  อันเดียว เช็คก่อนนะว่าต้องมี link ถึงจะแสดง
	$sql1 = "select id_group,group_name from link_group order by group_name";
		$result = mysql_query($sql1);
		if(($result) and mysql_num_rows($result) > 0) //ถ้ามีหมวดค่อย print select 
		{
			print "<select name='group_select'>";  //แต่ละหมวดเป็น select 1 อัน
			while ($row=mysql_fetch_array($result))
				{
					$id_group=$row['id_group'];
					$group_name=$row['group_name'];	
				
					print "<option value='$id_group' ";
					//ถ้า id=ค่าของ group_select ที่เคย select ไปก่อนนี้ก็ให้แสดง selected ที่ตัวนั้น
					if($id_group==$HTTP_POST_VARS["group_select"]) print " SELECTED";
					print ">$group_name</option> ";
				}
			print "</select>";		
		}
	print " <input type=submit name='submit' value='Move'><br><br>";
	print "<input type=submit name='submit' value='Edit link info'> ";
?>
    <input type=submit name='submit' value='Delete selected Link' onclick="return confirm('คุณต้องการที่จะลบ Link ที่เลือกออกจากฐานข้อมูล?')">&nbsp; </center>
<?    
//--------------End Staff Option ----------------------------------------------------------------------------------------------------------------->
			}
			else // มีกลุ่มที่ถูกต้อง แต่ไม่มี link ในกลุ่มนั้น
			{
					print " ";
			}
	} // ถ้าผู้ใช้พิมพ์ id กลุ่มที่ไม่มีจริงๆ 
	elseif(mysql_num_rows($result)==0)
	{	print "<center><b><font size=3>เลือกหมวด link ด้านขวามือ </font></b></center><br>"; }

//-------------------------------------------------------------------------------------------------------------------------------------------------------->]

curve_close();
other_5("links_admin");
print "</form>";
?>
