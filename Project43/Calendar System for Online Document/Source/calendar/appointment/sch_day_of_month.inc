<?
$tmp_day=mktime(1,1,0,$schmonth,1,$schyear);
$first_day=(int) date("w",$tmp_day);
$day_of_month=array();
$day_of_month[$first_day]=date("d/m/Y",mktime(1,1,0,$schmonth,1,$schyear));
if($first_day>0)//not start at Sunday
{
	$j=1;//previous day of 1st
	for($i=0;$i<$first_day;$i++)
	{
		$pre_date= date("d/m/Y",mktime(1,1,0,$schmonth,1-$j,$schyear));
		$day_of_month[$first_day-$j]=$pre_date;
		$j=$j+1;
	}
}
//keep next day for first week
$j=$first_day+1;
	$tmp=1;
	for($i=$j;$i<35;$i++)
	{
		$tmp=$tmp+1;
		$next_date= date("d/m/Y ",mktime(1,1,0,$schmonth,$tmp,$schyear));
		$day_of_month[$i]=$next_date;
		$num_week=5; //35วัน
	}
//เช็คว่าเกิน 35 วันในปฏิทิน
		$chk_next_month= (int) date("m ",mktime(1,1,0,$schmonth,$tmp+1,$schyear));
	if($chk_next_month==$schmonth)
	{	
		for($i=35;$i<42;$i++)
		{
			$tmp=$tmp+1;
			$next_date= date("d/m/Y ",mktime(1,1,0,$schmonth,$tmp,$schyear));
			$day_of_month[$i]=$next_date;
			$num_week=6; //42วัน
		}
	}

//for($i=0;$i<35;$i++)
//{
// echo $i," : ",$first_week[$i];
//}
?>

