<?php session_start();?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>ตรวจสอบการลงทะเบียน</title>
</head>

<body>
<?php
//ตรวจสอบว่าเป็นสมาชิกหรือยัง ถ้าเป็นสมาชิกลงทะเบียนวิชาได้
 if ($_SESSION['status']!="student"){
 		echo"<script>alert('กรุณาสมัครสมาชิกก่อนค่ะ'); </script>";
		echo"<meta http-equiv='refresh' content='0;URL=signup.php'>";
 }else{echo"<meta http-equiv='refresh' content='0;URL=student/course_show.php?subject_ID=$subject_ID'>";}
?>
</body>
</html>
