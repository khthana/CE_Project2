
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<?
if($packid=="")
{
print"<meta http-equiv=\"refresh\" content=\"0;URL=admin.php?file=packdata.php\">";
}else{
include "connect.inc.php";
$sql="delete from packtype where packid='$packid' ";
$result=mysql_db_query($dbname,$sql);
mysql_close();
	print"<meta http-equiv=\"refresh\" content=\"0;URL=admin.php?file=packdata.php\">";
}

?>

