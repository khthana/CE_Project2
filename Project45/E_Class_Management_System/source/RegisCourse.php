<?php 
	require('./libraries/grab_globals.lib.php');
	session_start(); 
	if(!$SESSION[id]) {
		include("./ChkErr.inc.php");
		ShowErr("กรุณา login ก่อนการลงทะเบียนเรียนครับ");
	}
	else {
				if($Submit == "ลงทะเบียนเรียนเพิ่ม") 
					echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= SelectCourse.php\">";
				else {
?>
<html>
<head>
<title>RegisterCourse</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body >
<?php
		include("./config.inc.php");
		include("./ChkErr.inc.php");		
		
		$query = "select  CID,SID from regist where CID = $CID and SID = '$SESSION[id]' ";
		$row = data_row($query,"check_data");
		
		if($row) 
				ShowErr("เสียใจครับ  คุณได้ลงทะเบียนวิชานี้่ไปแล้ว");
		else {
			$sql = "insert into regist values('$CID','$SESSION[id]','$SESSION[name]')";
			$result = mysql_query($sql);
			if(!result)
				die("ไม่สามารถ insert ข้อมูลได้");
			else {	
?>
<form action="<?php echo $PHP_SELF; ?>" method="post" enctype="multipart/form-data">
<table width="60%" border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="#000000">
  <tr> 
    <td bgcolor="#33AAFF"  bordercolor="#33AAFF" >&nbsp;</td>
  </tr>
  <tr> 
    <td bgcolor="#99AAFF"  bordercolor="#99AAFF"  class="header"><div align="center"><strong>ลงทะเบียนเรียนเสร็จเรียบร้อยแล้ว</strong></div></td>
  </tr>
  <tr bgcolor="#33AAFF"  bordercolor="#33AAFF">
  	<td class="text">&nbsp;</td>
  </tr>
  <tr> 
    <td bgcolor="#33AAFF" bordercolor="#33AAFF" ><div align="center">
        <input name="Submit" type="submit" id="Submit" value="ลงทะเบียนเรียนเพิ่ม">
        &nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="button" name="Button" value="ปิด" onClick="window.close()">
      </div></td>
  </tr>
</table>
</form>
		<?php  } ?>
		</body>
		</html>
<?php }
	}
} 
?>