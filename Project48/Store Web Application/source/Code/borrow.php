<?php
echo "
<HTML>
<HEAD>
<TITLE>หน้าสำหรับการยืม  </TITLE>
<meta http-equiv='Content-Type' content='text/html; charset=windows-874'>
</HEAD>

<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'> ";
$id = $HTTP_POST_VARS["ID"];
$Name = $HTTP_POST_VARS["Name"];
$ok = $HTTP_POST_VARS["Submit"];

if ( $ok != ' ตกลง ' )
{

$link = mysql_pconnect("localhost","administrator","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 

$store = "select  Acces_Remain from accessory where Acces_Name= '$Name' ";
$dbquery = mysql_db_query("store",$store);

if (mysql_num_rows($dbquery) != 0 )
	{
		$remain = mysql_fetch_row($dbquery);
		if ($remain[0] != 0 )
		{
			$ordersresult = "select level from userprofile where ID = $id ";
			$dbquery = mysql_db_query("store",$ordersresult);
			$level = mysql_fetch_row($dbquery);
			if ( $level[0] == "admin" )
				{
					echo " ได้ทำการยืมเสร็จเรียบร้อย ";
				}
				else if  ( $level[0] == "techer" )
				{
					
				}
				else if ( $level[0] == "student" )
				{

				}
		}
	}
else 
	{
		$store = "select  HW_Status from hardware where HW_Name= '$Name' ";
		$dbquery = mysql_db_query("store",$store);

		if (mysql_num_rows($dbquery) != 0 )
		{
		$status = mysql_fetch_row($dbquery);
		if ($status[0] != "N" )
			{
				$ordersresult = "select level from userprofile where ID = $id ";
				$dbquery = mysql_db_query("store",$ordersresult);
				$level = mysql_fetch_row($dbquery);
				if ( $level[0] == "admin" )
					{

					}
					else if  ( $level[0] == "techer" )
					{

					}
					else if ( $level[0] == "student" )
					{

					}
			}
	}
	}

	mysql_select_db("store");
	$sql="SELECT * FROM borrow ";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
	$Bill_ID=$number+1;
echo "
<font color='#7B869A'></font>
<form name='FormAddUser' method='post' action='borrow1.php'>
<div align='right'><font size='2'> <h3><font color=#CC66CC>เลขที่บิล</font><font color=#CC6699> $Bill_ID </font> </h3></div>  
<div align='center'> <font size='3'> <h2><font color=#3399FF>:: การยืมอุปกรณ์    :: </font> </h2></div>  
<br>
<table width='25%' height='30' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='#3399FF'>

<tr>
<td bgcolor=#99CCFF><font color=#6633FF><b> &nbsp;  รหัสนักศึกษา</b></font> </td>
</tr>

<tr>
<td bgcolor=#CCFFFF> <input name='Name' type='text' maxlength='30'></td>
</tr>

<tr> 
<td bgcolor=#99CCFF><font color=#6633FF><b>   &nbsp;  รหัสอุปกรณ์ </b></font></td>
</tr>
<tr>
	<td bgcolor=#CCFFFF> <input name='ID' type='text' maxlength='10'></td>
</tr>
<tr>
<td bgcolor=#99CCFF><font color=#6633FF><b> &nbsp; จำนวน </b></font></td>
</tr>

<tr>
<td bgcolor=#CCFFFF><input name='Amount' type='text' value='1'><font color=#6633FF><b>&nbsp;&nbsp;ตัว </b></font></td>
</tr>
<tr>
  <td>
    <div align='center'>
      <input name='Submit' type='submit' value=' ตกลง '> &nbsp;
      <input name='Reset' type='reset' value=' Reset '>
  </div></td>
</tr>
</table>
</form> ";

}
echo "</BODY></HTML> ";

?>
