
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
<link rel="stylesheet" type="text/css" href="style.css">	
</head>

<body bgcolor=#F5FFFA>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="20%">&nbsp;</td>
    <td height="51" width="53%"><img src="images/logo_big.gif" width="467" height="54"></td>
    <td height="51" width="15%" align="center" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href="../index.html">หน้าแรก</a></b></font></td>
    <td height="51" width="12%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ </a></b></font></td>
  </tr>
</table>
<hr color=1E90FF>

<?
include("smtpmail.php");


$msg = "Subject : $subject \n\n $message \n\n จาก : $name $email";

if(! smail($email,$mailto,$subject,$msg) )
{ ?>

 <table width="60%" border="1" cellspacing="0" cellpadding="0" align="center" height="26" bgcolor="#FFFBB0" bordercolor="#0000FF">
    <tr> 
    <td height="42">
        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#0000FF"><br>
          ได้ทำการส่งอีเมล์<br>
          <br>
          </font></b><font color="#0000FF" size="1">ถึง <b>
          <? echo $mailto ?>
          </b><br>
          <br>
          เรียบร้อยแล้ว </font><font color="#000000" size="1"><br>
          </font></font></div>
    </td>
  </tr>
</table>
<?
} else {
?>
<table width="60%" border="1" cellspacing="0" cellpadding="0" align="center" height="26" bgcolor="#FFCCFF" bordercolor="#FF0000">
  <tr> 
    <td height="42">
        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#0000FF"><br>
          ไม่สามารถส่งงอีเมล์<br>
          <br>
          </font></b><font color="#FF0000" size="1">ถึง</font><font color="#FF0000"> 
          <b>
          <? echo $mailto ?>
          </b><br>
          <br>
          <font size="1">ได้ครับกรุณาตรวจสอบ</font></font><font color="#000000"><font size="1"><br>
           </font></font></font></div>
    </td>
  </tr>
</table>
	
<?
}
?>










<hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF">Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>
</body>
</html>

