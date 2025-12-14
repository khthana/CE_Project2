<?php
	session_start();
	include ("user_conf.php");
	
	#Logout Case	
	if ($_GET['action']=="logout") {
		delete_cookie_func();
		$_SESSION['ss_Access'] = "";							#username mismatch with password
		$_SESSION['ss_Access_Error'] = "";

		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_archive.php?userid=".$_GET[userid]."&month=".$_GET[month]."&year=".$_GET[year]."\"> \n" ;
		exit();
	}
	
	#Login check
	$login = login_func();
	if ($login == "yes") {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_archive.php?userid=".$_GET[userid]."&month=".$_GET[month]."&year=".$_GET[year]."\"> \n" ;
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
	get_login_form($title,"show_archive.php","userid=".$_GET[userid]."&month=".$_GET[month]."&year=".$_GET[year],$error_post_comment,$_GET[userid],false);
			
	
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
				get_archive_content();
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

#########################Function GET_ARCHIVE_CONTENT##########################
function get_archive_content() {
	global $client;
	global $passkey;
		
	$params["author_userid"] = $_GET['userid'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["month"] = $_GET['month'];
	$params["year"] = $_GET['year'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$message = $client->call('obtain_showarchive', $params);
	$success = $message["success"];
	$error_msg = $message["error_message"];

	$archive_url = $message["content_id"];
	$archive_name_topic = $message["topic"];
	$month_name = array("","มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");
	$archive_month = $_GET['month'];
	$archive_year = $_GET['year'];
	$i=0;
	
	if ($success == "yes") {
		print 	"<div class=\"center_topic1\">".$month_name[$archive_month]." ".$archive_year."</div>";
		print 	"<div class=\"center_content\">";

		while($archive_name_topic[$i]) {
			print "<a href=\"show_content.php?contentid=".$archive_url[$i]."\">".$archive_name_topic[$i]."</a><hr width=\"100%\" size=\"1\" noshade>";
			$i++;
		}
		print "</div>";
	} else {
		print "Warning : ".$error_msg;
	}
}
?>