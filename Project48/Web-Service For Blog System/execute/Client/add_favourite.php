<?php
	session_start();
	include "service_register.php";
	$error_msg = add_Favourite();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Category</title>
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
	margin:5px;
	padding:5px;
	text-align: center;
}

div.topic {
	background-color:#CCCCCC;
	color:#333333;
	padding:2px;
	font-size:12px;
	border-style:none;
	text-align:left;
	margin:4px;
	width:335px;
	font-weight:bold;
}
</style>
<script language="JavaScript" type="text/JavaScript">
</script></head>
<body >
	<div class='topic'>Add Favourite</div>
<?php
#Authentcaion
	$authen = user_authen();
	if (($authen=="yes")&&(!$error_msg)) {	
?>
	<br><div style=\"text-align:center;\">คุณได้ทำการเพิ่มรายชื่อใน Favourite เรียบร้อยแล้ว</div><br>
<?php
	} else {
		if ($authen !="yes") {
			print "<br><div style=\"text-align:center;\">".$authen."</div><br><br>";
		} else if ($error_msg){
			Print "<br><div style=\"text-align:center;\">".$error_msg."</div><br><br>";
		} else {
			Print "<br><div style=\"text-align:center;\">กรุณาทำการ login เพื่อทำการเพิ่มรายชื่อใน Favourite</div><br><br>";
		}
	}
?>
	<div align='center'><input type="button" name="CloseForm" value="Close" onClick="window.close()"></div><br>
	<div style="width:99%; background-color:#333333; color:#FFFFFF;margin:0px; border-style:none; text-align:right; font-size:12px;">
		Copyright 2003 - 2006 soi13.com.,ALL RIGHT RESERVED</div>
</body>
</html>
<?php
#########################Function ADD_FAVOURITE##########################
function add_Favourite() {
	global $client;
	global $passkey;
		
	$params["favourite_userid"] = $_GET['authoruserid'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;
	
	#Call service check
	$message = $client->call('submit_favourite', $params);

	return $message["error_message"];
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