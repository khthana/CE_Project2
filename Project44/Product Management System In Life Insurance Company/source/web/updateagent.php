<html>
<head>
<title>Update Agent</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="75%" border="1">
  
    
    <td colspan="2">
      <div align="center"><b>UPDATE AGENT</b></div>
    </td>
  </tr>
  <tr> 

    <td width="47%">
<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	checkagent($Aid);
	CloseDB();
?>

										แก้ไข Agent
<FORM METHOD=POST ACTION="gotoupdateagent.php">

	  <p align="left"><b>ชื่อ</b>  <input type="text" name="Aname"></p>
      <p align="left"><b>นามสกุล</b><input type="text" name="Asurname"></p>
	  <p align="left"> <b>ชื่อเล่น</b> <input type="text" name="Anick"></p>
	  <p align="left"> <b>รหัสผ่าน</b> <input type="text" name="Apasswd"></p>
	  <p align="left"> <b>ตำแหน่ง</b> <input type="text" name="Arange"></p>
	  <p align="left"><b>จังหวัด</b>   <input type="text" name="Aprovince"></p>
      <p align="left"><b>เขต</b>    <input type="text" name="Adistrict"></p>
      <p align="left"><b>แขวง</b>  <input type="text" name="Asubdivision"></p>
      <p align="left"><b>ถนน</b>  <input type="text" name="Aroad"></p>
      <p align="left"><b>ซอย</b> <input type="text" name="Asoi"></p>
      <p align="left"><b>ตรอก</b><input type="text" name="Asubsoi"></p>
      <p align="left"><b>หมู่บ้าน</b>        <input type="text" name="ASubH"></p>
      <p align="left"><b>บ้านเลขที่</b>        <input type="text" name="Aaddress"></p>
      <p align="left"><b>เบอร์โทรศัพท์</b>์        <input type="text" name="Atel"></p>
	  <p align="left"><b>รหัสไปรษณีย์</b>์        <input type="text" name="APostcode"></p>
	<br>
	  <input type="submit" name="Submit" value="OK">
 </FORM>
</table>
<div align="center"></div>
</body>
</html>
