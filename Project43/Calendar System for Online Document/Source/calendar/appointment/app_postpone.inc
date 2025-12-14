<?
$host="localhost";

$usersql="magazine";

$password="magazine";

$table="schedule";

$db="magazine";

$link=mysql_connect($host,$usersql,$password) or

die("ไม่สามารถติดต่อฐานข้อมูลได้");

mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 
$datetoday=date("Y-m-d");
$tmp_date=date("d");
$tmp_month=date("m");
$tmp_year=date("Y");
//$tmp_day=mktime(1,1,0,$tmp_month,$tmp_date,$tmp_year-1);
//$tmpdate2= date("Y-m-d",$tmp_day);

$sql_app2="select a1.app_id,mem_id,app_time,app_date,app_title from appointment a1,appoint_receiver a2 where a1.app_id=a2.app_id and friend_id=$user_id and apr_status='PS' and app_date>='$datetoday' order by app_date,app_time";
$result=mysql_db_query("magazine",$sql_app2);
$numrow=@mysql_num_rows($result);
for($i=0;$i<$numrow;$i++)
{

		$row=mysql_fetch_array($result);
		$app_id=$row[0];
		$sender_id=$row[1];
		$sql_sendername="select mem_username,mem_fname from member where mem_id=$sender_id";
		$resultsender=mysql_db_query("magazine",$sql_sendername);
		$rowsender=mysql_fetch_array($resultsender);
		$sender=$rowsender[0]."(".$rowsender[1].")";
		$jobtime= (int) substr($row[2],0,2);
		$jobtime2=$jobtime.":00";

		$job_date=(int) substr($row[3],8,2);
		$job_month=(int) substr($row[3],5,2);
		$job_year= substr($row[3],0,4);
		 $job_day= date("w",mktime(1,1,0,$job_month,$job_date,$job_year));
		$job_year2=substr($job_year,2,2);
		 $jobdate2=$job_date."/".$job_month."/".$job_year2;
		if($row[3]==$datetoday)
		{ echo "<font color=#FF0000> !-warning-!</font>";
		}
		echo "<font color=#FF9900>&nbsp;",$jobtime2," ",$jobdate2,"</font>";
		echo "<a href = appointment/app_readmess.php?time=$jobtime&appday=$job_day&appdate=$job_date&appmonth=$job_month&appyear=$job_year&app_id=$app_id>";
		echo "<font color=#0000FF>จาก: ",$sender,":",$row[4],"</a><br>";

}
mysql_close();
?>