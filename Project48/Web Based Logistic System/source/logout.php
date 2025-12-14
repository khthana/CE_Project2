<?
session_start ();
unset ( $_SESSION ['sess_userid']);
unset ( $_SESSION ['sess_username']);
session_destroy();
echo"<meta http-equiv=\"refresh\" content=\"0;url=index.php\">";
?>