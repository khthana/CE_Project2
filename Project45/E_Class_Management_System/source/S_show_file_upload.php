<?php
	require('./libraries/grab_globals.lib.php');
	session_start();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/student.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ท</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="style.css" >
</head>
<body leftmargin="0" rightmargin="0" topmargin="0">
<?php 
	 if(session_is_registered("SESSION")){  
			include("./config.inc.php");
		 	$sql = "select member.EMAIL FROM member,courses ";
			$sql .= "where courses.ID = $CID AND member.ID = courses.TID ";
			$query = mysql_query($sql,$con);
			$row = mysql_fetch_array($query);
?>
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
    <td height="100%" width="780" valign="top">
	
	<table border="0" cellpadding="0" cellspacing="8" height="100%" width="100%" class="text">
	<tr>
	<td width="14%" valign="top" >
	   <table border="0" cellpadding="5" cellspacing="0" class="text">
	   <tr><td bgcolor="#0099FF" width="136" valign="top">
	   		<table border="0" cellpadding="0" cellspacing="0" height="100" class="text">
	   		<tr>
			<td width="129" bgcolor="#99CCCC" nowrap="nowrap" class="text">
	   		<?php  echo"<a href='FrmStu.php'>&nbsp;หน้าหลัก</a>"; ?>

	   		<hr>
	   		<b>&nbsp;สื่อการสอน</b><br>
	   		<?php echo"<a href='EnterCourse.php?CID=$CID'>&nbsp;บทเรียน</a><br>";
	   		      //echo"<a href='externallink.php?'>&nbsp;ลิงก์</a>"; 
			?>
	   		<hr>
	   		<b>&nbsp;ห้องเรียนจำลอง</b><br>
	   		<?php echo "<a href=\"JAVASCRIPT:%20void%20window.open('calendar.php','e','menubar=no,toolbar=no,location=no,scrollbars=no,status=no,width=600,height=400,top=100,left=100');\">&nbsp;ปฏิทิน</a><br>";
			 	   echo "<a href='Webboard.php?CID=$CID' target=_parent>&nbsp;กระดานสนทนา</a><br>";
   	         	  echo  "<a href=\"mailto: $row[0] \" >&nbsp;เมล์หาอาจารย์</a>" ;
			?>
	   		<hr>
	   		<b>&nbsp;ประเมินผล</b><br>
	   		<?php echo "<a href='S_questionlib.php?CID=$CID'>&nbsp;คำถามทดสอบความเข้าใจ</a><br>";
	   			  echo "<a href='S_homework.php?CID=$CID'> &nbsp;การบ้าน</a><br>"; 
				  echo "<a href='questionaire.php?CID=$CID'>&nbsp;ประเมินผลการสอน</a>";
	   		?>	   
	   		<hr>
	   		<b>&nbsp;ข้อมูล</b><br>
	   		<?php echo"<a href='FrmStu_Update.php?id=$SESSION[id]&CID=$CID '>&nbsp;ข้อมูลส่วนตัว</a><br>";?>	   
	   		<hr>
	   		<?php echo"<a href='index.php?LogOut=yes'>&nbsp; ออกจากระบบ</a>"; ?>
			</td></tr></table>
	</td></tr></table>
</td>
          <td  valign="top"><!-- InstanceBeginEditable name="data" -->
	<?php
	include("./Learn.php");
	global $Start;
	
	$Start=get_start("$SESSION[id]","$CID","$Chapter");
	//ทีนี้ก็เปลี่ยนแปลงค่าวันเวลาที่เข้าเรียนครั้งสุดท้ายทุกครั้งที่เข้ามา
	set_LastIN($Start[0],date("Y-m-d H:i:s"));
	//connect to Db
	$row=array();
	 connect_db();	?>
	<table  align="center"border=0 cellpadding=0 cellspacing=1 width="100%" class='text' >
	<tr bgcolor=AA99DD>
	<!--td align="center" class="text" height="10%">หัวข้อ</td-->
	<!--td align="center" class="text" height="20%">ไฟล์ Upload</td-->
	<td align="center" class="text" height="20%">ไฟล์ Word</td>
	<td align="center" class="text" height="20%">ไฟล์ Powerpoint</td>
	<td align="center" class="text" height="20%">ไฟล์ PDF</td>
	<td align="center" class="text" height="20%">ไฟล์ Flash</td>
	<td align="center" class="text" height="20%">ไฟล์ Video</td>
	<!--td align="center" class="text" height="20%">ลิงค์</td-->
	</tr>
	<?php
	$sql="select ID,Word, Powerpoint, PDF,Flash,Video from fileuploads where CID=$CID and Chapter='$Chapter' order by ID";
	$result=mysql_query($sql);
	while($row=mysql_fetch_row($result))
	{
			$row[0]=stripslashes($row[0]);
			$row[1]=stripslashes($row[1]);
			$row[2]=stripslashes($row[2]);
			$row[3]=stripslashes($row[3]);
			$row[4]=stripslashes($row[4]);
			$row[5]=stripslashes($row[5]);
			$row1=split("/",$row[1]);$row2=split("/",$row[2]);$row3=split("/",$row[3]);$row4=split("/",$row[4]);$row5=split("/",$row[5]);
			echo"<tr bgcolor=EEEEEE>";
			echo"<td  align=center width=20%><a href=\"$row[1]\" target='_blank'>".$row1[5]."</a></td>";
			echo"<td  align=center width=20%><a href=\"$row[2]\" target='_blank'>".$row2[5]."</a></td>";
			echo"<td  align=center width=20%><a href=\"$row[3]\" target='_blank'>".$row3[5]."</a></td>";
			echo"<td  align=center width=20%><a href=\"$row[4]\" target='_blank'>".$row4[5]."</a></td>";
			echo"<td  align=center width=20%><a href=\"$row[5]\" target='_blank'>".$row5[5]."</a></td>";
			echo"</tr>";
	}
	mysql_close();
	mysql_free_result($result);
	?>
	</table>

		  <!-- InstanceEndEditable --> 
          </td>
</tr>
</table>
	</td>
	<td>
	</td>
  </tr>
 </table>
 <?php
	 }
	 else
	 {
	 	//include("ChkErr.inc.php");
		//ShowErr("กรุณา LOGIN ก่อนเข้าใช้งาน");
	 print "<center><font color='#FF0000'><b>กรุณา LOGIN ก่อนเข้าใช้งานด้วยครับ</b></font></center><br>
				<center><a href='index.php'>LOGIN </a></center>";
	}
?>
</body>
<!-- InstanceEnd --></html>
