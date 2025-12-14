<?
session_start();
if($administrator[0]=='1')
{
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> </TITLE>
<link rel="stylesheet" type="text/css" href="../style.css">	
</HEAD>
<BODY BGCOLOR="#FFFFFF">
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
 include("../config.inc.php");
 //ติดต่อฐานข้อมูล

 mysql_connect($host,$user,$passwd);
 $sql="select username from member where username='$userdel' ";
 $result=mysql_db_query($dbname,$sql);
 $NRow = mysql_num_rows($result);
if($NRow==0){
			?>
<table width="50%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="60%" border="1" cellpadding="0" cellspacing="0" align="center" bordercolor="#FF0000" bgcolor="#FFCCFF">
  <tr>
    <td height="74"> 
      <p align="center"><font face="MS Sans Serif" size="3"><b><font color="#FF0000">ไม่พบ</font> 
        <?echo"  $userdel  "?>
        <font color="#FF0000">ในฐานข้อมูลสมาชิก</font></b></font></p>
      <p align="center"><font face="MS Sans Serif" size="3" color="#FF0000">กรุณาตรวจสอบข้อมูล</font></p>
      </td>
  </tr>
</table>
			<?
			    }
		else{
				   $sql1="delete from member where username='$userdel' ";
					$result1 = mysql_db_query($dbname,$sql1);
					 $sql2="delete from introduce where username='$userdel'    ";
					 $result2 = mysql_db_query($dbname,$sql2);
					if($result1!=0 && $result2!=0 ){
?>
<table width="50%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="60%" border="1" cellpadding="0" cellspacing="0" align="center" bordercolor="#0000FF" bgcolor="#99CCFF">
  <tr>
    <td height="74"> 
      <p align="center"><font face="MS Sans Serif" size="3"><b><font color="#0000FF">ลบ
        <? echo"  $userdel  "?>
        ออกจากสมาชิก</font></b></font></p>
      <p align="center"><font face="MS Sans Serif" size="3" color="#0000FF">เรียบร้อยแล้ว</font></p>
      </td>
  </tr>
</table>
	<?
						}else{
		?>
<table width="50%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="60%" border="1" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td height="74" bgcolor="#FFCCFF" bordercolor="#FF0000"> 
      <p align="center"><font face="MS Sans Serif" size="3"><b><font color="#FF0000">ไม่สามารถลบ 
        <? echo"  $userdel  "?>
        ออกจากสมาชิกได้</font></b></font></p>
      <p align="center"><font face="MS Sans Serif" size="3" color="#FF0000">กรุณาตรวจสอบ</font></p>
      </td>
  </tr>
</table>
	<?
									}

					}

mysql_close();
?>
 <hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF" size=1>Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>
</BODY>
</HTML>
<?
}else
{
echo"<CENTER><H1>ไม่อนุญาตให้เข้าสู่ระบบ</h1></CENTER> ";
}?>
