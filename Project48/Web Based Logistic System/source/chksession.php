<?
session_start();
$sess_userid=$_SESSION[sess_userid];
$sess_username=$_SESSION[sess_username];
if($session_id<>session_id() or $session_username=""){
	print"<meta http-equiv=\"refresh\" content=\"0;url=index.php?file=login.php\">";       exit();
}

?>