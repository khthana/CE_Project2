<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>
<body>
<table width="96%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CC0000">
  <tr> 
    <td height="152" valign="top"> <form name="form2" method="post" action="index.php">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFCC00">
          <tr align="center" valign="middle"> 
            <td height="16"><div align="center"> 
                <table width="100%" height="84%"  border="0" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td height="16" align="center" valign="middle" bgcolor="#CC0000"><div align="center"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>เข้าระบบ</strong></font></div></td>
                  </tr>
                </table>
              </div></td>
          </tr>
          <tr> 
            <td align="left" valign="middle"><div align="center"><strong><font size="1" face="MS Sans Serif, Tahoma, sans-serif">Username 
                : </font></strong> <font size="1" face="MS Sans Serif, Tahoma, sans-serif"> 
                </font></div></td>
          </tr>
          <tr> 
            <td valign="middle"><div align="center"><strong></strong><font size="1" face="MS Sans Serif, Tahoma, sans-serif"> 
                <input name="user_log" type="text" size="10" maxlength="20">
                </font></div></td>
          </tr>
          <tr> 
            <td height="13"><div align="center"><font size="1" face="MS Sans Serif, Tahoma, sans-serif"> 
                <strong><font size="1" face="MS Sans Serif, Tahoma, sans-serif">Password 
                : </font></strong> </font></div></td>
          </tr>
          <tr> 
            <td height="22"> <div align="center"><font size="1" face="MS Sans Serif, Tahoma, sans-serif"> 
                <input name="password_log" type="password" size="10" maxlength="20">
                <input type="hidden" name="flag_log" value="1">
                </font></div></td>
          </tr>
          <tr> 
            <td height="24"><div align="center"><font size="1" face="MS Sans Serif, Tahoma, sans-serif"> 
                <input type="submit" name="Submit" value="เข้าระบบ">
                </font></div></td>
          </tr>
          <tr> 
            <td height="40"><div align="center"><font size="1" face="MS Sans Serif, Tahoma, sans-serif"> 
<?	
//ตรวจสอบการกดปุ่ม submit or reset
if($flag_log==1){
include "connect.php";
$sql="select * from customers where binary cusid='$user_log' and binary password='$password_log' ";
$result=mysql_db_query($dbname,$sql);
if($result){ 
	$num=mysql_num_rows($result);
	if($num<=0)
	{	
		print("<center><font face=Microsoft Sans Serif, MS Sans Serif, sans-serif size=2 color=red><img src=images/img/icon_err.gif> Username หรือ Password ไม่ถูกต้อง</font></center>");
		}else{
$array=mysql_fetch_array($result);
$name=$array["name"];
$lname=$array["lname"];
$status=$array["status"];
mysql_close();
session_start();
////////////////// ประกาศตัวแปรเซสชั่น ///////////////////////////
$_SESSION[sess_username]=$user_log; //รหัสสมาชิก
$_SESSION[sess_name]=$name;// ชื่อ
$_SESSION[sess_lname]=$lname;//นามสกุล
$_SESSION[session_id]=$session_id;//id ของ session
	print"<meta http-equiv=\"refresh\" content=\"0;url=index.php\">";    }
	}
	}
?>
                </font></div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
</html>
