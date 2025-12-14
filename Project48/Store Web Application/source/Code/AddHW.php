
<html>
<head>
<title> เพิ่มเครื่องมือลงในฐานข้อมูล </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body bgcolor="#99FFFF"  background='bg_table.jpg' tppabs='bg_table.jpg'>
<form name="AddHW" method="post" action="AddHW2.php">
<div align="center"><h2> ::  เพิ่มเครื่องมือ  :: </h2></div>
<br>
<table width="50%" height="30" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#3399FF">

<tr> 
<td> &nbsp; รหัสเครื่องมือ </td>
<td> <input name="ID_hw" type="text" maxlength="20"></td></tr>

<tr>
<td>&nbsp; ชื่อเครื่องมือ </td>
<td> <input name="Name_hw" type="text" maxlength="30"></td>
</tr>

<tr>
<td>&nbsp; วันที่ซื้อเข้า </td>
<td> <input name="SaleIN_hw" type="text" maxlength="30"> 
&nbsp;&nbsp; ปี-เดือน-วัน</td>
</tr>

<tr>
<td> &nbsp; ราคา </td>
<td>   <input name="Price_hw" type="text" maxlength="30"></td>
</tr>

<tr>
<td> &nbsp; เลขที่บิล </td>
<td><input name="BillID_hw" type="text" maxlength="30"> </td> 
</tr>

<tr> 
<td> &nbsp; วันที่สามารถยืมได้</td>
<td> 
<input name="BorrowAbleDate_hw" type="text" maxlength="30">
</td></tr>

<tr>
  <td> </td>

  <td>
    <div align="center">
      <input name="Submit" type="submit" value=" ตกลง "> &nbsp;&nbsp;
      <input name="Reset" type="reset" value=" ยกเลิก ">
  </div></td>
</tr>
</table>
</form>
</body>
</html>