<?php
#########################Function GET_THEME_1##########################
function get_theme_1 () {
	global $client;
	global $passkey;

	$params["user_id"] = $_COOKIE[user_id];
	$params["username"] = $_COOKIE[username];
	$params["hash_password"] = $_COOKIE[password];
	
	#BODY
	$params["body_bg_color"] = "none";
	$params["body_border_style"] = "dotted";
	$params["body_border_color"] = "#00CC00";

	#HEADER
	$params["header_bg_color"] ="none";
	$params["header_font_color"] = "#333333";

	#STATUS
	$params["status_bg_color"] = "#333333";
	$params["status_font_color"] = "#FFFFFF";

	#ITEM_MENU
	$params["item_bg_color"] = "none";
	$params["item_topic_bg_color"] = "#333333";
	$params["item_topic_font_color"] ="#66FFCC";
	$params["item_link_color"] = "#333333";
	$params["item_link_hover"] ="#009933";

	#CONTENT
	$params["content_bg_color"] = "none";
	$params["content_comment_font_color"] = "#333333";
	$params["content_blog_color"] = "#333333";
	$params["content_comment_bg_color"] = "#CCCCCC";

	#COMMENT
	$params["comment_font_color"] = "#333333";
	$params["comment_bg_color"] = "none";
	$params["comment_topic_font_color"] = "#FFFFFF";
	$params["comment_topic_bg_color"] = "#666666";

	$params["passkey"] = $passkey;

	$message = $client->call('edit_usercss', $params);
	if($message['success'] == 'yes') {
		change_header_img(1);
#	$body_bg_image = "none";													
#	$header_bg_image = "url(images/user_header.jpg)";				
	}
	return $message["error_message"];
}

#########################Function GET_THEME_2##########################
function get_theme_2 () {
	global $client;
	global $passkey;

	$params["user_id"] = $_COOKIE[user_id];
	$params["username"] = $_COOKIE[username];
	$params["hash_password"] = $_COOKIE[password];
	
	#BODY
	$params["body_bg_color"] = "none";
	$params["body_border_style"] = "dashed";
	$params["body_border_color"] = "#CC0000";

	#HEADER
	$params["header_bg_color"] ="none";
	$params["header_font_color"] = "#333333";

	#STATUS
	$params["status_bg_color"] = "#990000";
	$params["status_font_color"] = "#FFFFFF";

	#ITEM_MENU
	$params["item_bg_color"] = "none";
	$params["item_topic_bg_color"] = "#990000";
	$params["item_topic_font_color"] ="#FFFFFF";
	$params["item_link_color"] = "#333333";
	$params["item_link_hover"] ="#CC0000";

	#CONTENT
	$params["content_bg_color"] = "none";
	$params["content_comment_font_color"] = "#FFFFFF";
	$params["content_blog_color"] = "#333333";
	$params["content_comment_bg_color"] = "#A6060E";

	#COMMENT
	$params["comment_font_color"] = "#CC3300";
	$params["comment_bg_color"] = "none";
	$params["comment_topic_font_color"] = "#FFFFFF";
	$params["comment_topic_bg_color"] = "#CC3300";

	$params["passkey"] = $passkey;

	$message = $client->call('edit_usercss', $params);

	if($message['success'] == 'yes') {
		change_header_img(2);
#	$body_bg_image = "none";													
#	$header_bg_image = "url(images/user_header.jpg)";				
	}
	return $message["error_message"];
}

#########################Function GET_THEME_3##########################
function get_theme_3 () {
	global $client;
	global $passkey;

	$params["user_id"] = $_COOKIE[user_id];
	$params["username"] = $_COOKIE[username];
	$params["hash_password"] = $_COOKIE[password];
	
	#BODY
	$params["body_bg_color"] = "#333333";
	$params["body_border_style"] = "dotted";
	$params["body_border_color"] = "#00FFFF";

	#HEADER
	$params["header_bg_color"] ="none";
	$params["header_font_color"] = "#FFFFFF";

	#STATUS
	$params["status_bg_color"] = "#000000";
	$params["status_font_color"] = "#FFFFFF";

	#ITEM_MENU
	$params["item_bg_color"] = "none";
	$params["item_topic_bg_color"] = "#000000";
	$params["item_topic_font_color"] ="#33FFFF";
	$params["item_link_color"] = "#FFFFFF";
	$params["item_link_hover"] ="#33FFFF";

	#CONTENT
	$params["content_bg_color"] = "none";
	$params["content_comment_font_color"] = "#00FFFFFF";
	$params["content_blog_color"] = "#FFFFFF";
	$params["content_comment_bg_color"] = "#666666";

	#COMMENT
	$params["comment_font_color"] = "#FFFFFF";
	$params["comment_bg_color"] = "none";
	$params["comment_topic_font_color"] = "#33FFFF";
	$params["comment_topic_bg_color"] = "#000000";

	$params["passkey"] = $passkey;

	$message = $client->call('edit_usercss', $params);

	if($message['success'] == 'yes') {
		change_header_img(3);
#	$body_bg_image = "none";													
#	$header_bg_image = "url(images/user_header.jpg)";				
	}
	return $message["error_message"];
}

#########################Function CHANGE_BG_IMG##########################
function change_header_img($theme) {
	global $passkey;
	global $client;

	switch ($theme) {
		case '1' :
			$instr = fopen("images/user_header_1.jpg","rb");
			$image = addslashes(fread($instr,filesize("images/user_header_1.jpg")));
			break;
		case '2' :
			$instr = fopen("images/user_header_2.jpg","rb");
			$image = addslashes(fread($instr,filesize("images/user_header_2.jpg")));
			break;
		case '3' :
			$instr = fopen("images/user_header_3.jpg","rb");
			$image = addslashes(fread($instr,filesize("images/user_header_3.jpg")));
			break;
	}

	
	$enc_image = base64_encode($image);

	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];

	$params["mode"] = "file";														//$mode = file,url
	$params["url"] = "";
	$params["type"] = "header";														//$type = avatar,bg,header
	$params["enc_image"] = $enc_image;
	$params["passkey"] = $passkey;

	$message = $client->call('submit_image', $params);

	if ($message["success"]=='yes') {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_template_theme.php?userid=".$_GET['userid']."\"> \n";
		exit();
	}

	return $message['error_message'];
}

?>