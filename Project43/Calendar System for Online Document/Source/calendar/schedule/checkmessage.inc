 <?php
session_start();
$host="localhost";
$user="magazine";
$pass="magazine";
$db="magazine";

$sql="select count(*) from message_receiver  where friend_id='"
	.$user_id."'";

$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");

$result=mysql_db_query($db,$sql);
$num_of_msg=mysql_fetch_array($result);

$sql="select count(*) from message_receiver  where friend_id='"
	.$user_id."'&&msr_status='new'";

$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");

$result=mysql_db_query($db,$sql);
$new_msg=mysql_fetch_array($result);
echo'<a href="./message/readmessage.php">';
echo"<font face="MS Sans Serif" size="1" color="#3399FF" ><b>มีข้อความใหม่ ".$new_msg[0]." ข้อความ</b></font>";
echo'<font face="MS Sans Serif" size="1" color="#3399FF" >มีข้อความถึงคุณทั้งหมด '.$num_of_msg[0]." ข้อความ</font><br>";
echo'</a>';
mysql_close($link);
?>