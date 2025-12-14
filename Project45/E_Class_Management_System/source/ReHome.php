<?php
		require('./libraries/grab_globals.lib.php');
	   	session_start(); 
		//echo $SESSION[username];
		if(session_is_registered("SESSION")) {
		//echo $SESSION[username];		
	   	session_unregister("SESSION");
	   	session_destroy();
		
	   }
		echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= index.php\">";
?>