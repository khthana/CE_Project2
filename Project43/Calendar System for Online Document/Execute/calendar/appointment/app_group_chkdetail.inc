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

	if($appoint_person=="นัดรายบุคคล")
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
		header("Location:app_add1.php?time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear");
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
		$err=6;
}else
{

if($appoint=="ทำการนัดหมาย" || $appoint_person=="")
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

//เอาชื่อเพื่อนกับid มาทำเป็นตัวแปรเที่ยบกับที่ส่งมา
$sqlgroup="select grp_id,grp_name from group_name ";
$sqlgroup=$sqlgroup."where mem_id=$user_id order by grp_id";
$result= mysql_db_query("magazine",$sqlgroup);
$numrow=@mysql_num_rows($result);
	$num_chk="F";
	$err=4;
$grp_name="";
$fri_name="";
$chk_group="00";
for($i=0;$i<$numrow;$i++)
{
	   $row=mysql_fetch_array($result);		
		$tmpname=$row[1];
		$tmpname=$tmpname.$row[0];

		if($$tmpname==$row[0]) //ชื่อตัวแปร==ค่าที่ส่งมากับตัวแปร
		{	 
			$err=5; //ถ้ากลุ่มที่เลือกไม่มีชื่อคน
		//select หาชื่อเพื่อนในกลุ่มนี้ทั้งหมด
		
			$sql_friend="select friend_id,mem_username from member m1,contact c1 where m1.mem_id=c1.friend_id and c1.mem_id=$user_id and grp_id=$row[0] order by c1.friend_id";
			$resultfriend=mysql_db_query("magazine",$sql_friend);
			$numfriend=@mysql_num_rows($resultfriend);
			if($numfriend<1)
			{ 
				$chk_group=$chk_group."/".$row[0];
				// ถ้าเพือน ในกลุ่มไม่มี
			}else
			{
				$chk_group=$chk_group."/".$row[0];
				$err="";
				$num_chk="T";
			}
		} //if $tmpname
	}//for
		$from_sch="T";
	if ($num_chk=="T")
	{
		session_register(list_group_id);
		$list_group_id=$chk_group;
	} // if $num_chk
mysql_close();
} // if $appoint
} //else
?>