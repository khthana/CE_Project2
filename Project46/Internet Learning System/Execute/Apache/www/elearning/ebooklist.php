<?php
session_start();
?>
<html>
<head>
<title>Temp of elearning</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">แบบเรียนทั้งหมด</td>
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
$rstatus=mysql_result($result,0,"status");
}
if (isset($_SESSION['user']) && $rstatus==2)
{
	$sql = "select * from subject where subid='$subid';";
	$result=mysql_query($sql);
	$rsubcode=mysql_result($result,0,"subcode");
	$renname=mysql_result($result,0,"enname");
	$rthname=mysql_result($result,0,"thname");
	$rsublv=mysql_result($result,0,"sublv");
?>
        <?php
	if($rsublv==1)
	{
?>
        <tr> 
          <td> <table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr bgcolor="#FFEECC"> 
                <td width="70" class="defaultfont"><?php print $rsubcode; ?></td>
                <td width="134" bgcolor="#FFEECC" class="defaultfont"><?php print $renname; ?></td>
                <td width="135" bgcolor="#FFEECC" class="defaultfont"><? print $rthname; ?></td>
              </tr>
            </table></td>
        </tr>
        <?php
	}
	if($rsublv==2)
	{
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr bgcolor="#CCEEFF"> 
                <td width="70" class="defaultfont"><?php print $rsubcode; ?></td>
                <td width="134" bgcolor="#CCEEFF" class="defaultfont"><?php print $renname; ?></td>
                <td width="135" bgcolor="#CCEEFF" class="defaultfont"><? print $rthname; ?></td>
              </tr>
            </table></td>
        </tr>
        <?php
	}
	if($rsublv==3)
	{
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr bgcolor="#CCFFEE"> 
                <td width="70" bgcolor="#CCFFEE" class="defaultfont"><?php print $rsubcode; ?></td>
                <td width="134" class="defaultfont"><?php print $renname; ?></td>
                <td width="135" class="defaultfont"><? print $rthname; ?></td>
              </tr>
            </table></td>
        </tr>
        <?php
	}
	if($rsublv==4)
	{
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr bgcolor="#EEDDFF"> 
                <td width="70" height="20" bgcolor="#EEDDFF" class="defaultfont"><?php print $rsubcode; ?></td>
                <td width="134" class="defaultfont"><?php print $renname; ?></td>
                <td width="135" class="defaultfont"><? print $rthname; ?></td>
              </tr>
            </table></td>
        </tr>
        <?php
	}
	if($rsublv==5)
	{
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr bgcolor="#FFCCBB"> 
                <td width="70" class="defaultfont"><?php print $rsubcode; ?></td>
                <td width="134" bgcolor="#FFCCBB" class="defaultfont"><?php print $renname; ?></td>
                <td width="135" bgcolor="#FFCCBB" class="defaultfont"><? print $rthname; ?></td>
              </tr>
            </table></td>
        </tr>
        <?php
	}
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <?php
	$sql = "select * from ebooksubject where subid='$subid';";
	$result=mysql_query($sql);
	$count=mysql_num_rows($result);
	if($count!=0)
	{
		for ($i=0; $i<$count; $i++)
		{
			$rebookid=mysql_result($result,$i,"ebookid");		
			$rebookname=mysql_result($result,$i,"ebookname");
			$rebookpart=mysql_result($result,$i,"ebookpart");

?>
              <tr> 
                <td><a href="<? print $rebookpart;?>" target="_blank"><? print $rebookname?></a></td>
              </tr>
              <?php
		}
	}
	else
	{
?>
              <tr> 
                <td class="warning"><div align="center">ยังไม่มีแบบเรียนในวิชานี้</div></td>
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