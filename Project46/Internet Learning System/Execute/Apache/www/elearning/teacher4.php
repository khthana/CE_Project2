<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>สิทธิเกี่ยวกับรายวิชา</title>
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
if(isset($_SESSION['user']) && $rstatus==1)
{
?>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="28" height="28" align="right"><div align="right"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></div></td>
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2">&nbsp;สิทธิเกี่ยวกับรายวิชา</font></td>
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
                <td class="defaultfont">ใน menu แก้ไขรายวิชา นั้นบุคลากรจะสามารถเปลี่ยนแปลงข้อมูลต่าง 
                  ๆ ในรายวิชาที่ตนเองดูแลอยู่ได้ให้เหมาะสม เช่น</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><img src="logo/teacher4-1.jpg" width="232" height="23"></td>
                      <td width="50%" class="defaultfont">หนังสือที่ใช้ (เพื่อให้ผู้เรียนค้นคว้าเพิ่มเติม)</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><img src="logo/teacher4-2.jpg" width="223" height="22"></td>
                      <td width="50%" class="defaultfont">เกณฑ์การผ่านของวิชานี้</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><img src="logo/teacher4-3.jpg" width="215" height="23"></td>
                      <td width="50%" class="defaultfont">และแบบเรียนที่จะให้ผู้เรียนได้ศึกษา</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont">ในแบบเรียนจะเป็นไฟล์ที่ถูก zip มาแล้วซึ่งไฟล์ที่ zip จะเป็นไฟล์ที่ได้จากการแปลงไฟล์ 
                  Power point เป็น html วิธีการทำมีดังนี้</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/teacher4-4.jpg" width="226" height="60"></div></td>
                      <td width="50%" class="defaultfont">ทำแบบเรียนในรูปของไฟล์ Power point </td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/teacher4-5.jpg" width="130" height="167"></div></td>
                      <td width="50%" class="defaultfont">ทำการ save เป็น web page</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/teacher4-6.jpg" width="152" height="66"></div></td>
                      <td width="50%" class="defaultfont">ตั้งชื่อเป็นรหัสของวิชานั้น</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/teacher4-7.jpg" width="76" height="68"></div></td>
                      <td width="50%" class="defaultfont">ทำการ zip ไฟล์ที่ได้จากการแปลงทั้งหมด</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td colspan="2"><img src="logo/teacher4-8.jpg" width="443" height="26"></td>
                    </tr>
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/teacher4-9.jpg" width="137" height="117"></div></td>
                      <td width="50%" class="defaultfont">คลิกเลือกแบบเรียนที่ 
                        zip มาทำการ upload ข้อมูล </td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="defaultfont">เพียงเท่านี้ก็สามารถ upload แบบเรียนขึ้นไปได้แล้ว</td>
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
