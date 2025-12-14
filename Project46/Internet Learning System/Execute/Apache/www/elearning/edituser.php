<?php
session_start();
?>
<html>
<head>
<title>รายชื่อของ user ทั้งหมด</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">รายชื่อของ user ทั้งหมด</td>
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
?>        
		<tr>
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr> 
                <td colspan="3" class="headfont">บุคลากรของภาควิชา <a href="createuser.php?status=1">create</a></td>
              </tr>
              <?php
	$tsql = "select * from userid where status=1 order by uid;";
	$tresult=mysql_query($tsql);
	$tcount=mysql_num_rows($tresult);
	for ($i=0; $i<$tcount; $i++)
	{
		$truid=mysql_result($tresult,$i,"uid");
		$tsql1 = "select * from teacherid where uid='$truid';";
		$tresult1=mysql_query($tsql1);
		$trtname = mysql_result($tresult1,0,"tname");		
?>
              <tr> 
                <td bgcolor="#FFEECC" class="defaultfont"><?php print $trtname; ?></td>
                <td width="60" bgcolor="#FFEECC"><a href="aduedit.php?uid=<?php print $truid; ?>">edit</a></td>
                <td width="65" bgcolor="#FFEECC"><a href="adudelete.php?uid=<?php print $truid; ?>">delete</a></td>
              </tr>
              <?php
	}
?>
              <tr> 
                <td colspan="3" class="headfont">user <a href="createuser.php?status=2">create</a></td>
              </tr>
              <?php
	$usql = "select * from userid where status=2 order by uid;";
	$uresult=mysql_query($usql);
	$ucount=mysql_num_rows($uresult);
	for ($i=0; $i<$ucount; $i++)
	{
		$uruid=mysql_result($uresult,$i,"uid");
		$usql1 = "select * from history where uid='$uruid';";
		$uresult1=mysql_query($usql1);
		$urfristname = mysql_result($uresult1,0,"fristname");
		$urlastname = mysql_result($uresult1,0,"lastname");		
?>
              <tr> 
                <td bgcolor="#FFEECC" class="defaultfont"><?php print $urfristname; ?>&nbsp;&nbsp;<?php print $urlastname; ?></td>
                <td width="50" bgcolor="#FFEECC"><a href="aduedit.php?uid=<?php print $uruid; ?>">edit</a></td>
                <td width="50" bgcolor="#FFEECC"><a href="adudelete.php?uid=<?php print $uruid; ?>">delete</a></td>
              </tr>
              <?php
	}
?>
            </table></td>
        </tr>
<?php
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
<?php
if (isset($_SESSION['user']))
{
	mysql_close($db);
}
?>