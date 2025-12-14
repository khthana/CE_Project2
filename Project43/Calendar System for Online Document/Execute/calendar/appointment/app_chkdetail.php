<?
session_start();
if($title=="")
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
}else
{
	if($grp_button=="ไป")
	{
$num_chk="F";
$err="";
$schdate=$date1;
$schmonth=$month;
$schyear=$year;
	}elseif($appoint_grp=="นัดเป็นกลุ่ม")
	{
//แก้ ข้อมูลในตัวแปร session
		$from_sch="T";
		$app_title=$title;
		$app_note=$note;
		$app_duration=$duration;
		$app_remind_before=$remind_before;
//กำหนดว-ด-ป
		$schdate=$date1;
		$schmonth=$month;
		$schyear=$year;
		$tmp_day=mktime(1,1,0,$schmonth,$schdate,$schyear);
		$schday=(int) date("w",$tmp_day);		
		header("Location:app_add_group.php?time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear");
	}elseif($more_button=="ทั้งหมด>>")
{
	//เมื่อผู้ใช้ต้องการรายชื่อเพื่อนทั้งหมดในกลุ่มนี้กรณีกลุ่มเกิน 15 คน
		$from_sch="T";
		$app_title=$title;
		$app_note=$note;
		$app_duration=$duration;
		$app_remind_before=$remind_before;
//กำหนดว-ด-ป
		$schdate=$date1;
		$schmonth=$month;
		$schyear=$year;
		$tmp_day=mktime(1,1,0,$schmonth,$schdate,$schyear);
		$schday=(int) date("w",$tmp_day);		

		$host="localhost";

		$usersql="magazine";
	
		$password="magazine";

		$table="schedule";

		$db="magazine";

		$link=mysql_connect($host,$usersql,$password) or

		die("ไม่สามารถติดต่อฐานข้อมูลได้");

		mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 

		$sqlfriend="select friend_id,mem_username from member,contact ";
		$sqlfriend=$sqlfriend."where member.mem_id=contact.friend_id and contact.mem_id=$user_id and grp_id=$grp_num";
		$result= mysql_db_query("magazine",$sqlfriend);
		$numrow=@mysql_num_rows($result);
		echo "$sqlfriend <br>";
		$chk_friend="00"; //เลขรองพื้นอาร์เรย์
		for($i=0;$i<$numrow;$i++)
		{
	   		$row=mysql_fetch_array($result);		
			$tmpname=$row[1];
			$tmpname=$tmpname.$row[0];
			if($$tmpname==$row[0])
			{	 $chk_friend=$chk_friend."/".$row[0];
			}
		}
		echo "chkfriend=$chk_friend <br>";
// ----------Session Register list_friend_id--------
		session_register(list_friend_id);
		$list_friend_id=$chk_friend;
		mysql_close();
		header("Location:app_add_all_list.php?time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear&grp_num=$grp_num");

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
	 $sqlinsert="insert into appointment(mem_id,app_date,app_time, app_title,app_note,app_duration,app_remind_before)
	 values('$user_id','$appdate2','$apptime2','$title','$note','$duration','$remind_before')";
	
   mysql_db_query("magazine",$sqlinsert);

	$sqlselect="select app_id from appointment where mem_id=$user_id and app_date='$appdate2' and app_time='$apptime2' and app_title='$title' order by app_id desc";
$result= mysql_db_query("magazine",$sqlselect);
$row=mysql_fetch_array($result);
$app_id=$row[0];
//เอาชื่อเพื่อนกับid มาทำเป็นตัวแปรเที่ยบกับที่ส่งมา
$sqlfriend="select friend_id,mem_username from member,contact ";
$sqlfriend=$sqlfriend."where member.mem_id=contact.friend_id and contact.mem_id=$user_id and grp_id=$grp_num";
$result= mysql_db_query("magazine",$sqlfriend);
$numrow=@mysql_num_rows($result);
	
	$num_chk="F";
	$err=4;

for($i=0;$i<$numrow;$i++)
{
	   $row=mysql_fetch_array($result);		
		$tmpname=$row[1];
		$tmpname=$tmpname.$row[0];
		if($$tmpname==$row[0])
		{	 $sqlinsert="insert into appoint_receiver(app_id,friend_id,apr_status) values($app_id,$row[0],'NE')";
				mysql_db_query("magazine",$sqlinsert);				
			$num_chk="T";
			$err="";
		}
}
if($num_chk=="T")
{
	if($from_sch=="T")
	{
	session_unregister(from_sch);
	session_unregister(app_title);
	session_unregister(app_note);
	session_unregister(app_duration);
	session_unregister(app_remind_before);
	}
}elseif($num_chk=="F" and $err==4)
{
	$sqldelete="delete from appointment where app_id=$app_id";
	mysql_db_query("magazine",$sqldelete);
} //$num_chk

mysql_close();
} // if $appoint
} //else
?>