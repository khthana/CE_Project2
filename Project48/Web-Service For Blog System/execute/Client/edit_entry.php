<?php
	session_start();
	include ("user_conf.php");
	
	#Sumit edit entry case
if (($_POST['task'] == "doedit")&&($_POST['title_entry'])&&($_POST['contents'])) {
	if ($_SERVER["HTTP_X_FORWARDED_FOR"]) {
		$ip= $_SERVER["HTTP_X_FORWARDED_FOR"]; 
	} else { 
		$ip= $_SERVER["REMOTE_ADDR"];
	}
	global $passkey;
	global $client;
	
	$params["author_userid"] = $_COOKIE['user_id'];
	$params["content_id"] = $_GET['contentid'];
	$params["topic"] = $_POST['title_entry'];
	//$params["message"] = str_replace("'", "&#39;", substr($_POST['contents'],0,-3));
	$content = $_POST['contents'];
	$content = stripslashes($content);
	$content = str_replace("\n<p style=\"margin: 0px;\"></p>","",$content);
	$content = str_replace("\n","",$content);
	$params["message"] = str_replace("'", "&#39;", rtrim(trim($content)));
	$params["category_id"] = $_POST['cat_entry'];
	$params["ip"] = $ip;
	$params["is_show"] = $_POST['permission'];
	($_POST['crecommend'] != 'yes') ?$params["is_recommend"] ="no":$params["is_recommend"] =$_POST['crecommend'] ;
	$params["comment_option"] = $_POST['comment_allow'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$edit_message = $client->call('edit_content', $params);
	if ($edit_message["success"]=='no') {
		$error_message = $edit_message["error_message"];
	} else {
		$time = getdate();
		$time[year] = $time[year];
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=edit_blog.php?userid=".$_COOKIE["user_id"]."&month=".$time[mon]."&year=".$time[year]."\"> \n";
		exit();
	}
}
	
	#Logout Case	
	if ($_GET['action']=="logout") {
		delete_cookie_func();
		$_SESSION['ss_Access'] = "";							#username mismatch with password
		$_SESSION['ss_Access_Error'] = "";

		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_blog.php?userid=".$_GET['userid']."\"> \n";
		exit();
	}
	
	#Login check
	$login = login_func();
	if ($login == "yes") {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=edit_entry.php?userid=".$_GET['userid']."&contentid=".$_GET['contentid']."\"> \n";
		exit();
	}
	
	#Get template & item variable
	$message = get_layout ($_GET[userid]);
	$layout = $message[layout];
	$item_seq = $message[item_seq];
	$title = $message["blog_title"];
	
	#Stat header & javascript
	get_header($title);

print	 "	<script language=\"javascript\" type=\"text/javascript\">
			function displayWindow(url, width, height) {
				 var Win = window.open(url,\"displayWindow\",'width=' + width + ',height=' + height + ',resizable=0,scrollbars=no,menubar=no,status=no' );
			}
			</script>";
			
	#Get login form
	get_login_form($title,"edit_entry.php","userid=".$_GET[userid],$error_post_comment,$_GET[userid],true);
			
	
	#Get layout &content
			if (($layout == "1")||($layout == "3"))  {	#Layout type 1,3
				#Print Item Menu
				print  "<div class=\"item\" style=\"float:left;\">";
				get_item($item_seq,1,$message,$_GET[userid]);
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
				get_item($item_seq,1,$message,$_GET[userid]);
				print "</div>";
				
				#Print header content
				print "<div class=\"center\" style=\"float:left; width:620px;\">";
			}

			#Get_Content
			$authen = user_authen();
			if (($_GET['userid']==$_COOKIE['user_id'])&&($authen=="yes")) { get_edit_blog_content($message,$error_message);
			} else {
				if ($authen !="yes") {
					print "<br><div style=\"text-align:center;\">".$authen."</div><br><br>";
				} else {
					Print "<br><div style=\"text-align:center;\">กรุณาทำการ login เพื่อแก้ไข Blog</div><br><br>";
				}
			}
			Add_Reserve ();
				print "</div>";
			
			#Con't Item menu
			if ($layout =="3") { #Layout type 3
				#Print Item Menu
				print "<div class=\"item\" style=\"float:right;\">";
				get_item($item_seq,2,$message,$_GET[userid]);
				print "</div>";
			}
	print "		</div>
			</body></center>
			</html>";

#########################Function GET_EDIT_BLOG_CONTENT##########################
function get_edit_blog_content($message,$error_message) {
	if (($message[error_message])||($error_message)) {
		print 	"<div class=\"center_topic1\">ERROR </div>";		
		print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>Warning : ".$message[error_message].$error_message."<br><br></div>";
	} else {
		global $passkey;
		global $client;

		$params["userid"] = $_COOKIE['user_id'];
		$params["username"] = $_COOKIE['username'];
		$params["hash_password"] = $_COOKIE['password'];
		$params["content_id"] = $_GET['contentid'];
		$params["passkey"] = $passkey;
			
		#Call service check
		$edit_message = $client->call('obtain_showcontent', $params);
		if ($edit_message['error_message']) {
			print 	"<div class=\"center_topic1\">ERROR </div>";		
			print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>Warning : ".$edit_message['error_message']."<br><br></div>";
		} else {
			$old_title =  $edit_message["content_topic"];

//			$old_content = nl2br($edit_message["content_message"]);
			$old_content = ($edit_message["content_message"]);
			$old_content = str_replace("\n","&#92;n",$old_content);
			$old_content = str_replace("&#92;n","",$old_content);

			$permission = $edit_message["is_show"];
			$category = $edit_message["category_id"];
			$comment_allow = $edit_message["comment_option"];
			$crecommend = $edit_message["is_recommend"];
			
			$add_blog_category = $message["category_name"];
			$add_blog_category_id = $message["category_id"];
			
			#header content
			print 	"<div class=\"center_topic1\">Edit entry </div>";
			
			#print content
			include ("richtext_edit.php");
		}
	}
	
}
?>