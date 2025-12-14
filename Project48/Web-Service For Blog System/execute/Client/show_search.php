<?php
	session_start();
	include ("user_conf.php");
	
	if ($_GET['tsearch']!="") {
		$service_message = Get_Search_Service();
	} else { 
		$service_message['error_message'] = "No result";
	}

	#Logout Case
	if ($_GET['action']=="logout") {
		delete_cookie_func();
		$_SESSION['ss_Access'] = "";							#username mismatch with password
		$_SESSION['ss_Access_Error'] = "";

		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_search.php?userid=".$_GET['userid']."\"> \n";
		exit();
	}
	
	#Check Login
	$login = login_func();
	if ($login == "yes") {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_search.php?userid=".$_GET['userid']."\"> \n";
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
	get_login_form($title,"show_search.php","userid=".$_GET[userid],$error_post_comment,$_GET[userid],false);
			
	
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
				print "<div class=\"center\" style=\"float:left; width:620px; font-size:12px;\">";
			}
			#Get_Content
				Get_Search_content($service_message,$message['error_message']);
				
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

###############################Function Get_Search_Content###############################
function Get_Search_content($message,$ser_message) {

	if (!$ser_message) {
		$content_url = $message["url"];
		$topic = $message["topic"];
		$submit = $message["submit_datetime"];
		$totalpage = $message["total_page"];
		$i = 0;

		print 	"<div class=\"center_topic1\">Search Result</div><br>";
		print "<div class='center_content'>
				<table width='95%'  border='0' cellspacing='0' cellpadding='0'>
				  <tr style='font-weight:bolder; font-size:14px; '>
					<td width='67%'>Topic</td>
					<td width='25%'>Time</td>
				  </tr> 
				  <tr>
					<td colspan='2'><hr width='100%' size='1' noshade></td>
				  </tr>";

		#Each Search Content
		while ($content_url[$i]) {
			print "
				  <tr style='font-size:12px; '>
					<td> <a href='".$content_url[$i]."'>".$topic[$i]."</a> </td>
					<td align='center'> ".convert_time($submit[$i])."</td>
				  </tr>
				  <tr>
					<td colspan='2'><hr width='100%' size='1' noshade></td>
				  </tr>";
			$i++;
		}

		#print End table;
		print "</table><br>";

		if ($i == "0") { print "No Result"; } else {
		
		#print page index
		$url_get = "&userid=".$_GET['userid']."&tsearch=".$_GET['tsearch']."&scoperadio=".$_GET['scoperadio']."&checkmsg=".$_GET['checkmsg']."&checkcomment=".$_GET['checkcomment']."";
		print "<div class='center_topic2'>page : ";
		for ($i=1; $i<=$totalpage; $i++) {
			($i == $_GET[page]) ? print " ".$i : print " <a href='show_search.php?page=".$i.$url_get."'>".$i."</a>";
		}
		print "</div>";
		
		}

		print "</div>";

	} else {
		print 	"<div class=\"center_topic1\">ERROR </div>";		
		print "<div style=\"background-color:#FFFFFF; color:#FF0000; text-align:center\"><br>Warning : ".$ser_message.$error_message."<br><br></div>";
	}
}

###############################Function Get_Search_Servicer###############################
function Get_Search_Service() {
	global $client;
	global $passkey;


	$params["keyword"] = $_GET['tsearch'];
	$params["page"] = $_GET['page'];
	$params["scope"] = $_GET['scoperadio'];

	($_GET['checktopic']!="") ? $topic = 'yes' : $topic = 'no' ;
	$params["option"]["topic"] = 'yes';

	($_GET['checkmsg']!="") ? $msg = 'yes' : $msg = 'no' ;
	$params["option"]["message"] = $msg;

	($_GET['checkcomment']!="") ? $comment = 'yes' : $comment = 'no' ;
	$params["option"]["comment"] = $comment;

	$params["passkey"] = $passkey;

	$message = $client->call('search_blog', $params);

	return $message;
}

?>
