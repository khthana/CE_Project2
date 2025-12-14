<html>
<head>
<?
session_start();

?>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<p>
  <?
	if($pass<>$rpass or $pass=="" or $rpass=="")
	{
	print("<center><font color=\"#FF0000\" size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><strong>Password ไม่ถูกต้อง !!</strong></font><br><br>");
	print("<a href=?file=datatool.php&file2=updatecustomer.php><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"> << แก้ไขใหม่</font></a><center>");

	}else{
	include "connect.php";
	$sql="update customers set  password='$pass' where cusid='$sess_username' ";
	$result=mysql_db_query($dbname,$sql);
	mysql_close();
	print"<meta http-equiv=\"refresh\" content=\"0;url=?file=datatool.php&file2=customer.php\">";  
	}
	?>
</p>
</body>
</html>
