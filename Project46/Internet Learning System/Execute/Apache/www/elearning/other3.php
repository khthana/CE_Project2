<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>สิทธิเกี่ยวกับ Webboard </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<link rel='stylesheet' type='text/css' href='style.css' />
<body>
<?php
if (!isset($_SESSION['user']))
{
?>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="28" height="28" align="right"><div align="right"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></div></td>
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2">&nbsp;สิทธิเกี่ยวกับ 
      Webboard </font></td>
    <td width="28" height="28" align="left"><div align="left"><img src="menu/trangle.gif" width="28" height="28" hspace="0" vspace="0"></div></td>
  </tr>
  <tr> 
    <td colspan="3"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FF9900">
        <tr> 
          <td colspan="2"><table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="30">&nbsp;</td>
                <td>&nbsp;</td>
                <td width="30">&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont">Webboard จะแบ่งออกเป็นกลุ่ม ๆ ตามรายวิชานั้น 
                  ๆ ในกรณีที่ไม่ได้เป็นสมาชิก หรือไม่ได้ทำการ เข้าสู่ระบบ จะไม่สามารถโพส 
                  หรือตอบกระทู้ได้</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="50%"><img src="logo/other3-1.jpg" width="221" height="71"></td>
                      <td width="50%" class="defaultfont">กรณีที่ไม่ได้เข้าสู่ระบบ</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="50%"><img src="logo/other3-2.jpg" width="206" height="52"></td>
                      <td width="50%" class="defaultfont">กรณีที่ได้เข้าสู่ระบบ 
                        และสามารถที่จะเรียนรู้วิชานั้นๆได้ (มีรายวิชานั้น ๆ ใน 
                        status ซึ่งจะบอกอีกทีในวิธีใช้สำหรับสมัคร หลังจากทำการเข้าสู่ระบบแล้ว)</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td width="28" height="28" align="right"><img src="menu/dlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td bgcolor="#FF9900">&nbsp;</td>
    <td width="28" height="28" align="left"><img src="menu/drangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
</table>
<?php
}
?>
</body>
</html>
