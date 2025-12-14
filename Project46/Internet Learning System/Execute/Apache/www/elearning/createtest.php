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
<title>ท่านกำลังทำการสร้างแบบทดสอบ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">สร้างแบบทดสอบ</td>
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
          <td><form name="form1" method="post" action="createt.php?subid=<?php print $subid; ?>" ENCTYPE="multipart/form-data">
              <table width="100%" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td width="30%" bgcolor="#FFCC99" class="headfont">&nbsp;คำถาม 
                    *</td>
                  <td width="69%" bgcolor="#FFEECC"> <textarea name="question" cols="50" rows="3" id="question"></textarea></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ตัวเลือกข้อที่ 
                    1 *</td>
                  <td bgcolor="#FFEECC"><input name="choice1" type="text" id="choice1" size="40" maxlength="50"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ตัวเลือกข้อที่ 
                    2 *</td>
                  <td bgcolor="#FFEECC"><input name="choice2" type="text" id="choice2" size="40" maxlength="50"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ตัวเลือกข้อที่ 
                    3 *</td>
                  <td bgcolor="#FFEECC"><input name="choice3" type="text" id="choice3" size="40" maxlength="50"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ตัวเลือกข้อที่ 
                    4 *</td>
                  <td bgcolor="#FFEECC"><input name="choice4" type="text" id="choice4" size="40" maxlength="50"> 
                  </td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ตัวเลือกข้อที่ 
                    5 *</td>
                  <td bgcolor="#FFEECC"><input name="choice5" type="text" id="choice5" size="40" maxlength="50"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;คำตอบที่ถูกต้อง 
                    *</td>
                  <td bgcolor="#FFEECC"><select name="answer" id="answer">
                      <option value="1" selected>คำตอบข้อที่ 1</option>
                      <option value="2">คำตอบข้อที่ 2</option>
                      <option value="3">คำตอบข้อที่ 3</option>
                      <option value="4">คำตอบข้อที่ 4</option>
                      <option value="5">คำตอบข้อที่ 5</option>
                    </select></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ระดับความยากของคำถาม 
                    *</td>
                  <td bgcolor="#FFEECC"><select name="level" id="level">
                      <option value="1" selected>level 1</option>
                      <option value="2">level 2</option>
                      <option value="3">level 3</option>
                      <option value="4">level 4</option>
                      <option value="5">level 5</option>
                    </select> </td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont"><div align="left"> &nbsp;แทรกรูปภาพ</div></td>
                  <td bgcolor="#FFEECC"><input name="picpart" type="file" id="picpart" size="30" maxlength="50">
                  </td>
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