<?php
session_start();
?>
<html>
<head>
<title>ท่านกำลังต้องการเปลี่ยน password ใหม่</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">เปลี่ยนรหัสผ่าน</td>
    <td width="28" height="28"><img src="menu/trangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
  <tr> 
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="150" height="28" bgcolor="#FF9900" class="headmenu">เมนูหลัก</td>
    <td width="28" height="28"><img src="menu/tlreangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td>&nbsp;</td>
    <td width="28" height="28"><img src="menu/trreangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
  <tr> 
    <td colspan="2" valign="top"><table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#FF9900">
        <tr> 
          <td bgcolor="#FFEECC"> 
            <?php include "log.php"; ?>
          </td>
        </tr>
        <tr> 
          <td bgcolor="#FFEECC"> 
            <?php include "menu.php"; ?>
          </td>
        </tr>
      </table>
    </td>
    <td>&nbsp;</td>
    <td>

	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
<?php
if (isset($_SESSION['user']))
{
?>        
		<tr> 
          <td><form name="form1" method="post" action="change.php">
              <table width="100%" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td width="25%" bgcolor="#FFCC99" class="headfont">&nbsp;Old 
                    Password *</td>
                  <td width="75%" bgcolor="#FFEECC" class="defaultfont"><input name="opass" type="password" id="opass" maxlength="40"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;New Password *</td>
                  <td bgcolor="#FFEECC" class="defaultfont"><input name="npass1" type="password" id="npass1" maxlength="40"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;New Password *</td>
                  <td bgcolor="#FFEECC" class="defaultfont"><input name="npass2" type="password" id="npass2" maxlength="40">
                    (กรุณาใส่ password เพื่อยืนยันการเปลี่ยนแปลง)</td>
                </tr>
                <tr> 
                  <td> <div align="right"> </div></td>
                  <td> <input name="change" type="submit" id="change" value="change"> 
                    <input name="clear" type="reset" id="clear" value="clear"></td>
                </tr>
              </table>
            </form></td>
        </tr>
<?php
}
else
{
?>
		<tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr> 
                <td class="warning"><div align="center">คุณจะต้อง login ถึงจะเข้าใช้งานใน 
                    menu นี้ได้<br>
                    กรุณา login</div></td>
              </tr>
            </table></td>
        </tr>
<?php
}
?>
		</table>
    </td>
    <td width="28">&nbsp;</td>
  </tr>
  <tr> 
    <td width="28" height="28"><img src="menu/dlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td height="28" bgcolor="#FF9900">&nbsp;</td>
    <td width="28" height="28"><img src="menu/dlreangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td>&nbsp;</td>
    <td width="28" height="28"><img src="menu/drreangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/dlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td bgcolor="#FF9900">&nbsp;</td>
    <td width="28" height="28"><img src="menu/drangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td>&nbsp;</td>
    <td><div align="center"><font size="1" face="MS Sans Serif, Tahoma, sans-serif"><a href="http://www.kmitl.ac.th/" target="_blank">Copyright 
        &copy;2003 Computer online. All rights reserved<br />
        &copy;2003 Computer online, King Mongkud Institude of Technology Ladkrabang.</a></font></div></td>
    <td width="28">&nbsp;</td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>