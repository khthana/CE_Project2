<?php
session_start();
if(!$subid && !$numid)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
<html>
<head>
<title>ท่านกำลังทำการเปลี่ยนแปลงแบบทดสอบ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">แก้ไขคำถาม</td>
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
	
	$sql = "select * from testsubject where subid='$subid' and numid='$numid';";
	$result=mysql_query($sql);
	$rquestion=mysql_result($result,0,"question");
	$rchoice1=mysql_result($result,0,"choice1");
	$rchoice2=mysql_result($result,0,"choice2");
	$rchoice3=mysql_result($result,0,"choice3");
	$rchoice4=mysql_result($result,0,"choice4");
	$rchoice5=mysql_result($result,0,"choice5");
	$ranswer=mysql_result($result,0,"answer");
	$rlevel=mysql_result($result,0,"level");
	
	if($rsublv==1)
	{
?>
        <tr> 
          <td> <table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr bgcolor="#FFEECC"> 
                <td width="70" class="defaultfont"><?php print $rsubcode; ?></td>
                <td width="270" bgcolor="#FFEECC" class="defaultfont"><?php print $renname; ?></td>
                <td width="70" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $subid; ?>">choice</a></td>
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
                <td width="70" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $subid; ?>">choice</a></td>
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
                <td width="70" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $subid; ?>">choice</a></td>
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
                <td width="70" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $subid; ?>">choice</a></td>
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
                <td width="70" class="warning"><?php print $count1; ?> <a href="editstest.php?subid=<?php print $subid; ?>">choice</a></td>
                <td width="70" class="warning"><?php print $count2; ?> <a href="lookups.php?subid=<?php print $subid; ?>">person</a></td>
              </tr>
            </table></td>
        </tr>
        <?php
	}
?>
        <tr> 
          <td><form name="form1" method="post" action="adtedit.php?subid=<?php print $subid; ?>&numid=<?php print $numid; ?>" ENCTYPE="multipart/form-data">
              <table width="100%" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td width="30%" bgcolor="#FFCC99" class="headfont">&nbsp;คำถาม 
                    *</td>
                  <td colspan="2" bgcolor="#FFEECC"><textarea name="question" cols="50" rows="3" id="question"><?php print $rquestion; ?></textarea></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ตัวเลือกข้อที่ 
                    1 *</td>
                  <td colspan="2" bgcolor="#FFEECC"><input name="choice1" type="text" id="choice1" value="<?php print $rchoice1; ?>" size="40" maxlength="50"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ตัวเลือกข้อที่ 
                    2 *</td>
                  <td colspan="2" bgcolor="#FFEECC"><input name="choice2" type="text" id="choice2" value="<?php print $rchoice2; ?>" size="40" maxlength="50"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ตัวเลือกข้อที่ 
                    3 *</td>
                  <td colspan="2" bgcolor="#FFEECC"><input name="choice3" type="text" id="choice3" value="<?php print $rchoice3; ?>" size="40" maxlength="50"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ตัวเลือกข้อที่ 
                    4 *</td>
                  <td colspan="2" bgcolor="#FFEECC"><input name="choice4" type="text" id="choice4" value="<?php print $rchoice4; ?>" size="40" maxlength="50"> 
                  </td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ตัวเลือกข้อที่ 
                    5 *</td>
                  <td colspan="2" bgcolor="#FFEECC"><input name="choice5" type="text" id="choice5" value="<?php print $rchoice5; ?>" size="40" maxlength="50"></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;คำตอบที่ถูกต้อง 
                    *</td>
                  <td colspan="2" bgcolor="#FFEECC"><select name="answer" id="answer">
                      <?php
	for($i=1; $i<=5; $i++)
	{
?>
                      <option value="<?php print $i; ?>" <?php if($i==$ranswer) {print 'selected';} ?>>คำตอบข้อที่ 
                      <?php print $i; ?></option>
                      <?php
	}
?>
                    </select></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;ระดับความยากของคำถาม 
                    *</td>
                  <td colspan="2" bgcolor="#FFEECC"><select name="level" id="level">
                      <?php
	for($i=1; $i<=5; $i++)
	{
?>
                      <option value="<?php print $i; ?>" <?php if($i==$rlevel) {print 'selected';} ?>>level 
                      <?php print $i; ?></option>
                      <?php
	}
?>
                    </select> </td>
                </tr>
				<tr> 
                  <td bgcolor="#FFCC99" class="headfont">&nbsp;แทรกรูปภาพ</td>
                  <td colspan="2" bgcolor="#FFEECC"><input name="picpart" type="file" id="picpart" size="30" maxlength="50"></td>
                </tr>
                <tr> 
                  <td class="warning">&nbsp;ยืนยัน</td>
                  <td width="22%" class="warning">Password Admin *</td>
                  <td width="47%"><input name="pass" type="password" id="pass" maxlength="40"></td>
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