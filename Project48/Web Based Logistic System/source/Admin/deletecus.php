<?
if($cusid=="")
{
print"<meta http-equiv=\"refresh\" content=\"0;URL=admin.php?file=customerdata.php\">";
}else{
include "connect.inc.php";
$sql="delete from customers where cusid='$cusid' ";
$result=mysql_db_query($dbname,$sql);
mysql_close();
	print"<meta http-equiv=\"refresh\" content=\"0;URL=admin.php?file=customerdata.php\">";
}

?>
