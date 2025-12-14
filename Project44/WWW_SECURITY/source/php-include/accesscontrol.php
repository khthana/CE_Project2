<?php
	include("db.php");
	
	if(session_is_registered("uid"))  //กรณีของ admin จะต้อง check ว่า user นั้นมี Level 1 ก่อน
	{
		$uid = $HTTP_SESSION_VARS["uid"];
		$sql = "SELECT * FROM accesslist WHERE Username='$uid' AND (Level=1 or Level=2)";	
		$result = mysql_query($sql);
		if (!$result) { print "cannot query database";  exit;}
		if (mysql_num_rows($result) == 0)
		{
			logo_leftmenu("ISAG (Login before access)"); 
			curve_open();
			session_destroy(); //if not destroy , it only go to this loop
			loginmenu(); 
			curve_close();
			empty_4();
			exit;
		}
	}

	if(!session_is_registered("uid") and !isset($HTTP_POST_VARS['uid0'])) 
	{
		 logo_leftmenu("ISAG (Login before access)"); 
		 curve_open();
		 loginmenu(); 
		 curve_close();
		 empty_4(); 						
		exit;
	}
	if (!session_is_registered("uid") and isset($HTTP_POST_VARS['uid0']))
	{
		$uid0=$HTTP_POST_VARS['uid0'];
		$pwd=$HTTP_POST_VARS['pwd'];

		$sql = "SELECT * FROM accesslist WHERE Username = '$uid0' AND Password = PASSWORD('$pwd')";
		$result = mysql_query($sql);
		if (!$result) { print "cannot query database";  exit;}
		if (mysql_num_rows($result) ==1)
		{
			 session_register("uid");
			 $HTTP_SESSION_VARS["uid"]=$uid0;
		}
		if (mysql_num_rows($result) == 0)
		{
			logo_leftmenu("ISAG (Login before access)"); 
			curve_open();
			//access_denied();
			loginmenu(); 
			curve_close();
			empty_4();
			exit;
		}
	}	//$username = mysql_result($result,0,"fullname");
											       	   
?>