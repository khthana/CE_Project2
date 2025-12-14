<?php
session_start();
?>
<html>
<head>
<title>แสดง ระดับความสามารถของ skill แต่ละวิชาของ user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">Status</td>
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
//if($_SESSION['user'])
if (isset($_SESSION['user']))
//if(session_is_registered("user"))
{
include "connectdb.php";
mysql_query("use elearning;");
$sql = "select * from userid where user='$user';";
$result=mysql_query($sql);
$ruid=mysql_result($result,0,"uid");
$sql = "select * from history where uid='$ruid';";
$result=mysql_query($sql);
$rfristname=mysql_result($result,0,"fristname");
$rlastname=mysql_result($result,0,"lastname");
$rnickname=mysql_result($result,0,"nickname");
$remail=mysql_result($result,0,"email");
?>        
		<tr> 
          <td>
		  <table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr> 
                <td bgcolor="#FFCC99" class="headfont">ชื่อ</td>
                <td bgcolor="#FFEECC" class="defaultfont"><?php print $rfristname; ?></td>
              </tr>
              <tr> 
                <td bgcolor="#FFCC99" class="headfont">นามสกุล</td>
                <td bgcolor="#FFEECC" class="defaultfont"><?php print $rlastname; ?></td>
              </tr>
              <tr> 
                <td bgcolor="#FFCC99" class="headfont">ชื่อเล่น</td>
                <td bgcolor="#FFEECC" class="defaultfont"><?php print $rnickname; ?></td>
              </tr>
              <tr> 
                <td width="18%" bgcolor="#FFCC99" class="headfont">E-mail</td>
                <td width="82%" bgcolor="#FFEECC" class="defaultfont"><?php print $remail; ?></td>
              </tr>
              <tr> 
                <td colspan="2" bgcolor="#FFCC99" class="headfont">Skill</td>
              </tr>
			  <tr>
                <td height="24" colspan="2">
				<table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <?php
$sql = "select * from userskill where uid='$ruid' order by subid;";
$result=mysql_query($sql);
$count=mysql_num_rows($result);
for ($i=0; $i<$count; $i++)
{
	$rsubid=mysql_result($result,$i,"subid");
	$rlvget=mysql_result($result,$i,"lvget");
	$sql = "select * from subject where subid='$rsubid';";
	$res=mysql_query($sql);
	$rsubcode=mysql_result($res,0,"subcode");
	$renname=mysql_result($res,0,"enname");
	$rthname=mysql_result($res,0,"thname");
?>
                    <tr> 
                      <td width="50" class="defaultfont"><?php print $rsubcode; ?></td>
                      <td class="defaultfont"><?php print $renname; ?></td>
                      <td class="defaultfont"><?php print $rthname; ?></td>
                      <td width="30" class="warning">lv.<?php print $rlvget; ?></td>
                    </tr>
                    <?php
}
?>
                  </table>
				  </td>
              </tr>
            </table>
			</td>
        </tr>
<?php
mysql_close($db);
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