<?php
	include ("admin.inc.php");
	include ("admin_header.php");
	
		
	if($_GET['action'] == 'logout') {
		$_SESSION['admin_name'] = "";
		$_SESSION['admin_password'] = "";
		$_SESSION['admin_id'] = "";
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=index.php\"> \n";
		exit();
	} else if (($_POST['tusername'] != "")&&($_POST['tpassword'] != "")){
		
		#Call Service for Login
		$params["username"] = $_POST['tusername'];
		$params["password"] = $_POST['tpassword'];
		$params["passkey"] = $passkey;

		$message = $client->call('user_login', $params);
		$success = $message["success"];
		$error_msg = $message["error_message"];
			
		if ($success=='yes') {
			if (($message["user_id"])==$Domain_ID) {
				$_SESSION['admin_name'] = $_POST['tusername'];
				$_SESSION['admin_password'] = md5($_POST['tpassword']);
				$_SESSION['admin_id'] = $message["user_id"];
				print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=admin_list_user.php?page=1\"> \n";
				exit();
			} else {
				$error_msg = "Username และ Password ไม่ถูกต้อง";
			}#End Check Correct Site
		} #End Call Service Condition
	} #End Submit Condition

	#Get Header for Html
	Get_Header();

	#Javascript for Check Complete Form
	print "<script language=\"javascript\" type=\"text/javascript\">
				function CheckLoginForm(form) {
					User= document.LoginForm.tusername.value;
					Pass= document.LoginForm.tpassword.value;
					if ((!User)&&(!Pass)) { 
						alert('กรุณาใส่Username และ Password ให้ถูกต้อง');
						return false;
					} else {
						return true;
					}
				}
			</script>";

	#Get Start <body>
	print "</head>
			 <center><body>
				<div class='header'>Home</div>";

	#Username or Password Invalid
	($error_msg) ? "<div style='background-color:#FFFF99; color:#FF0000; text-align:center; font-size:14px;'>ผิดพลาด : ".$error_msg."</div>" : ""; 

	#Print form for login
	print "<br><br><br><br>
				<br>
				<div style='border-color:#FF6600; border-style:groove; width:350px; text-align:left; padding:5px;'>
				<img src='../images/admin_header_login.jpg' width='350' height='30' style='margin-bottom:7px; '>	
				<form name='LoginForm' method='post' action='' style='margin:0px;' onSubmit=\"return CheckLoginForm()\">
					<table width='95%'  border='0' cellspacing='0' cellpadding='0'>
					  <tr>
						<td><strong>Username : </strong></td>
						<td><input name='tusername' type='text' id='tusername' style='margin:7px;' size='30' maxlength='20'></td>
					  </tr>
					  <tr>
						<td><strong>Password :</strong></td>
						<td><input name='tpassword' type='password' id='tpassword' style='margin:7px;' size='30' maxlength='20'></td>
					  </tr>
					  <tr>
						<td>&nbsp;</td>
						<td align='right'><input name='Log_Submit' type='submit' id='log_Submit' style='margin:7px; width:100px;' value='Login'></td>
					  </tr>
					</table>
					</form>
					</div><br><br><br><br><br>";

	#Get_Tailer HTML
	Get_Tailer();

?>