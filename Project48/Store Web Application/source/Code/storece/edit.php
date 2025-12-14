<?php
include "chksession.php";
include "function.php";
include "connect.php";
mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
$sql="select * from userprofile where Username='$sess_username' ";
$result = mysql_db_query($dbname,$sql);
$record = mysql_fetch_array($result);
$ID=$record[ID];
$User=$record[Username];
$Name=$record[Name];
$Sname=$record[Sname];
$Address=$record[Address];
$Email=$record[Email];
$Tel=$record[Tel];
$Level=$record[Level];
$regdate=$record[regdate];
mysql_close();
?>

<HTML>
<HEAD><TITLE> :: แก้ไขข้อมูลส่วนตัว 	:: </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
.style2 {color: #0000FF}
.style4 {color: #6699FF; font-weight: bold; }
.style5 {color: #6600FF}
-->
</style>
</HEAD>

<body bgcolor="#99FFFF">
<br> <br>
<h2 align="center" class="style2"><strong> :: แก้ไขข้อมูลสมาชิก :: </strong></h2>
<FORM METHOD="POST" ACTION="edit2.php">
<center> <TABLE CELLSPACING="2">
<TR>
<TD><span class="style4"> ID : </span></TD>
<TD><span class="style5">
  <?=$ID?>
</span></TD>
</TR>

<TR>
<TD><span class="style4"> Username : </span></TD>
<TD><span class="style5">
  <?=$User?>
</span></TD>
</TR>

<tr>
<td><span class="style4"> ชื่อ - นามสกุล : </span></td>
<td><span class="style5">
  <?=$Name?>   
  <?=$Sname?>
</span></td>
</tr>

<TR>
<TD><span class="style4"> E-mail : </span></TD>
<TD><span class="style5">
  <INPUT NAME="email_edit" TYPE="text" value="<?=$Email?>" SIZE="26"> 
  * </span></TD>
</TR>

<TR>
<TD><span class="style4"> โทรศัพท์ : </span></TD>
<TD><INPUT NAME="tel_edit" TYPE="text" VALUE="<?=$Tel?>" SIZE="26"></TD>
</TR>

<TR>
<TD VALIGN="top"><span class="style4"> ที่อยู่ติดต่อ : </span></TD>
<TD><span class="style5">
  <TEXTAREA NAME="address_edit" COLS="35" ROWS="3"><?=$Address?>
</TEXTAREA>
</span></TD>
</TR>

<TR>
<TD><span class="style4"> สมัครเมื่อ : </span></TD>
<TD><span class="style5">
  <?=displaydate($regdate)?>
</span></TD>
</TR>

<TR>
<TD>&nbsp; </TD>
<TD><INPUT TYPE="Submit" value="ตกลง">
<input type="reset" value="ยกเลิก"></TD>
</TR>
</TABLE>
</center>
<center>[ <a href="profile.php"> <font color="#6699FF"></font>กลับหน้าหลัก </a> ]</font></center>
</FORM>
</BODY>
</HTML>