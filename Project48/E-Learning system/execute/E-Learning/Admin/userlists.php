<script language="javascript" type="text/JavaScript">
function del(varUrl)
{ 		
	if (window.confirm("ยืนยันการลบข้อมูล")==true){window.open(varUrl,"_self")}
}
</script>
<?php require_once('../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_admin_rs = "SELECT * FROM `admin`";
$admin_rs = mysql_query($query_admin_rs, $conn) or die(mysql_error());
$row_admin_rs = mysql_fetch_assoc($admin_rs);
$totalRows_admin_rs = mysql_num_rows($admin_rs);

mysql_select_db($database_conn, $conn);
$query_student_rs = "SELECT * FROM student";
$student_rs = mysql_query($query_student_rs, $conn) or die(mysql_error());
$row_student_rs = mysql_fetch_assoc($student_rs);
$totalRows_student_rs = mysql_num_rows($student_rs);

mysql_select_db($database_conn, $conn);
$query_teacher_rs = "SELECT * FROM teacher";
$teacher_rs = mysql_query($query_teacher_rs, $conn) or die(mysql_error());
$row_teacher_rs = mysql_fetch_assoc($teacher_rs);
$totalRows_teacher_rs = mysql_num_rows($teacher_rs);

mysql_select_db($database_conn, $conn);
//find admin recordset
$query_rs_admin = "SELECT * FROM admin";
$rs_admin = mysql_query($query_rs_admin, $conn) or die(mysql_error());
$row_rs_admin = mysql_fetch_assoc($rs_admin);
$totalRows_rs_admin = mysql_num_rows($rs_admin);
//find student recordset
$query_rs_student = "SELECT * FROM student";
$rs_student = mysql_query($query_rs_student, $conn) or die(mysql_error());
$row_rs_student = mysql_fetch_assoc($rs_student);
$totalRows_rs_student = mysql_num_rows($rs_student);
?>
<?php 
if (isset($HTTP_GET_VARS['DelAll']))
{
	// clear table users
	$query  ="DELETE FROM users";
	$result = mysql_query($query);
	// clear table admin
	$query  ="DELETE FROM admin ";
	$result = mysql_query($query);
	// clear table student
	$query  ="DELETE FROM student ";
	$result = mysql_query($query);
	// clear table teacher
	$query  ="DELETE FROM teacher";
	$result = mysql_query($query);
	echo"<meta http-equiv = 'refresh' content = '0; URL =userlists.php'>";
}
if (isset($HTTP_GET_VARS['id']))
{
	//find status
	$query = "select status from users where user_ID = '$id' ";
	$result = mysql_query($query);
	$row_stat =mysql_fetch_assoc($result);
	$stat=$row_stat[status];
	//delete from user;
	$query ="DELETE FROM users where user_ID = '$id' ";
	$result = mysql_query($query);
	//delete from table "status"
	if($stat=="admin"){$query ="DELETE FROM admin where user_ID = '$id' ";}
	else if($stat=="student"){$query ="DELETE FROM student where user_ID = '$id' ";}
	else if($stat=="teacher"){$query ="DELETE FROM teacher where user_ID = '$id' ";}
	$result = mysql_query($query);
	echo"<meta http-equiv = 'refresh' content = '0; URL =userlists.php'>";
}

?>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>รายชื่อ user ทั้งหมด</title>
<style type="text/css">
<!--
.style1 {
	font-size: 24px;
	font-weight: bold;
	font-family: "Courier New", Courier, mono;
}
.style2 {
	font-size: 24px;
	font-weight: bold;
	color: #333333;
}
body {
	margin-left: 20px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #FFFFFF;
}
.style5 {color: #000000; font-weight: bold; }
.style7 {color: #0000CC; font-weight: bold; }
a:link {
	text-decoration: none;
	color: #3366FF;
}
a:visited {
	text-decoration: none;
	color: #3366FF;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
.style8 {color: #000000}
body,td,th {
	color: #000000;
}
-->
</style>
</head>

<body>
<div align="center">
  <p align="left" class="style1">	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<table width="676" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
    <tr>
      <td height="50" colspan="7"><div align="center"><span class="style2">รายชื่อสมาชิกทั้งหมด </span></div></td>
    </tr>
    <tr>
      <td colspan="7">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="7">&nbsp;</td>
    </tr>
    <tr>
      <td width="23">&nbsp;</td>
      <td width="60"><div align="center" class="style7">
        <div align="left"><a href="../index.php">Home </a></div>
      </div></td>
      <td width="167"><div align="left"><a href="admin_index.php" class="style7">Back to Admin menu</a> </div></td>
      <td width="92"><div align="left"><a href="../admin_register.php" target="_blank"><strong>Add Admin</strong></a></div></td>
      <td width="99"><div align="center" class="style5">
          <div align="left"><a href="../signup.php" target="_blank">Add Student</a></div>
      </div></td>
      <td width="105"><div align="left"><a href="../teacher_register.php" target="_blank"><strong>Add Teacher</strong></a> </div></td>
      <td width="130"><div align="center" class="style5">
          <div align="left"><a href=# onClick="del('userlists.php?DelAll=1')">Delete All</a></div>
      </div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="7"><?php if($totalRows_admin_rs>0&&$totalRows_teacher_rs>0&&$totalRows_student_rs>0){?><table width="676" height="93" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
        <tr bgcolor="#66CCFF">
          <td width="71" height="54"><div align="center"><strong>Delete</strong></div></td>
          <td width="52"><div align="center"><strong>Edit</strong></div></td>
          <td width="109"><div align="center"><strong>ID </strong></div></td>
          <td width="150"><div align="center"><strong>Name</strong></div></td>
          <td width="148"><div align="center"><strong>Surname</strong></div></td>
          <td width="132"><div align="center"><strong>Status</strong></div></td>
        </tr>
        <?php do { ?>
        <?php if ($totalRows_admin_rs > 0) { // Show if recordset not empty ?>
        <tr>
          <td><div align="center"><strong><a href=#  onClick="del('userlists.php?id= <?php echo "$row_admin_rs[user_ID]"; ?>')">DEL</a></strong></div></td>
          <td><div align="center"><strong><a href="admin_edit.php?id=<?php echo "$row_admin_rs[user_ID]";?>">Edit</a></strong></div></td>
          <td><div align="center"><?php echo $row_admin_rs['user_ID']; ?></div></td>
          <td><div align="center"><?php echo $row_admin_rs['name']; ?></div></td>
          <td><div align="center"><?php echo $row_admin_rs['surname']; ?></div></td>
          <td><div align="center">admin</div></td>
        </tr>
        <?php } // Show if recordset not empty ?>
        <?php } while ($row_admin_rs = mysql_fetch_assoc($admin_rs)); ?>
        <?php do { ?>
        <?php if ($totalRows_student_rs > 0) { // Show if recordset not empty ?>
        <tr>
          <td><div align="center"><strong><a href=#  onClick="del('userlists.php?id= <?php echo "$row_student_rs[user_ID]"; ?>')">DEL</a></strong></div></td>
          <td><div align="center"><strong><a href="student_edit.php?id=%20<?php echo "$row_student_rs[user_ID]";?>">Edit</a></strong></div></td>
          <td><div align="center"><?php echo $row_student_rs['user_ID']; ?></div></td>
          <td><div align="center"><?php echo $row_student_rs['name']; ?></div></td>
          <td><div align="center"><?php echo $row_student_rs['surname']; ?></div></td>
          <td><div align="center">student</div></td>
        </tr>
        <?php } // Show if recordset not empty ?>
        <?php } while ($row_student_rs = mysql_fetch_assoc($student_rs)); ?>
        <?php do { ?>
        <?php if ($totalRows_teacher_rs > 0) { // Show if recordset not empty ?>
        <tr>
          <td><div align="center"><strong><a href=#  onClick="del('userlists.php?id= <?php echo "$row_teacher_rs[user_ID]"; ?>')">DEL</a></strong></div></td>
          <td><div align="center"><strong><a href="teacher_edit.php?id=<?php echo "$row_teacher_rs[user_ID]";?>">Edit</a></strong></div></td>
          <td><div align="center"><?php echo $row_teacher_rs['user_ID']; ?></div></td>
          <td><div align="center"><?php echo $row_teacher_rs['name']; ?></div></td>
          <td><div align="center"><?php echo $row_teacher_rs['surname']; ?></div></td>
          <td><div align="center">teacher</div></td>
        </tr>
        <?php } // Show if recordset not empty ?>
        <?php } while ($row_teacher_rs = mysql_fetch_assoc($teacher_rs)); ?>
      </table>
      <?php }else echo "<div align='center'><font color='ff33cc' size='+3'>ไม่มีสมาชิกในระบบค่ะ</font></div>";?></td>
    </tr>                                                                                     
  </table>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

</body>
</html>
<?php
mysql_free_result($admin_rs);

mysql_free_result($student_rs);

mysql_free_result($teacher_rs);
?>

