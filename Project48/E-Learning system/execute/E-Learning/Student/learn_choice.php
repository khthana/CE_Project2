<?php session_start();?>
<?php require_once('../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_course = "SELECT * FROM course left join register on course.course_ID=register.course_ID where register.student_ID='$_SESSION[student_ID]'";
$course = mysql_query($query_course, $conn) or die(mysql_error());
$row_course = mysql_fetch_assoc($course);
$totalRows_course = mysql_num_rows($course);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {
	font-size: 24px;
	color: #FF0099;
	font-weight: bold;
}
.style2 {font-size: 24}
.style3 {font-size: 24px}
-->
</style>
</head>

<body>
 <p class="style1">โปรดเลือกวิธีการเรียน</p>
 <p><span class="style2"><span class="style3"><a href="<?php echo "http://$IP/E-Learning/Student/live_learn.php";?>">เรียนพร้อมอาจารย์สอน(Live)</a></span></span></p>
 <p><span class="style3"><a href="Teach%20record/Digital%20circuit%20and%20logic%20design/digital_detail.php">เรียนจากเทป</a></span></p>
</body>

</html>
<?php
mysql_free_result($course);

?>
