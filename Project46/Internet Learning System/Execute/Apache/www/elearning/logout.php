<?php
	session_start();
//	session_id();
//	session_unset();
//	session_unregister("user");
	session_destroy(); 
//if($file==null) 
//header("Location: index.php"); 
//else 
//header("Location: $file"); 

//	session_unregister('user');
//	unset($_SESSION['user']);
//	$HTTP_SESSION_VARS['user'] = $user;
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
?>