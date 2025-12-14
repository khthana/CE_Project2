<?php
  	session_start();
	if($uname&&$pwd){
			require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from users where USER_NAME ='$uname' AND PASSWORD='$pwd'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				$result = mysql_fetch_array($dbquery);
				$position   = $result[POSITION];
				if($num_rows<=0){
					echo "ชื่อหรือระหัสผิดพลาด";
					echo "<meta http-equiv=refresh content=0;URL=index.php>";
				}
				else{
  					$username="$uname";
					$username = addslashes($username);
					session_register("$username");
					echo "ระบบลงทะเบียนคุณ $username เรียบร้อย ";
					switch($position)
					{
							case 'secretary'  : {$position=accept;}break;	  
							case 'user'  : {$position=user;}break;	  
							case 'admin'  : {$position=add_user;}break;	  
							case 'หัวหน้าภาควิชาวิศวกรรมคอมพิวเตอร์'  : {$position=head;}break;
							default  :{echo "คุณยังไม่มีตำแหน่ง";}	  
					}
					echo "<meta http-equiv=refresh content=0;URL=index2.php?data=$position&username=$username&pwd=$pwd>";
				}
	}
	else{
			echo "กรุณากรอก username และ password ใหม่";
			echo "<meta http-equiv=refresh content=0;URL=index.php>";
	}
?>
<html>
<head>
<title>login</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

</body>
</html>
