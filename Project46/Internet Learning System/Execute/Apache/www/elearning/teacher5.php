<?php
session_start();
//print session_id();
?>
<html>
<head>
<title>สิทธิเกี่ยวกับแบบทดสอบ</title>
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
    <td width="544" bgcolor="#FF9900" class="headmenu"><font size="2">&nbsp;สิทธิเกี่ยวกับแบบทดสอบ</font></td>
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
                <td class="defaultfont">ใน menu แก้ไขแบบทดสอบ นั้นบุคลากรจะสามารถเพิ่ม 
                  ลบ และเปลี่ยนแปลงข้อมูลต่าง ๆ ในรายวิชาที่ตนเองดูแลอยู่ได้ให้เหมาะสม 
                </td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td class="defaultfont">ในเมนูนี้จะมีบอกถึงจำนวนข้อของแบบทดสอบ ในแต่ละวิชาที่มีอยู่</td>
                    </tr>
                    <tr> 
                      <td><img src="logo/teacher5-1.jpg" width="482" height="46"></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/teacher5-2.jpg" width="67" height="21"></div></td>
                      <td width="50%" class="defaultfont">คลิกที่ choice ในวิชาที่ต้องการเปลี่ยนแปลง</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td class="defaultfont">หน้านี้จะแสดงคำถามในแต่ละระดับความยากจาก level 1-5 <br>
                        กดปุ่ม create เมื่อต้องการสร้างคำถามใหม่<br>
                        กดปุ่ม edit เมื่อต้องการเปลี่ยนแปลงคำถามที่มีอยู่ <br>
                        กดปุ่ม delete เมื่อต้องการลบคำถามนั้น</td>
                    </tr>
                    <tr> 
                      <td><p><img src="logo/teacher5-3.jpg" width="482" height="100"></p></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont">ในการเปลี่ยนแปลงคำถามในแบบทดสอบนั้นจะมีข้อมูลให่ใส่ดังนี้</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/teacher5-4.jpg" width="161" height="160"></div></td>
                      <td width="50%" class="defaultfont">คำถามและตัวเลือก 5 choice</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/teacher5-5.jpg" width="229" height="20"></div></td>
                      <td width="50%" class="defaultfont">คำตอบที่ถูกต้อง</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td width="50%"><div align="center"><img src="logo/teacher5-6.jpg" width="214" height="36"></div></td>
                      <td width="50%" class="defaultfont">ระดับความยากของคำถาม</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
                    <tr> 
                      <td class="defaultfont">รูปภาพประกอบ</td>
                    </tr>
                    <tr> 
                      <td><div align="center"><img src="logo/teacher5-7.jpg" width="379" height="23"></div></td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td class="defaultfont">ทำการเปลี่ยนแปลง ก็เป็นอันเสร็จ</td>
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
