<html>
<head>
<title>DataStudent</title>
</head>

<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'>
<?php
echo"<div align='center'><strong><font size=5 color=#9933FF> <b><p>ข้อมูล</p></b></font></strong> </div>";
echo" <table width='100%' border='2' bordercolor='#3366FF'>
			  <tr>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datahardware1.php' >Hardware</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='dataaccessory1.php'> Accessory</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datastudent1.php'>นักศึกษา</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datateacher1.php' > อาจารย์</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datastaff1.php' > เจ้าหน้าที่</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datacompany1.php'>บริษัท</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='databorrow1.php' >การยืม</a></div></td>
			  </tr>
			</table>";
	mysql_query("SET NAMES tis620"); 
	mysql_select_db("store");
	$sql="SELECT * FROM company order by Comp_ID ";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
		echo"<br><br><strong><font size=3 color=#996600> <b>ข้อมูลบริษัทที่ซื้อเครื่องมือและอุปกรณ์</b></font></strong> ";
		echo "<TABLE  border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัส</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่อบริษัท</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ที่อยู่</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>เบอร์โทร</b></font></TD>
		</TR> ";
	if ( $number != 0 ) 
	{ 
		while ( $record = mysql_fetch_row($result))
		{
			echo "
			<TR>
			<TD  bgcolor=#CCFFCC><font color= blue>$record[0]</font> </TD>
			<TD bgcolor=#FFCC99>$record[1] </TD>
			<TD bgcolor=#FFCC99>$record[2]</TD>
			<TD bgcolor=#FFCC99>$record[3]</TD>
		</TR>  ";
		}
	}else{
		echo "";
	}
		echo "</TABLE>  ";
?>
</body>
</html>