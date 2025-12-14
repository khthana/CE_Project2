<?
		$schdate=$date1;
		$schmonth=$month;
		$schyear=$year;
		$app_title=trim($title);
		$app_note=trim($note);
		$app_duration=$duration;
		$app_remind_before=$remind_before;
		$app_remind_before_hour=$remind_before_hour;	
		$app_remind_mail=$remind_mail;

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
//		$app_title=$title;
//		$app_note=$note;
//		$app_duration=$duration;
//		$app_remind_before=$remind_before;
//กำหนดว-ด-ป
		$schdate=$date1;
		$schmonth=$month;
		$schyear=$year;
		$tmp_day=mktime(1,1,0,$schmonth,$schdate,$schyear);
		$schday=(int) date("w",$tmp_day);		
		header("Location:app_add_group.php?time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear");
	}elseif($more_button=="ทั้งหมด>>" || $list_all=="รายชื่อเพื่อนทั้งหมด" )
{
	//เมื่อผู้ใช้ต้องการรายชื่อเพื่อนทั้งหมดในกลุ่มนี้กรณีกลุ่มเกิน 15 คน
		$from_sch="T";
//		$app_title=$title;
//		$app_note=$note;
//		$app_duration=$duration;
//		$app_remind_before=$remind_before;
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
		$sqlfriend=$sqlfriend."where member.mem_id=contact.friend_id and contact.mem_id=$user_id and grp_id=$grp_num order by mem_username";
		$result= mysql_db_query("magazine",$sqlfriend);
		$numrow=@mysql_num_rows($result);
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
// ----------Session Register list_friend_id--------
		session_register(list_friend_id);
		$list_friend_id=$chk_friend;
			if($list_all=="รายชื่อเพื่อนทั้งหมด")
			{ $grp_num="all";
			}
			header("Location:app_add_all_list.php?time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear&grp_num=$grp_num");
	}elseif($app_title=="")
{ 
		$num_chk="F";
			$err=1;
}elseif($app_duration=="")
{
		$num_chk="F";
			$err=2;
}elseif(checkdate($month,$date1,$year)<>1)
{
		$num_chk="F";
		$err=3;
}elseif(strlen($app_note)>200)
{
		$num_chk="F";
		$err=5;
}else
{
if($appoint=="ทำการนัดหมาย" || ($grp_button=="" and $appoint_grp=="" and $more_button=="" and $list_all=="" ))
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
//เอาชื่อเพื่อนกับid มาทำเป็นตัวแปรเที่ยบกับที่ส่งมา
$sqlfriend="select friend_id,mem_username from member,contact ";
$sqlfriend=$sqlfriend."where member.mem_id=contact.friend_id and contact.mem_id=$user_id and grp_id=$grp_num order by mem_username";
$result= mysql_db_query("magazine",$sqlfriend);
$numrow=@mysql_num_rows($result);
	
	$num_chk="F";
	$err=4;
	$chk_friend="00";
for($i=0;$i<$numrow;$i++)
{
	   $row=mysql_fetch_array($result);		
		$tmpname=$row[1];
		$tmpname=$tmpname.$row[0];
		if($$tmpname==$row[0])
		{
			$chk_friend=$chk_friend."/".$row[0];
			$num_chk="T";
			$err="";
		}
}
		$from_sch="T";
if($num_chk=="T")
{
	session_register(list_friend_id);
	$list_friend_id=$chk_friend;
}
//elseif($num_chk=="F" and $err==4)
//{
//	$sqldelete="delete from appointment where app_id=$app_id";
//	mysql_db_query("magazine",$sqldelete);
//} 
//$num_chk

mysql_close();
} // if $appoint
} //else ไป
?>