
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<body>
<?
		session_start();
		if($username!=NULL){
				require("config.php");
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				echo"user name is $username pass is $old_pwd newpass is $new_pwd rep_pass is $rep_pwd";
				$sql = "select * from users where USER_NAME='$username' && PASSWORD='$old_pwd'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				if($num_rows<=0){
						echo "ระหัสผ่านไม่ถูกต้อง กรุณากรอกใหม่อีกครั้ง";
				}
				else{
						if(strcmp($new_pwd,$rep_pwd)!=0){
								echo "การยืนยันระหัสผ่านใหม่ผิดพลาด ";
						}
						else{
								$sql2="update users set PASSWORD='$new_pwd' where USER_NAME='$username'";
								$dbquery = mysql_db_query($dbname,$sql2);
								echo "เปลี่ยนระหัสใหม่สำเร็จ";
								$pwd=$new_pwd;
								echo "คือ $pwd";
								echo "<meta http-equiv=refresh content=0;URL=index2.php?data=getpwd&username=$username&pwd=$pwd>";
						}
				}
		}
		else{
				echo"ไม่สามารถล็อกอินได้";
		}
?>
</body>
</html>
