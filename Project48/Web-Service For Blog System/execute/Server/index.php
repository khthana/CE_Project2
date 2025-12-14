<?
include "config.inc.php";

$link = mysql_connect("$host","$db_username","$db_password");

mysql_select_db(regisblog);

if($_POST["username"]){

	$strSQL = "SELECT * FROM domain WHERE admin_username = '$_POST[username]' AND admin_password = MD5('$_POST[password]')";
	$result = mysql_query($strSQL);
	$row = mysql_fetch_array($result);
	$num = mysql_num_rows($result);

	mysql_close($link);

	if($num > 0){

		setcookie("admin_username",$row[admin_username],time()+(60*60*24*30*12));
		setcookie("hash_admin_password",$row[admin_password],time()+(60*60*24*30*12));

		echo "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=cpanel.php\"> \n";
		exit();

	} else {

		$error_message = "Username / Password ผิดพลาด";

	}

} 

if($_COOKIE["admin_username"]){

	echo "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=cpanel.php\"> \n";
	exit();

} 


?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Regisblog Service :: An Ultimate Blog Solution</title>
<style type="text/css">
<!--
body {
	background-image: url();
}
.style1 {font-size: 9px}
.style2 {
	font-family: Tahoma;
	font-size: 10px;
}
.style4 {font-family: Tahoma; font-size: 10px; font-weight: bold; color: #0000FF; }
.style5 {font-size: 11px}
.style7 {font-family: Tahoma; font-size: 10px; font-weight: bold; color: #FF0000; }
.style8 {font-size: 10px}
.style9 {font-size: 10px; color: #0000FF; font-family: Tahoma;}
.style11 {font-size: 11px; font-weight: bold; }
.style13 {font-size: 11px; font-weight: bold; color: #0000FF; }
.style14 {font-size: 10px; font-weight: bold; font-family: Tahoma;}
a:link {
	text-decoration: none;
	color: #FF0000;
}
a:visited {
	text-decoration: none;
	color: #FF0000;
}
a:hover {
	text-decoration: underline;
	color: #FF0000;
}
a:active {
	text-decoration: none;
	color: #FF0000;
}
-->
</style></head>

<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="90" colspan="5"><img src="images/images_top.jpg" width="780" height="90"></td>
  </tr>
  <tr>
    <td height="40" colspan="5"><img src="images/images_middle.jpg" width="780" height="40"></td>
  </tr>
  <tr>
    <td width="50"><img src="images/images_main_1.jpg" width="50" height="440"></td>
    <td width="180" valign="top" bgcolor="#D6E7FF"><div align="right" class="style2">
      <div align="left"><form method="POST"><br>
          <span class="style4"><img src="images/key.gif" width="16" height="16" align="absmiddle"> </span><span class="style13">Members Login<strong></strong></span><strong><br>
          </strong> <br>
<?
if($error_message){
	echo "<span class=\"style7\">$error_message</span> <br> \n";
}
?>
        Username :
  
        <input name="username" type="text" size="20">
          <br>
          <br>
          Password : 
          <input name="password" type="password" size="20">
          <br>
          <br>
          <input type="submit" name="Submit" value="Submit">
          <br>
          <br>
            <span class="style7">&nbsp;&nbsp;&nbsp;&nbsp;:: Forgot Password :: </span>
      </form>
          <p><img src="images/dollar.gif" width="16" height="16" align="absmiddle"><span class="style13"> Refill Money<br>
            <br>
          </span><a href="refillcenter.php"><span class="style9">&nbsp;&nbsp;&nbsp;&nbsp;+ Refill Center </span></a><br>
            <br>
            <img src="images/apply.gif" width="16" height="16" align="absmiddle"> <span class="style13">Register with US</span><br>
            <br>
		  
            <span class="style9">&nbsp;&nbsp;&nbsp;&nbsp;+ Regisblog Service คืออะไร<br> 
            <br>
&nbsp;&nbsp;&nbsp;&nbsp;+ ประโยชน์ที่จะได้รับ<br>
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;+ อัตราค่าใช้บริการ <br>
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;+ ข้อตกลงในการใช้บริการ</span><span class="style8"><br>
          <br>
		  </span> &nbsp;&nbsp;&nbsp;&nbsp; <a href="register.php"><span class="style7"><strong>:: สมัครใช้บริการ :: </strong></span></a><br>
          <br>
          </p>
        </div>
    </div></td>
    <td width="20"><img src="images/images_main_3.jpg" width="20" height="440"></td>
    <td width="505" valign="top" bgcolor="#FFCF8C"><div align="left"><span class="style11"><img src="images/calendar.gif" width="16" height="16" align="absbottom"> 08/11/2548<br>
      <br>
    </span><span class="style5">เริ่มเปิดเว็บไซด์ regisblog.com เป็นครั้งแรก </span><br> 
    </div></td>
    <td width="25"><img src="images/images_main_5.jpg" width="25" height="440"></td>
  </tr>
  <tr>
    <td height="10" colspan="5" background="images/images_bottom.jpg"><div align="right"><span class="style1"><br>
    copyright &copy; Regisblog.com 2004-2005. &nbsp;&nbsp;&nbsp;</span></div></td>
  </tr>
</table>
</body>
</html>