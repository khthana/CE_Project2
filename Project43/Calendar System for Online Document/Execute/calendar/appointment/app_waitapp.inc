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
$timenow=date("H:i:s");
//$tmp_date=date("d");
//$tmp_month=date("m");
//$tmp_year=date("Y");
//$tmp_day=mktime(1,1,0,$tmp_month,$tmp_date,$tmp_year-1);
//$tmpdate2= date("Y-m-d",$tmp_day);

$sql_app2="select a1.app_id,app_time,app_date,app_title from appointment a1,appoint_receiver a2 where a1.app_id=a2.app_id and mem_id=$user_id and (app_date>'$datetoday' or (app_date='$datetoday' and app_time>'$timenow')) and (apr_status='NE' or apr_status='PS') group by app_id order by app_date,app_time ";
$result=mysql_db_query("magazine",$sql_app2);
$numrow=@mysql_num_rows($result);
for($i=0;$i<$numrow;$i++)
{
		$row=mysql_fetch_array($result);
		$app_id=$row[0];
		$jobtime= (int) substr($row[1],0,2);
		$jobtime2=$jobtime.":00";

		$job_date=(int) substr($row[2],8,2);
		$job_month=(int) substr($row[2],5,2);
		$job_year= substr($row[2],0,4);
		$job_year2=substr($job_year,2,2);
		 $jobdate2=$job_date."/".$job_month."/".$job_year2;
			echo "<font color=#FF9900>&nbsp;",$jobtime2," ",$jobdate2,"</font>";
			echo "<a href = appointment/app_edit.php?app_id=$app_id&frompage=welcome>";
			echo "<font color=#666666 size=1 >",$row[3]," </font></a><br>";

}
mysql_close();
?>