<?php
ob_start();
session_start();
require '../libs/config.inc.php';
require '../libs/ajax.php'; 
require '../libs/mysql.php';
require '../libs/function.php';
require '../funcs/func_chat.php';
$webSite['pathMsg'] = '../data/messages.html';
$sajax_request_type = "GET";
sajax_init();
sajax_export("refresh");
sajax_handle_client_request();
ob_end_flush();
?>

<html>
<head>
<title></title>
<meta http-equiv='content-type' content='text/html; charset=tis-620'>
<link rel='stylesheet' href='../css/main.css' type='text/css'>
<script language='javascript'>
<!--
<? sajax_show_javascript(); ?>

function refresh_cb(e) {
	document.getElementById('contents').innerHTML = e;
	self.scrollTo(0, 5000)
	setTimeout("refresh()", 3000);
}

function refresh() {
	x_refresh(refresh_cb);
}
//-->
</script>
</head>
<body onload='refresh()'>
<div id='contents' name='contents'></div>
</body>
</html>