<html>
<head>
<title>Data Company</title>
</head>

<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'>
<?php
echo"<div align='center'><strong><font size=5 color=#9933FF> <b><p>ข้อมูล</p></b></font></strong> </div>";

	mysql_query("SET NAMES tis620"); 
	mysql_select_db("store");
	$sql="SELECT a.*,b.* FROM  hardware a,bill b where a.Bill_ID= b.Bill_ID and b.Comp_ID = '$record' ";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);

	mysql_query("SET NAMES tis620"); 
	mysql_select_db("store");
	$sql1="SELECT * FROM  company where Comp_ID ='$record' ";
	$result1=mysql_query($sql1);
	$number1=mysql_num_rows($result1);
	$record1= mysql_fetch_row($result1);

	mysql_query("SET NAMES tis620"); 
	mysql_select_db("store");
	$sql2="SELECT a.*,b.* FROM  accessory a,bill b where a.Bill_ID= b.Bill_ID and b.Comp_ID = '$record' ";
	$result2=mysql_query($sql2);
	$number2=mysql_num_rows($result2);

	echo"<font color=#3333CC size='4'> <b>รหัสบริษัท</b> $record1[0]  <b>ชื่อบริษัท</b>  $record1[1]</font><br><br>";

	echo "<TABLE  border='1' >
			<TR>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>เลขที่บิล</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>วันที่ซื้ออุปกรณ์</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ราคา(บาท)</b></font></TD>
			<TD  bgcolor=#FFCCFF><font color=#330066><b>ชนิดอุปกรณ์</b></font></TD>
		</TR> ";
if ($number != 0 ) 
	{ 
	while ($record = mysql_fetch_row($result))
		{
			echo "
			<TR>
			<TD bgcolor=#CCFFCC><font color= blue>$record[4]</font></TD>
			<TD  bgcolor=#FFCC99>$record[0]</a></TD>
			<TD bgcolor=#FFCC99>$record[1] </TD>
			<TD bgcolor=#FFCC99>$record[2]</TD>
			<TD bgcolor=#FFCC99>$record[3]</TD>
			<TD bgcolor=#FFCC99>$record[7]</TD>
		</TR>  ";
		}	
	}
	if ($number2 != 0 ) 
	{ 
	while ($record2 = mysql_fetch_row($result2))
		{
			echo "
			<TR>
			<TD bgcolor=#CCFFCC><font color= blue>$record2[4]</font></TD>
			<TD  bgcolor=#FFCC99>$record2[0]</a></TD>
			<TD bgcolor=#FFCC99>$record2[1] </TD>
			<TD bgcolor=#FFCC99>$record2[8]</TD>
			<TD bgcolor=#FFCC99>$record2[9]</TD>
			<TD bgcolor=#FFCC99>Accessory</TD>
		</TR>  ";
		}	
	}
	echo "</TABLE>  ";
?>
</body>
</html>