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

	#Delete entry case
	if ($_GET['action']=="delete_entry") {
		$error_del = delete_entry();
		if ($error_del == "") {
			$time = getdate();
			print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=edit_blog.php?userid=".$_COOKIE["user_id"]."&month=".$time[mon]."&year=".$time[year]."\"> \n";
			exit();
		}
	}
	
	#Login check
	$login = login_func();
	if ($login == "yes") {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=edit_blog.php?userid=".$_GET['userid']."&month=".$_GET['month']."&year=".$_GET['year']."\"> \n";
		exit();
	}
	
	#Get template & item variable
	$message = get_layout ($_GET[userid]);
	$layout = $message[layout];
	$item_seq = $message[item_seq];
	$title = $message["blog_title"];
	
	#Stat header & javascript
	get_header($title);

#Javascript for select archive
print "
<script language=\"JavaScript\" type=\"text/JavaScript\">
function selectArchive(dateobj) {
	var arc_date_int = dateobj.selectedIndex;
	var arc_date = dateobj.options[arc_date_int].value;
	var posspace = arc_date%2000;
	if (posspace) {
		arc_year = posspace+2000 ;
		arc_month = (arc_date - arc_year)/10000 ;
		var url_fin = '?userid=".$_GET[userid]."&month='+arc_month+'&year='+arc_year;
		window.location.href= 'edit_blog.php'+url_fin;
	} else {
		alert('กรุณาเลือกให้ถูกต้อง');
	}
}
</script>";

	#Get login form
	get_login_form($title,"edit_blog.php","userid=".$_GET[userid]."&month=".$_GET['month']."&year=".$_GET['year'],$error_post_comment,$_GET[userid],true);
			
	
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
			if (($_GET['userid']==$_COOKIE['user_id'])&&($authen=="yes")) { get_edit_blog_content($message,$error_del);
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
function get_edit_blog_content($message,$error_del) {
	
	if (($message[error_message])||($error_del)) {
		print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>Warning : ".$message[error_message].$error_del."<br><br></div>";
	} else {
	
		global $client;
		global $passkey;
		
		$params["author_userid"] = $_GET['userid'];
		$params["username"] = $_COOKIE['username'];
		$params["hash_password"] = $_COOKIE['password'];
		$params["month"] = $_GET['month'];
		$params["year"] = $_GET['year'];
		$params["passkey"] = $passkey;
			
		#Call service check
		$message_archive = $client->call('obtain_showarchive', $params);
		$success = $message_archive["success"];
		$error_msg = $message_archive["error_message"];

		$edit_blog_contentid = $message_archive["content_id"];
		$edit_blog_topic = $message_archive["topic"];

		$month_name = array("","มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");
		$edit_blog_month_year = $month_name[$_GET[month]]." ".$_GET[year];
		$i = 0;
		
		#header content
		print 	"<div class=\"center_topic1\">".$edit_blog_month_year." </div>
					<div class=\"center_content\">";
		
		#print content
		while ($edit_blog_topic[$i]) {
			(strlen($edit_blog_topic[$i]) > 47)  ? $edit_blog_topic[$i] = substr ($edit_blog_topic[$i],0,44)."..." : "" ;
			print 	"<div style=\"width:15%; float:right\">
						<a href=\"edit_entry.php?userid=".$_GET['userid']."&contentid=".$edit_blog_contentid[$i]."\">
							<img src=\"images/edit.gif\" width=\"16\" height=\"16\" border=\"0\"></a> &nbsp;&nbsp;&nbsp;
						<a href=\"edit_blog.php?userid=".$_GET['userid']."&contentid=".$edit_blog_contentid[$i]."&action=delete_entry\">
							<img src=\"images/delete.gif\" width=\"13\" height=\"14\" border=\"0\"></a></div>
					 <div style=\"width:80%; \"><a href=\"show_content.php?contentid=".$edit_blog_contentid[$i]."\">".$edit_blog_topic[$i]."</a></div>
					 <hr width=\"100%\" size=\"1\" noshade>";
			$i++;
		}

		#menu home and form month year
		print	"<br><br><div class=\"center_topic2\"> <form name=\"archive_edit_blog_form\" method=\"post\" action=\"\" style=\"margin:0px;\" >
					<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" >
					<tr align=\"right\" valign=\"middle\">
						<td width=\"15%\"><a href=\"show_blog.php?userid=".$_COOKIE['user_id']."\">< < Home</a></td>
						<td width=\"80%\">";
		
		$list_month = $message["archive_month"];
		$list_year = $message["archive_year"];
		$i = 0;
		
		#Drop down list month
		print "<select name=\"archive_date_select\" size=\"1\"  style=\"width:150px;\" OnChange=\"selectArchive(this)\">
				 <option value=\"none\">select month and year</option>";

		while ($list_month[$i]) {
			print  "<option value=\"".$list_month[$i].$list_year[$i]."\">".$month_name[$list_month[$i]]." ".$list_year[$i]."</option>";
			$i++;
		}
		($i==0) ? print "<option value=\"none\">none</option>\" >":"";
		
		print "		</select></td>
					</tr>
				</table></form></div>
			</div>";
	}
	
}

#########################Function DELETE_ENTRY##########################
function delete_entry() {
	global $client;
	global $passkey;

	$params["author_userid"] = $_COOKIE['user_id'];	
	$params["content_id"] = $_GET['contentid'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;
			
	#Call service check
	$message_del = $client->call('delete_content', $params);
	return $error_msg = $message_del["error_message"];
}
?>