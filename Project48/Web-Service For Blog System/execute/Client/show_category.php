<?php
	session_start();
	include ("user_conf.php");
	
	#Logout Case	
	if ($_GET['action']=="logout") {
		delete_cookie_func();
		$_SESSION['ss_Access'] = "";							#username mismatch with password
		$_SESSION['ss_Access_Error'] = "";

		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_category.php?userid=".$_GET["userid"]."&$catid=".$_GET["catid"]."&page=".$_GET["page"]."\"> \n" ;
		exit();
	}
	
	#Login check
	$login = login_func();
	if ($login == "yes") {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_category.php?userid=".$_GET["userid"]."&$catid=".$_GET["catid"]."&page=".$_GET["page"]."\"> \n" ;
		exit();
	}
	
	#Get template & item variable
	$message = get_layout ($_GET["userid"]);
	$layout = $message[layout];
	$item_seq = $message[item_seq];
	$title = $message["blog_title"];
	
	#Stat header & javascript
	get_header($title);
	
	#Get login form
	get_login_form($title,"show_category.php","userid=".$_GET[userid]."&catid=".$_GET[catid]."&page=".$_GET["page"],$error_post_comment,$_GET[userid],false);
			
	
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
			get_category_content();
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

#########################Function GET_CATEGORY_CONTENT##########################
function get_category_content() {
	global $client;
	global $passkey;
	
	$params["author_userid"] = $_GET['userid'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["category_id"] = $_GET['catid'];
	$params["page"] = $_GET['page'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$message = $client->call('obtain_showcategory', $params);
	$success = $message["success"];
	$error_msg = $message["error_message"];

	$category_total_page = $message["total_page"];
	$category_url = $message["content_id"];
	$category_name_topic = $message["topic"];
	$category_topic = $message["category_name"];
	$i=0;

	if ($success == "yes") {
		print 	"<div class=\"center_topic1\">".$category_topic."</div>";
		print 	"<div class=\"center_content\">";

		while($category_url[$i]) {
			print "<a href=\"show_content.php?contentid=".$category_url[$i]."\">".$category_name_topic[$i]."</a><hr width=\"100%\" size=\"1\" noshade>";
			$i++;
		}
		print "</div>";
		
		#menu home and page
		print	"<br><br><div class=\"center_topic2\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" >
					<tr align=\"right\" valign=\"middle\">
						<td width=\"20%\"><a href=\"show_blog.php?userid=".$_GET['userid']."\">< < Home</a></td>
						<td width=\"80%\">  page &nbsp; ";
		for ($i=0; $i<$category_total_page; ) { 
			(($i+1) == $_GET['page'] ) ? print ++$i."&nbsp;&nbsp;" : 
									print "<a href=\"show_category.php?userid=".$_GET['userid']."&$catid=".$_GET["catid"]."&page=".++$i."\">".$i."</a>&nbsp;&nbsp;";
		}
		print "		</div></td>
					</tr>
				</table>
				</div>";

	} else {
		print "Warning : ".$error_msg;
	}
}
?>