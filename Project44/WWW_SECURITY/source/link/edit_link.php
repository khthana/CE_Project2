<?php 
include "interface.inc.php";
include "accesscontrol.php";
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open();
$uid=$HTTP_SESSION_VARS["uid"];
//เริ่มแรกจะส่งตัวแปรมาผ่านทาง get
$group=$HTTP_GET_VARS["group"];
//พอครั้งต่อไปเมื่อมีการ submit จะมีการส่งตัวแปรผ่านทาง post 
if(isset($HTTP_POST_VARS["submit"])) $group=$HTTP_POST_VARS["group"];
?>
<form action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>" method="post">
<?
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
			$sql2="select id_link,linkname,link,link_detail,date_format(day_add,'%e %b %Y, %H:%i') AS day_add,user_add from link_each where group_name='$group' and user_add='$uid' order by day_add desc";
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
	print "<center><input type=submit name='submit' value='Edit link info'></center> ";
?>

<?    
//--------------End Staff Option ----------------------------------------------------------------------------------------------------------------->
			}
			else // มีกลุ่มที่ถูกต้อง แต่ไม่มี link ในกลุ่มนั้น
			{
					print "<CENTER><B><font size=3 color=red>คุณยังไม่ได้ Add link ไว้ในกลุ่มนี้ จึงไม่สามารถแก้ไขได้</font></B></CENTER>";
			}
	} // ถ้าผู้ใช้พิมพ์ id กลุ่มที่ไม่มีจริงๆ 
	elseif(mysql_num_rows($result)==0)
	{	print "<center><b><font size=3>เลือกหมวด link ด้านขวามือ </font></b></center><br>"; }

//-------------------------------------------------------------------------------------------------------------------------------------------------------->]

curve_close();
other_5("links_staff");
print "</form>";
?>
