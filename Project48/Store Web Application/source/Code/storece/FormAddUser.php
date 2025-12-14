<?php
include "chksession.php";
include "chkadmin.php";
?>

<HTML>
<HEAD>
<TITLE> เพิ่มผู้เข้าใช้งาน  </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</HEAD>

<body bgcolor="#99FFFF">
<font color="#7B869A"></font>
<form name="FormAddUser" method="post" action="AddUser.php">
<div align="center"><h3><br><font color="#0000FF">:: เพิ่มผู้เข้าใช้งาน :: </font> </h3></div>  
<table width="50%" height="30" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#3399FF">

<tr> 
<td> <font color="#0000FF">&nbsp; รหัสนักศึกษา </font></td>
<td> <input name="ID" type="text" maxlength="8"></td>
</tr>

<tr>
<td> <font color="#0000FF">&nbsp; ชื่อ </font></td>
<td> <input name="Name" type="text" maxlength="30"></td>
</tr>

<tr>
<td> <font color="#0000FF">&nbsp; นามสกุล </font></td>
<td> <input name="Sname" type="text" maxlength="30"></td>
</tr>

<tr>
<td> <font color="#0000FF">&nbsp; ที่อยู่ </font></td>
<td>   <textarea name="Address" cols="30" rows="4"></textarea></td>
</tr>

<tr>
<td> <font color="#0000FF">&nbsp; เบอร์โทรศัพท์ </font></td>
<td><input name="Tel" type="text" value=""> </td> 
</tr>

<tr> 
<td> <font color="#0000FF">&nbsp; E-mail </font></td>
<td> 
<input name="Email" type="text" maxlength="30">
</td>
</tr>

<tr> 
<td> <font color="#0000FF">&nbsp; Username </font></td>
<td> <input name="User" type="text" maxlength="20"> </td>
</tr>

<tr>
<td> <font color="#0000FF">&nbsp; Password </font></td>
<td> <input name="Password" type="password" maxlength="10"></td>
</tr>
<tr>
  <td> <font color="#0000FF">&nbsp; Re-Password </font></td>
  <td> <input name="Repwd" type="password" maxlength="10"></td>
</tr>

  
    <tr>
	<td><font color="#0000FF">&nbsp; ระดับ </td> </font>
    <td><font color="#0000FF"> <select name="level_regis"> </font>
 	<option value=""> - เลือกระดับผู้ใช้งาน - </option> <option value="student"> นักศึกษา </option><option value="staff"> เจ้าหน้าที่ </option> <option value="teacher"> อาจารย์ </option><option value="administrator"> ผู้ดูแลระบบ </option></select> </font>
     </tr>

    <tr>
      <td> </td>
      <td><div align="center"> 	<input name="Submit" type="submit" value="  ตกลง  ">&nbsp;&nbsp;&nbsp;
	  											<input name="Reset" type="reset" value=" ยกเลิก "></div></td></tr>
</table>
</form>
</BODY>
</HTML>