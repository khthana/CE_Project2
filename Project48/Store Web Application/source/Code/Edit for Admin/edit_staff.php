<HTML>
<HEAD>
<TITLE> Edit Staff </TITLE>
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
	$sql="SELECT * FROM userprofile WHERE User_ID = '$ID'";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
	$record = mysql_fetch_row($result);

if($number!=0){
echo "<form name='Edit_staff' method='post' action='edit_staff1.php'>
<div align='center'>  <h2><font color=#993366>:: แก้ไขข้อมูลเจ้าหน้าที่ :: </font> </h2></div>  
<br>
<table width='50%' height='30' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='#3399FF'>

<tr> 
<td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; รหัส*</b></font> </td>
<td> <input name='ID' type='text' maxlength='10' value='$record[0]'></td>
</tr>

<tr>
<td bgcolor=#FFCCCC><font color=#6633FF><b> &nbsp; ชื่อ*</b></font> </td>
<td> <input name='Name' type='text' maxlength='30' value='$record[1]'></td>
</tr>

<tr>
<td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; นามสกุล*</b></font> </td>
<td> <input name='Sname' type='text' maxlength='30'  value='$record[2]'></td>
</tr>

<tr>
<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; ที่อยู่</b></font> </td>
<td>   <textarea name='Address' cols='30' rows='4'  >$record[3]</textarea></td>
</tr>

<tr>
<td bgcolor=#CCFFCC><font color=#6633FF><b> &nbsp; เบอร์โทรศัพท์</b></font> </td>
<td><input name='Tel' type='text'  value='$record[4]'> </td> 
</tr>

<tr> 
<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; E-mail </b></font></td>
<td> <input name='Email' type='text' maxlength='30'  value='$record[5]'></td>
</tr>

<tr> 
<td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; Status </b></font></td>
<td> <input name='Status' type='text' maxlength='10' value='$record[7]'></td>
</tr>

<tr> 
<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; Username* </b></font></td>
<td> <input name='User' type='text' maxlength='15'  value='$record[8]'> </td>
</tr>

<tr>
<td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; Password* </b></font></td>
<td> <input name='Password' type='password' maxlength='10'  value='$record[9]'></td>
</tr>
<tr>
  <td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; Re-Password*</b></font></td>
  <td> <input name='Repwd' type='password' maxlength='10'  value='$record[9]'></td>
</tr>

<tr>
<td bgcolor=#CCFFCC><font color=#6633FF><b> &nbsp; ระดับ* </b></font></td>
<td> <select name='level_regis'>
 <option value='staff'> เจ้าหน้าที่ </option> </td>
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
</form> ";
}else{
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
//editdata
echo"
<form name='Editstaff' method='post' action='edit_staff.php'>
<div align='center'> <font color=#996666>:: แก้ไขข้อมูลเจ้าหน้าที่   :: </font> </div>  
<table   height='30' border='1' align='center' bordercolor='#3399FF'>
<tr> 
<td bgcolor=#CCFFCC> <font color=#663399><b>&nbsp;  รหัส &nbsp; </b></font></td>
<td>&nbsp; <input name='ID' type='text' maxlength='50'>
<input name='Submit' type='submit' value=' ตกลง '> &nbsp;
 <input name='Reset' type='reset' value=' ยกเลิก '></td>
</tr>
</table>
</form>";
//editdata
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="SELECT * FROM userprofile where Level ='staff' order by User_ID ";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
		echo"<br><strong><font size=3 color=#996600> <b>ข้อมูลเจ้าหน้าที่</b></font></strong> ";
		echo " <TABLE  border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัส</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่อ-นามสกุล</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ที่อยู่</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>เบอร์โทร</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>E-Mail</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>วันลงทะเบียน</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>สถานะ</b></font></TD>
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
			<TD  bgcolor=#CCFFCC><font color= blue>$record[0] </font></TD>
			<TD bgcolor=#FFCC99>$record[1] $record[2]</TD>
			<TD bgcolor=#FFCC99>$record[3]</TD>
			<TD bgcolor=#FFCC99>$record[4]</TD>
			<TD bgcolor=#FFCC99>$record[5] </TD>
			<TD bgcolor=#FFCC99>$thaiday</TD>
			<TD bgcolor=#FFCC99><font color= red>$record[7]</font> </TD>
		</TR>  ";
		}
	}else{
		echo "";
	}
		echo "</TABLE>  ";
}
?>
</body>
</html>