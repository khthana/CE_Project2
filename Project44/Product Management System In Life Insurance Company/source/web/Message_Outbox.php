<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	$login = $CK[Login];
    outbox($login,&$Date,&$To,&$Topic,&$Oid,&$count);
	$n = 0;// initial array
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
      <div align="center"><i>มีข้อความที่ส่งออกไปแล้ว <? echo "$count";?> ข้อความ</i></div>
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
                <td width="10%">&nbsp; </td>
                <td width="13%"><b>DATE</b></td>
                <td width="28%"><b>TOPIC </b></td>
                <td width="49%"><b>TO</b></td>
              </tr>
<?php
			  while($count>$n)
			  {
			  echo"<tr>",
               "<td width=\"10%\">",
               "<input type=\"checkbox\" name=\"checkbox2\" value=\"checkbox\">",
               "</td>",
                "<td width=\"13%\">$Date[$n]</td>",
                "<td width=\"28%\">",
				"<a href = Message_detail_outbox.php?outbox_id=$Oid[$n]>",
				"$Topic[$n] ",
				"</a>";	
			echo"</td>",
                "<td width=\"49%\">$To[$n]</td>",
               "</tr>";
			$n++;
			}
			CloseDB();
?>
			  <tr> 
                <td width="10%" height="36"> 
                  <input type="submit" name="Submit" value="Delete">
                </td>
                <td width="13%" height="36">&nbsp; </td>
                <td width="28%" height="36">&nbsp;</td>
                <td width="49%" height="36">&nbsp;</td>
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
