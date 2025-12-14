<?php
session_start();
?>
<html>
<head>
<title>รายวิชาของภาควิชาวิศวกรรมคอมพิวเตอร์</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
<script language="JavaScript">
function openwin(url,win_name,features) 
{ 
  window.open(url,win_name,features);
}
</script>
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">รายวิชา</td>
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
        <tr>
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr>
                <td><div align="right"><a href="list.php?sort=1">เรียงตามรหัสวิชา</a></div></td>
                <td width="100" class="defaultfont"><div align="right">|&nbsp;&nbsp;&nbsp;<a href="list.php?sort=2">เรียงตามตัวอักษร</a></div></td>
                <td width="100" class="defaultfont"><div align="right">|&nbsp;&nbsp;&nbsp;<a href="list.php?sort=3">เรียงตามระดับขั้น</a></div></td>
              </tr>
            </table></td>
        </tr>
<?php
include "connectdb.php";
mysql_query("use elearning;");
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
	if($rsublv==1)
	{
?>
        <tr> 
          <td>
<table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr id="#<?php print $rsubcode; ?>" bgcolor="#FFEECC"> 
                <td width="70" class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $rsubcode; ?></a></td>
                <td bgcolor="#FFEECC" class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $renname; ?></a></td>
                <td width="130" class="defaultfont"><a href="list.php?sort=<?php print $sort; ?>#<?php print $rpriority; ?>" target="_self">วิชาบังคับก่อน 
                  : <?php print $rpriority; ?></a></td>
              </tr>
              <tr> 
                <td bgcolor="#FFEECC">&nbsp;</td>
                <td bgcolor="#FFEECC" class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $rthname; ?></a></td>
                <td bgcolor="#FFEECC">&nbsp;</td>
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
              <tr bgcolor="#CCEEFF" id="#<?php print $rsubcode; ?>"> 
                <td width="70" class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $rsubcode; ?></a></td>
                <td class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $renname; ?></a></td>
                <td width="130" class="defaultfont"><a href="list.php?sort=<?php print $sort; ?>#<?php print $rpriority; ?>" target="_self">วิชาบังคับก่อน 
                  : <?php print $rpriority; ?></a></td>
              </tr>
              <tr bgcolor="#CCEEFF"> 
                <td>&nbsp;</td>
                <td bgcolor="#CCEEFF" class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $rthname; ?></a></td>
                <td>&nbsp;</td>
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
              <tr bgcolor="#CCFFEE" id="#<?php print $rsubcode; ?>"> 
                <td width="70" class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $rsubcode; ?></a></td>
                <td bgcolor="#CCFFEE" class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $renname; ?></a></td>
                <td width="130" class="defaultfont"><a href="list.php?sort=<?php print $sort; ?>#<?php print $rpriority; ?>" target="_self">วิชาบังคับก่อน 
                  : <?php print $rpriority; ?></a></td>
              </tr>
              <tr bgcolor="#CCFFEE"> 
                <td>&nbsp;</td>
                <td class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $rthname; ?></a></td>
                <td>&nbsp;</td>
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
              <tr bgcolor="#EEDDFF" id="#<?php print $rsubcode; ?>"> 
                <td width="70" class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $rsubcode; ?></a></td>
                <td class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $renname; ?></a></td>
                <td width="130" class="defaultfont"><a href="list.php?sort=<?php print $sort; ?>#<?php print $rpriority; ?>" target="_self">วิชาบังคับก่อน 
                  : <?php print $rpriority; ?></a></td>
              </tr>
              <tr bgcolor="#EEDDFF"> 
                <td height="22">&nbsp;</td>
                <td bgcolor="#EEDDFF" class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $rthname; ?></a></td>
                <td>&nbsp;</td>
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
              <tr bgcolor="#FFCCBB" id="#<?php print $rsubcode; ?>"> 
                <td width="70" class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $rsubcode; ?></a></td>
                <td bgcolor="#FFCCBB" class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $renname; ?></a></td>
                <td width="130" class="defaultfont"><a href="list.php?sort=<?php print $sort; ?>#<?php print $rpriority; ?>" target="_self">วิชาบังคับก่อน 
                  : <?php print $rpriority; ?></a></td>
              </tr>
              <tr bgcolor="#FFCCBB"> 
                <td>&nbsp;</td>
                <td class="defaultfont"><a href="JavaScript:openwin('description.php?subid=<?php print $rsubid; ?>','','scrollbars=yes,resizable=yes,width=700,height=500')"><?php print $rthname; ?></a></td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <?php
	}
}
mysql_close($db);
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
