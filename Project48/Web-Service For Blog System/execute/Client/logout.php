<?php
	session_start();
	
	setcookie ("username",false,false);
	setcookie ("password",false,false);
	setcookie ("user_id",false,false);
	setcookie ("user_domain",false,false);

	$_SESSION['ss_Access'] = "";							#username mismatch with password
	$_SESSION['ss_Access_Error'] = "";
	session_destroy();
			
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