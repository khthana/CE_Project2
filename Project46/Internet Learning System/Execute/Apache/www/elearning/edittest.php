<?php
session_start();
if(!$sort)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
<html>
<head>
<title>รายชื่อวิชา จำนวนแบบทดสอบ และผู้ที่ลงทะเบียนทั้งหมด </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">รายชื่อวิชาทั้งหมด</td>
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
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$rstatus=mysql_result($result,0,"status");
}
if(isset($_SESSION['user']) && ($rstatus==0 || $rstatus==1))
{
?>
        <tr>
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr> 
                <td><div align="left"></div>
                  <div align="right"><a href="edittest.php?sort=1">เรียงตามรหัสวิชา</a></div></td>
                <td width="100" class="defaultfont"><div align="right">|&nbsp;&nbsp;&nbsp;<a href="edittest.php?sort=2">เรียงตามตัวอักษร</a></div></td>
                <td width="100" class="defaultfont"><div align="right">|&nbsp;&nbsp;&nbsp;<a href="edittest.php?sort=3">เรียงตามระดับขั้น</a></div></td>
              </tr>
            </table></td>
        </tr>
<?php
include "connectdb.php";
mysql_query("use elearning;");
if($rstatus==0)
{
	if($sort==1)
	{
	$sql = "select * from subject order by subcode;";
	}
	if($sort==2)
	{
	$sql = "select * from subject order by enname;";
	}
	if($sort==3)
	{
	$sql = "select * from subject order by sublv;";
	}
}
else
{
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$ruid=mysql_result($result,0,"uid");
	if($sort==1)
	{
	$sql = "select * from subject where uid='$ruid' order by subcode;";
	}
	if($sort==2)
	{
	$sql = "select * from subject where uid='$ruid' order by enname;";
	}
	if($sort==3)
	{
	$sql = "select * from subject where uid='$ruid' order by sublv;";
	}
}
$result=mysql_query($sql);
$count=mysql_num_rows($result);
for ($i=0; $i<$count; $i++)
{
	$rsubid=mysql_result($result,$i,"subid");
	$rsubcode=mysql_result($result,$i,"subcode");
	$renname=mysql_result($result,$i,"enname");
	$rthname=mysql_result($result,$i,"thname");
	$rpriority=mysql_result($result,$i,"priority");
	$rsublv=mysql_result($result,$i,"sublv");
	$sql1 =  "select * from testsubject where subid='$rsubid';";
	$result1=mysql_query($sql1);
	$count1=mysql_num_rows($result1);
	$sql2 = "select * from userskill where subid='$rsubid';";
	$result2=mysql_query($sql2);
	$count2=mysql_num_rows($result2);
	if($rsublv==1)
	{
?>
        <tr> 
          <td>
<table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr bgcolor="#FFEECC"> 
                <td width="70" class="defaultfont"><?php print $rsubcode; ?></td>
                <td class="defaultfont"><?php print $renname; ?></td>
                <td width="60" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $rsubid; ?>">choice</a></td>
                <td width="65" class="warning"><?php print $count2; ?> <a href="lookups.php?subid=<?php print $rsubid; ?>">person</a></td>
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
                <td class="defaultfont"><?php print $renname; ?></td>                
				<td width="60" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $rsubid; ?>">choice</a></td>
                <td width="65" class="warning"><?php print $count2; ?> <a href="lookups.php?subid=<?php print $rsubid; ?>">person</a></td>
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
                <td width="70" class="defaultfont"><?php print $rsubcode; ?></td>
                <td class="defaultfont"><?php print $renname; ?></td>                
				<td width="60" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $rsubid; ?>">choice</a></td>
                <td width="65" class="warning"><?php print $count2; ?> <a href="lookups.php?subid=<?php print $rsubid; ?>">person</a></td>
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
                <td width="70" class="defaultfont"><?php print $rsubcode; ?></td>
                <td class="defaultfont"><?php print $renname; ?></td>                
				<td width="60" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $rsubid; ?>">choice</a></td>
                <td width="65" class="warning"><?php print $count2; ?> <a href="lookups.php?subid=<?php print $rsubid; ?>">person</a></td>
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
                <td class="defaultfont"><?php print $renname; ?></td>                
				<td width="60" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $rsubid; ?>">choice</a></td>
                <td width="65" class="warning"><?php print $count2; ?> <a href="lookups.php?subid=<?php print $rsubid; ?>">person</a></td>
              </tr>
            </table></td>
        </tr>
        <?php
	}
}
}
else
{
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr> 
                <td class="warning"><div align="center">หน้านี้สำหรับ ผู้บริหาร 
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
if(isset($_SESSION['user']))
{
	mysql_close($db);
}
?>