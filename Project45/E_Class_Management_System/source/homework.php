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
//---------------------------------------------------- Function ----------------------------------------------------------//
function InsertHomeWork($ID,$Document, $Date)
			{
								connect_db();
								$sql  ="SELECT count(*)  from homework where CID=$ID";
								$result=mysql_query($sql);
								$row=mysql_fetch_row($result);
								$Count=$row[0]+1;
								echo $Count."<br>";
								$sql1="INSERT INTO homework (ID, CID, Number, Description, Date) VALUES (NULL, $ID, $Count, '$Document', '$Date')";
								$result1=mysql_query($sql1);
								mysql_close();
			}
 function DeleteHomeWork($TID,$ID,$HWID)
 			{
 								connect_db();
								$sql  ="DELETE  from homework where ID=$HWID";
								$result=mysql_query($sql);
								if(!$result)
								{
										echo "<font class=text collor=red>ไม่สามารถลบการบ้านนี้ได้ โปรดตรวจสอบสิทธิ์ ของท่านอีกครั้ง</font>";
										echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= homework.php?TID=$TID&ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ 		
								}
								mysql_close();							
			 }
//---------------------------------------------------- Main Work Space --------------------------------------------//			
					if($make)
					{
							?>
							<form action="homework.php" class="text" name="homework" method="get">
							<table bgcolor="##6699FF" align="center" border="0" cellpadding="0" cellspacing="0" class="text" width="100%" height="100%">
							<tr><td>
							<table bgcolor="#66FFFF" align="center" border="0" cellpadding="0" cellspacing="0" class="text" width="70%">
							<tr>
							<td align="center"><b>  รายละเอียด</b></td>
							<td><textarea name="Document" rows="10" cols="50" wrap="soft"></textarea></td>
							</tr>
							<tr>
							<td align="center"><b>  กำหนดส่ง</b>	</td>
							<td><input  name="Date" type="text" size="30" maxlength="30"></td>
							</tr>
							<tr>
							<td colspan="2" align="center"><input type="submit" name="OK" value="OK">
							<?php
							echo"<input name='TID'  type='hidden' value=$SESSION[id]>";
							echo"<input name='ID'  type='hidden' value=$ID>";
							?>
							</td>
							</tr>
							</table> 
							</td></tr>
							</table>
							</form>
							<?php
					}
					else if($OK)
					{
								InsertHomeWork($ID,$Document,$Date);
								echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= homework.php?TID=$TID&ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ 
					}
					else if($delete)
					{
							for( $i=0;$i< count($homeworkID);$i++)
							{
							DeleteHomeWork($TID,$ID,$homeworkID[$i]);
							}
							echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= homework.php?TID=$TID&ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ 
					}
					else
					{
								?>
								<form action="homework.php" method="get" name="menu">
								<?php
								echo"<table align='center' width=100% border='0' cellpadding='0' cellspacing='1' class='text' >";
								echo"<tr bgcolor=AA99DD>";
								echo"<td width=10% align=center><b>ครั้งที่</b></td>";
								echo"<td width=60% align=center><b>รายระเอียด</b></td>";
								echo"<td width=30% align=center><b>กำหนดส่ง</b></td>";
								echo"</tr>";
									
								connect_db();
								$sql="select distinct ID,Number,Description,Date from homework where CID='$ID'";
								$result=mysql_query($sql);
								while($row=mysql_fetch_row($result))
								{
									$row[1]=stripslashes($row[1]);
									echo"<tr bgcolor=#6699FF>";
									echo"<td  align=center width=10%><input name='homeworkID[ ]' type='checkbox' value=$row[0]>".$row[1]."</td>";
									echo"<td  align=left width=60%>".$row[2]."</td>";
									echo"<td  align=center width=30%>".$row[3]."</td>";
									echo"</tr>";
								}
								echo"</table>";
								mysql_close();
								?>
									<br>
									<table align="center" border="0" cellpadding="0" cellspacing="0" class="text" >
									<tr>
									<td align="center">
									<input name="delete" type="submit" value="ลบการบ้าน" >
									<input name="make" type="submit" value="สร้างการบ้าน" >
									<?php
									echo"<input name='TID'  type='hidden'value=$SESSION[id]>";
									echo"<input name='ID'  type='hidden'value=$ID>";
									?>
									</td>
									</tr>
									</table>
									</form>	  
									<?php
						}
			?>

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
