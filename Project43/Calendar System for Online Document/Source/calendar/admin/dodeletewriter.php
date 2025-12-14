<? 
include("checkauth.inc");

$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
$sql="delete from writer where mem_id=$writerid";
$result=mysql_db_query($db,$sql);
if($deletetype=='deleteall')
{
$sql="delete from message_receiver where friend_id=$writerid";
$result=mysql_db_query($db,$sql);

$sql="delete from group_name where mem_id=$writerid";
$result=mysql_db_query($db,$sql);

$sql="delete from contact where mem_id=$writerid";
$result=mysql_db_query($db,$sql);

$sql="delete from member where mem_id=$writerid";
$result=mysql_db_query($db,$sql);

$sql="delete from writer where mem_id=$writerid";
$result=mysql_db_query($db,$sql);

}
header("Location:./adminpage.php");
?>