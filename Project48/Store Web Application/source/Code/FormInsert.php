<HTML>
<HEAD>
<TITLE> Form Insert </TITLE>
<meta http-equiv='Content-Type' content='text/html; charset=windows-874'>

</HEAD>

<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'>
<div align='center'> <font color=blue size=5><b> เลือกสิ่งที่ต้องการเพิ่มเข้าฐานข้อมูล </b></font>
<br><br>

<form name='FormInsert' method='Post' action='FormInsert.php'>
<select name='List'>
<option value='Blank' > --เลือกรายการ--</option>
<option value='Member' > ผู้ใช้งาน </option>
<option value='Hardware' > เครื่องมือ </option>
<option value='Accesseries' > อุปกรณ์  </option>
<option value='Company' > บริษัท </option>

<td> &nbsp; <input type='submit' name='btOK' value='OK' ></td>
</form>
</div>
<?php
$mem = $HTTP_POST_VARS['List'];
if ( $mem == 'Member' )
{

	echo "<form name='FormAddUser' method='post' action='AddUser.php'>
	<div align='center'>  <h2><font color=#993366>:: เพิ่มผู้เข้าใช้งาน  :: </font> </h2></div>  
	<br>
	<table width='50%' height='30' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='#3399FF'>

	<tr> 
	<td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; รหัส *</b></font> </td>
	<td bgcolor=#CCFFCC> <input name='ID' type='text' maxlength='8'></td>
	</tr>

	<tr>
	<td bgcolor=#FFCCCC><font color=#6633FF><b> &nbsp; ชื่อ*</b></font> </td>
	<td bgcolor=#FFCCCC> <input name='Name' type='text' maxlength='30'></td>
	</tr>

	<tr>
	<td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; นามสกุล*</b></font> </td>
	<td bgcolor=#CCFFCC> <input name='Sname' type='text' maxlength='30'></td>
	</tr>

	<tr>
	<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; ที่อยู่</b></font> </td>
	<td bgcolor=#FFCCCC>   <textarea name='Address' cols='30' rows='4'></textarea></td>
	</tr>

	<tr>
	<td bgcolor=#CCFFCC><font color=#6633FF><b> &nbsp; เบอร์โทรศัพท์</b></font> </td>
	<td bgcolor=#CCFFCC><input name='Tel' type='text' value=''> </td> 
	</tr>

	<tr> 
	<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; E-mail </b></font></td>
	<td bgcolor=#FFCCCC> <input name='Email' type='text' maxlength='30'></td>
	</tr>

	<tr> 
	<td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; Class </b></font></td>
	<td bgcolor=#CCFFCC> <input name='Class' type='text' maxlength='10'></td>
	</tr>

	<tr> 
	<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; Username* </b></font></td>
	<td bgcolor=#FFCCCC> <input name='User' type='text' maxlength='15'> </td>
	</tr>

	<tr>
	<td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; Password* </b></font></td>
	<td bgcolor=#CCFFCC> <input name='Password' type='password' maxlength='10'></td>
	</tr>

	<tr>
	 <td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; Re-Password*</b></font></td>
	 <td bgcolor=#FFCCCC> <input name='Repwd' type='password' maxlength='10'></td>
	</tr>

	<tr>
	<td bgcolor=#CCFFCC><font color=#6633FF><b> &nbsp; ระดับ* </b></font></td>
	<td bgcolor=#CCFFCC> <select name='level_regis'>
	 <option value=''>-- เลือก--</option> <option value='student'> นักศึกษา </option> <option value='staff'> เจ้าหน้าที่ </option> <option value='teacher'> อาจารย์ </option> <option value='admin'> ผู้ดูแลระบบ </option> </td>
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
	</form> ";
}else if  ( $mem == 'Hardware'  )
{
echo " 
<form name='AddHW' method='post' action='AddHW2.php'>
<div align='center'><h2><font color=#993366> ::  เพิ่มเครื่องมือ  :: </font></h2></div>
<br>
<table width='45%' height='30' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='#3399FF'>

<tr> 
<td  bgcolor=#CCFFCC><font color=#6633FF><b> &nbsp; รหัสเครื่องมือ </b></font></td>
<td  bgcolor=#CCFFCC> <input name='ID_hw' type='text' maxlength='20'></td>
</tr>

<tr>
<td bgcolor=#FFCCCC><font color=#6633FF><b>&nbsp; ชื่อเครื่องมือ </b></font></td>
<td bgcolor=#FFCCCC> <input name='Name_hw' type='text' maxlength='30'></td>
</tr>

<tr>
<td  bgcolor=#CCFFCC><font color=#6633FF><b>&nbsp; วันที่ซื้อเข้า </b><font></td> ";
$datecurrent = Date("Y-m-d");
echo "
<td  bgcolor=#CCFFCC> <font color=#6633FF><b><input name='SaleIN_hw' type='text' maxlength='30' value ='$datecurrent'> 
&nbsp;&nbsp; ปี-เดือน-วัน</b></font></td>
</tr>

<tr>
<td  bgcolor=#FFCCCC><font color=#6633FF><b> &nbsp; ราคา(บาท) </b></font></td>
<td bgcolor=#FFCCCC><input name='Price_hw' type='text' maxlength='30'></td>
</tr>

<tr>
<td  bgcolor=#CCFFCC><font color=#6633FF><b> &nbsp; เลขที่บิล </b></font></td>
<td  bgcolor=#CCFFCC><input name='BillID_hw' type='text' maxlength='30'> </td> 
</tr>

<tr>
<td  bgcolor=#FFCCCC><font color=#6633FF><b> &nbsp; รหัสบริษัท </b></font></td>
<td  bgcolor=#FFCCCC><input name='Comp_ID' type='text' maxlength='30'> </td> 
</tr>

<tr> 
<td  bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; วันที่สามารถยืมได้</b></font></td>
<td  bgcolor=#CCFFCC> <input name='BorrowAbleDate_hw' type='text' maxlength='30'></td>
</tr>

<tr>
<td  bgcolor=#FFCCCC><font color=#6633FF><b> &nbsp; ชนิดอุปกรณ์ </b></font></td>
<td  bgcolor=#FFCCCC><input name='Type' type='text' maxlength='30'> </td> 
</tr>

<tr>
  <td> </td>

  <td>
    <div align='center'>
      <input name='Submit' type='submit' value=' ตกลง '> &nbsp;&nbsp;
      <input name='Reset' type='reset' value=' ยกเลิก '>
  </div></td>
</tr>
</table>
</form> ";

}else if ( $mem == 'Accesseries'  )
{
	echo "
<form  method='post' action='AddAcces2.php'>
<div align='center'><h2><font color=#993366> :: เพิ่มอุปกรณ์อิเล็กทรอนิกส์ :: </font></h2></div>
<br>
<table width='40%' height='30' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='#3399FF'>

<tr>
<td  bgcolor=#CCFFCC><font color=#6633FF><b> &nbsp; เลขที่บิล </b></font></td>
<td  bgcolor=#CCFFCC><input name='BillID_acces' type='text' maxlength='30'> </td> 
</tr>

<tr>
<td  bgcolor=#FFCCCC><font color=#6633FF><b> &nbsp; รหัสบริษัท </b></font></td>
<td  bgcolor=#FFCCCC><input name='Comp_ID' type='text' maxlength='30'> </td> 
</tr>

<tr> 
<td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; รหัสอุปกรณ์</b></font></td>
<td bgcolor=#CCFFCC> <input name='ID_acces' type='text' maxlength='20'></td></tr>

<tr>
<td bgcolor=#FFCCCC><font color=#6633FF><b>&nbsp; ชื่ออุปกรณ์</b></font></td>
<td bgcolor=#FFCCCC> <input name='Name_acces' type='text' maxlength='30'></td>
</tr>

<tr>
<td  bgcolor=#CCFFCC><font color=#6633FF><b>&nbsp; วันที่ซื้อเข้า </b><font></td> ";
$datecurrent = Date("Y-m-d");
echo "
<td  bgcolor=#CCFFCC> <font color=#6633FF><b><input name='SaleIN_acces' type='text' maxlength='30' value ='$datecurrent'> 
&nbsp;&nbsp; ปี-เดือน-วัน</b></font></td>
</tr>

<tr>
<td bgcolor=#FFCCCC><font color=#6633FF><b>&nbsp; จำนวน</b></font> </td>
<td bgcolor=#FFCCCC> <input name='Amount_acces' type='text' maxlength='30'></td>
</tr>

<tr>
<td  bgcolor=#CCFFCC><font color=#6633FF><b> &nbsp; ราคา(บาท) </b></font></td>
<td bgcolor=#CCFFCC><input name='Price_acces' type='text' maxlength='30'></td>
</tr>

<tr>
  <td> </td>

  <td>
    <div align='center'>
      <input name='Submit' type='submit' value=' ตกลง '> &nbsp;&nbsp;
      <input name='Reset' type='reset' value=' ยกเลิก '>
  </div></td>
</tr>
</table>
</form> ";
}else if ( $mem == 'Company'  )
{
	echo "
<form  method='post' action='AddCompany2.php'>
<div align='center'><h2><font color=#993366> :: เพิ่มบริษัท :: </font></h2></div>
<br>
<table width='40%' height='30%' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='#3399FF'>

<tr> 
<td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; รหัส</b></font></td>
<td bgcolor=#CCFFCC> <input name='ID' type='text' maxlength='20'></td></tr>

<tr>
<td bgcolor=#FFCCCC><font color=#6633FF><b>&nbsp; ชื่อบริษัท</b></font></td>
<td bgcolor=#FFCCCC> <input name='Name' type='text' maxlength='30'></td>
</tr>

<tr>
<td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; ที่อยู่</b></font> </td>
<td  bgcolor=#CCFFCC> <textarea name='Address' cols='30' rows='4'></textarea></td>
</tr>

<tr>
<td bgcolor=#FFCCCC><font color=#6633FF><b>&nbsp;เบอร์โทรศัพท์</b></font> </td>
<td bgcolor=#FFCCCC> <input name='Tel' type='text' maxlength='30'></td>
</tr>

<tr>
  <td> </td>

  <td>
    <div align='center'>
      <input name='Submit' type='submit' value=' ตกลง '> &nbsp;&nbsp;
      <input name='Reset' type='reset' value=' ยกเลิก '>
  </div></td>
</tr>
</table>
</form> ";
}
?>
</body>
</html>