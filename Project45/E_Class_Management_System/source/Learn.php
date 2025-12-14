<?php 
//session_start(); 
	require('./libraries/grab_globals.lib.php');
	include('./connectDB.php');
?>
<html>
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ต</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="./style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
//if(session_is_registered("SESSION"))
//{
	function get_start($SID,$CID,$CH)
		{
			connect_db();
			$sql="select ID,Start from learn where SID=$SID and CID=$CID and CH='$CH'";
			$result=mysql_query($sql);
			$row=mysql_fetch_row($result);
			mysql_close();
			return $row;
		}
		function get_LastIN($SID,$CID,$CH)
		{
			connect_db();
			$sql="select ID,LastIN from learn where SID=$SID and CID=$CID and CH='$CH'";
			$result=mysql_query($sql);
			$row=mysql_fetch_row($result);
			mysql_close();
			return $row;
		}
		
		function set_start($ID,$Start)
		{
			connect_db();
			$sql="UPDATE learn set Start='$Start' where ID=$ID";
			echo $sql;
			$result=mysql_query($sql);
			mysql_close();
		}

		function set_LastIN($ID,$LastIN)
		{
			connect_db();
			$sql="UPDATE learn set LastIN='".$LastIN."' where ID=$ID";
			$result=mysql_query($sql);
			mysql_close();
		}
		
		function insert($SID,$CID,$CH,$Start)
		{
			connect_db();
			$sql="insert into  learn (ID, SID, CID, CH, Start, LastIN) VALUES (NULL, $SID, $CID, '$CH', '$Start', '$Start')";
			$result=mysql_query($sql);
			mysql_close();
		}
/*}
else
{
	print "<center><font color='#FF0000'><b>กรุณาทำการ LOGIN ก่อนเข้าใช้งานด้วยครับ</b></font></center><br>
				<ecnter><a href='index.php?LogOut=yes'>LOGIN</a></center>";
}*/
?>
</body>
</html>
