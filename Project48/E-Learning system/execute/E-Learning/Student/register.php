<?php  session_start(); ?>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<?php 
			require_once('../connections/conn.php');
			mysql_select_db($database_conn,$conn);
			//print_r($_SESSION[stack]);
			//วิชาไม่ซ้ำลงทะเบียน
			if(!$same){
								while ($course_ID = each($_SESSION[stack])) {	
								$query ="INSERT INTO register(student_ID,course_ID,status) VALUES('$_SESSION[student_ID]','$course_ID[value]','wait')";
								$register =mysql_query($query, $conn) or die(mysql_error());
								}
								$_SESSION[stack]=array();
								echo"<script> alert('การลงทะเบียนเรียบร้อยแล้วค่ะ');</script>";
								echo"<meta http-equiv='refresh' content='0 URL=student_index.php'>";
			}else//วิชาซ้ำ
				{
					echo"<script>alert('ไม่สามารถลงทะเบียนได้ เนื่องจากมีวิชาซ้ำกัน');</script>";
					echo"<meta http-equiv='refresh' content='0 URL=register_show.php'>";
				}
?>
</html>
