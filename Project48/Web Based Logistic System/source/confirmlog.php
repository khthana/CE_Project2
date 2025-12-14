<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
session_start();
include "connect.php";
$sql="update transition set  id_status=2 where transid='$transid' ";
$result=mysql_db_query($dbname,$sql);
if($result){
mysql_close(); 
print"<meta http-equiv=\"refresh\" content=\"0; url=index.php?file=usertool.php&file2=viewtotaltrans.php\">";
	}
?>
</body>
</html>
