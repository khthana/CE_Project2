<?php
	session_start();
	include "config.inc.php";
	include "service_register.php";

	if ((isset($_POST['tusername']))&&(isset($_POST['tpassword']))&&($_POST['tusername'] != "")&&($_POST['tpassword'] != "")) {
		$params["username"] = $_POST['tusername'];
		$params["password"] = $_POST['tpassword'];
		$params["passkey"] = $passkey;
		
	#Call service check
		$message = $client->call('user_login', $params);
		$success = $message["success"];
		$error_msg = $message["error_message"];
		$user_id = $message["user_id"];
		$user_domain = $message["url"];
	
#		$success = "yes";
#		$error_msg = "error msg";
		
		if ($success == "no") {
			$_SESSION['ss_Access'] = "error";															#username mismatch with password
			$_SESSION['ss_Access_Error'] = $error_msg;
		} else  if ($success=="yes") {
			if ($cremember == "remember") {
				$password = md5($_POST['tpassword']);
				setcookie ("username",$_POST['tusername'],time()+60*60*24*30*12*10);
				setcookie ("password",$password,time()+60*60*24*30*12*10);
				setcookie ("user_id",$user_id,time()+60*60*24*30*12*10);
				setcookie ("user_domain",$user_domain,time()+60*60*24*30*12*10);
				$_SESSION['ss_Access'] = "valid";
			} else {
				$_SESSION['ss_Access'] = "valid";														#Username And password match can access
				$password = md5($_POST['tpassword']);
				setcookie ("username",$_POST['tusername']);
				setcookie ("password",$password);
				setcookie ("user_id",$user_id);
				setcookie ("user_domain",$user_domain);
			}
		}
	} else {
		$_SESSION['ss_Access'] = "not complete";												#not insert both
	}

	echo "<html> \n";
	echo "<head> \n";
	echo "<title>Register</title> \n";
	echo "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=index.php\"> \n";
	echo "</head> \n";
	echo "<body> \n";
	echo "redirect... \n";
	echo "</body> \n";
	echo "</html> \n";

?>