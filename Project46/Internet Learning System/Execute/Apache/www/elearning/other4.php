<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>สิ่งที่คุณจะได้หลังจากทำการสมัครเป็นสมาชิก</title>
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
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2">&nbsp;สิ่งที่คุณจะได้หลังจากทำการสมัครเป็นสมาชิก</font></td>
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
                <td class="defaultfont">หลังจากได้ทำการสมัครเป็นสมาชิกแล้ว สมาชิกจะมี UserID, Password 
                  เป็นของตนเองในการเข้าสู่ระบบ และทำอะไรต่าง ๆ ดังนี้</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont">- สามารถเรียนด้วยตัวเอง จากแบบเรียน ในวิชาที่มีอยู่ได้</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont">- ทำแบบทดสอบเพื่อเพิ่มระดับความสามารถ (จะกล่าวอีกทีหลังทำการเข้าสู่ระบบ 
                  ในวิธีใช้สำหรับสมาชิก)</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="defaultfont">- สามารถ ถาม-ตอบกระทู้ ในวิชานั้นๆได้</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont">- สามารถเปลี่ยนแปลงรายละเอียดส่วนตัวได้ (กรณีที่ต้องการเปลี่ยนแปลงข้อมูลส่วนตัว)</td>
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
