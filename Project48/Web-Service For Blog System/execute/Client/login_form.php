<?php
	#Login Form
	print "<img src='images/domain_login.jpg' width='190px' height='24px'><br>";
//	print "<div class='menu_header'>:: Register & Login ::</div>";

	$authen = user_authen();
	 if ($authen == 'yes') {
		Get_Logout_Form();
	 } else {
		if ($_SESSION['ss_Access'] == "error" ) {
			print "<div style='width:100%; color:#FF0000; background-color:#FFFFCC; text-align:center;'>".$_SESSION['ss_Access_Error']."</div>";
		}
		Get_Login_Form();
	 }

###############################Function Get_Login_Form###############################
function Get_Login_Form() {
	print "<form name='login' method='post' action='user_login.php' onSubmit=\"return checkSubmit(this.form)\"style='margin:0;'>
			<table width='95%' border='0' cellspacing='0' cellpadding='0' style='margin:0; font-size:12px; color:#333333;'>
			<tr>
				<td><strong>Username : </strong></td>
				<td><input name='tusername' type='text' size='10' maxlength='20' style='margin:3px;'></td>
			</tr>
			<tr>
				<td><strong>Password : </strong></td>
				<td><input name='tpassword' type='password' size='10' maxlength='20' style='margin:3px;'></td>
			</tr>
			<tr valign='middle' >
				<td><input name='cremember' type='checkbox' value='remember'> Remember</td>
				<td align='right' >
					<a onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('submit1','','images/domain_loginbt1.jpg',1)\">
			  		<input name='submit1' type='image' value='submit' src='images/domain_loginbt.jpg' width='46' height='18' style='margin:3px;'>
				</td>
			</tr>
			</table></form>";

	print "<div style='text-align:left;'>
			<img src='images/domain_bullet.jpg' width='20' height='20'>
			<a href=\"javascript:displayWindow('forget_password.php',320,160)\">Forget password</a><br>
			<img src='images/domain_bullet.jpg' width='20' height='20'>
			<a href=\"javascript:displayWindow('regis_form.php',545,525)\">สมัครสมาชิก</a><br>
			<img src='images/domain_bullet.jpg' width='20' height='20'>
			<a href='http://network33.ce.kmitl.ac.th/service/refillcenter.php'>เติมเงิน</a><br></div>";
}

###############################Function Get_Logout_Form###############################
function Get_Logout_Form() {
	#Status Form
	print "<div style='width:180px; font-weight:bold; text-align:center; padding:2px; background-color:#CCCCCC;'>
			คุณ Login เป็น : 
			 <a href='".$_COOKIE['user_domain']."'>".$_COOKIE['username']."</a> | 
			 <a href='index.php?action=logout'>Logout</a></div>";

	#List Command
	print "<div style='text-align:left;'>
			<img src='images/domain_bullet.jpg' width='20' height='20'>
			<a href='show_blog.php?userid=".$_COOKIE['user_id']."'>ดู Blog ของคุณ</a><br>
			<img src='images/domain_bullet.jpg' width='20' height='20'>
			<a href='add_entry.php?userid=".$_COOKIE['user_id']."'>เขียน Blog ของคุณ</a><br>
			<img src='images/domain_bullet.jpg' width='20' height='20'>
			<a href='control_profile.php?userid=".$_COOKIE['user_id']."'>แก้ไขข้อมูลส่วนตัว</a><br>
			<img src='images/domain_bullet.jpg' width='20' height='20'>
			<a href='http://network33.ce.kmitl.ac.th/service/refillcenter.php'>เติมเงิน</a><br></div>";
}

#########################Function USER_AUTHEN#########################
function user_authen() {
	global $client;
	global $passkey;

	if ((isset($_COOKIE["user_id"]))&&(isset($_COOKIE["username"]))&&(isset($_COOKIE["password"]))) {
		$params["user_id"] = $_COOKIE["user_id"];
		$params["username"] = $_COOKIE["username"];
		$params["hash_password"] = $_COOKIE["password"];
		$params["passkey"] = "$passkey";

		#Call service check
		$message = $client->call('user_authenticate', $params);
		$success = $message["success"];
		$error_msg = $message["error_message"];

		if ($success =="yes") { 
			return $success;
		} else {
			return $error_message;
		}
	} else {
		return "กรุณาทำการ login เพื่อแก้ไข Blog";
	}
}
?>