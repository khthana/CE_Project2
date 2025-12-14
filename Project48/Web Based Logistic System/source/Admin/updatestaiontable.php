<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
include "connect.inc.php";
$sql="update station set sta_number='$number', sta_moo='$moo', sta_road='$road', sta_district='$district', sta_amphur='$amphur', sta_province='$province', sta_zipcode='$zipcode', sta_telephone='$telephone' where id_station='$id'";
$result=mysql_db_query($dbname,$sql);
mysql_close();
print"<meta http-equiv=\"refresh\" content=\"0;URL=admin.php?file=stationdata.php\">";
?>
</body>
</html>
