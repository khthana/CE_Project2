<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>ดูผลการเรียน</title>
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
if(isset($_SESSION['user']) && ($rstatus==1 || $rstatus==0))
{
?>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="28" height="28" align="right"><div align="right"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></div></td>
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2">&nbsp;ดูผลการเรียน</font></td>
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
                <td class="defaultfont">ใน menu ดูผลการเรียน นั้นบุคลากรจะสามารถทราบถึงจำนวนผู้ที่มีสิทธิ์เรียนใน 
                  ในรายวิชาที่ตนเองดูแลอยู่</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/teacher6-1.jpg" width="101" height="27"></div></td>
                      <td width="50%" class="defaultfont">เมื่อคลิกที่ person 
                        ในวิชาที่ต้องการดู </td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td class="defaultfont">จะบอกถึงชื่อ ระดับเลเวล และ e-mail ที่ใช้ในการติดต่อ</td>
                    </tr>
                    <tr> 
                      <td><img src="logo/teacher6-2.jpg" width="482" height="56"></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont">หน้านี้บุคลากรสามารถดูระดับ level ของผู้เรียนได้ 
                  เพื่อที่จะปรับแบบทดสอบ ให้เกณฑ์การผ่านของในแต่ละวิชานั้น ๆ ได้อย่างเหมาะสม</td>
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
