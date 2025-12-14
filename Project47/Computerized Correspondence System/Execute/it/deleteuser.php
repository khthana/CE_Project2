<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?php
 					session_start();
				  	session_register("$username");
					if($uname!=NULL)
							$username="$uname";
					else
							$username=$username;
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "delete from users where USER_NAME='$data1' and SERNAME='$data2'";
				$dbquery = mysql_db_query($dbname,$sql);
				echo "ทำการลบเรียบร้อย";
	 			mysql_close();
?>
</body>
</html>
