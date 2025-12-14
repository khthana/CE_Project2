<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>วิธีใช้งาน web elearning</title>
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
    <td width="550" bgcolor="#FF9900" class="headmenu">วิธีใช้</td>
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
    <td valign="top">
	
<?php
			$len = 1;
			$num = '';
			$lchar = 0;
			$char = 0;
		 	for($i = 0; $i < $len; $i++)
			{
				while($char == $lchar)
				{
					$char = rand(49, 51);
				}
				$num .= chr($char);
				$lchar = $char;
			}
			$kafra = "logo/kafra".$num.".jpg";
if (!isset($_SESSION['user']))
{
?>
		    
      <table width="100%" border="0" cellpadding="1" cellspacing="1">
        <tr> 
          <td width="50%" height="20" valign="top" class="defaultfont"><table width="100%" border="0" cellspacing="1" cellpadding="1">
              <tr> 
                <td height="20" class="defaultfont"><a href="JavaScript:openwin('other1.php','','scrollbars=yes,resizable=yes,width=700,height=500')">จะใช้งานเว็บนี้ได้อย่างไร</a></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><a href="JavaScript:openwin('other2.php','','scrollbars=yes,resizable=yes,width=700,height=500')">รายละเอียดเกี่ยวกับวิชา</a></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><a href="JavaScript:openwin('other3.php','','scrollbars=yes,resizable=yes,width=700,height=500')">สิทธิเกี่ยวกับ 
                  Webboard</a></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><a href="JavaScript:openwin('other4.php','','scrollbars=yes,resizable=yes,width=700,height=500')">สิ่งที่คุณจะได้หลังจากทำการสมัครเป็นสมาชิก</a></td>
              </tr>
            </table></td>
          <td width="50%" rowspan="2" align="right" valign="bottom" class="defaultfont"><img src="<? print $kafra; ?>"></td>
        </tr>
        <tr> 
          <td class="defaultfont">&nbsp;</td>
        </tr>
      </table>
<?php
}
if (isset($_SESSION['user']))
{
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$rstatus=mysql_result($result,0,"status");
}
if(isset($_SESSION['user']) && $rstatus==2)
{
?>
		    
      <table width="100%" border="0" cellpadding="1" cellspacing="1">
        <tr> 
          <td width="50%" height="20" valign="top" class="warning"><table width="100%" border="0" cellspacing="1" cellpadding="1">
              <tr> 
                <td height="20" class="warning"><div align="center">สำหรับสมาชิก</div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('user1.php','','scrollbars=yes,resizable=yes,width=700,height=500')">เกี่ยวกับ 
                    Password</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('user2.php','','scrollbars=yes,resizable=yes,width=700,height=500')">เกี่ยวกับข้อมูลส่วนตัว</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('user3.php','','scrollbars=yes,resizable=yes,width=700,height=500')">เริ่มต้นกับ 
                    Status</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('other2.php','','scrollbars=yes,resizable=yes,width=700,height=500')">รายละเอียดเกี่ยวกับวิชา</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('user5.php','','scrollbars=yes,resizable=yes,width=700,height=500')">แบบเรียนรายวิชาต่างๆ</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('user6.php','','scrollbars=yes,resizable=yes,width=700,height=500')">ความสำคัญของ 
                    Level</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('user7.php','','scrollbars=yes,resizable=yes,width=700,height=500')">แบบทดสอบเพื่อเลื่อนระดับ</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('user8.php','','scrollbars=yes,resizable=yes,width=700,height=500')">สิทธิพิเศษเกี่ยวกับ 
                    Webboard</a></div></td>
              </tr>
            </table></td>
          <td width="50%" rowspan="2" align="right" valign="bottom" class="warning"><img src="<? print $kafra; ?>"></td>
        </tr>
        <tr> 
          <td class="defaultfont">&nbsp;</td>
        </tr>
      </table>
<?php
}
if(isset($_SESSION['user']) && $rstatus==1)
{
?>
            
      <table width="100%" border="0" cellpadding="1" cellspacing="1">
        <tr> 
          <td width="50%" height="20" valign="top" class="warning"><table width="100%" border="0" cellspacing="1" cellpadding="1">
              <tr> 
                <td height="20" class="warning"><div align="center">สำหรับอาจารย์</div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('user1.php','','scrollbars=yes,resizable=yes,width=700,height=500')">เกี่ยวกับ 
                    Password</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('user2.php','','scrollbars=yes,resizable=yes,width=700,height=500')">เกี่ยวกับข้อมูลส่วนตัว</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('other2.php','','scrollbars=yes,resizable=yes,width=700,height=500')">รายละเอียดเกี่ยวกับวิชา</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('teacher4.php','','scrollbars=yes,resizable=yes,width=700,height=500')">สิทธิเกี่ยวกับรายวิชา</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('teacher5.php','','scrollbars=yes,resizable=yes,width=700,height=500')">สิทธิเกี่ยวกับแบบทดสอบ</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('teacher6.php','','scrollbars=yes,resizable=yes,width=700,height=500')">ดูผลการเรียน</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('teacher7.php','','scrollbars=yes,resizable=yes,width=700,height=500')">สิทธิพิเศษเกี่ยวกับ 
                    Webboard</a></div></td>
              </tr>
            </table></td>
          <td width="50%" rowspan="2" align="right" valign="bottom" class="warning"><img src="<? print $kafra; ?>"></td>
        </tr>
        <tr> 
          <td class="defaultfont">&nbsp;</td>
        </tr>
      </table>
<?php
}
if(isset($_SESSION['user']) && $rstatus==0)
{
?>
            
      <table width="100%" border="0" cellpadding="1" cellspacing="1">
        <tr> 
          <td width="50%" height="20" valign="top" class="warning"><table width="100%" border="0" cellspacing="1" cellpadding="1">
              <tr> 
                <td height="20" class="warning"><div align="center">สำหรับผู้ดูแลระบบ</div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('user1.php','','scrollbars=yes,resizable=yes,width=700,height=500')">เกี่ยวกับ 
                    Password</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('admin2.php','','scrollbars=yes,resizable=yes,width=700,height=500')">บริหาร 
                    User</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('admin3.php','','scrollbars=yes,resizable=yes,width=700,height=500')">บริหารรายวิชา</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('teacher5.php','','scrollbars=yes,resizable=yes,width=700,height=500')">บริหารแบบทดสอบ</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('teacher6.php','','scrollbars=yes,resizable=yes,width=700,height=500')">ดูผลการเรียน</a></div></td>
              </tr>
              <tr> 
                <td height="20" class="defaultfont"><div align="left"><a href="JavaScript:openwin('admin6.php','','scrollbars=yes,resizable=yes,width=700,height=500')">บริหาร 
                    Webboard</a></div></td>
              </tr>
            </table></td>
          <td width="50%" rowspan="2" align="right" valign="bottom" class="warning"><img src="<? print $kafra; ?>"></td>
        </tr>
        <tr> 
          <td class="defaultfont">&nbsp;</td>
        </tr>
      </table>
<?php
}
?>           	
	
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
