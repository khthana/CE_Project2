<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
print"aaaaaaaaaaaaaaaaa";
print"$id";
include "connect.inc.php";
$sql="delete from wb_question where id_ques='$id' ";
$result=mysql_db_query($dbname,$sql);
$sql2="delete from wb_answer where ref_id='$id'";
$result=mysql_db_query($dbname,$sql2);
mysql_close();
print"<meta http-equiv=\"refresh\" content=\"0;URL=admin.php?file=webborddata.php\">";
?>

</body>
</html>
