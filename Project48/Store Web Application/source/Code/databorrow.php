<html>
<head>
<title>DataBorrow</title>
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
				if($month=="3"){
					$month="03";
				}
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
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='dataaccessory.php'>Accessory</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datastudent.php'>นักศึกษา</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datateacher.php'> อาจารย์</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datastaff.php' > เจ้าหน้าที่</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datacompany.php'>บริษัท</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='databorrow.php' >การยืม</a></div></td>
			  </tr>
			</table>";

//find borrow
echo"
<form name='Databorrow' method='post' action='databorrow.php' >
<div align='center'> <font color=#996666>:: ค้นหาข้อมูลการยืม :: </font> </div>  
<table   height='30' border='1' align='center' bordercolor='#3399FF'>
<tr> 
<td bgcolor=#CCFFCC> <font color=#663399><b>&nbsp;  รหัส &nbsp; </b></font></td>
<td>&nbsp; <input name='ID' type='text' maxlength='50'>
<input name='Submit' type='submit' value=' ตกลง '> &nbsp;
 <input name='Reset' type='reset' value=' ยกเลิก '></td>
</tr>
</table>
</form>";
$FindBorrow = $HTTP_POST_VARS['ID'];
//find borrow

	echo"<strong><font size=3 color=#996600> <b>ข้อมูลการยืม</b></font></strong> ";
	echo"<form name='Databorrow' method='Post' action='databorrow.php'>
	<select name='List'>
	<option value='blank' > --เลือกรายการ-- </option>
	<option value='borrow' > การยืมปัจจุบัน </option>
	<option value='pastborrow' > การยืมที่ผ่านมา</option>
	<option value='stborrow' > สถิติการยืม</option>
	<td> &nbsp; <input type='submit' name='btOK' value='OK' ></td>
	</form>";
$mem = $HTTP_POST_VARS['List'];

if($FindBorrow!="")
{
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sqlfind="SELECT * FROM hisborrow where obj_Name like '%$FindBorrow%' or obj_ID  like '%$FindBorrow%' or  user_ID like '%$FindBorrow%' or  user_Name like '%$FindBorrow%'";
	$resultfind=mysql_query($sqlfind);
	$numberfind=mysql_num_rows($resultfind);

	if ($numberfind != 0 ) 
	{ 
		echo " <TABLE  border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>รหัสผู้ยืม</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ชื่อผู้ยืม</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>สถานะ</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>วันที่ทำการยืม</b></font></TD>
			</TR> ";
		while($recordfind = mysql_fetch_row($resultfind))
		{
			$temp=$recordfind[5];	
			list($y,$m,$d)=split("-",$temp);
			$borrowday=$y.$m.$d;
		    $borrowthaiday=datethai($borrowday);
			echo "
			<TR>
			<TD  bgcolor=#CCFFCC><font color= blue>$recordfind[0] </font></TD>
			<TD bgcolor=#FFCC99>$recordfind[1]</TD>
			<TD bgcolor=#FFCC99>$recordfind[2] </TD>
			<TD bgcolor=#FFCC99>$recordfind[3] </TD>
			<TD bgcolor=#FFCC99><font color=#336699>$recordfind[4] </font></TD>
			<TD bgcolor=#FFCC99>$borrowthaiday </TD>";
		}
		echo"	</TR>  ";
	}else{
		echo "<font color=red>	 ไม่พบข้อมูล.</font>";
	}
		echo "</TABLE>  ";
}

if ( $mem == 'borrow' )
{	
	echo"<br><strong><font size=2 color=#996600> <b>ข้อมูลการยืมปัจจุบัน</b></font></strong> ";
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="SELECT a.HW_ID,a.HW_Name,b.User_ID,b.Name,b.Sname,c.Borrow_Day,b.Level,a.Borrow_Day FROM hardware a, userprofile b, borrow c 
	WHERE a.HW_ID =C.Borrow_ID and b.User_ID = c.User_ID";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
	echo " <TABLE  border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>รหัสผู้ยืม</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ชื่อผู้ยืม</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>สถานะ</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>&nbsp;วันที่ทำการยืม</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>&nbsp;วันที่ทำการคืน</b></font></TD>
			</TR> ";
			
	if ( $number != 0 ) 
	{ 
		while ( $record = mysql_fetch_row($result))
		{
			$temp=$record[5];	
			list($y,$m,$d)=split("-",$temp);
			$borrowday=$y.$m.$d;
		    $borrowthaiday=datethai($borrowday);
			$returnday=$d+$record[7];
			$reday=checkdd($returnday,$m,$y);
			$returnthaiday=datethai($reday);

			echo "
			<TR>
			<TD  bgcolor=#CCFFCC><font color= blue>$record[0] </font></TD>
			<TD bgcolor=#FFCC99>$record[1]</TD>
			<TD bgcolor=#FFCC99>$record[2] </TD>
			<TD bgcolor=#FFCC99>$record[3] $record[4]</TD>
			<TD bgcolor=#FFCC99><font color=#336699>$record[6] </font></TD>
			<TD bgcolor=#FFCC99>$borrowthaiday </TD>
			<TD bgcolor=#FFCC99>$returnthaiday </TD>";
			}
		echo"	</TR>  ";
	}else{
		echo "";
	}
		echo "</TABLE>  ";
}else if($mem == 'pastborrow')
{
	echo"<br><strong><font size=2 color=#996600> <b>ข้อมูลการยืมทั้งหมด</b></font></strong> ";
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="SELECT * FROM hisborrow order by obj_ID"; 
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
		echo " <TABLE  border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>รหัสผู้ยืม</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ชื่อผู้ยืม</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>สถานะ</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>วันที่ทำการยืม</b></font></TD>
			</TR> ";
	if ( $number != 0 ) 
	{ 
		while ( $record = mysql_fetch_row($result))
		{
			$temp=$record[5];	
			list($y,$m,$d)=split("-",$temp);
			$borrowday=$y.$m.$d;
		    $borrowthaiday=datethai($borrowday);
			echo "
			<TR>
			<TD  bgcolor=#CCFFCC><font color= blue>$record[0] </font></TD>
			<TD bgcolor=#FFCC99>$record[1]</TD>
			<TD bgcolor=#FFCC99>$record[2] </TD>
			<TD bgcolor=#FFCC99>$record[3] </TD>
			<TD bgcolor=#FFCC99><font color=#336699>$record[4] </font></TD>
			<TD bgcolor=#FFCC99> $borrowthaiday</TD>";
		}
		echo"	</TR>  ";
	}else{
		echo "";
	}
		echo "</TABLE>  ";
}else if($mem == 'stborrow')
{
	echo"<br><strong><font size=2 color=#996600> <b>สถิติการยืม</b></font></strong> ";
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="SELECT *,count(obj_ID) FROM hisborrow group by obj_ID"; 
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
		echo " <TABLE  border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>จำนวนครั้งที่ถูกยืม</b></font></TD>
			</TR> ";
	if ( $number != 0 ) 
	{ 
		while ( $record = mysql_fetch_row($result))
		{
			echo "
			<TR>
			<TD  bgcolor=#CCFFCC><font color= blue>$record[0] </font></TD>
			<TD bgcolor=#FFCC99>$record[1]</TD>
			<TD bgcolor=#FFCC99><div align='center'>$record[6] ครั้ง </div></TD>";
		}
		echo"	</TR>  ";
	}else{
		echo "";
	}
		echo "</TABLE>  ";
}
?>
</body>
</html>