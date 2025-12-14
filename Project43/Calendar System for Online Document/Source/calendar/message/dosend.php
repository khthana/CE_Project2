<?php
session_start();
include('checkauth.inc');
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
$date=date('Y-m-d');
$time=date('H:i:s');
$sql="insert into message(mem_id,msg_date,msg_time,msg_title,msg_message) values ($user_id,'$date','$time','$title3','$message3')";
$result=mysql_db_query($db,$sql);

$sql="select msg_id from message where mem_id=".$user_id
."&&msg_date='".$date
."'&&msg_time='".$time."'";

$result=mysql_db_query($db,$sql);
$data=mysql_fetch_array($result);
$msg_id=$data[0];

$tok = strtok ($rec_name3,",");

while ($tok) {
$sql1="select mem_id from member where mem_username='".$tok."'";

$result1=mysql_db_query($db,$sql1);
$data1=mysql_fetch_array($result1);
$friend_id=$data1[0];

$sql2="insert into message_receiver(msg_id,friend_id,msr_status) values("
.$msg_id.",".$friend_id.",'new')";
		$result2=mysql_db_query($db,$sql2);
		$tok = strtok (",");
}

mysql_close($link);

	header("Location: ./readmessage.php"); 

?>
