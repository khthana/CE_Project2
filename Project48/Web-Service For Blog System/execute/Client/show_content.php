<?php
	session_start();
	include ("user_conf.php");
	
	$get_author_message = get_author_user ($_GET[contentid]);
	($get_author_message["success"] == 'yes') ? $author_userid = $get_author_message["author_userid"] : $error_id = $get_author_message["error_message"];
	
	#Logout Case	
	if ($_GET['action']=="logout") {
		delete_cookie_func();
		$_SESSION['ss_Access'] = "";							#username mismatch with password
		$_SESSION['ss_Access_Error'] = "";

		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_content.php?contentid=".$_GET['contentid']."\"> \n" ;
		exit();
	}
	
	#Delete comment case	
	if ($_GET['action']=="deletecomment") {
		$error_del = delete_comment();
		if ($error_del == "") {
			$time = getdate();
//			print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_content.php?contentid=".$_GET['contentid']."\"> \n";
//			exit();
		}

	}

	#Login check
		$login = login_func();
		if ($login == "yes") {
			print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL= show_content.php?contentid=".$_GET['contentid']."\"> \n";
			echo "";
			exit();
		}

	#Get template & item variable
	$message = get_layout ($author_userid);
	$layout = $message[layout];
	$item_seq = $message[item_seq];
	$title = $message["blog_title"];
	
	#Case comment post
	if($_POST['task']=="PostComment"){
		$error_post_comment = post_comment($_POST['Post']);
	}

	#Stat header & javascript
	get_header($title);

	#function add smile
	print "
				<script  language=\"javascript\" type=\"text/javascript\">
				var myAgent   = navigator.userAgent.toLowerCase();
				var myVersion = parseInt(navigator.appVersion);
				var is_ie   = ((myAgent.indexOf(\"msie\") != -1)  && (myAgent.indexOf(\"opera\") == -1));
				var is_win   =  ((myAgent.indexOf(\"win\")!=-1) || (myAgent.indexOf(\"16bit\")!=-1));
				
				function emotion(emotion) {
					doInsert(emotion, \"\", false);
				}
				
				function doInsert(ibTag, ibClsTag, isSingle)
				{
					var isClose = false;
					var obj_ta = document.commenter.Post;
				
					if ( (myVersion >= 4) && is_ie && is_win) // Ensure it works for IE4up / Win only
					{
						if(obj_ta.isTextEdit){ // this doesn't work for NS, but it works for IE 4+ and compatible browsers
							obj_ta.focus();
							var sel = document.selection;
							var rng = sel.createRange();
							rng.colapse;
							if((sel.type == \"Text\" || sel.type == \"None\") && rng != null){
								if(ibClsTag != \"\" && rng.text.length > 0)
									ibTag += rng.text + ibClsTag;
								else if(isSingle)
									isClose = true;
					
								rng.text = ibTag;
							}
						}
						else{
							if(isSingle)
								isClose = true;
					
							obj_ta.value += ibTag;
						}
					}
					else
					{
						if(isSingle)
							isClose = true;
				
						obj_ta.value += ibTag;
					}
				
					obj_ta.focus();
					
					// clear multiple blanks
				//	obj_ta.value = obj_ta.value.replace(/  /, \" \");
				
					return isClose;
				}	
				</script>
			";
	
	#Get login form
	get_login_form($title,"show_content.php","contentid=".$_GET['contentid'],$error_post_comment,$author_userid,false);		
	
	#Get layout &content
			if (($layout == "1")||($layout == "3"))  {	#Layout type 1,3
				#Print Item Menu
				print  "<div class=\"item\" style=\"float:left;\">";
				get_item($item_seq,1,$message,$author_userid);
				print "</div>";
				
				#Print header content
				if ($layout == "1") {
					print "<div class=\"center\" style=\"float:right; width:620px;\">";
				} else {
					print "<div class=\"center\" style=\"width:470px; margin-left:10px; float:left; \">";
				}
			}
			if ($layout == "2") { #Layout type 2
				#Print Item Menu
				print "<div class=\"item\" style=\"float:right;\">";
				get_item($item_seq,1,$message,$author_userid);
				print "</div>";
				
				#Print header content
				print "<div class=\"center\" style=\"float:left; width:620px;\">";
			}
			#Get_Content
				get_content_page($message,$author_userid,$error_del,$error_id);
				Add_Reserve ();
				print "</div>";
			
			#Con't Item menu
			if ($layout =="3") { #Layout type 3
				#Print Item Menu
				print "<div class=\"item\" style=\"float:right;\">";
				get_item($item_seq,2,$message,$author_userid);
				print "</div>";
			}
	
	print "		</div>
			</body></center>
			</html>";

#########################Function GET_AUTHOR_USERID#########################
function get_author_user ($content_id) {
	global $passkey;
	global $client;

	$params["content_id"] = $content_id;
	$params["passkey"] = $passkey;
		
	#Call service check
	$message = $client->call('obtain_authoruserid_by_contentid', $params);
	return $message;
}

#########################Function GET_CONTENT_PAGE##########################
function get_content_page ($main_message,$content_author_id,$error_del,$error_id) {
	if (($main_message[error_message])||($error_del)||($error_id)) {
		if($error_id) {
			print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>Warning : ".$error_id."<br><br></div>";
		} else if ($main_message[error_message]) {
			print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>Warning : ".$main_message[error_message]."<br><br></div>";
		} else {
			print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>Warning : ".$error_del."<br><br></div>";
		}
	} else {

		global $passkey;
		global $client;

		$params["userid"] = $_COOKIE['user_id'];
		$params["username"] = $_COOKIE['username'];
		$params["hash_password"] = $_COOKIE['password'];
		$params["content_id"] = $_GET['contentid'];
		$params["passkey"] = $passkey;
			
		#Call service check
		$message = $client->call('obtain_showcontent', $params);
		
		$content_topic = $message["content_topic"];
		$content = str_replace("&amp;", "&", str_replace("&gt;", ">", str_replace("&lt;", "<", stripslashes($message["content_message"]))));
		$content_post = $message["content_post_datetime"];
		$content_hit = $message["content_hits"];

		$comment_id = $message["comment_id"];
		$comment_content = $message["comment"];
		$comment_time = $message["comment_datetime"];
		$comment_url = $message["commentor_url"];
		$comment_total = $message["total_comment"] ;
		$comment_commenter = $message["commentor_name"];
		$i = 0;
		
		if (!$message['error_message']) {
		print 	"<div class=\"center_topic1\">".$content_topic."</div>";
		print 	"<div class=\"center_content\">".$content."
					 <br><br><div style=\"text-align:left;\"><a href=\"show_blog.php?userid=".$content_author_id."\">< <&nbsp;<img align='absmiddle' src=\"images/home.gif\" width=\"13\" height=\"14\" border=\"0\">&nbsp; Home</a></div>
					 </div>";
		($comment_total =="") ? $comment_total = "0" :"";
		print 	"<div class=\"center_topic2\">Post : ".convert_time($content_post)." (จำนวนผู้ชม : ".$content_hit." | Comment ".$comment_total." )<br></div>";
		
		#Print Comment
		if (($message["comment_option"] == "allow-show")||($_COOKIE['user_id'] == $content_author_id)) {
			while ($comment_id[$i]) {
				$comment_content[$i] = nl2br(convert_comment($comment_content[$i]));
				print 	"<div class=\"comment\">
								<div class=\"comment_content\">".$comment_content[$i]."</div><br>
								<div class=\"comment_topic\"><strong>By :</strong>
									<a class=\"comment_topic\" href = \"".$comment_url[$i]."\">".$comment_commenter [$i]."</a>  at ".convert_time($comment_time[$i]);
				if ($_COOKIE['user_id'] == $content_author_id) {
					print"		<a href =\"show_content.php?contentid=".$_GET['contentid']."&commentid=".$comment_id[$i]."&action=deletecomment\">
								<img src=\"images/delete.gif\" width=\"13\" height=\"14\" border=\"0\"></a>";
				}
					print 		" </div></div>";
				$i++;
			}
		} else if ($message["comment_option"] == "allow-hide") {
			print 	"<div class=\"comment\" style='text-align:center;'>content นี้เจ้าของ content ไม่อนุญาตให้แสดง comment</div>";
		}

		#Print Comment  form
		 if (($message["comment_option"] == "allow-hide")||($message["comment_option"] == "allow-show")) {
			if (($_SESSION['ss_Access'] == "valid") ||(($_COOKIE["username"])&&($_COOKIE["password"]))) {
			print 	" <div class=\"comment\">
							<div style=\"margin-bottom:5px; \">Comment by : ".$_COOKIE['username']."</div>
							<form name=\"commenter\" method=\"post\" action=\"\" style=\"margin:0px; \">
								<a href=\"javascript:emotion(':)')\"><img src=\"images/smile_1.gif\" width=22\" height=\"22\"  border=\"0\"></a>&nbsp;
								<a href=\"javascript:emotion(';(')\"><img src=\"images/smile_2.gif\" width=\"22\" height=\"22\"  border=\"0\"></a>&nbsp;
								<a href=\"javascript:emotion('T-T')\"><img src=\"images/smile_3.gif\" width=\"22\" height=\"22\"  border=\"0\"></a>&nbsp;
								<a href=\"javascript:emotion(';)')\"><img src=\"images/smile_4.gif\" width=\"22\" height=\"22\"  border=\"0\"></a>&nbsp;
								<a href=\"javascript:emotion(':(')\"><img src=\"images/smile_5.gif\" width=\"22\" height=\"22\"  border=\"0\"></a>&nbsp;
								<a href=\"javascript:emotion(':D')\"><img src=\"images/smile_6.gif\" width=\"22\" height=\"22\"  border=\"0\"></a>&nbsp;<br>
								<div style=\"font-size:12px; \"><textarea name=\"Post\" rows=\"6\" id=\"data\"  style=\"width:90%; \"></textarea></div>
								<div><input type=\"submit\" name=\"Submit\" value=\"Post Comment\">
								<input type=\"hidden\" name=\"task\" value=\"PostComment\"></div>
							</form>
						</div>";
			} else {
			print "<div class=\"comment\" style=\"text-align:center;\"><br> กรุณา Login ก่อนทำการ Comment <br><br></div>";
			}
		} else if ($message["comment_option"] == "notallow") {
			print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>Warning : content นี้เจ้าของ content ไม่อนุญาตให้ comment<br><br></div>";
		}
		
		} else {
			print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>".$message['error_message']."<br><br></div>";
		}
	} 
}

#########################Function POST_COMMENT##########################
function post_comment ($comment) {
	global $passkey;
	global $client;
	
	if ($_SERVER["HTTP_X_FORWARDED_FOR"]) {
		$ip= $_SERVER["HTTP_X_FORWARDED_FOR"]; 
	} else { 
		$ip= $_SERVER["REMOTE_ADDR"];
	}
	
	$params["content_id"] = $_GET['contentid'];
	$params["comment"] = ($comment);
	$params["ip"] = $ip;
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$message = $client->call('submit_comment', $params);
	
	$success = $message["success"];
	if ($success == "yes") {
		return "";
	}  else {
		return $message["error_message"];
	}
}

#########################Function CONVERT_COMMENT##########################
function convert_comment($comment) {
	$comment = htmlspecialchars($comment);
	$comment = str_replace(":)","<img src=\"images/smile_1.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	$comment = str_replace(";(","<img src=\"images/smile_2.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	$comment = str_replace("T-T","<img src=\"images/smile_3.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	$comment = str_replace(";)","<img src=\"images/smile_4.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	$comment = str_replace(":(","<img src=\"images/smile_5.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	$comment = str_replace(":D","<img src=\"images/smile_6.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	return $comment;
}

#########################Function DELETE_COMMENT##########################
function delete_comment() {
	global $client;
	global $passkey;

	$params["author_userid"] = $_COOKIE['user_id'];
	$params["content_id"] = $_GET['contentid'];
	$params["comment_id"] = $_GET['commentid'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;
			
	#Call service check
	$message_del = $client->call('delete_comment', $params);
	return $error_msg = $message_del["error_message"];
}

?>
