<?php
session_start();
require_once('Connections/conn.php'); 
if($HTTP_POST_VARS['Submit']=="Logout"||$HTTP_GET_VARS['do']=="logout")
{
if($_SESSION['teacher_ID']!=NULL){$sql="update course set IP='NULL' where teaher_ID='$_SESSION[teacher_ID]'";
							mysql_query($sql);}
echo $_SESSION['teacher_ID'];
session_destroy();
echo"<meta http-equiv='refresh' content='0;URL=index.php'>";
}
?>