<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	Agent_list($c,$id,$name,$surname,$addressno,$district,$subdivision,$road,$soi,$subsoi,$province,$telephone);
	$n = 0;//initial array
?>
 
<html>
<head>
<title>Un title page</title>
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
  <tr> 
    <td colspan="5" height="168"> 
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="6">ระบบบริหารข้อมูล 
        สำหรับผู้บริหาร</font></div>
    </td>
  </tr>
</table>
<div align="left"></div>
<table width="75%" border="1">
  <tr> 
    <td colspan="4" height="38"> 
      <div align="center"><b>ตัวแทน <b>&gt;&gt; รายชื่อตัวแทนทั้งหมด</b></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="4" height="21"> 
      <div align="center"><b></b></div>
      <div align="center"></div>
      <div align="center"></div>
    </td>
  </tr>
  <tr> 
    <td height="29" width="9%"><b>รหัส</b></td>
    <td height="29" width="22%"><b>ชื่อ-นามสกุล</b></td>
    <td height="29" width="34%"> 
      <div align="left"></div>
      <ul>
      </ul>
      <b>ที่อยู่</b> </td>
    <td height="29" width="35%"><b>เบอร์โทรศัพท์</b></td>
  </tr>
  <?
  while( $c > $n)
  {
  echo"<tr>", 
	"<td height=\"2\" width=\"9%\">",
	"$id[$n]",
	"</td>",
    "<td height=\"2\" width=\"22%\"><a href=\"Agent_Profile.html\">$name[$n] - $surname[$n]</a></td>",
    "<td height=\"2\" width=\"34%\">บ้านเลขที่ $addressno[$n] เขต $district[$n] แขวง $subdivision[$n] ถนน $road[$n] ซอย $soi[$n] ตรอก $subsoi[$n] จังหวัด $province[$n]</td>",
    "<td height=\"2\" width=\"35%\">$telephone[$n]</td>",
	"</tr>";
	$n++;
  };
?>
  <tr> 
    <td height="2" colspan="2"> 
      <div align="center"><b>รวม</b></div>
    </td>
    <td height="2" colspan="2"><?echo"$c"?></td>
  </tr>
  <tr> 
    <td height="44" colspan="4">&nbsp;</td>
  </tr>
  <tr> 
    <td height="88" colspan="4"> 
      <div align="center"></div>
    </td>
  </tr>
  
</table>
<FORM METHOD=POST ACTION="Main_access.html">
                  <input type="submit" name="Submit2" value="Back">
</FORM>
</body>
</html>
