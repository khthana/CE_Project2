<?
$tmp_day=mktime(1,1,0,date("m"),1,date("Y"));
$first_day=(int) date("w",$tmp_day);
$first_week=array();
$first_week[$first_day]=1;
if($first_day>0)//not start at Sunday
{
	$j=$first_day-1;//previous day of 1st
	for($i=0;$i<$first_day;$i++)
	{
		$pre_date=(int) date("d",mktime(1,1,0,date("m"),$j,date("Y")));
		$first_week[$j]=$pre_date;
		$j=$j-1;
	}
}
//keep next day for first week
$j=$first_day+1;
if($j<7)
{
	$tmp=1;
	for($i=$j;$i<7;$i++)
	{
		$tmp=$tmp+1;
		$first_week[$i]=$tmp;
	}
}
?>

