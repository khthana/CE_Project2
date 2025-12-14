<?
function app_tosender($user_id)
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

$sql_app2="select a1.app_id,friend_id,app_time,app_date,app_title,apr_status from appointment a1,appoint_receiver a2 where a1.app_id=a2.app_id and mem_id=$user_id and (apr_status='AC' or apr_status='UN') order by app_date,app_time ";
$result=mysql_db_query("magazine",$sql_app2);
$numrow=@mysql_num_rows($result);
echo "<font color=#663300 size=1 ><b>การตอบรับใหม่:</b></font><br>";
if ($numrow<1)
{ echo "<font color=#FF9900 size=1>--ไม่มี--</font>";
}
for($i=0;$i<$numrow;$i++)
{

		$row=mysql_fetch_array($result);
		$app_id=$row[0];
		$friend_id=$row[1];
		$sql_friendname="select mem_username,mem_fname from member where mem_id=$friend_id";
		$resultfriend=mysql_db_query("magazine",$sql_friendname);
		$rowfriend=mysql_fetch_array($resultfriend);
		$friend=$rowfriend[0]; //."(".$rowfriend[1].")";
		$jobtime= (int) substr($row[2],0,2);
		$jobtime2=$jobtime."น";

		$job_date=(int) substr($row[3],8,2);
		$job_month=(int) substr($row[3],5,2);
		$job_year= substr($row[3],0,4);
		$job_year2=substr($job_year,2,2);
		 $jobdate2=$job_date.$thaimonth_short[$job_month-1];
		 $apr_status=$row[5];
		 if (strlen($row[4])>12)
		 { $remind_title=substr($row[4],0,12);
		  }else
		{	$remind_title=$row[4];
		}
			echo "<a href = ../remind/app_readmess_sender.php?app_id=$app_id&friend_id=$friend_id>";
			echo "<font color=#0000FF size=1 >",$friend,": </font><font color=#0000FF size=1 >",$remind_title," </font>";
			if($apr_status=="AC")
			{
				echo " <font color=#FF0000 size=1 > ยอมรับ </font>";
			}elseif($apr_status=="UN")
			{ 
				echo "<font color=#FF0000 size=1 > ปฎิเสธ </font>";
			}
			echo "<font color=#FF9900>&nbsp;",$jobtime2," ",$jobdate2,"</font></a><br>";

}
mysql_close();
} //function
app_tosender($user_id);
?>