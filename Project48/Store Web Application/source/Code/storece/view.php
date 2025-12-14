<?php
include "chksession.php";
include "connect.php";
include "chkadmin.php";
?>

<html>
<head>
<title> Member ระบบสมาชิก </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body bgcolor="#99FFFF">
<div align="center">
<h2> <font color="#3333FF">:: รายชื่อสมาชิก ::</font> </h2> 
<table border="1">
<tr bgcolor='#d3d3d3'>
 <td><div align="center"><font color="#3366FF" size="3"> รหัส </font></div></td> 
 <td><div align="center"><font color="#3366FF" size="3"> ชื่อ </font></div></td> 
 <td><div align="center"><font color="#3366FF" size="3"> นามสกุล </font></div></td> 
 <td><div align="center"><font color="#3366FF" size="3"> ที่อยู่ </font></div></td> 
<td><div align="center"><font color="#3366FF" size="3"> โทรศัพท์ </font></div></td> 
<td><div align="center"><font color="#3366FF" size="3"> E-mail </font></div></td> 
<td><div align="center"><font color="#3366FF" size="3"> ระดับ </font></div></td> 
<td><div align="center"><font color="#3366FF" size="3"> ต้องการ </font></div></td> 

<?php
$count=0;
include "connect.php";
mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
$sql="select * from userprofile order by ID";
$result=mysql_db_query($dbname,$sql);
while ($record=mysql_fetch_array($result)) {
$connect++;
echo"
<tr>
<td><font size=2> $record[ID]</font></td>
<td><font size=2> $record[Name]</font></td>
<td><font size=2> $record[Sname]</font></td>
<td><font size=2> $record[Address]</font></td>
<td><font size=2> $record[Tel]</font></td>
<td><font size=2> $record[Email]</font></td>
<td><font size=2> $record[Level]</font></td>
<td><font size=2><a href=\"delete.php?id_del=$record[id]\" onclick=\"return confirm(' ต้องการลบ $record[name] ออกจากระบบจริงหรือไม่')\"><center> ลบ </center></a></font></td>
</tr>";
}
mysql_close();
?>

</table>
</div>
</body>
</html>