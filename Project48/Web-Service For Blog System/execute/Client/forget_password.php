<?php
	session_start();
	include "service_register.php";
	
	$success = 'none';

	#Submit Email
	if($_POST['forsubmit']) {

#Call for category list	
	$params["username"] = $_POST['forusername'];
	$params["email"] = $_POST['foremail'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$message = $client->call('user_forgotpass', $params);

	$success = $message["success"];
	}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Forget Password</title>
<style>
body {
	font-size:12px;
	color:#333333;
	padding:0px;
	margin:0px;
	text-align:left;
	width350px;
}
div {
	width:345px;
	border-color:#CCCCCC;
	border-style:groove;
	border-width:thin;
	padding:5px;
	font-size:12px;
}

div.topic {
	background-color:#CCCCCC;
	color:#333333;
	padding:2px;
	font-size:12px;
	border-style:none;
	text-align:left;
	width:100%;
	font-weight:bold;
}
</style>
<script language="JavaScript" type="text/JavaScript">
function ForgetCheck() {
	var Uname = document.ForgetPasswordForm.forusername.value;
	var Umail = document.ForgetPasswordForm.foremail.value;
	if ((Uname)&&(Umail)) {
		return true;
	} else {
		alert ('กรุณาใส่ username และ email ที่ได้ลงทะเบียนไว้');
		return false;
	}
}
</script></head>
<body >
<div class='topic'>Forget Password</div>
<?php
	if ($success == 'none') {
?>
<form name='ForgetPasswordForm' method='post' action='' style='margin:5px;' onSubmit="return ForgetCheck()">
<table width='270px' border='0' cellspacing='0' cellpadding='0'>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>   User Name :</td>
		<td><input name='forusername' type='text' size='10' maxlength='20' style='margin:3px;'></td>
	</tr>
	<tr>
		<td>   E-mail : </td>
		<td><input name="foremail" type="text" id="temail" size="20" maxlength="40" style='margin:3px;'></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align='right' style='margin:5px;'><input type="submit" name="forsubmit" value="Submit"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
</form>
<?php
} else if ($success=='no') { 
	print "<br><div style=\"text-align:center;\">".$message["error_message"]."</div><br><br>";
} else if ($success=='yes') {
	print "<br><div style=\"text-align:center;\">กรุณารอสักครู่ ระบบกำลังส่ง password ใหม่เข้าไปยัง e-mail".$_POST['foremail']."</div><br><br>";
}
?>
<div style="width:99%; background-color:#333333; color:#FFFFFF;margin:0px; border-style:none; text-align:right; font-size:12px; padding:2px;">
		Copyright 2003 - 2005 soi13.com.,ALL RIGHT RESERVED
	</div>
</body>
</html>
