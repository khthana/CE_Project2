<?
session_start();
if($administrator[0]=='1')
{
?>
<html>
	<head>
<link rel="stylesheet" type="text/css" href="../style.css">	
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="20%">&nbsp;</td>
    <td height="51" width="53%"><img src="../images/logo_big.gif" width="467" height="54"></td>
 
    <td height="51" width="12%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ </a></b></font></td>
  </tr>
</table>
<hr color=1E90FF>
<?

// บันทึกไฟล์
if($file!="none") {
	
			if(!copy($file,"news/news.html"))
			{ 
			?>
<table width="55%" border="1" cellspacing="0" cellpadding="0" align="center" height="98" bordercolor="#FF0000" bgcolor="#FFEAE6">
  <tr>
    <td>
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="3"><b><font color="#FF0000">ไม่สามารถลงข่าวได้</font></b></font><br>
        <font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FF0000">กรุณาตรวจสอบ</font><font face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000"> 
        </font></div>
    </td>
  </tr>
</table>
<?
				}else
				
				{
					?>
<table width="55%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolor="#6699FF" bgcolor="#FDFFE6">
  <tr>
    <td height="92">
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="3"><b><font color="#0000FF">ลงข่าวเรียบร้อยแล้ว</font></b></font><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000FF"><br>
        <br>
        <font size="2">กด Reload/Refresh ดูผลลัพธ์ที่หน้าแรก</font></font></div>
    </td>
  </tr>
</table>
<?
				}


}
?>

 <hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF" size=2>Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>

<?
}else
{
echo"<CENTER><H1>ไม่อนุญาตให้เข้าสู่ระบบ</h1></CENTER> ";
}?>
