<?php
	header("Content-type: text/css");
	include "service_register.php";

	$params["user_id"] = $_GET[userid];
	$params["passkey"] = $passkey;

	$css_message = $client->call('obtain_usercss', $params);

	if ($css_message["success" ] == 'yes') {
		$body_bg_color = $css_message["body_bg_color"] ;
		$body_border_style = $css_message["body_border_style"] ;
		$body_border_color = $css_message["body_border_color"] ;
		$body_bg_image = $css_message["body_bg_image"];
		$header_bg_color = $css_message["header_bg_color"] ;
		$header_bg_image = $css_message["header_bg_image"];
		$header_font_color =$css_message["header_font_color"] ;
		$status_bg_color = $css_message["status_bg_color"] ;
		$status_font_color = $css_message["status_font_color"] ;
		$item_bg_color = $css_message["item_bg_color"] ;
		$item_topic_bg_color = $css_message["item_topic_bg_color"] ;
		$item_topic_font_color =$css_message["item_topic_font_color"] ;
		$item_link_color = $css_message["item_link_color"] ;
		$item_link_hover =$css_message["item_link_hover"] ;
		$content_bg_color = $css_message["content_bg_color"] ;
		$content_comment_font_color = $css_message["content_comment_font_color"] ;
		$content_blog_color = $css_message["content_blog_color"] ;
		$content_comment_bg_color = $css_message["content_comment_bg_color"] ;
		$comment_font_color = $css_message["comment_font_color"] ;
		$comment_bg_color = $css_message["comment_bg_color"] ;
		$comment_topic_font_color = $css_message["comment_topic_font_color"] ;
		$comment_topic_bg_color = $css_message["comment_topic_bg_color"] ;

	($body_bg_image == 'no') ? $body_bg_image = "none" :	$body_bg_image = "url(bg_pic.php?userid=".$_GET['userid'].")"  ;
	($header_bg_image == 'no') ? $header_bg_image = "none" : $header_bg_image = "url(header_pic.php?userid=".$_GET['userid'].")";

/*
	#BODY
	$body_bg_color = "none";
	$body_border_style = "dotted";
	$body_border_color = "#00CC00";

	#HEADER
	$header_bg_color ="none";
	$header_font_color = "#333333";

	#STATUS
	$status_bg_color = "#333333";
	$status_font_color = "#FFFFFF";

	#ITEM_MENU
	$item_bg_color = "none";
	$item_topic_bg_color = "#333333";
	$item_topic_font_color ="#66FFCC";
	$item_link_color = "#333333";
	$item_link_hover ="#009933";

	#CONTENT
	$content_bg_color = "none";
	$content_comment_font_color = "#333333";
	$content_blog_color = "#333333";
	$content_comment_bg_color = "#CCCCCC";

	#COMMENT
	$comment_font_color = "#333333";
	$comment_bg_color = "none";
	$comment_topic_font_color = "#FFFFFF";
	$comment_topic_bg_color = "#666666";
*/

		print "
			body {\n
				margin-top:0px;\n
				font-family:Arial, Helvetica, sans-serif;\n
				background-color:".$body_bg_color.";\n
				background-image:".$body_bg_image.";\n
			}\n

			div.header {\n
				height:80px;\n
				font-weight:500;\n
				background-color:".$header_bg_color.";\n
				background-image:".$header_bg_image.";\n
				font-size:24px;\n
				text-align:left;\n
				padding:20px;\n
				color:".$header_font_color.";\n
			}\n

			div.status {\n
				background-color:".$status_bg_color.";\n
				text-align:right;\n
				color:".$status_font_color.";\n
				padding:2px;\n
				margin-bottom:5px;\n
				font-size:10px;\n
			}\n

			a.status:link {\n
				color:".$status_font_color.";\n
			}\n

			a.status:visited {\n
				color:".$status_font_color.";\n
			}\n

			a.status:hover {\n
				color:".$status_font_color.";\n
				text-decoration:underline;\n
			}\n

			div.content {\n
				width:770px;\n
			}\n

			div.item {\n
				width:130px;\n
				text-align:left;\n
				padding:0px;\n
				margin:0px;\n
				border-color:".$body_border_color.";\n
				border-style:".$body_border_style.";\n
				border-width:thin;\n
				background-color:".$item_bg_color.";\n
			}\n

			div.item_topic {\n
				margin:5px;\n
				padding:2px;\n
				color:".$item_topic_font_color.";\n
				font-size:14px;\n
				background-color:".$item_topic_bg_color.";\n
			}\n

			div.item_content {\n
				width:100px;\n
				padding:0px;\n
				padding-left:6px;\n
				color:".$item_link_color.";\n
				font-size:12px;\n
				overflow:hidden;\n
				margin:0px;\n
				margin-bottom:5px;\n
			}\n
				

			a:link {\n
				font-size:12px;\n
				color:".$item_link_color.";\n
				text-decoration:none;\n
			}\n

			a:visited {\n
				font-size:12px;\n
				color:".$item_link_color.";\n
				text-decoration:none;\n
			}\n

			a:hover {\n
				font-size:12px;\n
				color:".$item_link_hover.";\n
				text-decoration:none;\n
			}\n

			div.center {\n
				text-align:left;\n
				border-color:".$body_border_color.";\n
				border-style:".$body_border_style.";\n
				border-width:thin;\n
				background-color:".$content_bg_color.";;
				padding:5px;\n
			}\n

			div.center_topic1 {\n
				padding:2px;\n
				font-weight:bold;\n
				color:".$item_topic_font_color.";\n
				font-size:14px;\n
				background-color:".$item_topic_bg_color.";\n
			}\n

			a.topic1:link {\n
				color:".$item_topic_font_color.";\n
				font-size:14px;\n
			}\n

			a.topic1:hover {\n
				color:".$item_topic_font_color.";\n
				font-size:14px;\n
			}\n

			a.topic1:visited {\n
				color:".$item_topic_font_color.";\n
				font-size:14px;\n
			}\n

			div.center_content {\n
				margin:14px;\n
				color:".$content_blog_color.";\n
				background-color:".$content_bg_color.";\n
				overflow:auto;\n
				font-size:14px;\n
			}\n

			div.center_topic2{\n
				margin-bottom:5px;\n
				padding:2px;\n
				font-weight:bold;\n
				color:".$content_comment_font_color.";\n
				font-size:12px;\n
				background-color:".$content_comment_bg_color.";\n
				text-align:right;\n
			}\n

			a.center_topic2:link {\n
				color:".$content_comment_font_color.";\n
			}\n

			a.center_topic2:visited {\n
				color:".$content_comment_font_color.";\n
			}\n

			a.center_topic2:hover {\n
				color:".$$content_comment_font_color.";\n
				text-decoration:underline;\n
			}\n

			div.comment {\n
				border-color:".$body_border_color.";\n
				border-style:".$body_border_style.";\n
				border-width:thin;\n
				margin-left:30px;\n
				margin-right:30px;\n
				margin-top:8px;\n
				margin-bottom:8px;\n
				padding:5px;\n
				font-size:12px;\n
			}\n

			div.comment_topic {\n
				background-color:".$comment_topic_bg_color.";\n
				color:".$comment_topic_font_color.";\n
				padding:3px;\n
				text-align:right;\n
			}\n

			a.comment_topic:link {\n
				color:".$comment_topic_font_color.";\n
			}\n

			a.comment_topic:visited {\n
				color:".$comment_topic_font_color.";\n
			}\n

			a.comment_topic:hover {\n
				color:".$comment_topic_font_color.";\n
				text-decoration:underline;\n
			}\n

			div.comment_content {\n
				color:".$comment_font_color.";\n
				background-color:".$comment_bg_color.";\n
				overflow:auto;\n
			}\n

			hr {\n
				color:".$content_blog_color.";\n
			}
			";
	} else { 
		$css_error_message = $css_message['error_message'];
	}
?>