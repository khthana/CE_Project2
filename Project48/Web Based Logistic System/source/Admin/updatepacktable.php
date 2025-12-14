<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
include "connect.inc.php";
$sql="update packtype set packrate=$packrate where packid=$packid";
$result=mysql_db_query($dbname,$sql);
mysql_close();
print"<meta http-equiv=\"refresh\" content=\"0;URL=?file=packdata.php\">";
?>
</body>
</html>
