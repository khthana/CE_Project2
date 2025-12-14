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
sajax_export("chk_login");
sajax_handle_client_request();
ob_end_flush();
?>
<html>
<head>
<title>Login to Chat Room</title>
<meta http-equiv='content-type' content='text/html; charset=tis-620'>
<script language='javascript'>
<!--
<? sajax_show_javascript(); ?>

function chkPwd_cb(e) {
	if(e == 1) {
		document.getElementById("report").innerHTML = 'Vertify ...';
		window.setTimeout("location.href='contents.php';",3000);
	}
	else {
		document.getElementById("report").innerHTML = e;
		document.getElementById("send").disabled = false;
	}
}

function chkPwd() {
	name = document.getElementById("name").value;
	x_chk_login(name,chkPwd_cb);
	document.getElementById("name").value = '';
	document.getElementById("send").disabled = true;
}

//-->
</script>
</head>
<body>
<table width='' height=''>
<form name='frm' method='post' action='#' onsubmit='chkPwd(); return false;'>
<tr>
<td>Name : <input type='text' name='name' id='name'> <input type='submit' name='send' id='send' value="Let's Talk" onclick='chkPwd(); return false'></td>
</tr>
<tr>
<td><div id='report' style='color:red'>* * * * *</div></td>
</tr>
</table>
</body>
</html>