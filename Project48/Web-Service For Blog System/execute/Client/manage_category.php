<?php
	session_start();
	include "service_register.php";

#Add category case
	if ($_POST['addbt']) {
		$params["category_name"] = $_POST['buffer_add'];
		$params["username"] = $_COOKIE['username'];
		$params["hash_password"] = $_COOKIE['password'];
		$params["passkey"] = $passkey;
			
		#Call service check
		$message = $client->call('submit_category', $params);
		if ($message["error_message"]) {
			$error_message = $message["error_message"];
		} else {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=manage_category.php?\"> \n";
		exit();
		}
	}

#Edit category case
	if ($_POST['editbt']) {
		$params["author_userid"] = $_COOKIE['user_id'];
		$params["category_id"] = $_POST['selectCat'];
		$params["category_name"] = $_POST['buffer_edit'];
		$params["username"] = $_COOKIE['username'];
		$params["hash_password"] = $_COOKIE['password'];
		$params["passkey"] = $passkey;
			
		#Call service check
		$message = $client->call('edit_category', $params);
		if ($message["error_message"]) {
			$error_message = $message["error_message"];
		} else {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=manage_category.php?\"> \n";
		exit();
		}
	}

#Delete category case
	if ($_POST['deletebt']) {
		$params["author_userid"] = $_COOKIE['user_id'];
		$params["category_id"] = $_POST['selectCat'];
		$params["username"] = $_COOKIE['username'];
		$params["hash_password"] = $_COOKIE['password'];
		$params["passkey"] = $passkey;
			
		#Call service check
		$message = $client->call('delete_category', $params);
		if ($message["error_message"]) {
			$error_message = $message["error_message"];
		} else {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=manage_category.php?\"> \n";
		exit();
		}
	}

	if ($error_message) {
		print "<html>
				<head>
				</head>
				<body >
				<div style='font-size:16px; color:FF0000; text-align:center'>Error : ".$error_message."</div>
				</body>
				</html>";
	} else {

#Call for category list	
	$params["author_userid"] = $_COOKIE['user_id'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$message = $client->call('obtain_layout', $params);

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Category</title>
<style>
body {
	font-size:12px;
	color:#333333;
	padding:0px;
	margin:0px;
	text-align:left;
	width350px;
}
div {
	width:345px;
	margin:5px;
	border-color:#CCCCCC;
	border-style:groove;
	border-width:thin;
	padding:5px;
}

div.topic {
	background-color:#CCCCCC;
	color:#333333;
	padding:2px;
	font-size:12px;
	border-style:none;
	text-align:left;
	margin:4px;
	width:335px;
	font-weight:bold;
}
</style>

<script language="JavaScript" type="text/JavaScript">
function SelectCategory(catobject) {
	var cat_sel = catobject.selectedIndex;
	var cat_txt = catobject.options[cat_sel].text;
	document.manageCat.buffer_edit.value = cat_txt;
}
</script></head>
<body >
<?php
	#Authentcaion
	$authen = user_authen();
	if (($authen=="yes")) {		
?>
<table height="300px" width="360px" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td style="width:350px; background-color:#333333; color:#FFFFFF; font-size:16px; font-weight:bold; padding:8px; margin:0px; border-style:none;">
		&nbsp;&nbsp;&nbsp;Categories
	</td>
<tr>
	<td>
	<div><div class="topic">Edit & Delete Categories</div>
		<form name="manageCat" method="post" action="" >
		  <center><table width="90%" border="0" cellspacing="0" cellpadding="0" style="margin-left:10px; ">
			<tr>
			  <td width="131" rowspan="4">		  
				  <select name="selectCat" size="5" style="width:130px; " onClick="SelectCategory(this)">
		<?php
			$i = 0;
			while ($message["category_id"][$i]) {
				print "<option value='".$message["category_id"][$i]."'>".$message["category_name"][$i]."</option>";
				$i++;
			}
		?>
				  </select> 
			</td>
			  <td width="119"><strong>&nbsp;&nbsp;&nbsp;Name : </strong></td>
			</tr>
			<tr>
			  <td>&nbsp;&nbsp;&nbsp;<input name="buffer_edit" type="text" id="buffer_edit" size="20" maxlength="50"></td>
			</tr>
			<tr>
			  <td>&nbsp;</td>
			</tr>
			<tr>
			  <td><input name="editbt" type="submit" id="editbt" value="Edit">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="deletebt" type="submit" id="deletebt" value="Delete"></td>
			</tr>
		  </table></center>
		</form></div>
	</td>
</tr>
<tr>
	<td><div>
		<div class="topic">Add category</div>
		<form name="addCat" method="post" action="" >
		<center><table width="90%" border="0" cellspacing="0" cellpadding="0" style="margin-left:10px ">
		  <tr>
			<td width="259">&nbsp;&nbsp;&nbsp;<input name="buffer_add" type="text" id="buffer_add" size="30" maxlength="50"></td>
			<td width="91"><input name="addbt" type="submit" id="addbt" value="Add"></td>
		  </tr>
		</table></center>
		</form></div>
	</td>
</tr>
<tr>
	<td style="width:99%; background-color:#333333; color:#FFFFFF;margin:0px; border-style:none; text-align:right; font-size:12px;">
		Copyright 2003 - 2006 soi13.com.,ALL RIGHT RESERVED
	</td>
</tr>
</table>
<?php
	} else {
		if ($authen !="yes") {
			print "<br><div style=\"text-align:center;\">".$authen."</div><br><br>";
		} else {
			Print "<br><div style=\"text-align:center;\">กรุณาทำการ login เพื่อแก้ไข Blog</div><br><br>";
		}
	}
?>
</body>
</html>
<?php
	} #For error message
#########################Function USER_AUTHEN#########################
function user_authen() {
	global $client;
	global $passkey;

	if ((isset($_COOKIE["user_id"]))&&(isset($_COOKIE["username"]))&&(isset($_COOKIE["password"]))) {
		$params["user_id"] = $_COOKIE["user_id"];
		$params["username"] = $_COOKIE["username"];
		$params["hash_password"] = $_COOKIE["password"];
		$params["passkey"] = "$passkey";

		#Call service check
		$message = $client->call('user_authenticate', $params);
		$success = $message["success"];
		$error_msg = $message["error_message"];

		if ($success =="yes") { 
			return $success;
		} else {
			return $error_message;
		}
	} else {
		return "กรุณาทำการ login เพื่อแก้ไข Blog";
	}
}
?>
