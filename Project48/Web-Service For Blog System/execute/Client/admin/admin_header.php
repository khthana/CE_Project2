<?php
	session_start();
	include ("../service_register.php");

############################Function Get_Header()############################
function Get_Header() {
	print "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>
			<html>
			<head>
			<title>Administer</title>
			<meta http-equiv='Content-Type' content='text/html; charset=windows-874'>
			<link href='admin_css.css' rel='stylesheet' type='text/css'>";
}

############################Function Get_Header_End()############################
function Get_Header_end() {
	print "</head>
			 <center><body>
				<div class='header'>
					<a href = 'index.php?action=logout'>Logout</a> | 
					<a href = 'admin_list_user.php?page=1'>Home</a>
				</div>";
	$Authen = User_Authentication();
	if ($Authen == 'yes') {
		return true;
	} else {
		print "<div style='color:#FF0000; text-align:center; font-size:14px;'><br><br><br>".$Authe."</div>";
		return false;
	} #End Authentication Condition
		return true;
}

############################Function Get_Tailer()############################
function Get_Tailer() {
	print "<div style='margin-bottom:px; margin-top:10px; clear:both; width:100%; background-color:#333333; color:#FFFFFF; text-align:right; padding:3px;'>
				Copyright 2003 - 2006 soi13.com.,ALL RIGHT RESERVED</div>
			</body></center>
			</html>";
}

#########################Function User_Authentication()#########################
function User_Authentication() {
	global $client;
	global $passkey;

	if (($_SESSION['admin_name']!="")&&($_SESSION['admin_password']!="")&&($_SESSION['admin_id']!="")) {
		$params["user_id"] = $_SESSION['admin_id'];
		$params["username"] = $_SESSION['admin_name'];
		$params["hash_password"] = $_SESSION['admin_password'];
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
		return "กรุณาทำการ login เพื่อแก้ไข Domain";
	}
}

###########################Function GET_LAYOUT##########################
function get_layout ($author_userid) {
	global $client;
	global $passkey;
		
	$params["author_userid"] = $author_userid;
	$params["passkey"] = $passkey;
		
	#Call service check
	$recv_message = $client->call('obtain_layout', $params);
	$success = $recv_message["success"];
	$error_msg = $recv_message["error_message"];
	$message["layout"] = $recv_message["layout"];
	$message["item_seq"] = $recv_message["item_seq"];
	return $recv_message;
}

#########################Function CONVERT_TIME#########################
function convert_time($time) {
	$month_name = array("","มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");
	list($date,$time) = explode(" ",$time);
	list($year,$month,$day) = explode("-",$date);
	list($hour,$min,$sec) = explode(":",$time);
	$month = (int)$month;
	return $day." ".$month_name[$month]." ".$year." เวลา ".$hour.":".$min.":".$sec;
}

?>