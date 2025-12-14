<?php
session_start();
if(!$subid)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
<html>
<head>
<title>แสดงรายชื่อ และระดับความสามารถของผู้ที่สามารถลงทะเบียนเรียนวิชานี้</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">รายชื่อผู้ลงทะเบียนเรียนวิชานี้ทั้งหมด</td>
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
	$ruid1=mysql_result($result,0,"uid");
}
if(isset($_SESSION['user']) && ($rstatus==0 || $rstatus==1))
{
	if($rstatus==1)
	{
		$sql = "select * from subject where subid='$subid';";
		$result=mysql_query($sql);
		$ruid2=mysql_result($result,0,"uid");
		if($ruid1!=$ruid2)
		{
			print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
			mysql_close($db);
			exit();
		}
	}
	$sql = "select * from subject where subid='$subid';";
	$result=mysql_query($sql);
	$rsubcode=mysql_result($result,0,"subcode");
	$renname=mysql_result($result,0,"enname");
	$rsublv=mysql_result($result,0,"sublv");
	$sql1 =  "select * from testsubject where subid='$subid';";
	$result1=mysql_query($sql1);
	$count1=mysql_num_rows($result1);
	$sql2 = "select * from userskill where subid='$subid';";
	$result2=mysql_query($sql2);
	$count2=mysql_num_rows($result2);
?>
        <?php
	if($rsublv==1)
	{
?>
        <tr> 
          <td> <table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr bgcolor="#FFEECC"> 
                <td width="70" class="defaultfont"><?php print $rsubcode; ?></td>
                <td width="270" bgcolor="#FFEECC" class="defaultfont"><?php print $renname; ?></td>
                <td width="69" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $subid; ?>">choice</a></td>
                <td width="70" class="warning"><?php print $count2; ?> <a href="lookups.php?subid=<?php print $subid; ?>">person</a></td>
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
                <td width="270" bgcolor="#CCEEFF" class="defaultfont"><?php print $renname; ?></td>
                <td width="69" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $subid; ?>">choice</a></td>
                <td width="70" class="warning"><?php print $count2; ?> <a href="lookups.php?subid=<?php print $subid; ?>">person</a></td>
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
                <td width="270" class="defaultfont"><?php print $renname; ?></td>
                <td width="69" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $subid; ?>">choice</a></td>
                <td width="70" class="warning"><?php print $count2; ?> <a href="lookups.php?subid=<?php print $subid; ?>">person</a></td>
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
                <td width="270" class="defaultfont"><?php print $renname; ?></td>
                <td width="69" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $subid; ?>">choice</a></td>
                <td width="70" class="warning"><?php print $count2; ?> <a href="lookups.php?subid=<?php print $subid; ?>">person</a></td>
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
                <td width="270" bgcolor="#FFCCBB" class="defaultfont"><?php print $renname; ?></td>
                <td width="69" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $subid; ?>">choice</a></td>
                <td width="70" class="warning"><?php print $count2; ?> <a href="lookups.php?subid=<?php print $subid; ?>">person</a></td>
              </tr>
            </table></td>
        </tr>
        <?php
	}
?>
        <tr> 
          <td> <table width="100%" border="0" cellpadding="1" cellspacing="1">
              <?php
	$sql = "select * from userskill where subid='$subid' order by lvget;";
	$result=mysql_query($sql);
	$count=mysql_num_rows($result);
?>
              <tr> 
                <td width="70" class="headfont">level</td>
                <td width="200" class="headfont">ชื่อ - นามสกุล</td>
                <td width="70" class="headfont">ชื่อเล่น</td>
                <td width="140" class="headfont">E-mail</td>
              </tr>
              <?php
	for($i=0; $i<$count; $i++)
	{
		$ruid=mysql_result($result,$i,"uid");
		$rlvget=mysql_result($result,$i,"lvget");
		$sql1 = "select * from history where uid='$ruid';";
		$result1=mysql_query($sql1);
		$rfristname=mysql_result($result1,0,"fristname");
		$rlastname=mysql_result($result1,0,"lastname");
		$rnickname=mysql_result($result1,0,"nickname");
		$remail=mysql_result($result1,0,"email");
		
?>
              <tr bgcolor="#FFEECC"> 
                <td width="70" class="warning"><?php print $rlvget; ?></td>
                <td width="200" class="defaultfont"><?php print $rfristname; ?>&nbsp;&nbsp;<?php print $rlastname; ?></td>
                <td width="70" class="defaultfont"><?php print $rnickname; ?></td>
                <td width="140" class="defaultfont"><a href="mailto:<?php print $remail; ?>"><?php print $remail; ?></a></td>
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
          <td> <table width="100%" border="0" cellpadding="1" cellspacing="1">
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