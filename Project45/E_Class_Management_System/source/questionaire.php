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
		  <form name="addstu" enctype = "multipart/form-data" method = "post" action = "Vote.php">
		  <input type="hidden" name="CID" value="<?php echo $CID; ?>">
	 <table cellspacing="0" cellpadding="0" border="0" class="text" width="95%" align="center">
     <tr> 
      <th  class="title" ><font color="#3333FF">แบบประเมินการสอนโดยนักศึกษา</font></th>
    </tr>
    <tr> 
      <td width="100%" class="normal"> <font color="#FF0000">กรุณากรอกข้อมูลให้ครบด้วย</font></td>
    </tr>
    <tr> 
      <!-- Sign-Up Information -->
      <td width="100%">&nbsp; </td>
    </tr>
    <tr> 
      <td width="100%"> <table border="0" cellspacing="0" cellpadding="0" class="header">
          <tr> 
            <td align="left" valign="top" bgcolor="#869DB9"><img src="/Picture/cn_drk_lt.gif" width="11" height="19"></td>
            <td bgcolor="#869DB9"><b> ความคิดเห็น</b></td>
            <td bgcolor="#869DB9">&nbsp;</td>
            <td align="right" valign="top" bgcolor="#869DB9"><img src="/Picture/cn_drk_rt.gif" width="11" height="19"></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td width="100%" bgcolor="#869DB9" align="center"> 
	  <table width="100%" border="0" cellspacing="1" cellpadding="4" class="text">
          <tr bgcolor="#E9E9E9" align="left"> 
            <td bgcolor="#FAF7EA"> <table class="text" width="100%" border="0" cellspacing="1" cellpadding="4">
                <tr> 
                  <td >&nbsp;1. มีการแจ้งให้ทราบรายละเอียดของการเรียนการสอน</td>
                  <td><input type="radio" name="ask1" value="5">
                    ดีมาก 
                    <input type="radio" name="ask1" value="4">
                    ดี 
                    <input type="radio" name="ask1" value="3">
                    ปานกลาง 
                    <input type="radio" name="ask1" value="4">
                    น้อย 
                    <input type="radio" name="ask1" value="1">
                    น้อยที่สุด</td>
                </tr>
                <tr> 
                  <!-- Name -->
                  <td >&nbsp;2. ใช้สื่อการสอนที่ช่วยให้เข้าใจดีขึ้น</td>
                  <td><input type="radio" name="ask2" value="5">
                    ดีมาก 
                    <input type="radio" name="ask2" value="4">
                    ดี 
                    <input type="radio" name="ask2" value="3">
                    ปานกลาง 
                    <input type="radio" name="ask2" value="4">
                    น้อย 
                    <input type="radio" name="ask2" value="1">
                    น้อยที่สุด</td>
                </tr>
                <tr> 
                  <!-- Last Name -->
                  <td width="52%" height="36">&nbsp;3. นักศึกษาเข้าใจเนื้อหาได้ดี</td>
                  <td height="36" width="48%"><input type="radio" name="ask3" value="5">
                    ดีมาก 
                    <input type="radio" name="ask3" value="4">
                    ดี 
                    <input type="radio" name="ask3" value="3">
                    ปานกลาง 
                    <input type="radio" name="ask3" value="4">
                    น้อย 
                    <input type="radio" name="ask3" value="1">
                    น้อยที่สุด </td>
                </tr>
                <tr> 
                  <!-- Sex -->
                  <td>&nbsp;4. ความน่าสนใจของเนื้อหา</td>
                  <td width="48%"><input type="radio" name="ask4" value="5">
                    ดีมาก 
                    <input type="radio" name="ask4" value="4">
                    ดี 
                    <input type="radio" name="ask4" value="3">
                    ปานกลาง 
                    <input type="radio" name="ask4" value="4">
                    น้อย 
                    <input type="radio" name="ask4" value="1">
                    น้อยที่สุด </td>
                </tr>
                <tr> 
                  <!-- Birthday -->
                  <td>&nbsp;5. ความเพลิดเพลินในการเรียน</td>
                  <td width="48%"><input type="radio" name="ask5" value="5">
                    ดีมาก 
                    <input type="radio" name="ask5" value="4">
                    ดี 
                    <input type="radio" name="ask5" value="3">
                    ปานกลาง 
                    <input type="radio" name="ask5" value="4">
                    น้อย 
                    <input type="radio" name="ask5" value="1">
                    น้อยที่สุด </td>
                </tr>
                <tr> 
                              <td>&nbsp;6. ความเอาใจใส่ต่อคำถามผู้เรียน</td>
                  <td><input type="radio" name="ask6" value="5">
                    ดีมาก 
                    <input type="radio" name="ask6" value="4">
                    ดี 
                    <input type="radio" name="ask6" value="3">
                    ปานกลาง 
                    <input type="radio" name="ask6" value="4">
                    น้อย 
                    <input type="radio" name="ask6" value="1">
                    น้อยที่สุด </td>
                </tr>
                <tr> 
                              <td>&nbsp;7. เนื้อหาครอบคลุมตามที่ได้แจ้งรายละเอียดไว้</td>
                  <td width="48%"><input type="radio" name="ask7" value="5">
                    ดีมาก 
                    <input type="radio" name="ask7" value="4">
                    ดี 
                    <input type="radio" name="ask7" value="3">
                    ปานกลาง 
                    <input type="radio" name="ask7" value="4">
                    น้อย 
                    <input type="radio" name="ask7" value="1">
                    น้อยที่สุด </td>
                </tr>
                <tr>
                  <td>&nbsp;8. แบบทดสอบวัดความรู้ได้ดี</td>
                  <td><input type="radio" name="ask8" value="5">
                    ดีมาก 
                    <input type="radio" name="ask8" value="4">
                    ดี 
                    <input name="ask8" type="radio" value="3">
                    ปานกลาง 
                    <input type="radio" name="ask8" value="4">
                    น้อย 
                    <input type="radio" name="ask8" value="1">
                    น้อยที่สุด</td>
                </tr>
                <tr> 
                  <td>&nbsp;9. โดยภาพรวมแล้วได้รับความรู้เพิ่มขึ้นจากการเรียนวิชานี้</td>
                  <td><input type="radio" name="ask9" value="5">
                    ดีมาก 
                    <input type="radio" name="ask9" value="4">
                    ดี 
                    <input type="radio" name="ask9" value="3">
                    ปานกลาง 
                    <input type="radio" name="ask9" value="4">
                    น้อย 
                    <input type="radio" name="ask9" value="1">
                    น้อยที่สุด</td>
                </tr>
                <tr> 
                  <td>&nbsp;10. เข้ามาเรียนกี่ครั้งถึงผ่าน</td>
                  <td><input type="radio" name="ask10" value="5">
                    1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <input type="radio" name="ask10" value="4">
                    2ี 
                    <input type="radio" name="ask10" value="3">
                    3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="ask10" value="4">
                    4&nbsp;&nbsp;&nbsp; 
                    <input type="radio" name="ask10" value="1">
                    มากกว่า 4</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td width="100%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="100%"> <table width="100%">
          <tr> 
            <td width="293">&nbsp; </td>
            <td width="305"> <div align="right"> 
                <input type="submit" value="ตกลง" class="button" name="submit">
                          </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
	<br>
  &nbsp; 
</form>   
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
