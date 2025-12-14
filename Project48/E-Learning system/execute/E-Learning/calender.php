<?php $year = date('Y');
$month = date('m');
$mkdate = mktime(0,0,0,$month,1,$year);
$full_month=date('F',$mkdate);
$weekday =date('w',$mkdate);
$last_days=date('t',$mkdate);
$day=1;?>
<table width="168" border="1"  cellpadding="0" cellspacing="0" bordercolor="#6699FF">
  <tr bgcolor="#66CCFF">
    <td colspan="7"><div align="center"><b><font color="#FF3399"><?php echo"$full_month   $year";?></font></b> </div></td>
  </tr>
  <tr bgcolor="#66CCFF">
    <td width="24" class="style1" ><div align="center">Sun</div></td>
    <td width="24" class="style1"><div align="center">Mon</div></td>
    <td width="24" class="style1" ><div align="center">Tue</div></td>
    <td width="24" class="style1" ><div align="center">Wed</div></td>
    <td width="24" class="style1" ><div align="center">Thu</div></td>
    <td width="24" class="style1" ><div align="center">Fri</div></td>
    <td width="24" class="style1" ><div align="center">Sat</div></td>
  </tr>
  <tr>
    <?php $start=1;
while($start<=$weekday){
echo"<td>&nbsp;</td>";
$start++;
}
$weekday++;
while ($day<=$last_days){
			if (date("d")==$day){
			echo "<td bgcolor='#BBBBBB'><div align='center'>$day<div></td>";
			} else{ echo "<td><div align='center'>$day<div></td>";}
			if ( $weekday ==7  and $day<>$last_days){
			echo"</tr><tr>";
			$weekday=0;
			}
			$day++;
			$weekday++;
}
while($weekday<=7){
echo "<td>&nbsp;</td>";
$weekday++;
}
?>
</table>
