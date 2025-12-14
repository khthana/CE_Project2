<?php
session_start();
if(!$status)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
<html>
<head>
<title>ท่านกำลังต้องการสร้าง user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">สร้าง user ใหม่</td>
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
            <?php
	  include "log.php"; 
	  ?>
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
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
<?php
if (isset($_SESSION['user']))
{
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$rstatus=mysql_result($result,0,"status");
}
if(isset($_SESSION['user']) && $rstatus==0)
{
	if($status==1)
	{
?>
		<tr> 
          <td><form name="form1" method="post" action="createu.php?status=1">
              <table width="100%" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td width="20%" bgcolor="#FFCC99" class="headfont">&nbsp;ชื่อ-นามสกุล 
                    *</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><input name="tname" type="text" id="tname" maxlength="50"> 
                  </td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ห้องพัก</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><input name="troom" type="text" id="troom" maxlength="40"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;เบอร์ติดต่อ</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><input name="ttel" type="text" id="ttel" maxlength="25"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;E-mail *</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><input name="temail" type="text" id="temail" maxlength="30">
                    &nbsp;(เพื่อใช้ในการติดต่อ และลืมรหัสผ่าน)</td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;UserID *</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><input name="cuser" type="text" id="cuser" maxlength="20"> 
                  </td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;Password *</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><input name="pass1" type="password" id="pass1" maxlength="40"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;Password *</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><input name="pass2" type="password" id="pass2" maxlength="40">
                    &nbsp;(กรุณาใส่ password อีกครั้ง)</td>
                </tr>
                <tr> 
                  <td class="warning">&nbsp;ยืนยัน</td>
                  <td width="28%" class="warning">Password Admin *</td>
                  <td width="58%" class="defaultfont"><input name="adpass" type="password" id="adpass" maxlength="40"></td>
                </tr>
                <tr> 
                  <td colspan="3"><div align="center"> 
                      <input name="create" type="submit" id="create" value="create">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      <input name="clear" type="reset" id="clear" value="clear">
                    </div></td>
                </tr>
              </table>
            </form></td>
        </tr>
<?php
	}
	if($status==2)
	{
?>  
        <tr> 
          <td><form name="form1" method="post" action="createu.php?status=2">
              <table width="100%" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td width="20%" bgcolor="#FFCC99" class="headfont">&nbsp;ชื่อ 
                    *</td>
                  <td width="30%" bgcolor="#FFEECC" class="defaultfont"><input name="fristname" type="text" id="fristname4" maxlength="30"></td>
                  <td width="20%" bgcolor="#FFCC99" class="headfont">&nbsp;นามสกุล 
                    *</td>
                  <td width="30%" bgcolor="#FFEECC" class="defaultfont"><input name="lastname" type="text" id="lastname" maxlength="30"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont" >&nbsp;ชื่อเล่น *</td>
                  <td colspan="3" bgcolor="#FFEECC" class="defaultfont"><input name="nickname" type="text" id="nickname" maxlength="30"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;E-mail *</td>
                  <td colspan="3" bgcolor="#FFEECC" class="defaultfont"><input name="email" type="text" id="email2" maxlength="30">
                    &nbsp;(เพื่อใช้ในการติดต่อ และลืมรหัสผ่าน)</td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;UserID *</td>
                  <td colspan="3" bgcolor="#FFEECC" class="defaultfont"><input name="cuser" type="text" id="user2" maxlength="20"> 
                  </td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;Password *</td>
                  <td colspan="3" bgcolor="#FFEECC" class="defaultfont"><input name="pass1" type="password" id="pass12" maxlength="40"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;Password *</td>
                  <td colspan="3" bgcolor="#FFEECC" class="defaultfont"><input name="pass2" type="password" id="pass22" maxlength="40">
                    &nbsp;(กรุณาใส่ password อีกครั้ง)</td>
                </tr>
                <tr> 
                  <td class="warning">&nbsp;ยืนยัน</td>
                  <td class="warning">Password Admin *</td>
                  <td colspan="2"><input name="adpass" type="password" id="adpass" maxlength="40"></td>
                </tr>
                <tr> 
                  <td colspan="4"><div align="center"> 
                      <input name="create" type="submit" id="create" value="create">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      <input name="clear" type="reset" id="clear2" value="clear">
                    </div></td>
                </tr>
              </table>
            </form></td>
        </tr>
<?php
	}
}
else
{
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr> 
                <td class="warning"><div align="center">หน้านี้สำหรับ Administator 
                    เท่านั้น</div></td>
              </tr>
            </table></td>
        </tr>
<?php
}
?>
      </table></td>
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
<?php
if (isset($_SESSION['user']))
{
	mysql_close($db);
}
?>