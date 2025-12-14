<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>แบบเรียนรายวิชาต่าง ๆ </title>
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
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2">&nbsp;แบบเรียนรายวิชาต่าง 
      ๆ </font></td>
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
                <td class="defaultfont">แบบเรียนรายวิชาต่าง ๆ ถูกทำขึ้นด้วยโปรแกรม 
                  Microsoft power point และสนับสนุนการแสดงผลบน Internet Explorer 
                  จึงแนะนำให้สมาชิกใช้ Internet Explorer ในการเรียนจะทำให้สะดวกกว่า 
                  แต่โปรแกรม Browser อื่นๆก็สามารถแสดงผลได้แต่อาจจะไม่สมบูรณ์ 
                  กรณีที่สมาชิกไม่ได้ลงโปรแกรม Microsoft power point ไว้ให้ Download 
                  plug-in ด้วยจึงจะทำให้สามารถดูได้</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="1" cellpadding="1">
                    <tr> 
                      <td width="50%" class="defaultfont">- <a href="http://download.microsoft.com/download/OfficeXPProf/Install/4.71.30.1/W98NT42KMe/EN-US/PPVIEW97.EXE">Microsoft 
                        power point</a></td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="1" cellpadding="1">
                    <tr> 
                      <td width="50%" class="defaultfont">- <a href="http://www.chulaonline.com/download/ie6setup.exe">IE6</a></td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="1" cellpadding="1">
                    <tr> 
                      <td width="50%" class="defaultfont">- <a href="http://fpdownload.macromedia.com/pub/shockwave/flash/english/win95nt/7.0.19.0/flashplayer7installer.exe">Macromedia 
                        Flash</a></td>
                      <td width="50%">&nbsp;</td>
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
