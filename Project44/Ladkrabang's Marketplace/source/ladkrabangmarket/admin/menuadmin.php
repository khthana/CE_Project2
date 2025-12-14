<?
session_start();

if($isadmin==1)
{
session_unset();
session_destroy();
	
	$administrator=array('1');
	session_register("administrator");

?>
<html>
<head>
<title>ระบบสำหรับผู้ดูแล</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
	<style type="text/css">
	<!-- 
BODY {font-family:;font-size="10"}
	A:link { color: blue }
	A:visited { color: blue }
	A:hover { color: darkorange }
	A:active { color: blue }
	p, div, td, ul li, ol li { font-family:  MS Sans Serif, Microsoft Sans Serif;  font-size: 10pt }
	-->
</style>

</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="20%">&nbsp;</td>
    <td height="51" width="53%"><img src="../images/logo_big.gif" width="467" height="54"></td>

    <td height="51" width="12%"  align ="left" valign="bottom">
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ 
        </a></b></font></div>
    </td>
  </tr>
</table>
<hr color=1E90FF>
<table width="80%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolor="#0099FF">
  <tr>
    <td height="30" bgcolor="#CCFFFF">
      <div align="center"><b><font size="3" face="MS Sans Serif" color="#0000FF">ระบบ 
        Adminstrator</font></b></div>
    </td>
  </tr>
</table>
  <form name="formdeluser"  method="post" action="deluser.php"   onsubmit="return check1()" >
  <table width="80%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0099FF" align="center" bgcolor="#FFFFD7">
    <tr> 
      <td width="30%" height="74" bgcolor="#FFFFD7"> 
        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#0000FF">ลบสมาชิก</font></b></font></div>
    </td>
    <td width="70%" height="74"> 
        <table width="100%" border="0">
          <tr> 
            <td width="20%"> 
              <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Username</font></div>
            </td>
            <td width="51%"> 
              <input type="text" name="userdel">
            </td>
		  <?echo"
            <td width='29%'>
              <div align='cente'r><b>
				  <a href='listmember.php'  target='_blank'>ลบแบบตัวเลือก</a></b></div>
            </td>";
				?>
          </tr>
          <tr> 
            <td width="20%" height="34">&nbsp;</td>
            <td width="51%" height="34"> 
              <input type="submit" name="Submit3" value="ลบสมาชิก">
            </td>
            <td width="29%" height="34">&nbsp;</td>
          </tr>
        </table>
    </td>
  </tr>
</table>
</form>
<table width="80%" border="1" cellspacing="0" cellpadding="0" height="50" bordercolor="#0099FF" align="center">
  <tr> 
    <td height="62" bgcolor="#FFFFD7"> 
      <div align="center"><font face="MS Sans Serif" size="2"><b><a href="adminread.php" target="_blank">อ่าน-ตอบ 
        ข้อความจากผู้ใช้</a></b></font></div>
    </td>
  </tr>
</table>
<form name="formdelpost" method="post" action="admindelp.php" target="_blank" onsubmit="return check2()" >
  <table width="80%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0099FF" align="center" bgcolor="#FFFFD7">
    <tr> 
      <td width="30%" height="105" bgcolor="#FFFFD7"> 
        <div align="center"><font face="MS Sans Serif" size="2"><b><font color="#0000FF">ลบประกาศ</font></b></font></div>
    </td>
    <td width="70%" height="105"> 
        <table width="100%" border="0" cellspacing="2" cellpadding="2">
          <tr> 
            <td width="21%"> 
              <div align="right"></div>
            </td>
            <td width="50%"><b>ลบแบบใส่รหัส</b></td>
            <td width="29%">
              <div align="center"><b>ลบแบบตัวเลือก</b></div>
            </td>
          </tr>
          <tr> 
            <td width="21%"> 
              <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Code</font> 
              </div>
            </td>
            <td width="50%">
              <input type="text" name="codedel" size="15" maxlength="20">
            </td>
            <td width="29%">&nbsp; </td>
          </tr>
          <tr> 
            <td width="21%">
              <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Ans 
                No</font></div>
            </td>
            <td width="50%">
              <input type="text" name="ans_no" size="15" maxlength="20" value="ALL">
            </td>
            <td width="29%">
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><a href="menudel.php" target="_blank">เลือกหมวดที่จะลบ</a></font></div>
            </td>
          </tr>
          <tr>
            <td width="21%">&nbsp;</td>
            <td width="50%">
              <input type="submit" name="Submit" value="ลบประกาศ">
            </td>
            <td width="29%">&nbsp;</td>
          </tr>
        </table>
    </td>
  </tr>
</table>
</form>
<form name="formnews" enctype="multipart/form-data" method="post" action="adminnews.php"  target="_blank" onsubmit="return check3()" >
<table width="80%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0099FF" align="center">
  <tr> 
      <td width="30%" bgcolor="#FFFFD7"> 
        <div align="center"><font face="MS Sans Serif" size="2"><b><font color="#0000FF">ข่าวประชาสัมพันธ์</font></b></font></div>
    </td>
    <td width="70%"> 
        <table width="100%" border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFD7">
          <tr> 
          <td> 
            <input type="file" name="file" size="15">
            <input type="submit" name="Submit2" value="แทรกข่าว">
          </td>
        </tr>
        <tr> 
          <td> 
            <div align="center"><b><font face="MS Sans Serif" size="2"><a href="delnews.php" target="_blank">ลบข่าว 
              </a></font></b></div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
<hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        
      <div align="center"><font color="#0000FF" size="1" face="MS Sans Serif, Microsoft Sans Serif">Department 
        of Computer Engineering Faculty of Engineering King Mongkut's Institute 
        of Technology<br>
        Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>
<?}else
{
echo"<CENTER><H1>ไม่อนุญาตให้เข้าสู่ระบบ</h1></CENTER> ";

}

?>
<script language="JavaScript">
<!--
function check1()
{
	  var v1 = document.formdeluser.userdel.value;
	   
	   if (v1.length==0)
           {
           alert("กรุณาใส่ Username ที่ต้องการลบ ");
		   document.formdeluser.userdel.focus();           
		   return false;
}
		else
           return true;
}
function check2()
{
	  var v1 = document.formdelpost.codedel.value;
      var v2 = document.formdelpost.ans_no.value;
 	   
	   if (v1.length==0)
           {
           alert("กรุณาใส่ Code ที่ต้องการลบ");
           document.formdelpost.codedel.focus();           
		   return false;
           }
       else if ( v2.length==0)
           {
           alert("กรุณาใส่หมายเลขของคำตอบที่ต้องการลบ");
           document.formdelpost.ans_no.focus();           
           return false;
           }
		else
           return true;
}
function check3()
{
	  var v1 = document.formnews.file.value;
	   
	   if (v1.length==0)
           {
           alert("กรุณาใส่ไฟล์ข่าว");
		   document.formnews.file.focus();           
		   return false;
}
		else
           return true;
}
//-->
</script>
</body>
</html>
