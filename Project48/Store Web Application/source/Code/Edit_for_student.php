<HTML>
<HEAD>
<TITLE>:: แก้ไขข้อมูลนักศึกษา :: </TITLE>
</HEAD>
<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'>
<?php
	//echo"$xUser_ID";
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="SELECT * FROM userprofile WHERE User_ID = '$xUser_ID'";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
	$record = mysql_fetch_row($result);

echo "<form name='Edit_for_student' method='post' action='Edit_for_student1.php'>
<div align='center'>  <h2><font color=#999900>:: แก้ไขข้อมูลนักศึกษา :: </font> </h2></div>  
<br>
<table width='50%' height='30' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='#3399FF'>

<input type='hidden' name='ID'  value='$record[0]'>
<input type='hidden' name='Name' value='$record[1]'>
<input type='hidden' name='Sname' value='$record[2]'>
<input type='hidden' name='Username' value='$record[8]'>

<tr>
<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; ID </b></font> </td>
<td bgcolor=#FFCCCC>&nbsp;<font color='blue'> $record[0]</font></td>
</tr>

<tr>
<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; Username </b></font> </td>
<td bgcolor=#FFCCCC> &nbsp; <font color='blue'> $record[8]</font></td>
</tr>

<tr>
<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; ชื่อ - นามสกุล </b></font> </td>
<td bgcolor=#FFCCCC> &nbsp;<font color='blue'> $record[1]  $record[2] </font></td>
</tr>

<tr>
<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; ที่อยู่</b></font> </td>
<td bgcolor=#FFCCCC>   <textarea name='Address' cols='30' rows='4'  >$record[3]</textarea></td>
</tr>

<tr>
<td bgcolor=#CCFFCC><font color=#6633FF><b> &nbsp; เบอร์โทรศัพท์</b></font> </td>
<td  bgcolor=#CCFFCC><input name='Tel' type='text'  value='$record[4]'> </td> 
</tr>

<tr> 
<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; E-mail </b></font></td>
<td bgcolor=#FFCCCC> <input name='Email' type='text' maxlength='30'  value='$record[5]'></td>
</tr>

<input type='hidden' name='Status' value='$record[7]'>

<tr>
<td bgcolor=#FFCCCC></td>
<td bgcolor=#FFCCCC></td>
</tr>

<tr>
<td bgcolor=#FFCCCC> <font color=#6633FF><b>&nbsp; รหัสใหม่* </b></font></td>
<td  bgcolor=#FFCCCC> <input name='newpass' type='password' maxlength='16' </td>
</tr>
<tr>
  <td bgcolor=#CCFFCC> <font color=#6633FF><b>&nbsp; รหัสใหม่ อีกครั้ง*</b></font></td>
  <td bgcolor=#CCFFCC> <input name='newpass2' type='password' maxlength='16' </td>
</tr>
 
<input type='hidden' name='level_regis' value='student'>

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
?>
</body>
</html>
