<HTML>
<HEAD>
<TITLE>Login</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-874">
</HEAD>
<BODY BGCOLOR=#FFCC00 background="images/bg01.gif" LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><br>
  <br>
</p>
<table width=70% border=1 align='center' cellpadding=0 cellspacing=0 bordercolor="#FFCC00" bgcolor="#FFCC33">
  <tr>
    <td width="19%"  rowspan=2 bgcolor="#FFCC33"><img src='../images/Logistic_01.gif' width=148 height=68 > </td>
    <td height="47" bgcolor="#FFCC33" >&nbsp;<img src='../images/Logistic_02.gif' width=93 height=45  ><img src='../images/Logistic_03.gif' width=90 height=45 ><img src='../images/Logistic_04.gif' width=97 height=45 ><img src='../images/Logistic_05.gif' width=104 height=45 ><img src='../images/Logistic_06.gif' width=90 height=45 ><img src='../images/Logistic_07.gif' width=57 height=45 ></td>
  </tr>
  <tr>
    <td height='18' bgcolor='#FFCC00'><div align="center"><strong></strong></div></td>
  </tr>
  <tr bgcolor="#FFCC33" >
    <td height='16' colspan='2'>
      <div align="right"></div></td>
  </tr>
  <tr>
    <td height='18' colspan='2' valign='top'>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td height="18" bgcolor="#FFCC00"><table width="239" border="0" align="center" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
            <tr>
              <td width="233" height="18" bgcolor="#CC0033"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong><font color="#FFFFFF">หน้าจอเข้าระบบของผู้บริหารระบบ</font></strong></font><font color="#FFFFFF">&nbsp;</font></td>
            </tr>
            <tr>
              <td height="78" valign="top" bgcolor="#CC0033">
                <table width="100%" border="0" bgcolor="#ffffdd">
                  <form name="form1" method="post" action="login.php" >
                    <tr>
                      <td width="12%"><font size="1" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><strong>Username</strong></font> <strong><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> </font></strong><strong><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif"></font></strong></td>
                      <td width="88%"><strong><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif">
                        <input type="text" name="user_name">
                      </font></strong></td>
                    </tr>
                    <tr>
                      <td><strong><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><font size="1">Password</font></font></strong>:<font face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp; </font></td>
                      <td><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif">
                        <input type="password" name="password">
                      </font></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><div align="left"><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" name="Submit" value="เข้าระบบ">
                                <input type="hidden" name="type" value="1">
                      </font></div></td>
                    </tr>
                  </form>
              </table></td>
            </tr>
          </table>
          </td>
        </tr>
    </table></td>
  </tr>
  <tr bgcolor="#FFCC33">
    <td height='27' colspan='2' valign='top'><div align="right"><strong></strong></div></td>
  </tr>
</table>
<table width="314" border="0" align="center">
  <tr>
    <td width="304" align="center"><font color="#FF0000">
      <?
if($type==1){
$username=$_POST[user_name];
$password=$_POST[password];
include "connect.inc.php";
$password1=md5("$password");
$sql="select * from user where binary id_user='$username' and binary password='$password1' ";
$result=mysql_db_query($dbname,$sql);
if($result){
	$num=mysql_num_rows($result);
	if($num<=0)
	{
	print("<img src=\"images/img/icon_err.gif\"  align=\"absmiddle\">ไม่อนุญาติให้ใช้งานในส่วนนี้เนื่องจาก<br>
	ท่านกรอกข้อมูลไม่ถูกต้อง กรุณาตรวจสอบใหม่อีกครั้ง");
	}
	else{
	print"<meta http-equiv=\"refresh\" content=\"0;url=admin.php\">";       //exit();
	}
}
}

?>
      </font></td>
  </tr>
</table>
</BODY>
</HTML>
