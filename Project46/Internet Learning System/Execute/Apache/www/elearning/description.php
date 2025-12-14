<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>รายละเอียดของวิชา</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<link rel='stylesheet' type='text/css' href='style.css' />
<body>
<?php
include "connectdb.php";
mysql_query("use elearning;");
$sql = "select * from subject where subid='$subid';";
$result=mysql_query($sql);
$rsubcode=mysql_result($result,0,"subcode");
$renname=mysql_result($result,0,"enname");
$rthname=mysql_result($result,0,"thname");
$rendescript=mysql_result($result,0,"endescript");
$rthdescript=mysql_result($result,0,"thdescript");
$rsubbook=mysql_result($result,0,"subbook");
$ruid=mysql_result($result,0,"uid");
$rpriority=mysql_result($result,0,"priority");
$rprioritylv=mysql_result($result,0,"prioritylv");
$rsublv=mysql_result($result,0,"sublv");
$sql = "select * from teacherid where uid='$ruid';";
$result=mysql_query($sql);
$rtname=mysql_result($result,0,"tname");
?>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="28" height="28" align="right"><div align="right"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></div></td>
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2"><strong>รายละเอียดของวิชา 
      <?php print $renname; ?></strong></font></td>
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
<?php
if($rsublv==1)
{
?>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="32%" bgcolor="#FFEECC" class="headfont">รหัสวิชา</td>
                      <td width="68%" class="defaultfont"><?php print $rsubcode; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFEECC" class="headfont">ชื่อวิชาภาษาอังกฤษ</td>
                      <td class="defaultfont"><?php print $renname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFEECC" class="headfont">ชื่อวิชาภาษาไทย</td>
                      <td class="defaultfont"><?php print $rthname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFEECC" class="headfont">หนังสือที่ใช้</td>
                      <td class="defaultfont"><?php print $rsubbook; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFEECC" class="headfont">อาจารย์ผู้สอน</td>
                      <td class="defaultfont"><?php print $rtname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFEECC" class="headfont">วิชาบังคับก่อน</td>
                      <td class="defaultfont"><?php print $rpriority; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFEECC" class="headfont">เกณฑ์การผ่านของวิชานี้</td>
                      <td class="defaultfont">Lv. <?php print $rprioritylv; ?></td>
                    </tr>
                    <tr bgcolor="#FFEECC"> 
                      <td colspan="2" class="headfont">รายละเอียดวิชาภาษาอังกฤษ</td>
                    </tr>
                    <tr> 
                      <td colspan="2" class="defaultfont"><?php print $rendescript; ?></td>
                    </tr>
                    <tr bgcolor="#FFEECC"> 
                      <td colspan="2" class="headfont">รายละเอียดวิชาภาษาไทย</td>
                    </tr>
                    <tr> 
                      <td colspan="2" class="defaultfont"><?php print $rthdescript; ?></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
<?php
}
if($rsublv==2)
{
?>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="32%" bgcolor="#CCEEFF" class="headfont">รหัสวิชา</td>
                      <td width="68%" class="defaultfont"><?php print $rsubcode; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#CCEEFF" class="headfont">ชื่อวิชาภาษาอังกฤษ</td>
                      <td class="defaultfont"><?php print $renname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#CCEEFF" class="headfont">ชื่อวิชาภาษาไทย</td>
                      <td class="defaultfont"><?php print $rthname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#CCEEFF" class="headfont">หนังสือที่ใช้</td>
                      <td class="defaultfont"><?php print $rsubbook; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#CCEEFF" class="headfont">อาจารย์ผู้สอน</td>
                      <td class="defaultfont"><?php print $rtname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#CCEEFF" class="headfont">วิชาบังคับก่อน</td>
                      <td class="defaultfont"><?php print $rpriority; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#CCEEFF" class="headfont">เกณฑ์การผ่านของวิชานี้</td>
                      <td class="defaultfont">Lv. <?php print $rprioritylv; ?></td>
                    </tr>
                    <tr bgcolor="#CCEEFF"> 
                      <td colspan="2" class="headfont">รายละเอียดวิชาภาษาอังกฤษ</td>
                    </tr>
                    <tr> 
                      <td colspan="2" class="defaultfont"><?php print $rendescript; ?></td>
                    </tr>
                    <tr bgcolor="#CCEEFF"> 
                      <td colspan="2" class="headfont">รายละเอียดวิชาภาษาไทย</td>
                    </tr>
                    <tr> 
                      <td colspan="2" class="defaultfont"><?php print $rthdescript; ?></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
<?php
}
if($rsublv==3)
{
?>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="32%" bgcolor="#BBFFBB" class="headfont">รหัสวิชา</td>
                      <td width="68%" class="defaultfont"><?php print $rsubcode; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#BBFFBB" class="headfont">ชื่อวิชาภาษาอังกฤษ</td>
                      <td class="defaultfont"><?php print $renname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#BBFFBB" class="headfont">ชื่อวิชาภาษาไทย</td>
                      <td class="defaultfont"><?php print $rthname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#BBFFBB" class="headfont">หนังสือที่ใช้</td>
                      <td class="defaultfont"><?php print $rsubbook; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#BBFFBB" class="headfont">อาจารย์ผู้สอน</td>
                      <td class="defaultfont"><?php print $rtname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#BBFFBB" class="headfont">วิชาบังคับก่อน</td>
                      <td class="defaultfont"><?php print $rpriority; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#BBFFBB" class="headfont">เกณฑ์การผ่านของวิชานี้</td>
                      <td class="defaultfont">Lv. <?php print $rprioritylv; ?></td>
                    </tr>
                    <tr bgcolor="#BBFFBB"> 
                      <td colspan="2" class="headfont">รายละเอียดวิชาภาษาอังกฤษ</td>
                    </tr>
                    <tr> 
                      <td colspan="2" class="defaultfont"><?php print $rendescript; ?></td>
                    </tr>
                    <tr bgcolor="#BBFFBB"> 
                      <td colspan="2" class="headfont">รายละเอียดวิชาภาษาไทย</td>
                    </tr>
                    <tr> 
                      <td colspan="2" class="defaultfont"><?php print $rthdescript; ?></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
<?php
}
if($rsublv==4)
{
?>
              <tr>
                <td>&nbsp;</td>
                <td><table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="32%" bgcolor="#EECCFF" class="headfont">รหัสวิชา</td>
                      <td width="68%" class="defaultfont"><?php print $rsubcode; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#EECCFF" class="headfont">ชื่อวิชาภาษาอังกฤษ</td>
                      <td class="defaultfont"><?php print $renname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#EECCFF" class="headfont">ชื่อวิชาภาษาไทย</td>
                      <td class="defaultfont"><?php print $rthname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#EECCFF" class="headfont">หนังสือที่ใช้</td>
                      <td class="defaultfont"><?php print $rsubbook; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#EECCFF" class="headfont">อาจารย์ผู้สอน</td>
                      <td class="defaultfont"><?php print $rtname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#EECCFF" class="headfont">วิชาบังคับก่อน</td>
                      <td class="defaultfont"><?php print $rpriority; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#EECCFF" class="headfont">เกณฑ์การผ่านของวิชานี้</td>
                      <td class="defaultfont">Lv. <?php print $rprioritylv; ?></td>
                    </tr>
                    <tr bgcolor="#EECCFF"> 
                      <td colspan="2" class="headfont">รายละเอียดวิชาภาษาอังกฤษ</td>
                    </tr>
                    <tr> 
                      <td colspan="2" class="defaultfont"><?php print $rendescript; ?></td>
                    </tr>
                    <tr bgcolor="#EECCFF"> 
                      <td colspan="2" class="headfont">รายละเอียดวิชาภาษาไทย</td>
                    </tr>
                    <tr> 
                      <td colspan="2" class="defaultfont"><?php print $rthdescript; ?></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
<?php
}
if($rsublv==5)
{
?>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="32%" bgcolor="#FFCC99" class="headfont">รหัสวิชา</td>
                      <td width="68%" class="defaultfont"><?php print $rsubcode; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFCC99" class="headfont">ชื่อวิชาภาษาอังกฤษ</td>
                      <td class="defaultfont"><?php print $renname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFCC99" class="headfont">ชื่อวิชาภาษาไทย</td>
                      <td class="defaultfont"><?php print $rthname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFCC99" class="headfont">หนังสือที่ใช้</td>
                      <td class="defaultfont"><?php print $rsubbook; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFCC99" class="headfont">อาจารย์ผู้สอน</td>
                      <td class="defaultfont"><?php print $rtname; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFCC99" class="headfont">วิชาบังคับก่อน</td>
                      <td class="defaultfont"><?php print $rpriority; ?></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFCC99" class="headfont">เกณฑ์การผ่านของวิชานี้</td>
                      <td class="defaultfont">Lv. <?php print $rprioritylv; ?></td>
                    </tr>
                    <tr bgcolor="#FFCC99"> 
                      <td colspan="2" class="headfont">รายละเอียดวิชาภาษาอังกฤษ</td>
                    </tr>
                    <tr> 
                      <td colspan="2" class="defaultfont"><?php print $rendescript; ?></td>
                    </tr>
                    <tr bgcolor="#FFCC99"> 
                      <td colspan="2" class="headfont">รายละเอียดวิชาภาษาไทย</td>
                    </tr>
                    <tr> 
                      <td colspan="2" class="defaultfont"><?php print $rthdescript; ?></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
<?php
}
mysql_close($db);
?>
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
</body>
</html>
