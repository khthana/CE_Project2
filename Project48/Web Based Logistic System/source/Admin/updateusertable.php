<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
include "connect.inc.php";
/*print "$userid";
print "$name";
print "$sername";
print "$position";
print "$place";*/
$sql="update user set  id_user='$usid', name='$name', sername='$sername', id_type='$position', id_station='$place' where id_user='$id2' ";
$result=mysql_db_query($dbname,$sql);
mysql_close();
print"<meta http-equiv=\"refresh\" content=\"0;URL=admin.php?file=userdata.php\">";
?>
</body>
</html>
