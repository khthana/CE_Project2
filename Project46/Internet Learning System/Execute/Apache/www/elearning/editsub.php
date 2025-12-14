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
<title>ท่านกำลังทำการเปลี่ยนแปลงรายละเอียดของวิชา</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">แก้ไขรายวิชา</td>
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
	$ruid=mysql_result($result,0,"uid");
	$rstatus=mysql_result($result,0,"status");
}
if(isset($_SESSION['user']) && ($rstatus==0))
{
	if($rstatus==1)
	{
		$sql = "select * from subject where subid='$subid';";
		$result=mysql_query($sql);
		$ruid2=mysql_result($result,0,"uid");
		if($ruid!=$ruid2)
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
	$rthname=mysql_result($result,0,"thname");
	$rendescript=mysql_result($result,0,"endescript");
	$rthdescript=mysql_result($result,0,"thdescript");
	$rsubbook=mysql_result($result,0,"subbook");
//	$rsubpart=mysql_result($result,0,"subpart");
	$teaed=mysql_result($result,0,"uid");
	$subed=mysql_result($result,0,"priority");
	$lved=mysql_result($result,0,"prioritylv");
?>        
		<tr> 
          <td><form name="form1" method="post" action="adsedit.php?subid=<?php print $subid; ?>" ENCTYPE="multipart/form-data">
              <table width="100%" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td width="30%" bgcolor="#FFCC99" class="headfont">&nbsp;รหัสวิชา 
                    *</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><input name="subcode" type="text" id="subcode" value="<?php print $rsubcode; ?>" size="10" maxlength="8" <? if($rstatus!=0) {?>readonly="readonly"<? } ?>></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ชื่อวิชาภาษาอังกฤษ 
                    * </td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><input name="enname" type="text" id="enname" value="<?php print $renname; ?>" size="40" maxlength="50" <? if($rstatus!=0) {?>readonly="readonly"<? } ?>></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ชื่อวิชาภาษาไทย 
                    * </td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><input name="thname" type="text" id="thname" value="<?php print $rthname; ?>" size="40" maxlength="50" <? if($rstatus!=0) {?>readonly="readonly"<? } ?>></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;หนังสือที่ใช้</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><input name="subbook" type="text" id="subbook" value="<?php print $rsubbook; ?>" size="40" maxlength="50"></td>
                </tr>
                <?php
	$sql = "select * from teacherid order by uid";
	$result=mysql_query($sql);
	$count=mysql_num_rows($result);
?>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;อาจารย์ผู้สอน</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"> 
                    <?php
if($rstatus==0)
{
?>
                    <select name="uid" id="uid">
                      <?php
	for($i=0; $i<$count; $i++)
	{
		$ruid=mysql_result($result,$i,"uid");
		$rtname=mysql_result($result,$i,"tname");
?>
                      <option value="<?php print $ruid; ?>" <?php if($ruid==$teaed) {print 'selected';} ?>><?php print $rtname; ?></option>
                      <?php
	}
?>
                    </select> 
                    <?php
}
if($rstatus==1)
{
	$sql = "select * from teacherid where uid='$ruid';";
	$result=mysql_query($sql);
	$rtname=mysql_result($result,0,"tname");
?>
                    <input name="uid" type="text" id="uid" value="<?php print $rtname; ?>" size="40" readonly="readonly"> 
                    <?php
}
?>
                  </td>
                </tr>
                <?php
	$sql = "select * from subject order by subcode";
	$result=mysql_query($sql);
	$count=mysql_num_rows($result);
?>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;วิชาบังคับก่อน 
                    *</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"> 
                    <?php
if($rstatus==0)
{
?>
                    <select name="priority" id="priority">
                      <option value="none">none</option>
                      <?php
	for($i=0; $i<$count; $i++)
	{
		$rsubcodel=mysql_result($result,$i,"subcode");
		$renname=mysql_result($result,$i,"enname");
		if($rsubcodel!=$rsubcode)
		{
?>
                      <option value="<?php print $rsubcodel; ?>" <?php if($rsubcodel==$subed) {print 'selected';} ?>><?php print $rsubcodel; ?> 
                      <?php print $renname; ?></option>
                      <?php
		}
	}
?>
                    </select> 
                    <?php
}
if($rstatus==1)
{
	$sql = "select * from subject where uid='$ruid';";
	$result=mysql_query($sql);
	$rsubcodel=mysql_result($result,0,"subcode");
	$renname=mysql_result($result,0,"enname");
?>
                    <input name="priority" type="text" id="priority" value="<?php print $rsubcodel; ?> <? print $renname; ?>" size="40" readonly="readonly"> 
                    <?php
}
?>
                  </td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;เกณฑ์การผ่านของวิชานี้ 
                    *</td>
                  <td colspan="2" bgcolor="#FFEECC" class="defaultfont"><select name="prioritylv" id="prioritylv">
                      <?php
	for($i=0; $i<11; $i++)
	{
		
?>
                      <option value="<?php print $i; ?>" <?php if($i==$lved) {print 'selected';} ?>>lv.<?php print $i; ?></option>
                      <?php
}
?>
                    </select></td>
                </tr>
                <tr bgcolor="#FFCC99"> 
                  <td colspan="3" class="headfont">&nbsp;รายละเอียดวิชาภาษาอังกฤษ</td>
                </tr>
                <tr bgcolor="#FFEECC"> 
                  <td colspan="3" class="defaultfont"><textarea name="endescript" cols="80" rows="3" id="endescript"><?php print $rendescript; ?></textarea></td>
                </tr>
                <tr bgcolor="#FFCC99"> 
                  <td colspan="3" class="headfont">&nbsp;รายละเอียดวิชาภาษาไทย</td>
                </tr>
                <tr bgcolor="#FFEECC"> 
                  <td colspan="3" class="defaultfont"><textarea name="thdescript" cols="80" rows="3" id="thdescript"><?php print $rthdescript; ?></textarea></td>
                </tr>
                <tr> 
                  <td class="warning"> &nbsp;ยืนยัน</td>
                  <td width="22%" class="warning">Password *</td>
                  <td width="47%" class="defaultfont"><input name="adpass" type="password" id="adpass" maxlength="40"></td>
                </tr>
                <tr> 
                  <td colspan="3"><div align="center"> 
                      <input name="update" type="submit" id="update" value="update">
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