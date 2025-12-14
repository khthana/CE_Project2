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
	<table  align="center"border=0 cellpadding=0 cellspacing=1 width="100%" class='text' >
	<tr bgcolor="AA99DD">
	<td align="center" class="text" width="8%">บทที่</td>
	<td align="center" class="text" width="13%">เอกสาร</td>
	<td align="center" class="text" width="16%">ไฟล์ Download</td>
	<td align="center" class="text" width="13%">ลิงค์</td>
	<td align="center" class="text" width="25%">เริ่มเรียน</td>
	<td align="center" class="text" width="25%">เข้าเรียนครั้งล่าสุด</td>
	</tr>
	<?php
	include("./Learn.php");
	connect_db();
	$sql="select Chapter,Link from chapters where CID=$CID group by Chapter order by Chapter";
	$result=mysql_query($sql);
	while($row=mysql_fetch_row($result))
	{	
			$row[1]=str_replace("\n","<br>",$row[1]);
			$row[0]=stripslashes($row[0]);
			//$row[2]=stripslashes($row[2]);
			
			// Check and register to learn
			connect_db();
				$sql="select ID from learn where CID=$CID and CH='".$row[0]."'";
				$learn=mysql_query($sql);
				$check=mysql_fetch_row($learn);
				
				//This Chapter dosen't have register  in learn table
				if(!$check)
				insert($SESSION[id],$CID,$row[0],date("Y-m-d H:i:s"));
				
				//Get time
				$Start=get_start("$SESSION[id]","$CID","$row[0]");
				$End=get_LastIN("$SESSION[id]","$CID","$row[0]");
			echo"<tr bgcolor=EEEEEE>";
			echo"<td  align=center width=8%>".$row[0]."</td>";
			echo"<td  align=center width=13%><a href='S_show_subject.php?CID=$CID&Chapter=$row[0]'>รายละเอียด</a></td>";
			echo"<td  align=center width=16%><a href='S_show_file_upload.php?CID=$CID&Chapter=$row[0]'>รายละเอียด</a></td>";
			echo"<td  align=center width=13%><a href=\"$row[1]\" target='_blank'>เนื้อหาเพิ่มเติม</a></td>";
			echo"<td  align=center width=25%>".$Start[1]."</td>";
			echo"<td  align=center width=25%>".$End[1]."</td>";
			echo"</tr>";
			mysql_free_result($learn);
	}
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
