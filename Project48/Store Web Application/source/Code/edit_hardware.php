<HTML>
<HEAD>
<TITLE> Edit Hardware</TITLE>
</HEAD>
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

	$ID = $HTTP_POST_VARS["ID"];
	mysql_query("SET NAMES tis620"); 
	mysql_select_db("store");
	$sql="SELECT * FROM hardware WHERE HW_ID = '$ID'";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
	$record = mysql_fetch_row($result);

if($number!=0){
echo "<form name='Edit_Hardware' method='post' action='edit_hardware1.php'>
<div align='center'>  <h2><font color=#993366>:: แก้ไขข้อมูลเครื่องมือ :: </font> </h2></div>  
<br>
<table width='50%' height='30' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='#3399FF'>

<tr> 
<td bgcolor=#CCFFCC> &nbsp; รหัสเครื่องมือ </td>
<td> <input name='ID_hw' type='text' maxlength='20' value='$record[0]'></td>
</tr>

<tr>
<td  bgcolor=#FFCCCC>&nbsp; ชื่อเครื่องมือ </td>
<td> <input name='Name_hw' type='text' maxlength='30' value='$record[1]'></td>
</tr>

<tr>
<td bgcolor=#CCFFCC>&nbsp; วันที่ซื้อเข้า </td>
<td> <input name='SaleIN_hw' type='text' maxlength='30' value='$record[2]'> 
&nbsp;&nbsp; ปี-เดือน-วัน</td>
</tr>

<tr>
<td  bgcolor=#FFCCCC> &nbsp; ราคา </td>
<td>   <input name='Price_hw' type='text' maxlength='30' value='$record[3]'></td>
</tr>

<tr>
<td bgcolor=#CCFFCC> &nbsp; เลขที่บิล </td>
<td><input name='BillID_hw' type='text' maxlength='30' value='$record[4]'> </td> 
</tr>

<tr> 
<td  bgcolor=#FFCCCC> &nbsp; วันที่สามารถยืมได้</td>
<td> <input name='BorrowAbleDate_hw' type='text' maxlength='30' value='$record[5]'></td>
</tr>

<tr> 
<td bgcolor=#CCFFCC> &nbsp; สถานะ</td>
<td> <input name='status_hw' type='text' maxlength='30' value='$record[6]'></td>
</tr>

<tr>
  <td> </td>

  <td>
    <div align='center'>
      <input name='Submit' type='submit' value=' ตกลง '> &nbsp;&nbsp;
      <input name='Reset' type='reset' value=' ยกเลิก '>
  </div></td>
</tr>
</table>
</form>";
}else{
echo"<div align='center'><strong><font size=5 color=#9933FF> <b><p>ข้อมูล</p></b></font></strong> </div>";
echo" <table width='100%' border='2' bordercolor='#3366FF'>
			  <tr>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datahardware.php' >Hardware</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='dataaccessory.php'> Accessory</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datastudent.php'>นักศึกษา</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datateacher.php'> อาจารย์</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datastaff.php' > เจ้าหน้าที่</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datacompany.php'>บริษัท</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='databorrow.php' >การยืม</a></div></td>
			  </tr>
			</table>";

//edit hardware
echo"
<form name='EditHardware' method='post' action='edit_hardware.php' >
<div align='center'> <font color=#996666>:: แก้ไขข้อมูลเครื่องมือ :: </font> </div>  
<table   height='30' border='1' align='center' bordercolor='#3399FF'>
<tr> 
<td bgcolor=#CCFFCC> <font color=#663399><b>&nbsp;  รหัส &nbsp; </b></font></td>
<td>&nbsp; <input name='ID' type='text' maxlength='50'>
<input name='Submit' type='submit' value=' ตกลง '> &nbsp;
 <input name='Reset' type='reset' value=' ยกเลิก '></td>
</tr>
</table>
</form>";
//edit hardware
	mysql_query("SET NAMES tis620"); 
	mysql_select_db("store");
	$sql="SELECT * FROM hardware order by HW_ID ";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
	echo"<br><strong><font size=3 color=#996600> <b>ข้อมูลเครื่องมือ</b></font></strong> ";
	echo " <TABLE border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>วันที่ซื้อเข้ามา</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ราคา(บาท)</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>เลขที่บิล</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>จำนวนวันที่ยืมได้</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>สถานะอุปกรณ์</b></font></TD>
		</TR> ";
	if ( $number != 0 ) 
	{ 
		while ( $record = mysql_fetch_row($result))
		{
			$temp=$record[2];	
			list($y,$m,$d)=split("-",$temp);
			$buyday=$y.$m.$d;
		    $buythaiday=datethai($buyday);
			echo "
			<TR>
			<TD  bgcolor=#CCFFCC><font color= blue>$record[0] </font></TD>
			<TD bgcolor=#FFCC99>$record[1]</TD>
			<TD bgcolor=#FFCC99>$buythaiday </TD>
			<TD bgcolor=#FFCC99>&nbsp;&nbsp;$record[3]&nbsp;บาท</TD>
			<TD bgcolor=#FFCC99>$record[4]</TD>
			<TD bgcolor=#FFCC99>&nbsp;&nbsp;$record[5] &nbsp; วัน </TD>";
			if($record[6] == 'no'){
			   echo"<TD bgcolor=#FFCC99><font color=red><b>&nbsp;&nbsp;ฺBorrow</b></font></TD>";
			}else if($record[6] == 'yes'){
				echo"<TD bgcolor=#FFCC99>&nbsp;&nbsp;IN Stock</TD>";
			}else{
				echo"<TD bgcolor=#FFCC99><font color=blue><b>&nbsp;&nbsp;$record[6]</b></font></TD>";
			}
		echo"	</TR>  ";
		}
	}else{
		echo "";
	}
		echo "</TABLE>  ";
}
?>
</body>
</html>