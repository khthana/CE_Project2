<?
include "config.inc.php";
session_start();
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Regisblog :: Register with US</title>
<style type="text/css">
<!--
.style4 {
	font-family: Verdana;
	font-size: 10px;
}
.style3 {	font-family: Tahoma;
	font-size: 12px;
	color: #000000;
	font-weight: bold;
}
.style5 {font-family: Tahoma; font-size: 12px; }
a:link {
	color: #FF0000;
	text-decoration: none;
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
.style6 {color: #FF0000}
-->
</style>

<script language="JavaScript">
<!--
function check_form2()
{
      var v1 = document.form2.domain.value;
      var v2 = document.form2.admin_username.value;
      var v3 = document.form2.admin_password.value;
	  var v4 = document.form2.no_user.value;
        if ( v1.length==0)
           {
           alert("กรุณาระบุ Domain Name ที่คุณต้องการใช้งาน");
           document.form2.domain.focus();           
           return false;
           }
        else if (v2.length<4)
           {
           alert("กรุณาตั้ง Admin Username ความยาวไม่น้อยกว่า 4 ตัวอักษร");
           document.form2.admin_username.focus();           
		   return false;
           }
        else if (v3.length<4)
           {
           alert("กรุณาตั้ง Admin Password ความยาวไม่น้อยกว่า 4 ตัวอักษร");
           document.form2.admin_password.focus();           
		   return false;
           }
		else if ((document.form2.service_type[1].checked) && (v4.length == 0))
			{
			alert("กรุณาระบุจำนวน Blog ที่ต้องการให้มีในระบบ");
			document.form2.no_user.focus();
			return false;
			}
        else
           return true;
}


//-->
</script>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">

<?
if(!$_GET["step"]){
	$_GET["step"] = 1;
}

?>

<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><img src="images/images2_top.jpg" width="780" height="90"></td>
  </tr>
  <tr>
    <td width="50" rowspan="4"><img src="images/images2_main_1.jpg" width="50" height="490"></td>
    <td width="725" height="40" bgcolor="#FFBE52"><img src="images/register.jpg" width="102" height="40"></td>
    <td width="25" rowspan="4"><img src="images/images2_main_3.jpg" width="25" height="490"></td>
  </tr>
  <tr>
    <td height="421" valign="top">
      <div align="center"></div>      
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top" class="style5"><p align="right"><img src="images/apply.gif" width="16" height="16" align="top"> <span class="style3">สมัครใช้บริการของเรา</span></p>
 
<?        
if($_GET["step"] == 1){
echo<<<HTML
 <p align="left" class="style5"><span class="style6">* ก่อนสมัครสมาชิก กรุณาอ่าน <strong><a href="term.php" target="_blank">ข้อตกลงในการใช้บริการ</a></strong> และ <strong><a href="cost.php">อัตราค่าบริการ</a></strong> ก่อน * </span><br>
            <br>
            <img src="images/about.gif" width="16" height="16" align="absmiddle"> <span class="style3">STEP 1</span> <br>
            <br>
            ข้อมูลส่วนตัวในการใช้บริการ Regisblog Service<br>
			<form name="form1" action="register.php?step=2" method="post" class="style5">
            username ของคุณในระบบ regisblog : 
            <input name="username" type="text" id="username" size="20">
            &nbsp;&nbsp;<br>
            <br>
            password ของคุณในระบบ regisblog : 
            <input name="password" type="password" id="password" size="20">
            <br>
            <br>
            <input type="submit" name="Submit" value="Next">
			</form>
            <br>
            <br>
            <br> 
          </p>
HTML;
} else if($_GET["step"] == 2){

$link = mysql_connect("$host","$db_username","$db_password");

mysql_select_db(regisblog);

$_POST["username"] = addslashes($_POST["username"]);
$_POST["password"] = addslashes($_POST["password"]);

$strSQL = "SELECT * FROM user WHERE username = '$_POST[username]' AND password = MD5('$_POST[password]')";

$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);
if($num < 1){
	$success = 0;
	$error_message = "Username / Password ของคุณผิดพลาด";
} else {

	$strSQL = "SELECT * FROM domain WHERE admin_user_id = '$row[user_id]'";
	$result = mysql_query($strSQL);
	$num = mysql_num_rows($result);
	if($num > 0){
		$success = 0;
		$error_message = "Username $_POST[username] ได้ใช้งานเป็น admin ของ blog อื่นแล้ว";
	} else {
		$success = 1;
	}

}

if($success == 0){
echo<<<HTML
<div align="center"><br>
    <br>
    <img src="images/false.gif" width="16" height="16" align="top"> ไม่สามารถดำเนินการต่อได้ <br>
    <br>
    เนื่องจาก : $error_message <br>
    <br>
    <a href="javascript:history.back()"><img src="images/reverse.gif" width="16" height="16" border="0" align="absmiddle"> กลับไปแก้ไข</a><br>
    <br>
</div>
HTML;
}else{
//session_start();
$_SESSION["user_id"] = $row["user_id"];
$_SESSION["username"] = $row["username"];
$_SESSION["hash_password"] = $row["password"];
$_SESSION["credit_left"] = $row["credit_left"];

echo "<img src=\"images/about.gif\" width=\"16\" height=\"16\" align=\"absmiddle\"> <span class=\"style3\">STEP 2 </span><br> \n";
echo "<br> \n";
echo "<span class=\"style6\">คุณต้องการใช้ username <strong>$_SESSION[username]</strong> ในการสมัครใช้บริการ โดยมี credit เหลืออยู่จำนวน <strong>$_SESSION[credit_left]</strong> credits</span> \n";
 
echo<<<HTML
<br>
<br> 
กรุณาระบุข้อมูลของบริการที่คุณต้องการใช้<br>
<form name="form2" method="post" action="register.php?step=3" onsubmit="return check_form2()">
  Domain ที่ต้องการใช้บริการ : http://
  <input name="domain" type="text" id="domain" size="30">
  <br>
  <br>
รูปแบบของบริการที่ต้องการใช้ : <br>
<br>
<input name="service_type" type="radio" value="unlimited" checked>
Unlimited (ไม่จำกัดจำนวน blog ที่สามารถมีได้ในระบบ) <br>
<br>
<input name="service_type" type="radio" value="limited">
Limited (จำกัดจำนวน blog ที่สามารถมีได้ในระบบ โดยจำกัดที่
<input name="no_user" type="text" id="no_user" value="1" size="1">
blogs)<br>
<br>
กรุณาตั้ง Administrator username/password สำหรับบริหารระบบของคุณ (ความยาวไม่ต่ำกว่า 4 ตัวอักษร)<br>
<br>
Admin username :
<input name="admin_username" type="text" id="admin_username" size="20">
&nbsp;&nbsp;&nbsp;Admin password :
<input name="admin_password" type="password" id="admin_password" size="20">
<br>
<br>
<input type="submit" name="Submit" value="Next">
</form>
HTML;
}

mysql_close($link);

} else if($_GET["step"] == 3){

//	echo "userid = $_SESSION[user_id]";

		//session_start();
$link = mysql_connect("$host","$db_username","$db_password");

mysql_select_db(regisblog);

		if($_POST[service_type] == "unlimited"){

			$strSQL = "SELECT * FROM payment_cost WHERE payment_type = 'unlimited'";
			$result = mysql_query($strSQL);
			$row = mysql_fetch_array($result);
			$total = $row["payment_cost"];

		} else if($_POST[service_type] == "limited"){

			$strSQL = "SELECT * FROM payment_cost WHERE payment_type = 'limited_base'";
			$result = mysql_query($strSQL);
			$row = mysql_fetch_array($result);
			$total = $row["payment_cost"];

			$strSQL = "SELECT * FROM payment_cost WHERE payment_type = 'limited_per_user'";
			$result = mysql_query($strSQL);
			$row = mysql_fetch_array($result);

			$total = ($total + ($_POST[no_user]*$row["payment_cost"]));
		}

mysql_close($link);

		$_SESSION["total_credit"] = $total;

		if ($total > $_SESSION["credit_left"]){
			$error = 1;
			$error_message = "คุณมี Credit เหลือในบัญชีไม่พอจ่ายค่าบริการเดือนแรก กรุณาเติมเงินเพิ่ม หรือเปลี่ยนรูปแบบการใช้บริการ <br> คุณมี credit เหลืออยู่ $_SESSION[credit_left] / ต้องการ credit $total";
		}

		$pattern = "^([a-z][a-z0-9\_\-]*)(\.[a-z][a-z0-9\_\-]*)+";

		if(!ereg($pattern,$_POST["domain"],$regs)){
			$error = 1;
			$error_message = "Domain Name ของคุณผิดพลาด";
		}

		if(!eregi("^[a-z][a-z0-9\_]*[a-z0-9\_]*$",$_POST["admin_username"])) {
			$error = 1;
			$error_message = "Username ของคุณผิดพลาด (username จะต้องขึ้นต้นด้วยตัวอักษร และประกอบด้วยตัวอักษร/ตัวเลข/_เท่านั้น)";
		}

		if(!eregi("^[a-z][a-z0-9\_]*[a-z0-9\_]*$",$_POST["admin_password"])) {
			$error = 1;
			$error_message = "Password ของคุณผิดพลาด (password จะต้องขึ้นต้นด้วยตัวอักษร และประกอบด้วยตัวอักษร/ตัวเลข/_เท่านั้น)";
		}

		$link = mysql_connect("$host","$db_username","$db_password");

		mysql_select_db(regisblog);

		$_POST["admin_username"] = addslashes($_POST["admin_username"]);

		$strSQL = "SELECT * FROM domain WHERE admin_username = '$_POST[admin_username]'";

		$result = mysql_query($strSQL);

		$num = mysql_num_rows($result);

		mysql_close($link);

		if($num > 0){
			$error = 1;
			$error_message = "Username ของคุณมีผู้อื่นใช้งานอยู่ก่อนแล้ว";
		}

		if($error == 1){
echo<<<HTML
<div align="center"><br>
    <br>
    <img src="images/false.gif" width="16" height="16" align="top"> ไม่สามารถดำเนินการต่อได้ <br>
    <br>
    เนื่องจาก : $error_message <br>
    <br>
    <a href="javascript:history.back()"><img src="images/reverse.gif" width="16" height="16" border="0" align="absmiddle"> กลับไปแก้ไข</a><br>
    <br>
</div>
HTML;
		} else {

		$_SESSION["admin_username"] = $_POST["admin_username"];
		$_SESSION["admin_password"] = $_POST["admin_password"];
		$_SESSION["service_type"] = $_POST["service_type"];
		$_SESSION["no_user"] = $_POST["no_user"];
		$_SESSION["domain"] = $_POST["domain"];

echo "<img src=\"images/about.gif\" width=\"16\" height=\"16\" align=\"absmiddle\"> <span class=\"style3\">STEP 3</span><br> \n";
echo "<br> \n";
echo "กรุณายืนยันข้อมูลการสมัครใช้บริการ \n";
echo "<br><br> \n";
echo "Domain Name : $_SESSION[domain]<br><br> \n";
echo "รูปแบบการใช้บริการ : ";
if($_SESSION["service_type"] == "unlimited"){
	echo "Unlimited";
} else if($_SESSION["service_type"] == "limited"){
	echo "Limited โดยมีจำนวน blog ได้สูงสุด $_SESSION[no_user] blogs";
}

echo "<br><br> \n";
echo "ค่าบริการรายเดือน : $total บาท<br> <br>  \n";
echo "<span class=\"style6\">* เมื่อคุณยืนยันข้อมูล Credit ในบัญชี ของ $_SESSION[username] จะถูกหักออกเป็นจำนวนเท่ากับค่าบริการรายเดือนเพื่อเป็นค่าบริการสำหรับเดือนแรก * </span><br><br><br> \n";
echo "<img src=\"images/reverse.gif\" width=\"16\" height=\"16\" align=\"texttop\"> <span class=\"style3\"><a href=\"javascript:history.back()\">กลับไปแก้ไขข้อมูล</a></span> || <span class=\"style3\"><a href=\"register.php?step=4\">ยืนยันการสมัครใช้บริการ</a></span> <img src=\"images/forward.gif\" width=\"16\" height=\"16\" align=\"texttop\"> \n";

		}


} else if($_GET["step"] == 4){

		$link = mysql_connect("$host","$db_username","$db_password");
		mysql_select_db(regisblog);
		$strSQL = "SELECT * FROM user WHERE username = '$_SESSION[username]' AND password = '$_SESSION[hash_password]'";
		$result = mysql_query($strSQL);
		$row = mysql_fetch_array($result);
		$num = mysql_num_rows($result);
		if($num < 1){
			$success = "0";
			$error_message = "username/password ผิดพลาด กรุณากลับไปแก้ไข";
		}else{
			$credit = $_SESSION["credit_left"] - $_SESSION["total_credit"];
			$strSQL = "UPDATE user SET credit_left = '$credit' WHERE username = '$_SESSION[username]'";
			$result = mysql_query($strSQL);
			if(!$result){
				$success = "0";
				$error_message = "ไม่สามารถป้อนข้อมูลลง database ได้";
			} else {
				// INSERT NEW DOMAIN
			}
		}
		mysql_close($link);

		if($success == "0"){
echo<<<HTML
<div align="center"><br>
    <br>
    <img src="images/false.gif" width="16" height="16" align="top"> ไม่สามารถดำเนินการต่อได้ <br>
    <br>
    เนื่องจาก : $error_message <br>
    <br>
    <a href="javascript:history.back()"><img src="images/reverse.gif" width="16" height="16" border="0" align="absmiddle"> กลับไปแก้ไข</a><br>
    <br>
</div>
HTML;
		}else{

			$link = mysql_connect("$host","$db_username","$db_password");
			mysql_select_db(regisblog);

			settype($template, "string");
			$template = "1234567890abcdefghijklmnopqrstuvwxyz";
			for ($i = 0; $i <= 12; $i++) {
               $n = rand(0, strlen($template) - 1);
               $domain_passkey .= $template[$n];
		    }

			$mNow = getdate();
			$xNow = $mNow['year']."-".$mNow['mon']."-".$mNow['mday'];

			$strSQL = "INSERT INTO domain(domain_passkey,domain_name,admin_user_id,admin_username,admin_password,valid_date,service_type,no_user) VALUES ('$domain_passkey','$_SESSION[domain]','$_SESSION[user_id]','$_SESSION[admin_username]',MD5('$_SESSION[admin_password]'),FROM_DAYS(TO_DAYS('$xNow')+30),'$_SESSION[service_type]','$_SESSION[no_user]')";
			$result = mysql_query($strSQL);

			if($result){

				$strSQL2 = "SELECT * FROM domain WHERE admin_username = '$_SESSION[admin_username]'";
				$result2 = mysql_query($strSQL2);
				$row2 = mysql_fetch_array($result2);

				$strSQL2 = "UPDATE user SET domain_id = '$row2[domain_id]' WHERE user_id = '$_SESSION[user_id]'";
				$result2 = mysql_query($strSQL2);

				if($result2){
					
					echo "การสมัครสมาชิกเรียบร้อย <br> <a href=\"./\">Click ที่นี่เพื่อกลับไปหน้าแรก</a>";

				} else {
					echo "ไม่สามารถป้อนข้อมูลลงฐานข้อมูลได้ กรุณาติดต่อ Administrator";
				}

			} else {
					echo "ไม่สามารถป้อนข้อมูลลงฐานข้อมูลได้ กรุณาติดต่อ Administrator";
			}

			mysql_close($link);
		}

}

?>

</td>
        </tr>
              </table>      
      <p>&nbsp; </p></td></tr>
  <tr>
    <td height="19" bgcolor="#FFA210"><div align="right" class="style1 style4">copyright &copy; 2004-2006 Regisblog.com all right reserved. </div></td>
  </tr>
  <tr>
    <td height="10" bgcolor="#DEEBFF"><img src="images/blanker_blue.jpg" width="1" height="1"></td>
  </tr>
</table>
</body>
</html>
