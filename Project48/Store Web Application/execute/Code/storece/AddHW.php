<?php
include "chksession.php";
include "chkadmin.php";
include "connect.php";
include "function.php";
?>

<html>
<head>
<title> เพิ่มเครื่องมือลงในฐานข้อมูล </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
.style1 {color: #0000FF}
.style2 {color: #3399FF}
.style3 {color: #3333FF}
-->
</style>
</head>

<body bgcolor="#99FFFF">
<form name="AddHW" method="post" action="AddHW2.php">
<div align="center"><h3 class="style1"> ::  เพิ่มเครื่องมือ  :: </h3>
</div>
<br>
<table width="50%" height="30" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#3399FF">

<tr> 
<td> <span class="style2">&nbsp; รหัสเครื่องมือ </span></td>
<td> <input name="ID_hw" type="text" maxlength="15"></td></tr>

<tr>
<td><span class="style2">&nbsp; ชื่อเครื่องมือ </span></td>
<td> <input name="Name_hw" type="text" maxlength="30"></td>
</tr>

<tr>
<td><span class="style2">&nbsp; วันที่ซื้อเข้า </span></td>
<td> <span class="style3">
  <input name="SaleIN_hw" type="text" maxlength="30">
&nbsp;&nbsp; ปี-เดือน-วัน</span></td>
</tr>

<tr>
<td> <span class="style2">&nbsp; ราคา </span></td>
<td>   <input name="Price_hw" type="text" maxlength="30"></td>
</tr>

<tr>
<td> <span class="style2">&nbsp; เลขที่บิล </span></td>
<td><input name="BillID_hw" type="text" maxlength="30"> </td> 
</tr>

<tr> 
<td> <span class="style2">&nbsp; วันที่สามารถยืมได้</span></td>
<td> 
<input name="BorrowAbleDate_hw" type="text" maxlength="30">
</td></tr>

<tr>
  <td> </td>

  <td>
    <div align="center" class="style3">
      <input name="Submit" type="submit" value=" ตกลง "> &nbsp;&nbsp;
      <input name="Reset" type="reset" value=" ยกเลิก ">
  </div></td>
</tr>
</table>
</form>
</body>
</html>