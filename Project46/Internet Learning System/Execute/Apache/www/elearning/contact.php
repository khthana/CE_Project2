<?php
session_start();
?>
<html>
<head>
<title>ติดต่อกับบุคลากรของภาควิชา</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">ติดต่อบุคลากรของภาควิชา</td>
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
    <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
<?php
include "connectdb.php";
mysql_query("use elearning;");
$sql = "select * from teacherid order by uid;";
$result=mysql_query($sql);
$count=mysql_num_rows($result);
$rtname=mysql_result($result,0,"tname");
$rtroom=mysql_result($result,0,"troom");
$rttel=mysql_result($result,0,"ttel");
$rtemail=mysql_result($result,0,"temail");
?>        
		<tr bgcolor="#FFEECC"> 
          <td width="25%" class="defaultfont"> &nbsp;<?php print $rtname; ?></td>
          <td width="18%" class="defaultfont"><?php print $rtroom; ?></td>
          <td width="19%" class="defaultfont"><?php print $rttel; ?></td>
          <td width="25%" class="defaultfont"><a href="mailto:<?php print $rtemail; ?>"><?php print $rtemail; ?></a></td>
        </tr>
        <tr> 
          <td class="headfont">บุคลากรของภาควิชา</td>
          <td class="headfont">ห้องทำงาน</td>
          <td class="headfont">เบอร์โทรศัพท์</td>
          <td class="headfont">E-mail</td>
        </tr>
<?php
for($i=1; $i<$count; $i++)
{
	$rtname=mysql_result($result,$i,"tname");
	$rtroom=mysql_result($result,$i,"troom");
	$rttel=mysql_result($result,$i,"ttel");
	$rtemail=mysql_result($result,$i,"temail");
?>		
        <tr bgcolor="#FFEECC"> 
          <td height="18" bgcolor="#FFEECC" class="defaultfont">&nbsp;<?php print $rtname; ?></td>
          <td class="defaultfont"><?php print $rtroom; ?></td>
          <td class="defaultfont"><?php print $rttel; ?></td>
          <td class="defaultfont"><a href="mailto:<?php print $rtemail; ?>"><?php print $rtemail; ?></a></td>
        </tr>
<?php
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
</body>
</html>
