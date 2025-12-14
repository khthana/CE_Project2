<?php
echo "
<HTML>
<HEAD>
<TITLE>การค้นหา</TITLE>
</HEAD>
<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'>

<form name='ReturnHardware' method='post' action='find_for_student.php'>
<div align='center'>  <h2><font color=#996666>:: การค้นหาอุปกรณ์   :: </font> </h2></div>  
<table width='50%' height='30' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='#3399FF'>
<tr> 
<td bgcolor=#CCFFCC <font color=#663399><b>&nbsp;  ชื่ออุปกรณ์ </b></font></td>
<td bgcolor=#CCFFCC> <input name='Name' type='text' maxlength='50'></td>
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
</form><br>";

$Name = $HTTP_POST_VARS["Name"];
if($Name!=""){
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="SELECT * from hardware where HW_Name  like '%$Name%' and HW_Status='yes' order by HW_ID";
	$result=mysql_query($sql);
	$num=mysql_num_rows($result);

	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql1="SELECT * from accessory where Acces_Name  like '%$Name%'  order by Acces_ID";
	$result1=mysql_query($sql1);
	$num1=mysql_num_rows($result1);

}
if ( $num != 0 ) 
{
echo " <TABLE width='400'  border='1' >
			<TR>
			<TD bgcolor=#CCFFFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>จำนวนวันที่ยืมได้</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>สถานะ</b></font></TD>
			</TR> ";
		while ($record = mysql_fetch_row($result))
		{
			echo" 
			<TR>
			<TD  bgcolor=#CCFFCC><font color= blue>$record[0]</font> </TD>
			<TD bgcolor=#FFCCCC>$record[1]</TD>
			<TD bgcolor=#FFCCCC>&nbsp&nbsp$record[5]&nbsp วัน</TD>
			<TD bgcolor=#FFCCCC align='center'>มีอยู่</TD>
		</TR> ";
		}
}else if( $num1 != 0 ) {
	echo " <TABLE   border='1' >
			<TR>
			<TD bgcolor=#CCFFFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#CCFFFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>	
			<TD bgcolor=#CCFFFF><font color=#330066><b>จำนวนคงเหลือ</b></font></TD>	
			<TD bgcolor=#CCFFFF><font color=#330066><b>สถานะ</b></font></TD>
			</TR> ";
			while ($record1 = mysql_fetch_row($result1))
		{
			echo" 
			<TR>
			<TD bgcolor=#CCFFCC><font color= blue>$record1[0]</font></TD>
			<TD bgcolor=#FFCCCC>&nbsp;$record1[1] </TD>
			<TD bgcolor=#FFCCCC>&nbsp;&nbsp;$record1[3]  ตัว </TD>";
			if($record1[3] >0){
			echo"<TD bgcolor=#FFCCCC>&nbsp;&nbsp;มีอยู่</TD>";
			}else{
			echo"<TD bgcolor=#FFCCCC><font color=red>หมด</font></TD>";
			}
		echo"</TR> ";
		}
}
else{
	echo"";
}

echo "</TABLE></BODY></HTML> ";

?>