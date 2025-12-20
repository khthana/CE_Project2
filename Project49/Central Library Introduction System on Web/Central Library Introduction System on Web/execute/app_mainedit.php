<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php 
session_start();
?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
<title>:::ระบบจัดการเอกสารสำหรับระบบแนะนำหอสมุดกลางบนเว็บ:::</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>

<body>
<?php 
if (isset($_SESSION["valid_user"])) { 
?>
<table width="580" border="0" cellspacing="20" cellpadding="0">
  <tr>
    <td align="center" valign="top" class="headline">
	<p>&nbsp;</p>
	โปรดเลือกหมวด ที่ต้องการ <font color="#DE4B11">แก้ไข/อัพเดท</font> ข้อมูล </td>
  </tr>
  <tr>
    <td align="center"  valign="middle" height="250" >
	<table width="100%" border="0" cellspacing="20" cellpadding="0">
    <tr><td align="center">
	        <form id="form1" name="form1" method="post" action="app_filechoose.php" target="_self" >
				<input type="hidden" name="file" id="file"  value="service_link.xml" />
				<input type="hidden" name="libtype" id="libtype"  value="service" />
				<input type="submit" name="submit" value="บริการของสำนัก" class="button" />
		</form>
	 </td></tr>
	<tr><td align="center">
		<form id="form2" name="form2" method="post" action="app_filechoose.php" target="_self" >
				<input type="hidden" name="file" id="file" value="search_link.xml" />
				<input type="hidden" name="libtype" id="libtype"  value="search" />
				<input type="submit" name="submit" value="การสืบค้นข้อมูลด้วยคอมพิวเตอร์" class="button" />
		</form>
	</td></tr>
	<tr><td align="center">
		<form id="form3" name="form3" method="post" action="app_filechoose.php" target="_self" >
				<input type="hidden" name="file" id="file"  value="office_link.xml" />
				<input type="hidden" name="libtype" id="libtype"  value="office library" />
				<input type="submit" name="submit" value="การแบ่งส่วนราชการ" class="button" />
		</form>
	</td></tr>
	<tr><td align="center">
		<form id="form4" name="form4" method="post" action="app_filechoose.php" target="_self" >
				<input type="hidden" name="file" id="file"  value="library_link.xml" />
				<input type="hidden" name="libtype" id="libtype"  value="faculty library" />
				<input type="submit" name="submit" value="แนะนำห้องสมุดคณะ" class="button" />
		</form>
	</td></tr>
	<tr><td align="center">
		<form id="form5" name="form5" method="post" action="app_filechoose.php" target="_self" >
				<input type="hidden" name="file" id="file"  value="future_link.xml" />
				<input type="hidden" name="libtype" id="libtype"  value="future library" />
				<input type="submit" name="submit" value="ห้องสมุดในอนาคต" class="button" />
		</form>
	</td></tr>
	</table>
    </td>
  </tr>
</table>
<?php 
}
else {echo "<a href='app_index.php' target='_top'>คุณยังไม่ได้ login กรุณา login ก่อน</a>";}
?>
</body>
</html>
