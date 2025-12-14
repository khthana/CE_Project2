<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	Read_logfile($Aid,$Anick,$Apwd);
	viewoutbox($outbox_id,&$Date,&$To,&$Topic,&$Message);
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
      <div align="center"><i>Message  <?echo"$Topic";?></i></div>
    </td>
  </tr>
  <tr> 
    <td height="206">
      <table width="100%" border="1" height="137">
        <tr> 
          <td width="13%"> 
            <p><a href="Main_Message.php">INBOX</a></p>
            <p><a href="Message_Outbox.php">OUTBOX</a></p>
            <p><a href="Message_Compose.php">COMPOSE</a></p>
            <p><a href="Message_Namebook.php">Name Book</a></p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
          </td>
          <td width="87%">
            <table width="100%" border="1">
              <tr> 
                <td width="12%" height="2"><b>DATE :</b></td>
                <td colspan="5" height="2"><? echo"$Date";?></td>
              </tr>
              <tr> 
                <td width="12%" height="2"><b>TO :</b></td>
                <td colspan="5" height="2"><? echo" $To ";?></td>
              </tr>
              <tr> 
                <td width="12%" height="2"><b>From :</b></td>
                <td colspan="5" height="2"><? echo" $Anick ";?></td>
              </tr>
              <tr> 
                <td width="12%" height="2"><b>CC :</b></td>
                <td colspan="5" height="2"></td>
              </tr>
              <tr> 
                <td colspan="6">
				<?
					//วันนี้มีการประชุม ประจำปี ขอให้ทุกคนมากันอย่างพร้อมเพรียงกัน โดยหัวข้อมประชุมจะมีเพิ่มเติมขึ้นอีกด้วย ดังนั้นจตึงขอให้มีการ...
				  echo"$Message";
				  CloseDB();
				  ?></td>
              </tr>
              <tr> 
                <td width="12%" height="36"> 
                 <FORM METHOD=POST ACTION="delete_outbox.php?outbox_id=<?echo"$outbox_id";?>">
					<input type="submit" name="Submit" value="Delete">
					</FORM>
                </td>
                <td width="24%" height="36"> 
               	<FORM METHOD=POST ACTION="main_message.php">
					<input type="submit" name="Submit2" value="Back">
					</FORM>
                </td>
                <td width="8%" height="36">&nbsp;</td>
                <td height="36" colspan="3">&nbsp;</td>
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
