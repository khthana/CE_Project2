<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?

$packtype=$_POST[packtype];
$packrate=$_POST[packrate];
if($packtype=="" ||packrate=="")
{
print("<center><strong>ท่านกรอกข้อมูลไม่ครบ</strong></center>");
	if($packtype=="")
	{
	print("<center> - ข้อมูลประเภท ไม่ได้กรอก</center></br>");
}
if($packrate=="")
{
print("<center> - ข้อมูลอัตราไม่ได้กรอก</center></br>");
}
print"<center><input type='button' onclick=\"history.back()\" value='-->>กรอกข้อมูลใหม่<<--'></center>";
}else{
include "connect.inc.php";
$sql="insert into packtype values(null,'$packtype','$packrate')";
$resulr=mysql_db_query($dbname,$sql);
mysql_close();
print"<meta http-equiv=\"refresh\" content=\"0;URL=admin.php?file=packdata.php\">";
}
?>
</body>
</html>
