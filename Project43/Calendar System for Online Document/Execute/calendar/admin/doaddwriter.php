<? 
include("checkauth.inc");

$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
$sql="insert into writer (mem_id,wri_position,wri_education,wri_experience,wri_skill) values ($writer_id,'$position','$education','$experience','$skill')";
$result=mysql_db_query($db,$sql);
header("Location:./adminpage.php");
?>