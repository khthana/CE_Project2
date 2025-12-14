<?
$title=trim($title);
$note=trim($note);
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
}elseif(strlen($note)>200)
{
		$num_chk="F";
		$err=4;
}else
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
{
		$tmp_remind_mail="Y";
}else
{
		$tmp_remind_mail="N";
}	
$schdate2=$year."-".$month."-".$date1;
$schtime2=$time.":00:00";
	 $sqlupdate="update schedule set sch_date='$schdate2' , sch_title='$title' , sch_note='$note',";
	 $sqlupdate=$sqlupdate."sch_duration='$duration',sch_remind_before='$remind_before',sch_remind_before_hour='$remind_before_hour',sch_remind_mail='$tmp_remind_mail' ";
	 $sqlupdate=$sqlupdate." where sch_id=$sch_id";
   mysql_db_query("magazine",$sqlupdate);
mysql_close();
}

?>