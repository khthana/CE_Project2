<?php 
	require('./libraries/grab_globals.lib.php'); 
	include("./connectDB.php");
	session_start(); 
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/logo.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ท</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="style.css" >
</head>

<body leftmargin="0" topmargin="0" >
<table width="780" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <td width="100%" align="right" valign="top"><img src="./Picture/logo.jpg" width="100%" height="85" align="baseline"></td>
  </tr>
  <tr> 
    <td  valign="top"><table  width="100%" border="0" cellpadding="0" cellspacing="1"   bgcolor="#000000"  class="text">
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
  <tr valign="top">
    <td width="100%"  valign="top" height="100%"><!-- InstanceBeginEditable name="data" -->
	<table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
	<tr>
	<td width="17%">
	<table border="0" cellpadding="5" cellspacing="0" height="100%">
	   <tr><td bgcolor="#0099FF" width="120">
	   		<table border="0" cellpadding="0" cellspacing="0" height="100" class="text">
	   		<tr>
			<td bgcolor="#99CCCC" nowrap="nowrap" class="text">
	   		<?php echo"<a href='show_courses.php?TID=$TID'>&nbsp;หน้าหลัก</a>";?>

	   		<hr>
	   		<b>&nbsp;สื่อการสอน</b><br>
	   		<?php echo"<a href='course_content.php?ID=$ID&TID=$TID'>&nbsp;บทเรียน</a><br>";
	   		       echo"<a href='externallink.php3?'>&nbsp;ลิงก์</a>"; 
			?>
	   		<hr>
	   		<b>&nbsp;ห้องเรียนจำลอง</b><br>
	   		<?php echo"<a href='calendar.php3?'>&nbsp;ปฏิทิน</a><br>";
	   		 	   echo"<a href='broadcast.php3?'>&nbsp;ประกาศ</a><br>"; 
	   		       echo"<a href='webboard.php3?'>&nbsp;กระดานสนทนา</a><br>";
	   		       echo "<a href=# onclick=open('chatroom.php3?HTTP_REFERER=1','','toolbar=no,scrollbar=yes,width=700,height=500')>&nbsp;ห้องสนทนา</a>";
			?>
	   		<hr>
	   		<b>&nbsp;ประเมินผล</b><br>
	   		<?php echo"<a href='questionlib.php3?Session=985bb0dc4d79c1e56ebcd3d0a0797f7276363161ec1b9540980a68b6482a83b1'>&nbsp;คลังข้อสอบ</a><br>";
	   			   echo"<a href='quiz.php3?Session=985bb0dc4d79c1e56ebcd3d0a0797f7276363161ec1b9540980a68b6482a83b1'>&nbsp;คำถามทดสอบความเข้าใจ</a><br>";
	   			   echo"<a href='homework.php3?Session=985bb0dc4d79c1e56ebcd3d0a0797f7276363161ec1b9540980a68b6482a83b1'> &nbsp;การบ้าน</a><br>"; 
	   			   echo" <a href='test.php3?Session=985bb0dc4d79c1e56ebcd3d0a0797f7276363161ec1b9540980a68b6482a83b1'>&nbsp;ข้อสอบวัดผล</a>";
			?>	   
	   		<hr>
	   		<b>&nbsp;ข้อมูล</b><br>
	   		<?php echo"<a href='profile.php3?Session=985bb0dc4d79c1e56ebcd3d0a0797f7276363161ec1b9540980a68b6482a83b1'>&nbsp;ข้อมูลส่วนตัว</a><br>";
	   			   echo"<a href='subject.php3?Session=985bb0dc4d79c1e56ebcd3d0a0797f7276363161ec1b9540980a68b6482a83b1'>&nbsp;รายละเอียดวิชา</a><br>";
	   		       echo"<a href='stdmgr.php3?Session=985bb0dc4d79c1e56ebcd3d0a0797f7276363161ec1b9540980a68b6482a83b1'>&nbsp;จัดการข้อมูลนักเรียน</a><br>";
	   		       echo"<a href='filemgr.php3?Session=985bb0dc4d79c1e56ebcd3d0a0797f7276363161ec1b9540980a68b6482a83b1'>&nbsp;จัดการแฟ้มข้อมูล</a><br>";
	   		       echo"<a href='webwizard.php3?Session=985bb0dc4d79c1e56ebcd3d0a0797f7276363161ec1b9540980a68b6482a83b1'> &nbsp;สร้างโฮมเพจ</a>";
			?>	   
	   		<hr>
	   		<?php echo"<a href='index.php3?LogOut=yes&Session=985bb0dc4d79c1e56ebcd3d0a0797f7276363161ec1b9540980a68b6482a83b1'>&nbsp; ออกจากระบบ</a>"; ?>
			</td></tr></table>
	</td></tr></table>
	</td>
	<td>
	<?php
	connect_db();
	$sql="select Document from chapters where CID=$ID and Chapter='$Chapter'";
	$result=mysql_query($sql);
	$row=mysql_fetch_row($result);
	 //echo gettype($row);
			$row[0]=str_replace("\n","<br>",$row[0]);
	echo "<table bgcolor='#FFFFFF' align='center' border=0 cellpadding=0 cellspacing=0 class='text' height=100% width=100%>";
	echo "<tr><td bgcolor='#006699' align='center' height=7% width=100% ><font  color='#FF6600'><b>".$Chapter."</b></font></td></tr>";
	echo "<tr><td bgcolor='#EEEEEE' valign='top'>".$row[0]."</td></tr>";
	echo "<tr><td bgcolor='#EEEEEE' align='center'><form action='test.php' method='post'>
				<input name='Chapter'  type='hidden' value=$Chapter>
				<input name='ID'  type='hidden' value=$ID>
				<input type='submit' name='Chang' value='แก้ไข'></form></td></tr>";
	echo "</table>";
	mysql_close();
	?>
	</td>
	</tr>
	</table>
	<!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
