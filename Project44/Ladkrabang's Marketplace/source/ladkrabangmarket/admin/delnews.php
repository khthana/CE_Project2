<?
session_start();
if($administrator[0]=='1')
{
?>
<html>

<link rel="stylesheet" type="text/css" href="../style.css">	


<body bgcolor="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="20%">&nbsp;</td>
    <td height="51" width="53%"><img src="../images/logo_big.gif" width="467" height="54"></td>
    <td height="51" width="15%" align="center" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href="../../index.html">หน้าแรก</a></b></font></td>
    <td height="51" width="12%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ </a></b></font></td>
  </tr>
</table>
<hr color=1E90FF>
<?
     if( file_exists("news/news.html") ){
																			if(	unlink("news/news.html")){

																														?>
<table width="55%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolor="#0000FF" bgcolor="#C5E9FA">
  <tr>
    <td height="87"> 
      <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#0000FF">ลบข่าวประชาสัมพันธ์</font><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><br>
        <br>
        <font color="#0000FF">เรียบร้อยแล้ว </font></font></b></div>
    </td>
  </tr>
</table>
<?
																																	}else
																																	{?>
<table width="55%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolor="#FF0000" bgcolor="#FFECF1">
  <tr> 
    <td height="87"> 
      <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#FF0000">ไม่สามารถลบข่าวประชาสัมพันธ์ได้</font><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><br>
        <br>
        <font color="#FF0000">กรุณาตรวจสอบ </font></font></b></div>
    </td>
  </tr>
</table>
<?
																																	
																																	}
																	}else{

																					?>
<table width="55%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolor="#FF0000" bgcolor="#FFECF1">
  <tr> 
    <td height="87"> 
      <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#FF0000">ไม่พบไฟล์ข่าวประชาสัมพันธ์</font><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><br>
        <font color="#FF0000">กรุณาตรวจสอบ </font></font></b></div>
    </td>
  </tr>
</table>
<?
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