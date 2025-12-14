<?php
 require('./libraries/grab_globals.lib.php'); 
 include("./connectDB.php");
 session_start(); 
 ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/teacher.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>การเรียนการสอนผ่านอินเตอร์เน็ท</title>
<!-- InstanceEndEditable --> 
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="style.css" >
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
</head>

<body leftmargin="0" rightmargin="0" topmargin="0">
<?php  if(session_is_registered("SESSION")){  ?>
<table width="780" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr> 
    <td width="100%" align="right"><img src="./Picture/logo.jpg" width="100%" height="81"></td>
  </tr>
  <tr> 
    <td><table  width="100%" border="0" cellpadding="0" cellspacing="1"   bgcolor="#000000"  class="text">
        <tr bgcolor="#336699" class="text" valign="top"> 
          <td width = "14%" align="center"><strong><a href="index.php" class="nav">Home</a></strong></td>
          <td width = "14%" align="center"><strong><a href="Course1.php" target="_parent" class="nav">Course</a></strong></td>
          <td width = "13%" align="center"><strong><a href="Headline.php?status=all" target="_parent" class="nav">News</a></strong></td>
          <td width="14%" align="center"><strong><a href="FrmSearch.php" target="_parent" class="nav">Search</a></strong></td>
          <td width="16%" align="center"><strong><a href="MeansUse.php" target="_blank" class="nav">FAQ</a></strong></td>
          <td width = "12%" align="center"><strong><a href="about.php" class="nav">About</a></strong></td>
          <td width = "17%" align="center"><strong><a href="index.php?LogOut=yes" class="nav">Logout</a></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="100%" width="780">
	<table border="0" cellpadding="0" cellspacing="8" height="100%" width="100%">
	<tr>
	<td width="14%" valign="top" >
	   <table border="0" cellpadding="5" cellspacing="0" >
	   <tr><td   bgcolor="#0099FF" width="136" valign="top">
	   		<table border="0" cellpadding="0" cellspacing="0" height="100" class="text">
	   		<tr>
			<td width="129" nowrap="nowrap"  bgcolor="#99CCCC" class="text" valign="top">
	   		<?php echo"<a href='FrmTea.php'>&nbsp;หน้าหลัก</a>";?>

	   		<hr>
	   		<b>&nbsp;สื่อการสอน</b><br>
	   		<?php echo"<a href='course_content.php?ID=$ID'>&nbsp;บทเรียน</a><br>";?>
	   		<hr>
	   		<b>&nbsp;ห้องเรียนจำลอง</b><br>
	   		<?php 
				   echo"<a href=\"JAVASCRIPT:%20void%20window.open('calendar.php','e','menubar=no,toolbar=no,location=no,scrollbars=no,status=no,width=600,height=400,top=100,left=100');\">&nbsp;ปฏิทิน</a><br>";
				   echo"<a href=\"JAVASCRIPT:%20void%20window.open('News.php','e','menubar=no,toolbar=no,location=no,scrollbars=no,status=no,width=500,height=400,top=50,left=150');\">&nbsp;ประกาศ</a><br>";
	   		       echo"<a href='Webboard.php?CID=$ID' target=_parent>&nbsp;กระดานสนทนา</a><br>";
	   		       //echo "<a href=# onclick=open('chatroom.php?HTTP_REFERER=1','','toolbar=no,scrollbar=yes,width=700,height=500')>&nbsp;ห้องสนทนา</a>";
			?>
	   		<hr>
	   		<b>&nbsp;ประเมินผล</b><br>
	   		<?php echo"<a href='questionlib.php?ID=$ID'>&nbsp;คลังข้อสอบ</a><br>";
	   			   echo"<a href='quiz.php?ID=$ID'>&nbsp;คำถามทดสอบความเข้าใจ</a><br>";
	   			   echo"<a href='homework.php?ID=$ID'> &nbsp;การบ้าน</a><br>"; 
	   			   //echo" <a href='test.php?'>&nbsp;ข้อสอบวัดผล</a>";
			?>	   
	   		<hr>
	   		<b>&nbsp;ข้อมูล</b><br>
	   		<?php 
				   echo"<a href='FrmTea_Update1.php?ID=$ID&TID=$SESSION[id]'>&nbsp;ข้อมูลส่วนตัว</a><br>";
	   			   echo"<a href='course_detail.php?ID=$ID&TID=$SESSION[id]'>&nbsp;รายละเอียดวิชา</a><br>";
	   		       //echo"<a href='stdmgr.php?'>&nbsp;จัดการข้อมูลนักเรียน</a><br>";
	   		       //echo"<a href='filemgr.php?'>&nbsp;จัดการแฟ้มข้อมูล</a><br>";
			?>	   
	   		<hr>
	   		<?php  echo"<a href='index.php?LogOut=yes'>&nbsp; ออกจากระบบ</a>";  ?>
			</td></tr></table>
	</td></tr></table>
</td>
          <td valign="top"><!-- InstanceBeginEditable name="data" -->
		  <?php
	connect_db();
	$sql="select distinct ID,Chapter from chapters where CID='$ID' group by Chapter order by Chapter";
	$result=mysql_query($sql);
	?>
	<form action="del_chapter.php" method="post" name="chapter">
	<table  align="center"border=0 cellpadding=0 cellspacing=1 class='text' width="100%">
	<tr bgcolor=AA99DD>
	<td align="center" class="text" height="5%">&nbsp;</td>
	<td align="center" class="text" height="10%">บทที่</td>
	<td align="center" class="text" height="20%">เอกสาร</td>
	<td align="center" class="text" height="20%">ไฟล์ Upload</td>
	</tr>
	<?php
	while($row=mysql_fetch_row($result))
	{
			$row[1]=str_replace("\n","<br>",$row[1]);
			$row[0]=stripslashes($row[0]);
			//$row[1]=stripslashes($row[1]);
			echo"<tr bgcolor=EEEEEE>";
			echo"<td  align=center width=5%><input name='course[ ]' type='checkbox' value=$row[0]></td>";
			echo"<td  align=center width=10%>$row[1]</td>";
			echo"<td  align=center width=20%><a href='show_subject.php?ID=$ID&Chapter=$row[1]'>รายละเอียด</a></td>";
			echo"<td  align=center width=20%><a href='show_file_upload.php?ID=$ID&Chapter=$row[1]'>รายละเอียด</a></td>";
			echo"</tr>";
	}
	echo"<tr bgcolor=EEEEEE>";
	echo"<input name='TID' type='hidden' value=$SESSION[id]>";
	echo"<input name='ID' type='hidden' value=$ID>";
	echo"<td align='center'><input name='delete' type='submit' value='&nbsp;ลบ&nbsp;' onclick=\"if (!window.confirm('คุณแน่ใจว่าจะลบเนื้อหาวิชาที่เลือกหรือไม่ ?')) return false;\">";
	echo"<input name='reset' type='reset' value='ยกเลิก'></td>";
	echo"<td>&nbsp;</td>";
	echo"<td>&nbsp;</td>";
	echo"<td>&nbsp;</td>";
	//echo"<td>&nbsp;</td>";
	//echo"<td>&nbsp;</td>";
	//echo"<td>&nbsp;</td>";
	echo"</tr>";
	mysql_free_result($result);
	mysql_close();
	?>
	</table>
	</form>
	<table align="center" border="0" cellpadding="0" cellspacing="0" class="text" >
	<tr>
	<td align="center">
	<form action="insert_chapter_form.php" method="post" name="menu">
	<input name="open" type="submit" value="สร้างเนื้อหา" >
	<?php
	echo"<input name='ID'  type='hidden'value=$ID>";
	echo"<input name='TID'  type='hidden' value=$SESSION[id]>";
	?>
	</form>
	</td>
	</tr>
	</table>
		  <!-- InstanceEndEditable --></td>
</tr>
</table>
</td>
</tr>
</table>

</td>
</tr> 
</table> 
<?php
	 }
	 else
	 {
	  print "<center><font color='#FF0000'><b>กรุณา LOGIN ก่อนเข้าใช้งานด้วยครับ</b></font></center><br>
	 			<center><a href='index.php'>LOGIN </a></center>";
	}
?>
</body>
<!-- InstanceEnd --></html>
