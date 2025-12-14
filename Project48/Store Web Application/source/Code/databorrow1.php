<html>
<head>
<title>DataBorrow</title>
</head>

<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'>
<?php
echo"<div align='center'><strong><font size=5 color=#9933FF> <b><p>ข้อมูล</p></b></font></strong> </div>";
echo" <table width='100%' border='2' bordercolor='#3366FF'>
			  <tr>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datahardware1.php' >Hardware</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='dataaccessory1.php'>Accessory</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datastudent1.php'>นักศึกษา</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datateacher1.php'> อาจารย์</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datastaff1.php' > เจ้าหน้าที่</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datacompany1.php'>บริษัท</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='databorrow1.php' >การยืม</a></div></td>
			  </tr>
			</table>";


	echo"<br><strong><font size=3 color=#996600> <b>ข้อมูลการยืม</b></font></strong> ";

	echo"<form name='Databorrow' method='Post' action='databorrow1.php'>
	<select name='List'>
	<option value='blank' > --เลือกรายการ-- </option>
	<option value='borrow' > การยืมปัจจุบัน </option>
	<option value='pastborrow' > การยืมทั้งหมด</option>
	<td> &nbsp; <input type='submit' name='btOK' value='OK' ></td>
	</form>";
$mem = $HTTP_POST_VARS['List'];
if ( $mem == 'borrow' )
{	
	echo"<br><strong><font size=2 color=#996600> <b>ข้อมูลการยืมปัจจุบัน</b></font></strong> ";
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="SELECT a.HW_ID,a.HW_Name,b.User_ID,b.Name,b.Sname,c.Borrow_Day,b.Level FROM hardware a, userprofile b, borrow c 
	WHERE a.HW_ID =C.Borrow_ID and b.User_ID = c.User_ID";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
	echo " <TABLE width='700' border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>รหัสผู้ยืม</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ชื่อผู้ยืม</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>สถานะ</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>วันที่ทำการยืม (ปี-เดือน-วัน)</b></font></TD>
			</TR> ";
			
	if ( $number != 0 ) 
	{ 
		while ( $record = mysql_fetch_row($result))
		{
			echo "
			<TR>
			<TD  bgcolor=#CCFFCC><font color= blue>$record[0] </font></TD>
			<TD bgcolor=#FFCC99>$record[1]</TD>
			<TD bgcolor=#FFCC99>$record[2] </TD>";
			if($record[6]=="teacher"){
			echo"
			<TD bgcolor=#FFCC99>$record[3] $record[4]</TD>
			<TD bgcolor=#FFCC99><font color=#FF6600>$record[6] </font></TD>";
			}else{
			echo"
			<TD bgcolor=#FFCC99>$record[3] $record[4]</TD>
			<TD bgcolor=#FFCC99><font color=#336699>$record[6] </font></TD>";
			}
			echo"
			<TD bgcolor=#FFCC99>$record[5] </TD>";
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
		echo " <TABLE width='700' border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>รหัสผู้ยืม</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ชื่อผู้ยืม</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>สถานะ</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>วันที่ทำการยืม (ปี-เดือน-วัน)</b></font></TD>
			</TR> ";
	if ( $number != 0 ) 
	{ 
		while ( $record = mysql_fetch_row($result))
		{
			echo "
			<TR>
			<TD  bgcolor=#CCFFCC><font color= blue>$record[0] </font></TD>
			<TD bgcolor=#FFCC99>$record[1]</TD>
			<TD bgcolor=#FFCC99>$record[2] </TD>";
			if($record[4]=="teacher"){
			echo"
			<TD bgcolor=#FFCC99>$record[3] </TD>
			<TD bgcolor=#FFCC99><font color=#FF6600>$record[4] </font></TD>";
			}else{
			echo"
			<TD bgcolor=#FFCC99>$record[3] </TD>
			<TD bgcolor=#FFCC99><font color=#336699>$record[4] </font></TD>";
			}
			echo"
			<TD bgcolor=#FFCC99>$record[5] </TD>";
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