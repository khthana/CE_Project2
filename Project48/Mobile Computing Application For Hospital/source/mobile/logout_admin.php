<?
session_start();
if (!empty($authuser)) $old_admin = $authuser;
$result_unreg = session_unregister("authuser");
$result_dest = session_destroy();
include("index.php");
if(empty($authuser))
	if(!$result_unreg && !$result_dest)
		echo "ไม่สามารถล็อคเอาท์ได้";
?>