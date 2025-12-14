<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body> 
<?php
	require('./libraries/grab_globals.lib.php'); 
	function DetailCourse($con,$CID) {
		$sql = "SELECT courses.Name,courses.Target,courses.Description,courses.Refer,member.FULLNAME,member.LASTNAME FROM  courses,member ";
		$sql .= "WHERE courses.ID = '$CID' and courses.TID = member.ID ";
		$result = mysql_query($sql,$con);
		if(!$result) 
		 die("Can't Query Selection");
		$row = mysql_fetch_object($result);
?>
<!--<p  class="title">ลงทะเบียนรายวิชา</p>-->
&nbsp;&nbsp;
 <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> 
      <td colspan="3" class="title">รายละเอียดรายวิชา</td>
    </tr>
    <tr> 
      <td width="2%"><img src="Picture/left_course.gif" width="11" height="20"></td>
      <td width="96%" bgcolor="#8397C4"  class="header"> 
        <?php 
		echo "<b>";
		echo " ".$CID."&nbsp;&nbsp;".$row->Name;		
		echo "</b>";
	?>
      </td>
      <td width="2%"><img src="Picture/right_course.gif" width="11" height="20"></td>
    </tr>
    <tr bgcolor="#DDDDDD"> 
      <td colspan="3"></td>
    </tr>
    <tr bgcolor="#DDDDDD"> 
      <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0"  class="text">
          <tr> 
            <td width="27%"  valign="top">&nbsp;&nbsp;&nbsp;<b>ผู้สอน</b></td>
            <td colspan="2"> <?php echo "<li> ".$row->FULLNAME." ".$row->LASTNAME ;  ?> 
            </td>
          </tr>
          <tr> 
            <td  valign="top">&nbsp;&nbsp;&nbsp;<strong>วัตถุประสงค์</strong></td>
            <td width="71%"><?php echo  "<li>".$row->Target; ?></td>
            <td width="2%">&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top">&nbsp;&nbsp;&nbsp;<strong>เนื้อหาหลัก</strong></td>
            <td><?php echo "<li>".$row->Description; ?></td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;&nbsp;&nbsp;<strong>อ้างอิง</strong></td>
            <td colspan="2"><?php echo "<li>".$row->Refer ;?></td>
          </tr>
        </table></td>
    </tr>
  </table>
<?php 
		Closed();
	} 
?>
</body>
</html>
