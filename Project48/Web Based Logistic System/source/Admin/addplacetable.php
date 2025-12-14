<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
include "connect.inc.php";
$sql="insert into place values(null,'$splace','$rplace','$rate')";
$result=mysql_db_query($dbname,$sql);
print"<meta http-equiv=\"refresh\" content=\"0;URL=?file=packdata.php\">";
mysql_close();
?>
</body>
</html>
