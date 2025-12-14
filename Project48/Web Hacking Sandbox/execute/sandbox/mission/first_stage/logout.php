<?php 
		setcookie('passkey', $session, time()-3600);
		header("Location:home.php");
?>