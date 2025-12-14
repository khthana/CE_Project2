<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	view_news(&$Message,&$Announce,&$n,&$News_id);
	$c =0;
?>
 
<html>
<head>
<title>Main Access</title>
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
    <td> 
      <div align="center"></div>
      <div align="center"><a href="Main_Agent.html"><b>ตัวแทน</b></a></div>
    </td>
    <td> 
      <div align="center"><b><a href="Search_Customer.php">ค้นหาลูกค้า</a></b></div>
    </td>
    <td>
      <div align="center"><b><a href="Search_Policy.html">ค้นหากรมธรรม์</a></b></div>
    </td>
    <td> 
      <div align="center"><b><a href="Main_Statistic.html">ข้อมูลสถิติ</a></b></div>
    </td>
    <td> 
      <div align="center"><b> <a href="Main_Message.php">ข้อความ</a></b></div>
    </td>
  </tr>
  <tr> 
    <td height="25" colspan="5"> 
      <div align="center"><b>NEWS</b></div>
    </td>
  </tr>
  <tr> 
    <td height="206" colspan="5"> 
      <table width="100%" border="1">
        <tr> 
          <td width="15%"> 
            <div align="center"><b>วันที่</b></div>
          </td>
          <td width="85%"> 
            <div align="center"><b>เนื้อหา</b></div>
          </td>
        </tr>
<?while($n > $c)
{
		echo"<tr>", 
          "<td height=\"42\" width=\"15%\">$Announce[$c]</td>",
          "<td height=\"42\" width=\"85%\"><a href=opennews.php?News_id=$News_id[$c]>$Message[$c]</a></td>",
		"</tr>";
		$c++;
}
 ?>       
      </table>
    </td>
  </tr>
  <tr> 
    <td height="206" colspan="5">&nbsp;</td>
  </tr>
  <tr> 
    <td height="206" colspan="5">&nbsp;</td>
  </tr>
</table>
</body>
</html>
