<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>ความสำคัญของ level </title>
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
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2">&nbsp;ความสำคัญของ 
      level </font></td>
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
                <td class="defaultfont">ระดับของ level นั้นบอกถึงความสามารถในวิชานั้น 
                  ๆ ซึ่งในแต่ละวิชาจะมีเกณฑ์การผ่านในแต่ละวิชาด้วย ถ้าเรามีระดับ 
                  level ที่สูงกว่าจะทำให้เราผ่านวิชานั้น และถ้าวิชาที่เราผ่านเป็นวิชาบังคับในวิชาต่อไป 
                  วิชานั้นๆ ก็จะปรากฏให้สามารถทำการเรียนได้</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="1" cellpadding="1">
                    <tr> 
                      <td width="50%">&nbsp;</td>
                      <td width="50%" class="defaultfont">รายวิชาที่สามารถเรียนรู้ได้</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="1" cellpadding="1">
                    <tr> 
                      <td width="50%">&nbsp;</td>
                      <td width="50%" class="defaultfont">เมื่อระดับเลเวลผ่านเกณฑ์ 
                        จะมีวิชาเพิ่มขึ้นมาให้เรียน </td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont">จะเห็นได้ว่าจะสามารถเรียนวิชาที่สูงขึ้นไปได้นั้น 
                  ต้องผ่านเกณฑ์ในวิชาก่อนหน้านั้นก่อน โดยใช้ level เป็นตัววัด 
                  ซึ่งวิธีที่สามารถทำให้ level เพิ่มขึ้นได้นั้นจะกล่าวในหัวข้อ 
                  แบบทดสอบเพื่อเลื่อนระดับ</td>
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
