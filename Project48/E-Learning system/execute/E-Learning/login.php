<?php session_start();?>
<?php require_once('Connections/conn.php');?> 
<?php		
		mysql_select_db($database_conn,$conn);
		$command = "SELECT * FROM users WHERE username='$username' and password ='$password' ";
		$query = mysql_query($command,$conn) or die(mysql_error());
		$result = mysql_fetch_assoc($query);
		$totalRows_result=mysql_num_rows($query);
if($totalRows_result>0){
			$user_ID =$result['user_ID'];
			$status =$result['status']; //status is same name to table name
			if($status=="admin"){$command = "SELECT * FROM  admin WHERE user_ID='$user_ID' ";}
			else if($status=="student"){$command = "SELECT * FROM  student WHERE user_ID='$user_ID' ";}
			else if($status=="teacher"){$command = "SELECT * FROM  teacher WHERE user_ID='$user_ID' ";}
			$query = mysql_query($command, $conn) or die(mysql_error());
			$result= mysql_fetch_assoc($query);
			session_register("user_ID");
			if($status=="student"){$_SESSION["student_ID"]=$result['student_ID'];}
			session_register("username");
			session_register ("password");
			session_register("status");
			$_SESSION["name"]=$result['name'];
			$_SESSION["surname"]=$result['surname'];
			$_SESSION[stack]=array();
			//if teacher then collect ip  
			if ($status=="teacher"){
				 	$_SESSION["teacher_ID"]=$result['teacher_ID'];
					$IP = getenv("REMOTE_ADDR");
					if($IP=="127.0.0.1"){$IP="192.168.0.2";}
					$query="select course_ID from course where teacher_ID='$result[teacher_ID]' ";
				 	$result=mysql_query($query);
					while($row_course=mysql_fetch_assoc($result)){
				 				$query="update course set IP ='$IP' where course_ID='$row_course[course_ID]'";
								$result2 =mysql_query($query);
					}
				}
				 
				 switch($status) 
				{
				   case "admin" : echo"<meta http-equiv='refresh' content='0;URL=Admin/admin_index.php'>";break;
				   case "teacher" :{echo"<meta http-equiv='refresh' content='0;URL=Teacher/teacher_index.php'>";}break;
	               case "student":echo"<meta http-equiv='refresh' content='0;URL=Student/student_index.php'>";break;
				   default:{}
				 }
}else	{	$sql="select * from users where username like '$username'";
			$query =mysql_query($sql,$conn);
			$totalRow_result=mysql_num_rows($query);
			if($totalRow_result>0){echo"<script>alert('password ١ͧ');</script>";}
			else {echo"<script>alert('username к');</script>";}
			echo"<meta http-equiv='refresh' content='0;URL=index.php'>";
		}
?>
