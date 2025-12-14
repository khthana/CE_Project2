<?php
ob_start();
session_start();
require '../libs/config.inc.php';
require '../libs/ajax.php'; 
require '../libs/mysql.php';
require '../libs/function.php';
require '../funcs/func_chat.php';

$sajax_request_type = "GET";
sajax_init();
sajax_export("useronline");
sajax_handle_client_request();

ob_end_flush();
?>
<html>
<head>
<title></title>
<meta http-equiv='content-type' content='text/html; charset=utf-8'>
<link rel='stylesheet' href='../css/main.css' type='text/css'>
<script language='javascript'>
<!--
<? sajax_show_javascript(); ?>

function refresh_cb(e) {
	document.getElementById('useronline').innerHTML = e;
	self.scrollTo(0, 1000)
	setTimeout("refresh()", 20000); // update every 20 seconds
}

function refresh() {
	x_useronline(refresh_cb);
}

//-->
</script>
</head>
<body onload='refresh()'>

<table width='100%' cellpadding='0' cellspacing='0'>
<tr>
<td><div id='useronline' class='online_male' style='text-align:right;vertical-align:top'></div></td>
</tr>
</table>
</body>
</html>