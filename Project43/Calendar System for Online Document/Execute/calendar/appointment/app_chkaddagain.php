<?
session_start();
if(trim($title)=="")
{ 
		$num_chk="F";
			$err=1;
}elseif($duration=="")
{
		$num_chk="F";
			$err=2;

}elseif(checkdate($month,$date1,$year)<>1)
{
		$num_chk="F";
		$err=3;
}elseif($appoint=="ทำการนัดหมาย")
{
$num_chk="F";
$err=4;
$host="localhost";

$usersql="magazine";

$password="magazine";

$table="schedule";

$db="magazine";

$link=mysql_connect($host,$usersql,$password) or

die("ไม่สามารถติดต่อฐานข้อมูลได้");

mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 
//	echo "year=",$year,"  month=",$month," date =",$bddate;
	
$appdate2=$year."-".$month."-".$date1;
$apptime2=$time.":00:00";
//เช็คว่าคนที่ถูกนัดมีมากกว่า1คนและไม่อยู่ในสถานะOD,NAที่ไม่ใช่คนที่จะถูกนัด
$sqlcheck="select * from appoint_receiver where app_id=$app_id and friend_id<>$friend_id and (apr_status<>'OD' and apr_status<>'NA')";

$resultcheck= mysql_db_query("magazine",$sqlcheck);
$numrowcheck=@mysql_num_rows($resultcheck);

if($numrowcheck<1)
{
	 $sqlupdate="update appointment set app_time='$apptime2',app_date='$appdate2',app_title='$title',app_note='$note',app_duration='$duration'";
	$sqlupdate=$sqlupdate.",app_remind_before='$remind_before' where app_id=$app_id and mem_id=$user_id";
	   mysql_db_query("magazine",$sqlupdate);
	$sqlupdate2="update appoint_receiver set apr_status='NE' where app_id=$app_id and friend_id=$friend_id";
	mysql_db_query("magazine",$sqlupdate2);

}else
{
	$sqldel="delete from appoint_receiver where app_id=$app_id and friend_id=$friend_id";
	   mysql_db_query("magazine",$sqldel);

	$sqlinsert="insert into appointment(mem_id,app_time,app_date,app_title,app_note,app_duration,app_remind_before) ";	
	$sqlinsert=$sqlinsert."values($user_id,'$apptime2','$appdate2','$title','$note','$duration','$remind_before')";
	mysql_db_query("magazine",$sqlinsert);
echo $sqlinsert,"<br>";

	$sqlselect="select app_id from appointment where mem_id=$user_id and app_date='$appdate2' and app_time='$apptime2' and app_title='$title' order by app_id desc";
	$result= mysql_db_query("magazine",$sqlselect);
	$row=mysql_fetch_array($result);
echo $sqlselect,"<br>";
	$app_id=$row[0];

$sqlinsertapr="insert into appoint_receiver(app_id,friend_id,apr_status) values($app_id,$friend_id,'NE')";
	mysql_db_query("magazine",$sqlinsertapr);				
echo $sqlinsertapr,"<br>";
}

// ทำการส่งข้อความให้ผู้รับในกรณีที่เป็นการนัดหมายอีกครั้งสำหรับ PS
		if($apr_status=="PS")
		{
			//สร้างข้อความไปบอกreceiver ว่าการนัดหมายถูกลบไปแล้ว
			$sqlsender="select mem_username from member where mem_id=$user_id";
			$result=mysql_db_query("magazine",$sqlsender);
			$row=mysql_fetch_array($result);
			$sendername=$row[0];
			$sql_select="select app_time,app_date,app_title from appointment where app_id=$app_id";
			$result=mysql_db_query("magazine",$sql_select);
				echo $sql_select,"<br>";
			$row=mysql_fetch_array($result);
			$apptime=(int) substr($row[0],0,2);
			$appdate=(int) substr($row[1],8,2);
			$appmonth=(int) substr($row[1],5,2);
			$appyear=(int) substr($row[1],0,4);
			$apptitle=$row[2];
			$datetoday=date("Y-m-d");
			$timenow=date("H:i:s");
			$mess_id=9;
			$mess_title="$sendername ได้ทำการนัดหมายใหม่จากนัดหมายเดิมที่คุณขอคิดดูก่อนแล้ว";
			$mess_note=$apptime.":00น. ".$appdate."/".$appmonth."/".$appyear." ".$apptitle;
			$sql_mess="insert into message(mem_id,msg_time,msg_date,msg_title,msg_message) ";
			$sql_mess=$sql_mess."values(0,'$timenow','$datetoday','$mess_title','$mess_note')";
			echo $sql_mess;
			mysql_db_query("magazine",$sql_mess);
			$sql_maxid="select max(msg_id) from message";
			$result_max=mysql_db_query("magazine",$sql_maxid);
			$rowmax=mysql_fetch_array($result_max);
			echo "<br>",$sql_maxid;
			$msg_id=$rowmax[0];
			$sql_mess_receiver="insert into message_receiver(msg_id,friend_id,msr_status) values($msg_id,$friend_id,'new')";
			mysql_db_query("magazine",$sql_mess_receiver);
			echo "<br>",$sql_mess_receiver;
		} //if apr_status


	$num_chk="T";
	$err="";

mysql_close();

} //else
?>