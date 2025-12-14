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

$sql_app2="select a1.app_id,friend_id,app_time,app_date,app_title,apr_status from appointment a1,appoint_receiver a2 where a1.app_id=a2.app_id and mem_id=$user_id and (app_date<'$datetoday' or (app_date='$datetoday' and app_time<'$timenow')) and (apr_status='NE' or apr_status='PS') order by app_date,app_time ";
$result=mysql_db_query("magazine",$sql_app2);
$numrow=@mysql_num_rows($result);
if($numrow>0)
{ echo "<br><b><font size=2 color=#FF9900>จาก Admin : การนัดที่เลยเวลานัด >></font></b><br>";
}
for($i=0;$i<$numrow;$i++)
{
		$row=mysql_fetch_array($result);
		$app_id=$row[0];
		$friend_id=$row[1];
		$sql_friendname="select mem_username,mem_fname from member where mem_id=$friend_id";
		$resultfriend=mysql_db_query("magazine",$sql_friendname);
		$rowfriend=mysql_fetch_array($resultfriend);
		$friend=$rowfriend[0] ;    //."(".$rowfriend[1].")";
		$jobtime= (int) substr($row[2],0,2);
		$jobtime2=$jobtime.":00";

		$job_date=(int) substr($row[3],8,2);
		$job_month=(int) substr($row[3],5,2);
		$job_year= substr($row[3],0,4);
		$job_year2=substr($job_year,2,2);
		 $jobdate2=$job_date."/".$job_month."/".$job_year2;
		 $apr_status=$row[5];
			echo "<font color=#FF9900>&nbsp;",$jobtime2," ",$jobdate2,"</font>";
			echo "<a href = appointment/app_readmess_sender.php?app_id=$app_id&friend_id=$friend_id>";
			echo "<font color=#0000FF size=1 >",$friend,": </font><font color=#0000FF size=1 >",$row[4]," </font>";
			if($apr_status=="PS")
			{
				echo " <font color=#FF0000 size=1 > ขอคิดดูก่อน </font>";
			}elseif($apr_status=="NE")
			{ 
				echo "<font color=#FF0000 size=1 > ยังไม่ดูนัด </font>";
			}
			echo "</a><br>";

}
mysql_close();
?>