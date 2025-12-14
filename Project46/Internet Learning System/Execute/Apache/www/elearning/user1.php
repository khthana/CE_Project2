<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>เกี่ยวกับ Password </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<link rel='stylesheet' type='text/css' href='style.css' />
<body>
<?php
if (isset($_SESSION['user']))
{
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$rstatus=mysql_result($result,0,"status");
	$ruid1=mysql_result($result,0,"uid");
}
if(isset($_SESSION['user']) && ($rstatus==2 || $rstatus==1 || $rstatus==0))
{
?>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="28" height="28" align="right"><div align="right"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></div></td>
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2">&nbsp;เกี่ยวกับ 
      Password </font></td>
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
                <td class="defaultfont">Password เป็นรหัสที่ใช้ในการเข้าสู่ระบบ ในกรณีที่ต้องการเปลี่ยน 
                  Password สามารถทำได้โดย หลังจากทำการเข้าสู่ระบบแล้วเข้าไปใน 
                  menu เปลี่ยนรหัสผ่าน</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellpadding="1" cellspacing="2">
                    <tr> 
                      <td width="50%"><img src="logo/user1-1.jpg" width="185" height="69"></td>
                      <td width="50%" class="defaultfont">กรอก Password เก่าและ Password ใหม่ที่ต้องการเปลี่ยน</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellpadding="1" cellspacing="2">
                    <tr> 
                      <td width="50%"><img src="logo/user1-2.jpg" width="90" height="30"></td>
                      <td width="50%" class="defaultfont">กดปุ่มเพื่อทำการเปลี่ยนรหัสผ่าน</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont">กรณีที่ลืม Password สามารถขอ Password ใหม่โดยการเข้า menu 
                  ลืมรหัสผ่านในหน้าแรก </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr>
                      <td width="50%"><img src="logo/user1-3.jpg" width="194" height="47"></td>
                      <td width="50%" class="defaultfont">กรอก UserID และ e-mail ที่ใช้ในการสมัคร</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr>
                      <td width="50%">&nbsp;</td>
                      <td width="50%" class="defaultfont">หลังจากกดปุ่ม send แล้ว Password จะถูกส่งไปยัง e-mail 
                        ที่ใช้ในการสมัคร </td>
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
