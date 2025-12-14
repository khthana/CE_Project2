<?
include "config.inc.php";
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Regisblog Service :: Reset Password</title>
<style type="text/css">
<!--
.style1 {
	font-family: Verdana;
	font-size: 10px;
}
.style2 {font-family: Tahoma; font-size: 12px; }
-->
</style>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">

<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><img src="images/images2_top.jpg" width="780" height="90"></td>
  </tr>
  <tr>
    <td width="50" rowspan="4"><img src="images/images2_main_1.jpg" width="50" height="490"></td>
    <td width="725" height="40" bgcolor="#FFBE52"><img src="images/resetpass.jpg" width="180" height="40"></td>
    <td width="25" rowspan="4"><img src="images/images2_main_3.jpg" width="25" height="490"></td>
  </tr>
  <tr>
    <td height="421" valign="top"><br>
      <table width="568" border="0" align="center" cellpadding="1" cellspacing="1">
        <tr>
          <td width="566" height="359" valign="top" bgcolor="#999999" class="style2"><table width="564"  border="0" cellspacing="1" cellpadding="3"><tr></tr>
          </table>
            <table width="100%" height="371"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="371" valign="top" bgcolor="#FFFFFF"><div align="center">
<?
$link = mysql_connect("$host","$db_username","$db_password");
mysql_select_db(regisblog);

$strSQL = "SELECT * FROM password_recovery WHERE recovery_code = '$_GET[code]'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num < 1){
	echo "<p>&nbsp;</p> \n";
	echo "<p>ไม่พบ recovery code $_GET[code] กรุณาทดลอง Reset Password อีกครั้ง</p> \n";
} else {

	settype($template, "string");
	$template = "1234567890abcdefghijklmnopqrstuvwxyz";
	for ($i = 0; $i <= 9; $i++) {
          $n = rand(0, strlen($template) - 1);
         $newpassword .= $template[$n];
     }

	$strSQL = "UPDATE user SET password = MD5('$newpassword') WHERE user_id = '$row[user_id]'";
	$result = mysql_query($strSQL);

	$strSQL = "DELETE FROM password_recovery WHERE user_id = '$row[user_id]'";
	$result = mysql_query($strSQL);

	echo "<p>&nbsp;</p> \n";
	echo "<p>Regisblog.com ได้ทำการ Reset Password ของคุณ ให้แล้ว</p> \n";
	echo "<p>โดย Password ใหม่ของคุณคือ : $newpassword</p> \n";
	echo "<p>&nbsp;</p> \n";
	echo "<p>ขอบคุณที่เลือกใช้บริการ Blog ในเครือ Regisblog.com</p> \n";
	echo "<p>Regisblog Service </p> \n";
}

mysql_close($link);
?>
                </div></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="19" bgcolor="#FFA210"><div align="right" class="style1">copyright &copy; 2004-2006 Regisblog.com all right reserved. </div></td>
  </tr>
  <tr>
    <td height="10" bgcolor="#DEEBFF"><img src="images/blanker_blue.jpg" width="1" height="1"></td>
  </tr>
</table>
</body>
</html>
