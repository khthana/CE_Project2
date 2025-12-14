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
$today_time=date("H");
$tmp_date=date("d");
$tmp_month=date("m");
$tmp_year=date("Y");
// ----งานที่จะเตือนได้ต้อง เป็นปัจจุบันหรืออนาคต---
$tmp_day=mktime(1,1,0,$tmp_month,$tmp_date-1,$tmp_year); 
$tmpdate2= date("Y-m-d",$tmp_day);

$sql_sch="select sch_id,sch_date,sch_time,sch_duration,sch_remind_before,sch_remind_before_hour from schedule where mem_id = $user_id and sch_date>='$tmpdate2' order by sch_date,sch_time";
$result=mysql_db_query("magazine",$sql_sch);
$numrow=@mysql_num_rows($result);
		$chk_have_job="F";
for($i=0;$i<$numrow;$i++)
{

		$row=mysql_fetch_array($result);
		$sch_id=$row[0];
		$job_schdate=$row[1];
		$job_date=(int) substr($row[1],8,2);
		$job_month=(int) substr($row[1],5,2);
		$job_year= substr($row[1],0,4);
		$job_year2=substr($job_year,2,2);
		$job_time=(int) substr($row[2],0,2);
		$job_duration=(int) $row[3];
		$job_remind_day=(int) $row[4];
		$job_remind_hour=(int) $row[5];
		
		//หาผลต่างเป็นวันระหว่างวันนัดกับปัจจุบัน
		$diff_date=0;
		$tmp_datechk=$datetoday;
		if($job_schdate<$tmp_datechk) // กรณีวันงานเป็นเมื่อวานแต่ระยะเวลายังอยู่
		{ $diff_date=-1;
		}else
		{
			while($tmp_datechk<$job_schdate)
			{
				$diff_date=$diff_date+1;
				$tmp_datechk=date("Y-m-d",mktime(1,1,0,$tmp_month,$tmp_date+$diff_date,$tmp_year)); 
			} //while
		} //else
		//หาผลต่างของเวลางาน-ปัจจุบัน
		$diff_hour=$job_time-$today_time;

		$diff_job=$diff_hour +($diff_date*24);
		if($diff_job<0) //เวลางานเลยมาแล้ว
		{  //ตรวจสอบว่ายังอยู่ในระยะเวลาที่ทำงานนั้นรึเปล่า
			$diff_job=$diff_job+$job_duration-1; //ต้องลบ 1 เพราะงานเริ่ม 7 โมงถ้าระยะเวลา 10ชม.งานต้องเลิกตอน 16 ไม่ใช่ 17
			if($diff_job>=0)
			{
				$chk_remind="Y";
			}else
			{
				$chk_remind="N";
			}
		}else //งานนั้นยังไม่เลยเวลาก็ตรวจสอบว่าถึงกำหนดการเตือนยัง
		{ 
			$remind_time=$job_remind_day*24+$job_remind_hour;
			if($diff_job>$remind_time) //ยังไม่ถึงเวลาเตือน
			{	$chk_remind="N";
			}else
			{	$chk_remind="Y";
			} 

		} //if $diff_job<0

		if($chk_remind=="Y") //เตือน
		{
			$chk_have_job="T";
			 $jobdate2=$job_date."/".$job_month."/".$job_year2;
			 $sql_job="select sch_title from schedule where mem_id = $user_id and sch_id=$sch_id";
			$resultjob=mysql_db_query("magazine",$sql_job);
	 		$rowjob=mysql_fetch_array($resultjob);
			$jobtime2=$job_time.":00";
			$job_day= date("w",mktime(1,1,0,$job_month,$job_date,$job_year));
			If (strlen($rowjob[1])>20)
			{
				$job_title=substr($rowjob[0],0,20)."..";
			}else
			{
				$job_title=$rowjob[0];
			} //if strlen
			echo "<font color=#669900>&nbsp;",$jobtime2," ",$jobdate2,"</font>";
			echo "<a href = schedule/sch_edit1.php?time=$job_time&schday=$job_day&schdate=$job_date&schmonth=$job_month&schyear=$job_year&sch_id=$sch_id>";
			echo "<font color=#0000FF size=1 > ",$job_title,"</font></a><br>";
		} //if $chk_remind
} // for
if($chk_have_job=="F") //เช็คว่ามีงานโชว์ไหม
{
		echo "<font color=#669900 size=1> -ไม่มีงาน- </font><br>";
}

//----------- เช็คเตือนวันเกิดเพื่อน-------------------
$tmp_date=date("d"); //วันที่ปัจจุบัน
$tmp_month=date("m"); //ปีปัจจุบัน
$sql_bd="select m1.mem_username,m1.mem_fname,m1.mem_birthday from member m1,contact c1 where c1.friend_id=m1.mem_id and c1.mem_id=$user_id order by m1.mem_username";
$resultbd=mysql_db_query("magazine",$sql_bd);
$numrowbd=@mysql_num_rows($resultbd);
$chk_show=1;
for($i=0;$i<$numrowbd;$i++)
{
		$rowbd=mysql_fetch_array($resultbd);
		$bd_date=(int) substr($rowbd[2],8,2);
		$bd_month=(int) substr($rowbd[2],5,2);
		if($bd_date==$tmp_date and $tmp_month==$bd_month)
		{
			if($chk_show=="1") //เช็คว่าโชว์รูปของขวัญครั้งเดียว
			{
			echo "<font color=#CC33FF size=1 >___________________________</font><br>";
			echo "<img src=images/gift.gif width=24 height=24>";
			$chk_show="0";
		   	} else
			{
			 echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			} //if
			$bdtitle="วันนี้ : วันเกิดของ ";
			echo "<a href= http://www.bluemountain.com/>";
			echo "<font color=#9933FF size=1 ><blink> ",$bdtitle,$rowbd[0],"(",$rowbd[1],")","</blink></font>";
			echo "</a><br>";
		} //if bddate
} //for
mysql_close();
?>