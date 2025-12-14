<?
function remindapp_mess($user_id)
{
$host="localhost";

$usersql="magazine";

$password="magazine";

$table="schedule";

$db="magazine";

$link=mysql_connect($host,$usersql,$password) or

die("ไม่สามารถติดต่อฐานข้อมูลได้");

mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 
//$datetoday=date("Y-m-d");
//$tmp_date=date("d");
//$tmp_month=date("m");
//$tmp_year=date("Y");
//$tmp_day=mktime(1,1,0,$tmp_month,$tmp_date,$tmp_year-1);
//$tmpdate2= date("Y-m-d",$tmp_day);

$sql_app="select a1.app_id,app_time,app_date,app_title,mem_id from appointment a1,appoint_receiver a2  where a1.app_id=a2.app_id and friend_id = $user_id and apr_status='NE' order by app_date,app_time";
$result=mysql_db_query("magazine",$sql_app);
$numrow=@mysql_num_rows($result);
echo "<font color=#663300><b>การนัดหมายที่เข้ามาใหม่: </b></font><br>";
if ($numrow<1)
{ echo "<font color=#FF9900 size=1>--ไม่มี--</font>";
}
for($i=0;$i<$numrow;$i++)
{

		$row=mysql_fetch_array($result);
		$app_id=$row[0];

		$jobtime= (int) substr($row[1],0,2);
		$jobtime2=$jobtime."น";

		$job_date=(int) substr($row[2],8,2);
		$job_month=(int) substr($row[2],5,2);
		$job_year= substr($row[2],0,4);
		$job_year2=substr($job_year,2,2);
		 $jobdate2=$job_date." ".$thaimonth_short[$job_month-1];
		 $job_day= date("w",mktime(1,1,0,$job_month,$job_date,$job_year));
		 $sender_id=$row[4];
		$sql_sender="select mem_username,mem_fname from member where mem_id=$sender_id";
		$resultsend=mysql_db_query("magazine",$sql_sender);
		$rowsend=mysql_fetch_array($resultsend);
		$sender=$rowsend[0]; //."(".$rowsend[1].")"
		if (strlen($row[3])>15)
		{
			$remind_title=substr($row[3],0,15)."..";
		}else
		{
			$remind_title=$row[3];
		}	
			echo "<font color=#FF9900>&nbsp;",$jobtime2," ",$jobdate2,"</font>";
			echo "<a href = ../remind/app_readmess.php?time=$jobtime&appday=$job_day&appdate=$job_date&appmonth=$job_month&appyear=$job_year&app_id=$app_id>";
			echo "<font color=#0000FF size=1 >จาก: ",$sender," : </font><font color=#0000FF size=1>",$remind_title,"</font></a><br>";

}
mysql_close();
return 1;
} //function 
remindapp_mess($user_id);
?>