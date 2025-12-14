<html>
<head>
<title>ส่งเมล์</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
<style type="text/css">
<link rel="stylesheet" type="text/css" href="style.css">	
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="20%">&nbsp;</td>
    <td height="51" width="53%"><img src="images/logo_big.gif" width="467" height="54"></td>
    <td height="51" width="15%" align="center" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href="../index.html">หน้าแรก</a></b></font></td>
    <td height="51" width="12%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ </a></b></font></td>
  </tr>
</table>
<hr color=1E90FF>
<form method=post action="boardmail.php" name="mailForm" onsubmit="return check()">
  <table width="50%" border="1" cellspacing="0" cellpadding="0" align="center"  bordercolor=#6699FF bgcolor=#CCFFFF>
    <tr> 
      <td height="30" bgcolor="#9999FF"> 
        <div align="center"><font face="MS Sans Serif"><b><font size="2" color="#FFFFFF">แบบฟอร์มส่งเมล์ถึงคุณ</font><font size="3" color="#FFFF00"> 
          <?echo "$name" ;?>
          </font> </b></font></div>
      </td>
    </tr>
    <tr>
      <td height="290" valign="top"> 
        <table width="100%" border="0" cellspacing="3" cellpadding="2">
          <tr>
            <td height="30"> 
              <div align="right"><font face="MS Sans Serif" size="2" color="#0000FF">หัวเรื่อง</font></div>
            </td>
            <td width="80%" height="30"> 
              <input type="text" name="subject" size="35" maxlength="100">
            </td>
          </tr>
          <tr>
            <td width="20%"> 
              <div align="right"><font face="MS Sans Serif" size="2" color="#0000FF">ข้อความ</font></div>
            </td>
            <td width="80%"> 
              <textarea name="message" cols="35" rows="10"></textarea>
            </td>
          </tr>
          <tr>
            <td width="20%" height="30"> 
              <div align="right"><font face="MS Sans Serif" size="2" color="#0000FF">โดย</font></div>
            </td>
            <td width="80%"> 
              <input type="text" name="name" size="35" maxlength="100">
            </td>
          </tr>
          <tr>
            <td height="34" width="20%"> 
              <div align="right"><font face="MS Sans Serif" size="2" color="#0000FF">E-mail</font></div>
            </td>
            <td height="34" width="80%"> 
              <input type="text" name="email" size="30" maxlength="100">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
  <input type="submit" name="Submit" value="ส่งเมล์">
  <input type="hidden" name="mailto" value=<?echo $wemail;?>>
  <input type="reset" name="Submit2" value="ยกเลิก">
</p>

</form>
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
<script language="JavaScript">
<!--
function check()
{
      var v1 = document.mailForm.subject.value;
      var v2 = document.mailForm.message.value;
      var v3 = document.mailForm.name.value;
	  var v4 = document.mailForm.email.value;
        if ( v1.length==0)
           {
           alert("กรุณาป้อนหัวเรื่องครับ");
           document.mailForm.subject.focus();           
           return false;
           }
        else if (v2.length==0)
           {
           alert("กรุณาป้อนข้อความ");
           document.mailForm.message.focus();           
		   return false;
           }
        else if (v3.length==0)
           {
           alert("กรุณาป้อนชื่อผู้ส่ง");
           document.mailForm.name.focus();           
		   return false;
           }
		   else if (v4.length==0)
           {
           alert("กรุณาป้อน E-mail");
           document.mailForm.email.focus();           
		   return false;
           }
        else
           return true;
}
//-->
</script>
</body>
</html>
