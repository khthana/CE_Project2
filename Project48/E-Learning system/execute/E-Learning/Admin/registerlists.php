<?php require_once('../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_student = "SELECT * FROM student";
$student = mysql_query($query_student, $conn) or die(mysql_error());
$row_student = mysql_fetch_assoc($student);
$totalRows_student = mysql_num_rows($student);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Register Data Show</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {
	font-size: 24px;
	color: #6699FF;
	font-weight: bold;
}
.style3 {color: #66CC00}
-->
</style></head>

<body>
<table width="860" border="0" cellpadding="2" cellspacing="0">
  <tr>
    <td width="49">&nbsp;</td>
    <td width="803">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div align="center"><span class="style1">แสดงสถานะการลงทะเบียนคอร์สวิชาของนักศึกษา</span></div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div align="center"><a href="register_config.php">ปรับเปลี่ยนค่าที่ใช้สำหรับการลงทะเบียน</a> &nbsp;&nbsp;&nbsp;<a href="admin_index.php">กลับไปหน้าเมนูผู้ดูแลระบบ</a>&nbsp;&nbsp;&nbsp;<a href="../index.php">กลับไปหน้า home page</a></div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div align="center">
      <table width="452" border="1" cellpadding="2" cellspacing="0" bordercolor="#6699FF">
      <tr bgcolor="#66CCFF">
        <td><div align="center">student_ID</div></td>
        <td><div align="center">ชื่อ</div></td>
        <td><div align="center">นามสกุล</div></td>
        <td><div align="center">สถานะการลงทะเบียนวิชา</div></td>
      </tr>
      <tr>
        <td><div align="center"><?php echo $row_student['student_ID']; ?></div></td>
        <td><div align="center"><?php echo $row_student['name']; ?></div></td>
        <td><div align="center"><?php echo $row_student['surname']; ?></div></td>
        <td><div align="center"><?php $query ="Select * from register where student_ID like '$row_student[student_ID]'";
														$output =mysql_query($query,$conn) or die(mysql_error());
														$total_row=mysql_num_rows($output);
														if($total_row>0){echo "<a href='register_show.php?student_ID=$row_student[student_ID]'><font color='66cc00'>ลงทะเบียนแล้ว ดูข้อมูล Click</font></a>";}
														else echo"ยังไม่ลงทะเบียน";
														?></div></td>
      </tr>
    </table></div></td>
  </tr>
</table>
</body>
</html>
<?php
mysql_free_result($student);
?>
