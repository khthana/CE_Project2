<?php
	session_start();
	include ("user_conf.php");
	
	#Logout Case
	if ($_GET['action']=="logout") {
		delete_cookie_func();
		$_SESSION['ss_Access'] = "";							#username mismatch with password
		$_SESSION['ss_Access_Error'] = "";

		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_blog.php?userid=".$_GET['userid']."\"> \n";
		exit();
	}
	
	#Check Login
	$login = login_func();
	if ($login == "yes") {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_blog.php?userid=".$_GET['userid']."\"> \n";
		exit();
	}
	
	#Get template & item variable
	$message = get_layout ($_GET[userid]);
	$layout = $message[layout];
	$item_seq = $message[item_seq];
	$title = $message["blog_title"];
	
	#Stat header & javascript
	get_header($title);
		
	#Get login form
	get_login_form($title,"show_blog.php","userid=".$_GET[userid],$error_post_comment,$_GET[userid],false);
			
	
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
				get_content($message['error message']);
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

#########################Function GET_CONTENT##########################
function get_content($ser_message) {
	if (!$ser_message) {
		global $passkey;
		global $client;
		$params["author_userid"] = $_GET['userid'];
		$params["username"] = $_COOKIE['username'];
		$params["hash_password"] = $_COOKIE['password'];
		$params["passkey"] = $passkey;
			
		#Call service check
		$message = $client->call('obtain_showblog', $params);
		
		if (!$message["error_message"] ) {
			$content_id = $message["content_id"];
			$content_topic = $message["topic"];
			$content_post = $message["submit_datetime"];
			$comment_num = $message["total_comment"];
			$content_hit = $message["hits"];
			$i = 0;
			
			while ($content_id[$i]) {
				$content = str_replace("&amp;", "&", str_replace("&gt;", ">", str_replace("&lt;", "<", stripslashes($message["message"][$i]))));
				print 	"<div class=\"center_topic1\"><a class=\"topic1\" href=\"show_content.php?contentid=".$content_id[$i]."\">".$content_topic[$i]."</a></div>";
				print 	"<div class=\"center_content\">".$content."</div>";
				print 	"<div class=\"center_topic2\">Post : ". convert_time($content_post[$i])." (จำนวนผู้ชม : ".$content_hit[$i]." | 
						 <a class =\"center_topic2\" href=\"show_content.php?contentid=".$content_id[$i]."\">Comment</a> ( ".$comment_num[$i]." )<br></div>";
				$i++;
			}
		} else {
			print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>Warning : ".$message["error_message"]."<br><br></div>";

		}
	} else {
		print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>Warning : ".$ser_message."<br><br></div>";
	}
}

?>
