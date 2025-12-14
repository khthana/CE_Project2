<?php
	session_start();
	include "config.inc.php";
	include "service_register.php";
	$access = true;

#Password Match Check
			if ((isset($_POST['tpassword']))&&(isset($_POST['trepassword']))&&($_POST['tpassword'] != "")&&($_POST['trepassword'] != "")) {
				if ($_POST['tpassword'] != $_POST['trepassword'] ) {
					 $_SESSION['ss_RePassword_Valid'] = "repass blank";
					 $access = false;
					} else {
						 $_SESSION['ss_RePassword_Valid'] = "" ;
					}
			}
			
#Secure Code check
		if(isset($_POST['tseccode'])) {
			$_SESSION['ss_SecCode'] = $_POST['tseccode'];
			if ($_SESSION['ss_Temp'] == $_SESSION['ss_SecCode']) {
				$_SESSION['ss_SecCode_Valid'] = "match" ;
				($access) ? $access = true : "";
			} else {
				$_SESSION['ss_SecCode_Valid'] = "mismatch";
				$access = false;
			}
		} else {
			$_SESSION['ss_SecCode_Valid'] = "mismatch";
			$access = false;
		}

#Call service & Store data
	if ($access) {
		$params["username"] = $_POST['tusername'];
		$params["alias"] = str_replace("\"", "&#34;", str_replace("'", "&#39;", rtrim(trim($_POST['tcomname']))));
		$params["title"] = str_replace("\"", "&#34;", str_replace("'", "&#39;", rtrim(trim($_POST['ttitle']))));
		$params["password"] =  $_POST['tpassword'];
		$params["email"] = $_POST['temail'];
		$params["passkey"] = $passkey;
		
		$message = $client->call('user_register', $params);
		$success = $message["success"];								#"yes" "no"	
		$_SESSION['ss_Username_Msg'] = $message["username_error_message"];						
		$_SESSION['ss_Alias_Msg'] = $message["alias_error_message"];
		$_SESSION['ss_Title_Msg'] = $message["title_error_message"];
		$_SESSION['ss_Password_Msg'] = $message["password_error_message"];
		$_SESSION['ss_Email_Msg'] = $message["email_error_message"];
		$_SESSION['ss_ErrorReg_Msg'] = $message["error_message"];
		$_SESSION['ss_User_id'] = $message["user_id"];
	} else {
		$success = "no";
		$_SESSION['ss_ErrorReg_Msg'] = "";
	}

	if ($success == "yes") {																				#Success can regis
		$_SESSION['ss_UserName'] = $_POST['tusername'];
		print "Complete";
		echo "<html> \n";
		echo "<head> \n";
		echo "<title>Register</title> \n";
		echo "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=regis_success.php\"> \n";
		exit();
	} else {																																	#Error with incorrect form
		if ($_SESSION['ss_ErrorReg_Msg'] == "") {																
			($_SESSION['ss_Username_Msg'] == "" ) ? $_SESSION['ss_UserName'] = $_POST['tusername'] :  $_SESSION['ss_UserName'] = "";
			$_SESSION['ss_Alias'] = $_POST['tcomname'];
			$_SESSION['ss_Title'] = $_POST['ttitle'];
			($_SESSION['ss_Email_Msg'] == "") ? $_SESSION['ss_Email'] = $_POST['temail'] : $_SESSION['ss_Email'] = "";
			echo "<html> \n";
			echo "<head> \n";
			echo "<title>Register</title> \n";
			echo "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=regis_form.php\"> \n";
			exit();
		} else {																																#Error with DB or Passkey
			echo "<html> \n";
			echo "<head> \n";
			echo "<title>Register</title> \n";
			echo "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=regis_error.php\"> \n";
			exit();
		}
	}

?>
