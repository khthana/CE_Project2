<?php

function next_month($month, $year)
     {
               if ($month%12==0)
               {
               $month=$month-11;
               $year=$year+1;
               }
               else        
               {
               $month=$month+1;
               $year=$year;
               }
     return $month;
     return $year;
     }
function checkdd($day,$month,$year)
	{
		if($month == "4" or $month == "6" or $month == "9" or $month == "11" ){
			if($day >30){
				$day= $day-30;
				$month++;
			}
		}else if($month == "1" or $month == "3" or $month == "5" or $month == "7" or $month == "8" or $month == "10" or $month == "12"){
			if($day>31){
				$day=$day-31;
				$month++;
				if($month=="2"){
					$month="02";
				}else if($month=="4"){
					$month="04";
				}else if($month=="6"){
					$month="06";
				}else if($month=="8"){
					$month="08";
				}else if($month=="9"){
					$month="09";
				}
				if($month=="13"){
				    $month="01";
					$year=$year+1;
               }
			}
		} 
		else{
			if($day>28){
				$day=$day-28; 
				$month++;
			}
		}
		return $year.$month.$day;
	}

function datethai($date)
{
	$day=substr("$date",6,2);
	$month=substr("$date",4,2);
	$month=(int)$month -1;
	$year =substr("$date",0,4);
	$year=$year+543;
	$thaimonth=array("มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฏาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");
	$month=$thaimonth[$month];
	return (int)$day." ". $month." ".$year;
}

echo "
<HTML>
<HEAD>
<TITLE> :: การค้นหา :: </TITLE>
</HEAD>
<body bgcolor='#99FFFF' background='bg_table.jpg' tppabs='bg_table.jpg'>

<form name='ReturnHardware' method='post' action='find_for_admin.php'>
<div align='center'>  <h2><font color=#996666>:: การค้นหา  :: </font> </h2></div>  <br>
<table  height='30' border='1' align='center'  bordercolor='#3399FF'>
<tr> 
<td bgcolor=#CCFFCC> <font color=#663399><b>&nbsp;&nbsp;&nbsp;&nbsp;สิ่งที่ต้องการค้นหา&nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>
<td> <input name='Name' type='text' maxlength='100'></td>
</tr>
<tr>
  <td> </td>
 <td>
    <div align='center'>
      <input name='Submit' type='submit' value=' ตกลง '> &nbsp;
      <input name='Reset' type='reset' value=' ยกเลิก '>
  </div></td>
</tr>
</table>
</form><br>";

$Name = $HTTP_POST_VARS["Name"];
if($Name!=""){
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="SELECT * from hardware where HW_ID like '%$Name%' or HW_Name  like '%$Name%'  order by Bill_ID";
	$result=mysql_query($sql);
	$num=mysql_num_rows($result);

	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql1="SELECT * from accessory where Acces_Name  like '%$Name%' or Acces_ID like '%$Name%' order by Acces_ID";
	$result1=mysql_query($sql1);
	$num1=mysql_num_rows($result1);

	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql2="SELECT * from userprofile where Name  like '%$Name%' or User_ID like '%$Name%' order by User_ID";
	$result2=mysql_query($sql2);
	$num2=mysql_num_rows($result2);

}
if ( $num != 0 ) 
{
echo " <TABLE width='800'  border='1' >
			<TR>
			<TD bgcolor=#CCFFFF><font color=#330066><b>เลขที่บิล</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>	
			<TD bgcolor=#CCFFFF><font color=#330066><b>วันที่ซื้ออุปกรณ์ </b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>ราคาอุปกรณ์</b></font></TD>	
			<TD bgcolor=#CCFFFF><font color=#330066><b>จำนวนวันที่ยืมได้</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>สถานะ</b></font></TD>
			</TR> ";
		while ($record = mysql_fetch_row($result))
		{
			$temp=$record[2];	
			list($y,$m,$d)=split("-",$temp);
			$borrowday=$y.$m.$d;
		    $buythaiday=datethai($borrowday);
			echo" 
			<TR>
			<TD bgcolor=#CCFFCC><font color= blue>$record[4]</font></TD>
			<TD bgcolor=#FFCCCC>$record[0] </TD>
			<TD bgcolor=#FFCCCC>$record[1]</TD>
			<TD bgcolor=#FFCCCC>$buythaiday</TD>
			<TD bgcolor=#FFCCCC>$record[3] &nbsp บาท</TD>
			<TD bgcolor=#FFCCCC>&nbsp&nbsp$record[5]&nbsp วัน</TD>
			<TD bgcolor=#FFCCCC align='center'>$record[6]</TD>
		</TR> ";
		}
}else if( $num1 != 0 ) {
		echo " <TABLE width='800'  border='1' >
			<TR>
			<TD bgcolor=#CCFFFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>	
			<TD bgcolor=#CCFFFF><font color=#330066><b>จำนวนทั้งหมด</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>จำนวนคงเหลือ</b></font></TD>
			</TR> ";
			while ($record1 = mysql_fetch_row($result1))
		{
			echo" 
			<TR>
			<TD bgcolor=#CCFFCC><font color= blue>$record1[0]</font></TD>
			<TD bgcolor=#FFCCCC>$record1[1] </TD>
			<TD bgcolor=#FFCCCC>$record1[2]</TD>
			<TD bgcolor=#FFCCCC>$record1[3]</TD>
		</TR> ";
		}
}else if( $num2 != 0 ){
	echo " <TABLE   border='1' >
			<TR>
			<TD bgcolor=#CCFFFF><font color=#330066><b>รหัส</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>ชื่อ-นามสกุล</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>ที่อยู่</b></font></TD>	
			<TD bgcolor=#CCFFFF><font color=#330066><b>เบอร์โทร</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>E-mail</b></font></TD>	
			<TD bgcolor=#CCFFFF><font color=#330066><b>Level</b></font></TD>	
			<TD bgcolor=#CCFFFF><font color=#330066><b>Reg_date</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>Class</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>Status</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>Black List</b></font></TD>
			</TR> ";
		while ($record2 = mysql_fetch_row($result2))
		{
			echo" 
			<TR>
			<TD bgcolor=#CCFFCC><font color= blue>$record2[0]</font></TD>
			<TD bgcolor=#FFCCCC>$record2[1]  $record2[2]</TD>
			<TD bgcolor=#FFCCCC>$record2[3]</TD>
			<TD bgcolor=#FFCCCC>$record2[4]</TD>
			<TD bgcolor=#FFCCCC>$record2[5]</TD>
			<TD bgcolor=#FFCCCC>$record2[6]</TD>
			<TD bgcolor=#FFCCCC>$record2[10]</TD>
			<TD bgcolor=#FFCCCC>$record2[11]</TD>				
			<TD bgcolor=#FFCCCC><font color =red>$record2[7]</font></TD>
			<TD bgcolor=#FFCCCC><font color =red>&nbsp;&nbsp;&nbsp;$record2[12]</font></TD>
		</TR> ";
		}
}else{
	echo"";
}

echo "</TABLE></BODY></HTML> ";

?>