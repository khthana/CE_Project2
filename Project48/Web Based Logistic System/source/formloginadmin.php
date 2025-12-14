<HTML>
<HEAD>
<TITLE>Login</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-874">
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="239" border="0" align="center" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
  <tr> 
    <td width="233" height="18" bgcolor="#CC0033"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>หน้าจอเข้าระบบของผู้บริหารระบบ</strong></font></td>
  </tr>
  <tr>
  <td height="78" valign="top" bgcolor="#CC0000">

                
        <table width="100%" border="0" bgcolor="#ffffdd">
        <form name="form1" method="post" action="?file2=formloginmanager.php" >
          <tr> 
            <td width="12%"><font size="1" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><strong>Username</strong></font> 
              <strong><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              </font></strong><strong><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif"></font></strong></td>
            <td width="88%"><strong><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input type="text" name="user_name">
              </font></strong></td>
          </tr>
          <tr> 
            <td><strong><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><font size="1">Password</font></font></strong>:<font face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp; 
              </font></td>
            <td><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input type="password" name="password">
              </font></td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td><div align="left"><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <input type="submit" name="Submit" value="เข้าระบบ">
                <input type="hidden" name="type" value="1">
                </font></div></td>
          </tr>
        </form>
      </table>
            
  </td>
  </tr>
</table>
<table width="314" border="0" align="center">
  <tr>
    <td width="304" align="center"><font color="#FF0000">
      <?
if($type==1){
$username=$_POST[user_name];
$password=$_POST[password];
include "connect.php";
$password1=md5("$password");
$sql="select * from user where binary id_user='$username' and binary password='$password1' ";
$result=mysql_db_query($dbname,$sql);
if($result){
	$num=mysql_num_rows($result);
	if($num<=0)
	{
	print("<img src=\"images/img/icon_err.gif\"  align=\"absmiddle\">ไม่อนุญาติให้ใช้งานในส่วนนี้เนื่องจาก<br>
	ท่านกรอกข้อมูลไม่ถูกต้อง กรุณาตรวจสอบใหม่อีกครั้ง");
	
	//exit();
	}
	else{
	session_start();
	$array=mysql_fetch_array($result);
	$name=$array[name];
	$lname=$array[sername];
	//$place=$array[place];
	$typeuser=$array[id_type];
	$_SESSION[sess_userid]=$username;
	$_SESSION[sess_name]=$name;
	$_SESSION[sess_lname]=$lname;
	$_SESSION[sess_place]=$place;
	$_SESSION[sess_type]=$typeuser;
	$_SESSION[session_id]=$session_id;
	print"<meta http-equiv=\"refresh\" content=\"0;url=Admin/admin.php\">";       //exit();
	}
}
}

?>
      </font></td>
  </tr>
</table>
</BODY>
</HTML>
