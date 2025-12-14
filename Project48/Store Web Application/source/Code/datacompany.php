<html>
<head>
<title>Data Company</title>
</head>

<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'>
<?php
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

//edit_company
echo"
<form name='EditCompany' method='post' action='edit_company.php'>
<div align='center'> <font color=#996666>:: แก้ไขข้อมูลบริษัท  :: </font> </div>  
<table   height='30' border='1' align='center' bordercolor='#3399FF'>
<tr> 
<td bgcolor=#CCFFCC> <font color=#663399><b>&nbsp;  รหัส &nbsp; </b></font></td>
<td>&nbsp; <input name='ID' type='text' maxlength='50'>
<input name='Submit' type='submit' value=' ตกลง '> &nbsp;
 <input name='Reset' type='reset' value=' ยกเลิก '></td>
</tr>
</table>
</form>";
//edit_company
	mysql_query("SET NAMES tis620"); 
	mysql_select_db("store");
	$sql="SELECT * FROM company order by Comp_ID ";
	mysql_query("SET NAMES tis620"); 
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
		echo"<br><strong><font size=3 color=#996600> <b>ข้อมูลบริษัทที่ซื้อเครื่องมือและอุปกรณ์</b></font></strong> ";
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
			<TD  bgcolor=#CCFFCC><a href='ddcompany.php?record=$record[0]' target='newframe'><font color= blue>$record[0]</font></a></TD>
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