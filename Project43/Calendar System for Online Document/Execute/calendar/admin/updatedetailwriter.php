<? 
include("checkauth.inc");

$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
$sql="update writer set wri_position='$newposition',wri_education='$neweducation',wri_experience='$newexperience',wri_skill='$newskill' where mem_id=$writerid";
$result=mysql_db_query($db,$sql);
session_unregister("writername");

session_unregister("position");
session_unregister("skill");
session_unregister("educate");
$lastpage='';
session_unregister("exp");
session_unregister("lastpage");

header("Location:./adminpage.php");
?>