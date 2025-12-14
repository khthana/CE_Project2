<?php
include('checkauth.inc');
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");

$sql='select  message.msg_id from message,message_receiver where message.msg_id=message_receiver.msg_id 
	&&message_receiver.friend_id='.$user_id;

$result4=mysql_db_query($db,$sql);
$row=mysql_num_rows($result4);

for($i=0;$i<$row;$i++){
	$data=mysql_fetch_array($result4);
	if($$data[0]==$data[0])
		{$sql1='delete from message_receiver where msg_id='.$data[0].'&&friend_id='.$user_id;
		$result1=mysql_db_query($db,$sql1);

		$sql2='select  count(*)  from message_receiver where msg_id='.$data[0].'&&friend_id<>'.$user_id;
		$result2=mysql_db_query($db,$sql2);
		$data2=mysql_fetch_array($result2);		

if($data2[0]==0)
			{$sql3='delete from message where msg_id='.$data[0];
			$result3=mysql_db_query($db,$sql3);

		}}
}
mysql_close($link);
header("Location: ./readmessage.php"); 
?>