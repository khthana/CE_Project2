<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>จะใช้งานเว็บนี้ได้อย่างไร</title>
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
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2">&nbsp;จะใช้งานเว็บนี้ได้อย่างไร</font></td>
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
                <td class="defaultfont">เว็บนี้เป็นเว็บที่ให้เรียนรู้ ทดสอบ และถาม-ตอบ 
                  ปัญหาเกี่ยวกับวิชาของภาควิชาคอมพิวเตอร์ คณะวิศวกรรมศาสตร์ ผู้ที่สนใจในการเข้าใช้งาน 
                  จำเป็นต้อง ลงทะเบียนเป็นสมาชิกก่อนถึงจะเข้าใช้งานได้</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="50%"><img src="logo/other1-1.jpg" width="191" height="37"></td>
                      <td width="50%" class="defaultfont">เมนูเข้าใช้สำหรับลงทะเบียน</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="50%"><img src="logo/other1-2.jpg" width="239" height="29"></td>
                      <td width="50%" class="defaultfont">กรอกข้อมูลส่วนตัว</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="50%"><img src="logo/other1-3.jpg" width="236" height="29"></td>
                      <td width="50%" class="defaultfont">ใส่ e-mail ที่ใช้ในการติดต่อ</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="50%"><img src="logo/other1-4.jpg" width="236" height="71"></td>
                      <td width="50%" class="defaultfont">ใส่ UserID, Password 
                        และยืนยัน Password</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr>
                      <td width="50%"><img src="logo/other1-5.jpg" width="123" height="38"></td>
                      <td width="50%" class="defaultfont">ทำการ register โดยกดปุ่ม</td>
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
