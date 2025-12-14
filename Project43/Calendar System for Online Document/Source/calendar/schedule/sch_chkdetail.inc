<?
$title=trim($title);
$note=trim($note);
	if($appoint=="นัดหมายเพื่อน" and schedule<>"จัดตาราง")
	{
		session_register("from_sch");
		session_register("app_title");
		session_register("app_note");
		session_register("app_duration");
		session_register("app_remind_before");
		session_register("app_remind_before_hour");
		session_register("app_remind_mail");
		$from_sch="T";
		$app_title=$title;
		$app_note=str_replace('"','&quot;',$note);

		$app_duration=$duration;
		$app_remind_before=$remind_before;
		$app_remind_before_hour=$remind_before_hour;	
		$app_remind_mail=$remind_mail;
$tmp_day=mktime(1,1,0,$month,$date1,$year);
$schday=(int) date("w",$tmp_day);

		header("Location:../appointment/app_add1.php?time=$time&schday=$schday&schdate=$date1&schmonth=$month&schyear=$year");
	}elseif($title=="")
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
}elseif(strlen($note)>200)
{
		$num_chk="F";
		$err=4;
}else
{
	if($schedule=="จัดตาราง" || ($appoint=="" and $schedule==""))
	{
$num_chk="T";
$host="localhost";

$usersql="magazine";

$password="magazine";

$table="schedule";

$db="magazine";

$link=mysql_connect($host,$usersql,$password) or

die("ไม่สามารถติดต่อฐานข้อมูลได้");

mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 
//	echo "year=",$year,"  month=",$month," date =",$bddate;
if($remind_mail=="yes")
{ $remind_mail2="Y";
}else
{ $remind_mail2="N";
}	
$schdate2=$year."-".$month."-".$date1;
$schtime2=$time.":00:00";
	 $sqlinsert="insert into schedule(mem_id,sch_date,sch_time, sch_title,sch_note,sch_duration,sch_remind_before,sch_remind_before_hour,sch_remind_mail,sch_sendmail)
	 values('$user_id','$schdate2','$schtime2','$title','$note','$duration','$remind_before','$remind_before_hour','$remind_mail2','N')";


   mysql_db_query("magazine",$sqlinsert);
mysql_close();

	} //if $schedule
}

?>