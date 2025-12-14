<?php
session_start();
?>
<html>
<head>
<title>ท่านกำลังทำการสร้างรายวิชาใหม่</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">สร้างรายวิชาใหม่</td>
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
if(isset($_SESSION['user']) && $rstatus==0)
{
?>        
		<tr> 
          <td><form name="form1" method="post" action="creates.php" ENCTYPE="multipart/form-data">
              <table width="100%" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td width="30%" bgcolor="#FFCC99" class="headfont">&nbsp;รหัสวิชา 
                    *</td>
                  <td width="69%" bgcolor="#FFEECC"><input name="subcode" type="text" id="subcode" size="10" maxlength="8"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ชื่อวิชาภาษาอังกฤษ 
                    * </td>
                  <td bgcolor="#FFEECC"><input name="enname" type="text" id="enname" size="40" maxlength="50"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ชื่อวิชาภาษาไทย 
                    * </td>
                  <td bgcolor="#FFEECC"><input name="thname" type="text" id="thname" size="40" maxlength="50"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;หนังสือที่ใช้</td>
                  <td bgcolor="#FFEECC"><input name="subbook" type="text" id="subbook" size="40" maxlength="50"></td>
                </tr>
                <?php
	$sql = "select * from teacherid order by uid";
	$result=mysql_query($sql);
	$count=mysql_num_rows($result);
?>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;อาจารย์ผู้สอน</td>
                  <td bgcolor="#FFEECC"><select name="uid" id="uid">
                      <?php
	for($i=0; $i<$count; $i++)
	{
		$ruid=mysql_result($result,$i,"uid");
		$rtname=mysql_result($result,$i,"tname");
?>
                      <option value="<?php print $ruid; ?>"><?php print $rtname; ?></option>
                      <?php
	}
?>
                    </select> </td>
                </tr>
                <?php
	$sql = "select * from subject order by subcode";
	$result=mysql_query($sql);
	$count=mysql_num_rows($result);
?>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;วิชาบังคับก่อน 
                    *</td>
                  <td bgcolor="#FFEECC"><select name="priority" id="priority">
                      <option value="none">none</option>
                      <?php
	for($i=0; $i<$count; $i++)
	{
		$rsubcode=mysql_result($result,$i,"subcode");
		$renname=mysql_result($result,$i,"enname");
?>
                      <option value="<?php print $rsubcode; ?>"><?php print $rsubcode; ?> 
                      <?php print $renname; ?></option>
                      <?php
	}
?>
                    </select></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;เกณฑ์การผ่านของวิชานี้ 
                    *</td>
                  <td bgcolor="#FFEECC"><select name="prioritylv" id="prioritylv">
                      <option value="0" selected>lv.0</option>
                      <option value="1">lv.1</option>
                      <option value="2">lv.2</option>
                      <option value="3">lv.3</option>
                      <option value="4">lv.4</option>
                      <option value="5">lv.5</option>
                      <option value="6">lv.6</option>
                      <option value="7">lv.7</option>
                      <option value="8">lv.8</option>
                      <option value="9">lv.9</option>
                      <option value="10">lv.10</option>
                    </select></td>
                </tr>
                <tr bgcolor="#FFCC99"> 
                  <td colspan="2" class="headfont">&nbsp;รายละเอียดวิชาภาษาอังกฤษ</td>
                </tr>
                <tr bgcolor="#FFEECC"> 
                  <td colspan="2"><textarea name="endescript" cols="80" rows="3" id="endescript"></textarea></td>
                </tr>
                <tr bgcolor="#FFCC99"> 
                  <td colspan="2" class="headfont"> &nbsp;รายละเอียดวิชาภาษาไทย</td>
                </tr>
                <tr bgcolor="#FFEECC"> 
                  <td colspan="2"><textarea name="thdescript" cols="80" rows="3" id="thdescript"></textarea></td>
                </tr>
                <tr> 
                  <td colspan="2"><div align="center"> 
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