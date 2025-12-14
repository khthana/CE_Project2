<?php
include "chksession.php";
include "function.php";
include "connect.php";

mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
$sql="select * from userprofile where Username='$sess_username' ";
$result = mysql_db_query($dbname,$sql);
$record = mysql_fetch_array($result);

$ID=$record[ID];
$User=$record[Username];
$Name=$record[Name];
$Sname=$record[Sname];
$Address=$record[Address];
$Email=$record[Email];
$Tel=$record[Tel];
$Level=$record[Level];
$regdate=$record[regdate];
mysql_close();
?>

<HTML><TITLE> Profile ระบบสมาชิก </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
.style2 {color: #0000FF}
-->
</style>
</head>
<body bgcolor="#99FFFF">
<h2 align="center"><br> 
<span class="style2">::  ขอต้อนรับเข้าสู่ห้อง Store ภาควิชาวิศวกรรมคอมพิวเตอร์ ::</span> </h2>
<p align="center" class="style2"> <br>
  ยินดีต้อนรับ  คุณ <b><?=$Name?>  <?=$Sname?> </b> 
    
 <?php  
  
switch ($Level) {

case student:
echo " ระดับผู้ใช้งาน <b>นักศึกษา</b><br><br>";
echo " <br>[<a href=frmsearch.html> ค้นหาวัสดุ และอุปกรณ์ </a>] ";
echo " [<a href=edit.php> แก้ไขข้อมูลส่วนตัว </a>]";
echo " [<a href=changepw.php> เปลี่ยนรหัสผ่าน </a>]";
echo " [<a href=logout.php> ออกจากระบบ </a>]";
break;

case staff:
echo " ระดับผู้ใช้งาน <b>เจ้าหน้าที่ </b><br><br>";
echo " <br>[<a href=frmsearch.html> ค้นหาวัสดุ และอุปกรณ์ </a>] ";
echo " [<a href=edit.php> แก้ไขข้อมูลส่วนตัว </a>]";
echo " [<a href=changepw.php> เปลี่ยนรหัสผ่าน </a>]";
echo " [<a href=logout.php> ออกจากระบบ </a>]";
break;

case teacher:
echo " ระดับผู้ใช้งาน <b> อาจารย์ </b><br><br>";
echo " <br>[<a href=frmsearch.html> ค้นหาวัสดุ และอุปกรณ์ </a>] ";
echo " [<a href=edit.php> แก้ไขข้อมูลส่วนตัว </a>]";
echo " [<a href=changepw.php> เปลี่ยนรหัสผ่าน </a>]";
echo " [<a href=logout.php> ออกจากระบบ </a>]";
break;

 case administrator :

echo " ระดับผู้ใช้งาน <b>ผู้ดูแลระบบ </b><br>";
echo " <br>[<a href=frmsearch.html> ค้นหาวัสดุ และอุปกรณ์ </a>] ";
echo " [<a href=frminsert.html>  เพิ่ม </a>]";
echo " [<a href=frmedit.html>  แก้ไข  </a>]";
echo " [ <a href=frmdel.html> ลบ </a>]";
echo " [<a href=edit.php> แก้ไขข้อมูลส่วนตัว </a>]";
echo " [<a href=changepw.php> เปลี่ยนรหัสผ่าน</a> ]";
echo " [<a href=logout.php> ออกจากระบบ </a>]";
break;
}
?>


</body>
</html>
