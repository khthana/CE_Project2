<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>บริหาร Webboard</title>
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
if(isset($_SESSION['user']) && $rstatus==0)
{
?>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="28" height="28" align="right"><div align="right"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></div></td>
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2">&nbsp;บริหาร 
      Webboard</font></td>
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
                <td class="defaultfont">ใน menu ลบ Webboard admin สามารถที่จะลบกระทู้ที่ไม่เหมาะสม 
                  หรือลบคำตอบที่ไม่เหมาะสมได้ </td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/admin6-1.jpg" width="142" height="46"></div></td>
                      <td width="50%" class="defaultfont">เมื่อเจอกระทู้ที่ไม่เหมาะสม 
                        (ดูคำถามที่) </td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/admin6-2.jpg" width="73" height="34"></div></td>
                      <td width="50%" class="defaultfont">คำตอบที่ไม่เหมาะสม (ดูคำตอบที่)</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/admin6-3.jpg" width="106" height="38"></div></td>
                      <td width="50%" class="defaultfont">เข้าไปที่ menu ลบ Webboard</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/admin6-4.jpg" width="190" height="42"></div></td>
                      <td width="50%" class="defaultfont">เลือกว่าจะลบกระทู้ หรือคำตอบ</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/admin6-5.jpg" width="212" height="41"></div></td>
                      <td width="50%" class="defaultfont">ใส่หมายเลขกระทู้ หรือคำตอบที่จะลบ</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="defaultfont">เท่านี้ก้อจะสามารถลบกระทู้หรือคำตอบที่ไม่เหมาะสมได้</td>
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
