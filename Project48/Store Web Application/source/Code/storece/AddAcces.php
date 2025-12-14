<?php
include "chksession.php";
include "chkadmin.php";
?>

<html>
<head>
<title> เพิ่มอุปกรณ์อิเล็กทรอนิกส์ </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
.style1 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#99FFFF">
<form name="AddAcces.php" method="post" action="AddAcces2.php">
<div align="center"><h3 class="style1"> :: เพิ่มอุปกรณ์อิเล็กทรอนิกส์ :: </h3>
</div>
<br>
<table width="50%" height="30" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#3399FF">

<tr> 
<td> &nbsp; รหัสอุปกรณ์</td>
<td> <input name="ID_acces" type="text" maxlength="20"></td></tr>

<tr>
<td>&nbsp; ชื่ออุปกรณ์</td>
<td> <input name="Name_acces" type="text" maxlength="30"></td>
</tr>

<tr>
<td>&nbsp; จำนวน </td>
<td> <input name="Amount_acces" type="text" maxlength="30"></td>
</tr>

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
