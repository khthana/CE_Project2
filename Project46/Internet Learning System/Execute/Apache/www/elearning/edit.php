<?php
session_start();
?>
<html>
<head>
<title>แก้ไขข้อมูลส่วนตัว</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">แก้ไขข้อมูลส่วนตัว</td>
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
    <td colspan="2" valign="top"><table width="100%" height="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#FF9900">
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
//if($_SESSION['user'])
if (isset($_SESSION['user']))
//if(session_is_registered("user"))
{
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$ruid=mysql_result($result,0,"uid");
//	$ruser=mysql_result($result,0,"user");
	$rpass=mysql_result($result,0,"pass");
	$rstatus=mysql_result($result,0,"status");
	if($rstatus==1)
	{
		$sql = "select * from teacherid where uid='$ruid';";
		$result=mysql_query($sql);
		$rtname=mysql_result($result,0,"tname");
		$rtroom=mysql_result($result,0,"troom");
		$rttel=mysql_result($result,0,"ttel");	
		$rtemail=mysql_result($result,0,"temail");
	}
	if($rstatus==2)
	{
		$sql = "select * from history where uid='$ruid';";
		$result=mysql_query($sql);
		$rfristname=mysql_result($result,0,"fristname");
		$rlastname=mysql_result($result,0,"lastname");
		$rnickname=mysql_result($result,0,"nickname");	
		$remail=mysql_result($result,0,"email");
	}
?>
        <tr>
          <td>
<?php
	if($rstatus==1)
	{
?>
			<form name="form1" method="post" action="update.php?status=1">
              <table width="100%" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td width="12%" bgcolor="#FFCC99" class="headfont">ชื่อ-นามสกุล*</td>
                  <td bgcolor="#FFEECC" class="defaultfont"><input name="tname" type="text" id="tname" value="<?php print $rtname; ?>" maxlength="50"> 
                  </td>
                </tr>
                <tr>
                  <td bgcolor="#FFCC99" class="headfont">ห้องพัก</td>
                  <td bgcolor="#FFEECC" class="defaultfont"><input name="troom" type="text" id="troom" value="<?php print $rtroom; ?>" maxlength="40"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">เบอร์ติดต่อ</td>
                  <td bgcolor="#FFEECC" class="defaultfont"><input name="ttel" type="text" id="ttel" value="<?php print $rttel; ?>" maxlength="25"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">E-mail*</td>
                  <td bgcolor="#FFEECC" class="defaultfont"><input name="temail" type="text" id="temail" value="<?php print $rtemail; ?>" maxlength="30">
                    (เพื่อใช้ในการติดต่อ และลืมรหัสผ่าน) </td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">username*</td>
                  <td bgcolor="#FFEECC" class="defaultfont"><input name="user" type="text" disabled id="user" value="<?php print $user; ?>" maxlength="20"> 
                  </td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">password*</td>
                  <td bgcolor="#FFEECC" class="defaultfont"><input name="pass1" type="password" id="pass1" maxlength="40"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">password*</td>
                  <td bgcolor="#FFEECC" class="defaultfont"><input name="pass2" type="password" id="pass2" maxlength="40">
                    (กรุณาใส่ password เพื่อยืนยันการเปลี่ยนแปลง)</td>
                </tr>
                <tr> 
                  <td colspan="2"><div align="center"> 
                      <input name="update" type="submit" id="update" value="update">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      <input name="clear" type="reset" id="clear" value="clear">
                    </div></td>
                </tr>
              </table>
			</form>
<?php
	}
?>
<?php
	if($rstatus==2)
	{
?>
			<form name="form1" method="post" action="update.php?status=2">
              <table width="100%" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td width="12%" bgcolor="#FFCC99" class="headfont">ชื่อ*</td>
                  <td width="34%" bgcolor="#FFEECC" class="defaultfont"><input name="fristname" type="text" id="fristname" value="<?php print $rfristname; ?>" maxlength="30"></td>
                  <td width="13%" bgcolor="#FFCC99" class="headfont">นามสกุล*</td>
                  <td width="41%" bgcolor="#FFEECC" class="defaultfont"><input name="lastname" type="text" id="lastname" value="<?php print $rlastname; ?>" maxlength="30"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont" >ชื่อเล่น*</td>
                  <td colspan="3" bgcolor="#FFEECC" class="defaultfont"><input name="nickname" type="text" id="nickname" value="<?php print $rnickname; ?>" maxlength="30"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">E-mail*</td>
                  <td colspan="3" bgcolor="#FFEECC" class="defaultfont"><input name="email" type="text" id="email" value="<?php print $remail; ?>" maxlength="30">
                    (เพื่อใช้ในการติดต่อ และลืมรหัสผ่าน) </td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">username*</td>
                  <td colspan="3" bgcolor="#FFEECC" class="defaultfont"><input name="user" type="text" disabled id="user" value="<?php print $user; ?>" maxlength="20"> 
                  </td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">password*</td>
                  <td colspan="3" bgcolor="#FFEECC" class="defaultfont"><input name="pass1" type="password" id="pass1" maxlength="40"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">password*</td>
                  <td colspan="3" bgcolor="#FFEECC" class="defaultfont"><input name="pass2" type="password" id="pass2" maxlength="40">
                    (กรุณาใส่ password เพื่อยืนยันการเปลี่ยนแปลง)</td>
                </tr>
                <tr> 
                  <td colspan="4"><div align="center"> 
                      <input name="update" type="submit" id="update" value="update">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      <input name="clear" type="reset" id="clear" value="clear">
                    </div></td>
                </tr>
              </table>
			</form>
<?php
	}
?>
            </td>
        </tr>
<?php
	mysql_close($db);
}
else
{
?>        
		<tr>
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
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
</body>
</html>