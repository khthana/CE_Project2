<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>สิทธิพิเศษเกี่ยวกับ Webboard </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<link rel='stylesheet' type='text/css' href='style.css' />
<body>
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
if(isset($_SESSION['user']) && $rstatus==2)
{
?>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="28" height="28" align="right"><div align="right"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></div></td>
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2">&nbsp;สิทธิพิเศษเกี่ยวกับ 
      Webboard </font></td>
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
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont">.ในกรณีที่สมาชิกทำการเข้าสู่ระบบ จะสามารถ 
                  ถาม-ตอบกระทู้ ในวิชาที่ตนเองสามารถเรียนรู้อยู่ได้<br>
                  ในกรณีที่วิชานั้น ๆ สมาชิกยังไม่สามารถเรียนรู้ได้ จะไม่สามารถ 
                  ถาม-ตอบกระทู้นั้นๆได้ แต่สามารถที่จะดูได้</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td class="defaultfont">รายวิชาที่สามารถเรียนรู้ได้</td>
                    </tr>
                    <tr> 
                      <td><img src="logo/user8-1.jpg" width="482" height="130"></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td class="defaultfont">Webboard ที่สามารถเรียนรู้ได้ จะสามารถถาม-ตอบได้</td>
                    </tr>
                    <tr> 
                      <td><div align="center"><img src="logo/user8-2.jpg" width="410" height="66"></div></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont"><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td class="defaultfont">Webboard ที่ยังไม่สามารถเรียนรู้ได้</td>
                    </tr>
                    <tr> 
                      <td><div align="center"><img src="logo/user8-3.jpg" width="332" height="76"></div></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
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
<?php
}
?>
</body>
</html>
