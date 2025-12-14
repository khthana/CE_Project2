<?
	require("config.inc.php");
	$topic = htmlspecialchars($topic);
	$detail = htmlspecialchars($detail);
	$sender =htmlspecialchars($sender);
	$email = htmlspecialchars($email);
   $date=date("d/m/y");

// บันทึกข้อมูลลงฐานข้อมูล
	mysql_connect($host,$user,$passwd);
	
	$sql = "insert into toadmin(no,topic,detail,sender,email,date) values ('$no','$topic','$detail','$sender','$email','$date')";
	$result = mysql_db_query($dbname,$sql);

if($result==0) {
		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>มีข้อผิดพลาดที่ระบบ</b></font><br><br>";
		echo "กรุณาแจ้ง admin ให้ตรวจสอบด้วยครับ";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "[<a href='javascript:history.back(1)'>Back</a>]";
		echo "</center>";
		exit();
	} 
	mysql_close(); 
		
		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif' color=blue>";
		echo "<font size=3 color=red><b>บันทึกข้อมูลเรียบร้อย</b></font><br><br>";
		echo"ได้ส่งข้อความถึงผู้ดูแลระบบเรียบร้อยแล้ว<br>";
		echo"กรุณารอสักครู่เพื่อกลับสู่หน้าแรก";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
?>
	<html>
	<head>
	<title>ส่งคำถาม</title>
	<meta name="Generator" content="EditPlus">
	<META HTTP-EQUIV="Content-Type" content="text/html; charset=windows-874">
	<META HTTP-EQUIV="REFRESH" CONTENT="4; URL=main.php ">
	</head>

<link rel="stylesheet" type="text/css" href="style.css">	

	<body>
<table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF" size='1'>Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>

	</body>
	</html>

