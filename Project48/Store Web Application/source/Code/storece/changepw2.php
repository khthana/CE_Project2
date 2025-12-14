<HTML>
<HEAD>
<TITLE> ระบบสมาชิก </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</HEAD>

<body bgcolor="#99FFFF">

<?php
include "chksession.php";

$oldpass=$_POST[oldpass];
$newpass=$_POST[newpass];
$newpass2=$_POST[newpass2];
$md5oldpass=md5($oldpass);
$md5newpass=md5($newpass);
$md5newpass2=md5($newpass2);

if ($oldpass=="" or $newpass=="" or $newpass2=="" or $newpass<>$newpass2) {
echo "<div align=center><br><br><h3> ERROR :: กรุณากรอกข้อมูลให้ครบ </h3>"; 
echo " [ <a href=changepw.php> เปลี่ยนรหัสอีกครั้ง </a> ] ";
exit();
}

include "connect.php";
$sql="select * from userprofile where Username='$sess_username' and Password='$md5oldpass' ";
$result=mysql_db_query($dbname,$sql);
$num=mysql_num_rows($result);

if ($num<1) {
echo "<br><br> <h3> ERROR : รหัสผ่านเดิมไม่ถูกต้อง </h3>";
echo " [ <a href=changepw.php> เปลี่ยนรหัสอีกครั้ง </a> ] <div>";
exit();
}

$sql="update userprofile set password='$md5newpass'
where Username ='$sess_username' ";
$result=mysql_db_query($dbname,$sql);
if  ($result) {
echo "<div align='center'>";
echo  "<center> <br><br> <h3> :: เปลี่ยนรหัสผ่านเรียบร้อยแล้ว ::</h3> </center>";
echo " <b> รหัสเก่า </b> $oldpass <br>";
echo "	<b> รหัสใหม่ </b> $newpass <br>";
echo "	<b> รหัสใหม่อีกครั้ง </b>$newpass2 <br><br>";
echo "	[ <a href=profile.php> กลับหน้าหลัก </a> ] ";
echo "</div>";
} else {
echo "<div aglin='center'><h3><br><br> ไม่สามารถเปลี่ยนรหัสผ่านได้ </h3>";
echo "[<a href=changepw.php> เปลี่ยนรหัสอีกครั้ง </a> ]</div>";
}
mysql_close();
?>

</body>
</html>