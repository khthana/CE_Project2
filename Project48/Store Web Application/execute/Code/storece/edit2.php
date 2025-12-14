<HTML>
<HEAD>
<TITLE> :: แก้ไขข้อมูลส่วนตัว 	:: </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</HEAD>

<body bgcolor="#99FFFF">

<?php
include "chksession.php";
$email_edit=$_POST[email_edit];
$tel_edit=$_POST[tel_edit];
$address_edit=$_POST[address_edit];

include "function.php";
/* if (!checkemail ($email_edit)) {
echo "<h3> ERROR : รูปแบบ E-mail ที่กรอกไม่ถูกต้อง </h3>"; exit();
} */

include "connect.php";
mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
$sql="update userprofile set Address='$address_edit',Tel='$tel_edit', Email='$email_edit' where user='$sess_username' ";
$result=mysql_db_query($dbname,$sql);

if (result) {
echo"<center>";
echo "<h2><br><br>  ข้อมูลของคุณถูกแก้ไขเรียบร้อยแล้ว <br></h2>";
echo "<h3> <br> ข้อมูลที่แก้ไขใหม่ </h3>";
echo "<b> ที่อยู่ : </b>              $address_edit    <br>";
echo "<b> เบอร์โทรศัพท์ : </b>$tel_edit              <br>";
echo "<b> E-mail : </b>          $email_edit<br> <br>";
echo "[ <a href=profile.php> กลับหน้าหลัก </a> ] ";
echo"</center>";
} else {
echo "<h3> ไม่สามารถแก้ไขข้อมูลได้ </h3>";
}
mysql_close();
?>
</BODY>
</HTML>