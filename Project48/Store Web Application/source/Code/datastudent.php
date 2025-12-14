<html>
<head>
<title>DataStudent</title>
</head>

<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'>
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

echo"<div align='center'><strong><font size=5 color=#9933FF> <b><p>ข้อมูล</p></b></font></strong> </div>";
echo" <table width='100%' border='2' bordercolor='#3366FF'>
			  <tr>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datahardware.php' >Hardware</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='dataaccessory.php'> Accessory</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datastudent.php'>นักศึกษา</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datateacher.php' > อาจารย์</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datastaff.php' > เจ้าหน้าที่</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datacompany.php'>บริษัท</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='databorrow.php' >การยืม</a></div></td>
			  </tr>
			</table>";

//edit_student
echo"
<form name='EditStudent' method='post' action='edit_student.php'>
<div align='center'> <font color=#996666>:: แก้ไขข้อมูลนักศึกษา  :: </font> </div>  
<table   height='30' border='1' align='center' bordercolor='#3399FF'>
<tr> 
<td bgcolor=#CCFFCC> <font color=#663399><b>&nbsp;  รหัส &nbsp; </b></font></td>
<td>&nbsp; <input name='ID' type='text' maxlength='50'>
<input name='Submit' type='submit' value=' ตกลง '> &nbsp;
 <input name='Reset' type='reset' value=' ยกเลิก '></td>
</tr>
</table>
</form>";
//edit_student
	mysql_query("SET NAMES tis620"); 
	mysql_select_db("store");
	$sql="SELECT * FROM userprofile where Level ='student' order by User_ID ";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
		echo"<br><strong><font size=3 color=#996600> <b>ข้อมูลนักศึกษา</b></font></strong> ";
		echo "<TABLE  border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสนักศึกษา</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่อ-นามสกุล</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ที่อยู่</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>เบอร์โทร</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>E-Mail</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>วันลงทะเบียน</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ห้อง</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>สถานะ</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>Black List</b></font></TD>
		</TR> ";
	if ( $number != 0 ) 
	{ 
		while ( $record = mysql_fetch_row($result))
		{
			$temp=$record[10];	
			list($y,$m,$d)=split("-",$temp);
			$buyday=$y.$m.$d;
		    $thaiday=datethai($buyday);
			echo "
			<TR>
			<TD  bgcolor=#CCFFCC><font color= blue>$record[0]</font></TD>
			<TD bgcolor=#FFCC99>$record[1] $record[2]</TD>
			<TD bgcolor=#FFCC99>$record[3]</TD>
			<TD bgcolor=#FFCC99>$record[4]</TD>
			<TD bgcolor=#FFCC99>$record[5] </TD>
			<TD bgcolor=#FFCC99>$thaiday</TD>
			<TD bgcolor=#FFCC99>$record[11]</TD>
			<TD bgcolor=#FFCC99><font color= red>$record[7]</font> </TD>
			<TD bgcolor=#FFCC99><font color= red>&nbsp;&nbsp;$record[12]</font> </TD>
		</TR>  ";
		}
	}else{
		echo "";
	}
		echo "</TABLE>  ";
?>
</body>
</html>