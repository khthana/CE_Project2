<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	//Read_logfile($Aid,$Anick,$Apwd);
	namebook($Name,$id,$count);
	$n = 0;
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
    <td> 
      <div align="center"></div>
      <div align="center"><b>ข้อความ </b></div>
    </td>
  </tr>
  <tr> 
    <td height="25"> 
      <div align="center"><i>Name Book</i></div>
    </td>
  </tr>
  <tr> 
    <td height="206">
      <table width="100%" border="1" height="137">
        <tr> 
          <td width="13%"> 
            <p><a href="Main_Message.php">INBOX</a></p>
            <p><a href="Message_Outbox.php">OUTBOX</a></p>
            <p><a href="Message_Compose.html">COMPOSE</a></p>
            <p><a href="Message_Namebook.php">Name Book</a></p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
          </td>
          <td width="87%">
            <table width="100%" border="1">
              <tr> 
                <td width="9%">&nbsp;</td>
                <td width="25%"><b>Name</b></td>
                <td width="25%"><b>Detail</b></td>
                <td width="10%">TO:</td>
                <td width="31%">CC:</td>
              </tr>
<?
while($count>$n){
              echo"<tr> ",
                "<td width=\"9%\">", 
                 "<input type=\"checkbox\" name=\"checkbox2\" value=\"checkbox\">",
                "</td>",
                "<td width=\"25%\">$Name[$n]</td>",
                "<td width=\"25%\">id no :$id[$n]</td>",
                "<td width=\"10%\">", 
                "<input type=\"radio\" name=\"radiobutton\" value=\"radiobutton\">",
                "</td>",
                "<td width=\"31%\">", 
                "<input type=\"radio\" name=\"radiobutton\" value=\"radiobutton\">",
                "</td>",
              "</tr>";
$n = $n+1;
}
CloseDB();
?>              	                
			  <tr> 
                <td width="9%"><i><b>New Name</b></i></td>
                <td width="25%"> 
                  <input type="text" name="textfield">
                </td>
                <td width="25%"> 
                  <input type="text" name="textfield2">
                </td>
                <td colspan="2"> 
                  <input type="submit" name="Submit" value="Add">
                </td>
              </tr>
              <tr> 
                <td width="9%" height="36"> 
                  <input type="submit" name="Submit2" value="Delete">
                </td>
                <td width="25%" height="36">&nbsp; </td>
                <td width="25%" height="36">&nbsp;</td>
                <td height="36" colspan="2">
                  <input type="submit" name="Submit3" value="Insert">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="206">&nbsp;</td>
  </tr>
  <tr>
    <td height="206">&nbsp;</td>
  </tr>
</table>
</body>
</html>
