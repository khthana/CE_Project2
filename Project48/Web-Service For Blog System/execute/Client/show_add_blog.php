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
	
	#Login check
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
	get_login_form($title,"show_edit_blog.php","userid=".$_GET[userid],$error_post_comment,$_GET[userid],true);
			
	
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
				($_GET['userid']==$_COOKIE['user_id']) ? get_add_blog_content() : 
						Print "<br><div style=\"text-align:center;\">กรุณาทำการ login เพื่อแก้ไข Blog</div><br><br>";
				print "<div class=\"status\" style=\"margin-bottom:px; margin-top:10px; \">Copyright 2003 - 2005 soi13.com.,ALL RIGHT RESERVED</div>";
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

#########################Function GET_ADD_BLOG_CONTENT##########################
function get_add_blog_content() {
/*	global $passkey;
	global $client;
	$params["user_id"] = $_GET['userid'];
	$params["password"] = $_COOKIE['password'];
	$params["username"] = $_COOKIE['username'];
	$params["edit_blog_page"] = $edit_blog_page;
	$params["passkey"] = $passkey;
		
	#Call service check
	$message = $client->call('obtain_showcontent', $params);

	if ($message[error_message]) {
		print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>Warning : ".$message[error_message]."<br><br></div>";
	} else {
*/	
		$add_blog_category = array ("Music","Movie");
		$i = 0;
		
		#header content
		print 	"<div class=\"center_topic1\">Add entry </div>
					<div class=\"center_content\">";
		
		#print content
		include ("richtext.php");

		#menu home and page
		print	"<br><br><div class=\"center_topic2\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" >
					<tr align=\"right\" valign=\"middle\">
						<td width=\"20%\"><a href=\"show_blog.php?userid=".$_COOKIE['user_id']."\">< < Home</a></td>
						<td width=\"80%\">  page &nbsp; ";
		for ($i=0; $i<$edit_blog_page; ) { 
			(($i+1) == 2 ) ? print ++$i."&nbsp;&nbsp;" : 
									print "<a href=\"show_edit_blog.php?userid=".$_COOKIE['user_id']."&page=".++$i."\">".$i."</a>&nbsp;&nbsp;";
		}
		print "		</td>
					</tr>
				</table></div>
			</div>";
//	}
	
}
?>