<html>
<head>
<title>DataAccessory</title>
</head>

<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'>
<?php
echo"<div align='center'><strong><font size=5 color=#9933FF> <b><p>ข้อมูล</p></b></font></strong> </div>";
echo" <table width='100%' border='2' bordercolor='#3366FF'>
			  <tr>
				<td bgcolor=#D9FFEC  width='95.5'><div align='center'><a href='datahardware.php' >Hardware</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='dataaccessory.php' > Accessory</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datastudent.php'>นักศึกษา</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datateacher.php'> อาจารย์</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='datastaff.php' > เจ้าหน้าที่</a> </div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'> <a href='datacompany.php'>บริษัท</a></div></td>
				<td bgcolor=#D9FFEC width='95.5'><div align='center'><a href='databorrow.php' >การยืม</a></div></td>
			  </tr>
			</table>";

//edit accessory
echo"
<form name='EditAccessory' method='post' action='edit_accessory.php' >
<div align='center'> <font color=#996666>:: แก้ไขข้อมูลอุปกรณ์  :: </font> </div>  
<table   height='30' border='1' align='center' bordercolor='#3399FF'>
<tr> 
<td bgcolor=#CCFFCC> <font color=#663399><b>&nbsp;  รหัส &nbsp; </b></font></td>
<td>&nbsp; <input name='ID' type='text' maxlength='50'>
<input name='Submit' type='submit' value=' ตกลง '> &nbsp;
 <input name='Reset' type='reset' value=' ยกเลิก '></td>
</tr>
</table>
</form>";
//edit accessory
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="SELECT * FROM accessory order by Acces_ID";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
		echo"<br><strong><font size=3 color=#996600> <b>ข้อมูลอุปกรณ์</b></font></strong> ";
		echo " <TABLE width='550' border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>จำนวนทั้งหมด</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>จำนวนคงเหลือ</b></font></TD>
			</TR> ";
	if ( $number != 0 ) 
	{ 
		while ($record = mysql_fetch_row($result))
		{
			echo "
			<TR>
			<TD  bgcolor=#CCFFCC><font color= blue>$record[0]</font></TD>
			<TD  bgcolor=#FFCC99>$record[1]</TD>
			<TD bgcolor=#FFCC99>$record[2] </TD>
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