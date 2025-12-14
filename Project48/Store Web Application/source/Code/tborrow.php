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
	mysql_query("SET NAMES tis620");
	$link = mysql_pconnect("localhost","administrator","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
	mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 

	$store = "select  Acces_Remain from accessory where Acces_Name= '$Name' ";
	$dbquery = mysql_db_query("store",$store);

if (mysql_num_rows($dbquery) != 0 )
	{
		$remain = mysql_fetch_row($dbquery);
		if ($remain[0] != 0 )
		{
			mysql_query("SET NAMES tis620");
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
		mysql_query("SET NAMES tis620");
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
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="SELECT * FROM borrow ";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
	$Bill_ID=$number+1;
	$Today=date("dmY");

	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql1="SELECT max(Bill_ID) FROM borrow "; 
	$result1=mysql_query($sql1);
	$record1=mysql_fetch_row($result1);
	$record1[0]=$record1[0]+1;
	if($record1[0]<10){
			$record1[0]='0'.$record1[0];
	}
echo "
<font color='#7B869A'></font>
<form name='FormAddObj' method='post' action='AddObj.php'>
<div align='right'><font size='2'> <h3><font color=#CC66CC>เลขที่ใบยืม</font>&nbsp;<input type='text' name='Bill_ID' tabindex='3' size='10' value='$record1[0]$Today'></div>  
<div align='center'> <font size='3'> <h2><font color=#3399FF>:: การยืมอุปกรณ์    :: </font> </h2></div>  <br>

  <p align='center'><b><font color='#0000FF'><span lang='th'></span>
  </font></b><span lang='th'><input type='hidden' name='CusCode' tabindex='2'  size='6'></span>
  <font color='#009933' size='4'><b>&nbsp;<span lang='th'><b>รหัสนักศึกษา : </b></span><span lang='th'>
  <input type='text' name='ID' tabindex='3' size='15'></span>&nbsp;&nbsp;
  <span lang='th'>ชื่อ-นามสกุล :</span> 
  <input type='text' name='Name' tabindex='4' size='30' onkeyup='isNumber(this)'></b></font></p>

<br><div align='center'>

<table  height='30' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='#3399FF'>
      <tr>
        <td  bgcolor='#99CCFF' height='30' width='46' style='border-left-color: #111111; border-left-width: 1'><font   color=#6633FF size='4'>ลำดับที่</td>
        <td bgcolor='#99CCFF' height='30'  ><span lang='th'><font   color=#6633FF size='4'>รหัสอุปกรณ์</span></td>
        <td  bgcolor='#99CCFF' height='30'  ><font   color=#6633FF size='4'>ชื่ออุปกรณ์ </td>
        <td  bgcolor='#99CCFF' height='30' > <p><font   color=#6633FF size='4'>จำนวน</td> </font>
	  </tr>

	    <tr>
       <td bgcolor=#CCFFFF> <input name='Number1' type='text'  tabindex='6' size='3' value='1' style=' border: 1px solid #FFFFFF; font-weight: bold'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_ID1' type='text'  size='20'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_Name1' type='text'  size='25'></td>
		<td bgcolor=#CCFFFF> <input name='Amount1' type='text'  size='4' value='1' style='color: #0000FF; border: 1px solid #FFFFFF; text-align:right;font-weight: bold'></td>
		</tr>

		<tr>
       <td bgcolor=#CCFFFF> <input name='Number2' type='text'  tabindex='6' size='3' value='2' style=' border: 1px solid #FFFFFF; font-weight: bold'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_ID2' type='text'  size='20'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_Name2' type='text'  size='25'></td>
		<td bgcolor=#CCFFFF> <input name='Amount2' type='text'  size='4' value='1' style='color: #0000FF; border: 1px solid #FFFFFF; text-align:right;font-weight: bold'></td>
		</tr>

		<tr>
       <td bgcolor=#CCFFFF> <input name='Number3' type='text'  tabindex='6' size='3' value='3' style=' border: 1px solid #FFFFFF; font-weight: bold'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_ID3' type='text'  size='20'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_Name3' type='text'  size='25'></td>
		<td bgcolor=#CCFFFF> <input name='Amount3' type='text'  size='4' value='1' style='color: #0000FF; border: 1px solid #FFFFFF; text-align:right;font-weight: bold'></td>
		</tr>

		<tr>
       <td bgcolor=#CCFFFF> <input name='Number4' type='text'  tabindex='6' size='3' value='4' style=' border: 1px solid #FFFFFF; font-weight: bold'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_ID4' type='text'  size='20'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_Name4' type='text'  size='25'></td>
		<td bgcolor=#CCFFFF> <input name='Amount4' type='text'  size='4' value='1' style='color: #0000FF; border: 1px solid #FFFFFF; text-align:right;font-weight: bold'></td>
		</tr>

		<tr>
       <td bgcolor=#CCFFFF> <input name='Number5' type='text'  tabindex='6' size='3' value='5' style=' border: 1px solid #FFFFFF; font-weight: bold'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_ID5' type='text'  size='20'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_Name5' type='text'  size='25'></td>
		<td bgcolor=#CCFFFF> <input name='Amount5' type='text'  size='4' value='1' style='color: #0000FF; border: 1px solid #FFFFFF; text-align:right;font-weight: bold'></td>
		</tr>

		<tr>
       <td bgcolor=#CCFFFF> <input name='Number6' type='text'  tabindex='6' size='3' value='6' style=' border: 1px solid #FFFFFF; font-weight: bold'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_ID6' type='text'  size='20'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_Name6' type='text'  size='25'></td>
		<td bgcolor=#CCFFFF> <input name='Amount6' type='text'  size='4' value='1' style='color: #0000FF; border: 1px solid #FFFFFF; text-align:right;font-weight: bold'></td>
		</tr>
		
		<tr>
       <td bgcolor=#CCFFFF> <input name='Number7' type='text'  tabindex='6' size='3' value='7' style=' border: 1px solid #FFFFFF; font-weight: bold'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_ID7' type='text'  size='20'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_Name7' type='text'  size='25'></td>
		<td bgcolor=#CCFFFF> <input name='Amount7' type='text'  size='4' value='1' style='color: #0000FF; border: 1px solid #FFFFFF; text-align:right;font-weight: bold'></td>
		</tr>

			<tr>
       <td bgcolor=#CCFFFF> <input name='Number8' type='text'  tabindex='6' size='3' value='8' style=' border: 1px solid #FFFFFF; font-weight: bold'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_ID8' type='text'  size='20'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_Name8' type='text'  size='25'></td>
		<td bgcolor=#CCFFFF> <input name='Amount8' type='text'  size='4' value='1' style='color: #0000FF; border: 1px solid #FFFFFF; text-align:right;font-weight: bold'></td>
		</tr>

		<tr>
       <td bgcolor=#CCFFFF> <input name='Number9' type='text'  tabindex='6' size='3' value='9' style=' border: 1px solid #FFFFFF; font-weight: bold'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_ID9' type='text'  size='20'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_Name9' type='text'  size='25'></td>
		<td bgcolor=#CCFFFF> <input name='Amount9' type='text'  size='4' value='1' style='color: #0000FF; border: 1px solid #FFFFFF; text-align:right;font-weight: bold'></td>
		</tr>

		<tr>
       <td bgcolor=#CCFFFF> <input name='Number10' type='text'  tabindex='6' size='3' value='10' style=' border: 1px solid #FFFFFF; font-weight: bold'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_ID10' type='text'  size='20'></td>
		<td bgcolor=#CCFFFF> <input name='Obj_Name10' type='text'  size='25'></td>
		<td bgcolor=#CCFFFF> <input name='Amount10' type='text'  size='4' value='1' style='color: #0000FF; border: 1px solid #FFFFFF; text-align:right;font-weight: bold'></td>
		</tr>
</table>

</center>
<td>&nbsp;<td>
  <div align='center'>
      <input name='Submit' type='submit' value=' ตกลง '> &nbsp;
      <input name='Reset' type='reset' value=' ยกเลิก '>
  </div>

</form>
<p>&nbsp;</p>
";

}
echo "</BODY></HTML> ";

?>
