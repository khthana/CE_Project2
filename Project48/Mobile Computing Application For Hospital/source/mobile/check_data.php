<?
function check_valid_user()	
{
global $valid_user;
if(session_is_registered("valid_user")){
		$str = "<tr><td align=\"center\" colspan=\"3\"><font face = \"MS Sans Serif\" color=\"#FFFFFF\" size=\"2\"><strong>$valid_user</strong><br><br></font></td></tr>";
		if(session_is_registered("login"))
				$str = "<tr><td align=\"center\" colspan=\"3\"><font face = \"MS Sans Serif\" color=\"#FFFFFF\" size=\"2\"><strong>$login</strong><br><br></font></td></tr>";
			if(session_is_registered("officer"))
					$str = "<tr><td align=\"center\" colspan=\"3\"><font face = \"MS Sans Serif\" color=\"#FFFFFF\" size=\"2\"><strong>$officer</strong><br><br></font></td></tr>";
				if(session_is_registered("normal"))
						$str = "<tr><td align=\"center\" colspan=\"3\"><font face = \"MS Sans Serif\" color=\"#FFFFFF\" size=\"2\"><strong>$normal</strong><br><br></font></td></tr>";
}
else{
		$str = "<center>คุณไม่ได้ล็อกอิน</center><br>";
		return $str;
}
}

// ----------------------------------------------------filled_out ---------------------------------------------------------
function filled_out($form_vars)			
{
	foreach($form_vars as $key=>$value);
	{
		if(!isset($key)||($value==""))
			return false;
	}
	return true;
}
// ----------------------------------------------------check_admin ---------------------------------------------------------
function check_admin()			
{
  global $authuser;
  if (session_is_registered("authuser"))
  {
      echo "<br><br><tr><td><center><font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\"><strong>+ ล็อกอินโดยผู้ดูแลระบบ $authuser +</strong></font></center>";
      echo "</td></tr>";
	  return true;
  }
  else
  {
     echo "<tr><td><center><font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\"><strong>คุณไม่ได้ล็อกอิน $authuser</strong></font></center></td></tr>";
	 return false;
     exit;
  }  
}
// ----------------------------------------------------check_valid_officer ---------------------------------------------------------
function check_valid_officer()			
{  
  global $valid_officer;
  global $id;

  if (session_is_registered("valid_officer"))
  {
      echo "<br><br><tr><td><center><font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\"><strong>+ ล็อกอินโดยพนักงาน $valid_officer +</strong></font></center>";
      echo "</td></tr>";		
	  return true;
  }
  else
  {
     echo "<tr><td><center><font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\"><strong>คุณไม่ได้ล็อกอิน $valid_officer</strong></font></center></td></tr>";
	 return false;
     exit;
  }  
}
// ----------------------------------------------------valid_email ---------------------------------------------------------
function valid_email($add)			
{
if(ereg("^[a-zA-Z0-9_]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]",$add))
	return true;
else
	return false;
}

?>