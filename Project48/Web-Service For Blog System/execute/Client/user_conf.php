<?php
	session_start();
	include "service_register.php";

###########################Function GET_HEADER##########################
function get_header($title){
	print	" <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"
				\"http://www.w3.org/TR/html4/loose.dtd\">
				<html>
				<head>
				<title>".$title."</title>
				<script language=\"javascript\" type=\"text/javascript\">
				function checkLogin(form) {
					User= document.loginForm.tusername.value;
					Pass= document.loginForm.tpassword.value;
					if ((!User)&&(!Pass)) { 
						alert('กรุณาใส่Username และ Password ด้วยค่ะ');
						return false;
					} else {
						return true;
					}
				}
				function displayWindow(url, width, height) {
					var Win = window.open(url,'displayWindow','width=' + width + ',height=' + height + ',resizable=0,scrollbars=no,menubar=no,status=no' );
				}
				</script>";
}

###########################Function GET_LOGIN_FORM##########################
function get_login_form($title,$filename,$varforsent,$error_post_comment,$authoruserid,$edit){
	print	 "	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">
				<link href=\"css.php?userid=".$authoruserid."\" rel=\"stylesheet\" type=\"text/css\">
				</head>

				<center><body>
				  <div class=\"content\">
					<div class=\"header\">".$title."</div>
						<div class=\"status\"> ";

	
	#Status Logout
	if ((!$_COOKIE["username"])||(!$_COOKIE["password"])) {
		print	"	<form name=\"loginForm\" method=\"post\" action=\"?".$varforsent."\" style=\" margin:0px ; \"onSubmit=\"return checkLogin (this.form)\">
						<table width=\"760\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" >
							<tr align=\"center\" valign=\"middle\">
								<td width=\"75\">";
		
		#Check Error message
		print	"				</td>
								<td width=\"274\"> ";

		(($_SESSION['ss_Access_Error'])||($error_post_comment)||($css_error_message) ) ? print  "Warning : ".$_SESSION['ss_Access_Error'].$error_post_comment.$css_error_message : "";
		
		print	"		</td>
						<td width=\"70\"><strong>Username :</strong></td>
						<td width=\"65\"><input name=\"tusername\" type=\"text\"  id=\"tusername\" size=\"10\" maxlength=\"20\"></td>
						<td width=\"63\"><strong>Password :</strong></td>
						<td width=\"64\"><input name=\"tpassword\" type=\"password\" id=\"tpassword2\"  size=\"10\" maxlength=\"20\"></td>
						<td width=\"93\"><input name=\"cremember\" type=\"checkbox\" value=\"remember\">&nbsp;<strong>Remember</strong></td>
						<td width=\"46\"><input type=\"submit\" name=\"Submit\" value=\"Login\" ></td>
					</tr>
					</table>
				</form>";

	} 
	
	#Status Login
	else if (($_COOKIE["username"])&&($_COOKIE["password"])) {
		  print "	<table width=\"750\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:0; padding:2px;\" >
							<tr align=\"center\" valign=\"middle\">";
		
		#Check userid is match with authoruser_id ?
		if ($authoruserid==$_COOKIE["user_id"]) {
			$time = getdate();
				 print "<td width=\"14%\"><a class=\"status\" href =\"add_entry.php?userid=".$_COOKIE['user_id']."\">:: Add entry ::</a></td>";
				print "<td width=\"15%\"><a class=\"status\" href =\"edit_blog.php?userid=".$_COOKIE["user_id"]."&month=".$time[mon]."&year=".$time[year]."\">:: Edit your blog ::</a></td>";
				print "<td width=\"15%\"><a class=\"status\" href =\"control_profile.php?userid=".$_COOKIE["user_id"]."\">:: Control panel ::</a></td>" ;
		} else {
				print "<td width=\"14%\"><a href=\"javascript:displayWindow('add_favourite.php?authoruserid=".$authoruserid."',345,165)\" class=\"status\">:: Add favourite ::</a></td>
						<td width=\"15%\"></td>
						<td width=\"15%\"></td>";
		}

		($css_error_message) ? print "<td width=\"25%\">Warning : ".$css_error_message."</td>" : "" ;
				
		print	"		<td align=\"right\" width=\"95%\">
								<span style=\"font-size:12px\"> คุณ Login เป็น&nbsp;:&nbsp;
								<a class=\"status\" href=\"".$_COOKIE['user_domain']."\">".$_COOKIE['username']."</a>&nbsp;|&nbsp;
								<a class=\"status\" href=\"".$filename."?action=logout&".$varforsent."\">Logout</a></span>
							</td>
							<td width=\"100%\"></td>
						</tr>
					</table>";
	}
	
	print "</div>";
 }

###########################Function GET_LAYOUT##########################
function get_layout ($author_userid) {
	global $client;
	global $passkey;
		
	$params["author_userid"] = $author_userid;
	$params["passkey"] = $passkey;
		
	#Call service check
	$recv_message = $client->call('obtain_layout', $params);
	$success = $recv_message["success"];
	$error_msg = $recv_message["error_message"];
	$message["layout"] = $recv_message["layout"];
	$message["item_seq"] = $recv_message["item_seq"];
	return $recv_message;
}

###########################Function GET_ITEM##########################
function get_item ($item_seg,$turn,$message,$user_id) {
	if ($message["success"]=='yes') {
		($turn==1) ? $i = 0 : $i = 10;
		for (;$j<10; $j++) {
			($item_seg[$i+$j]=="archive") ? get_archive($message,$user_id) : "";
			($item_seg[$i+$j]=="profile") ? get_profile($message,$user_id) : "";
			($item_seg[$i+$j]=="category") ? get_category($message,$user_id) : "";
			($item_seg[$i+$j]=="favourite") ? get_favourite($message) : "";
			($item_seg[$i+$j]=="recommend") ? get_recommend($message) : "";
			($item_seg[$i+$j]=="links") ? get_links($message) : "";
			($item_seg[$i+$j]=="last_update") ? get_last_update($message) : "";
			($item_seg[$i+$j]=="search") ? get_search_form ($user_id) : "";
		}
	}
}

#########################Function GET_PROFILE#########################
function get_profile($message,$user_id) {
	print  "	<div class=\"item_topic\">Profile</div>";
	print "<div class=\"item_content\" >";
	
	$profile_name = $message["profile_name"];	
	
	print "<div align='center' style='width:100%'><img src=\"avatar_pic.php?userid=".$user_id."\" width=\"100px\" height=\"100px\"></div><br>";
	print "<strong>Name : </strong><a href=\"show_blog.php?userid=".$user_id."\">".$profile_name."</a><br>";
	print "</div>";
}

#########################Function GET_ARCHIVE#########################
function get_archive($message,$user_id) {
	print  "	<div class=\"item_topic\">Archive</div>";
	print "<div class=\"item_content\">";
	
	$month_name = array("","มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");
	$list_month = $message["archive_month"];
	$list_year = $message["archive_year"];
	$i = 0;
	while ($list_month[$i]) {
		$temp = $list_month[$i];
		print  "<a href=\"show_archive.php?userid=".$user_id."&month=".$list_month[$i]."&year=".$list_year[$i]."\" >".$month_name[$temp]." ".$list_year[$i]."</a><br>" ;
		$i++;
	}

	($i==0) ? print "No archive":"";
	print "</div>";
}

#########################Function GET_CATEGORY#########################
function get_category($message,$user_id) {
	print  "	<div class=\"item_topic\">Category</div>";
	print "<div class=\"item_content\">";
	
	$list_category_id = $message["category_id"];
	$list_category_name = $message["category_name"];
	$i = 0;
	while ($list_category_id[$i]) {
		(strlen($list_category_name[$i]) > 19)  ? $list_category_name[$i] = substr ($list_category_name[$i],0,16)."..." : "" ;
		print  "<a href=\"show_category.php?userid=".$user_id."&catid=".$list_category_id[$i]."&page=1\" >".$list_category_name[$i]."</a><br>" ;
		$i++;
	}
	($i==0) ? print "No category":"";
	print "</div>";
}


#########################Function GET_FAVOURITE#########################
function get_favourite($message) {
	print  "	<div class=\"item_topic\">Favourite</div>";
	print "<div class=\"item_content\">";
	
	$list_favouritename = $message["favourite_content_blog_title"];
	$list_favouriteurl = $message["favourite_content_url"];
	$i = 0;
	while ($list_favouritename[$i]) {
		(strlen($list_favouritename[$i]) > 19)  ? $list_favouritename[$i] = substr ($list_favouritename[$i],0,16)."..." : "" ;
		print  "<a href=\"".$list_favouriteurl[$i]."\" >".$list_favouritename[$i]."</a><br>" ;
		$i++;
	}
	($i==0) ? print "No favourite":"";
	print "</div>";
}

#########################Function GET_RECOMMEND#########################
function get_recommend($message) {
	print "<div class=\"item_topic\">Recommend</div>";
	print "<div class=\"item_content\">";

	$list_recommend_content_id = $message["recommend_content_id"];
	$list_recommend_topic = $message["recommend_content_topic"];
	$i = 0;

	while ($list_recommend_content_id[$i]) {
		(strlen($list_recommend_topic[$i]) > 19)  ? $list_recommend_topic[$i] = substr ($list_recommend_topic[$i],0,16)."..." : "" ;
		print  "<a href=\"show_content.php?contentid=".$list_recommend_content_id[$i]."\" >".$list_recommend_topic[$i]."</a><br>" ;
		$i++;
	}
	($i==0) ? print "No recommend":"";
	print "</div>";
}

#########################Function GET_LINKS#########################
function get_links($message) {
	print  "	<div class=\"item_topic\">Links</div>";
	print "<div class=\"item_content\">";

	$list_linksname = $message["links_name"];
	$list_linksurl = $message["links_url"];
	$i = 0;
	while ($list_linksname[$i]) {
		(strlen($list_linksname[$i]) > 19)  ? $list_linksname[$i] = substr ($list_linksname[$i],0,16)."..." : "" ;
		print  "<a href=\"".$list_linksurl[$i]."\" target='_blank' >".$list_linksname[$i]."</a><br>" ;
		$i++;
	}
	($i==0) ? print "No links":"";
	print "</div>";
}

#########################Function GET_LAST_UPDATE#########################
function get_last_update($message) {
	print  "	<div class=\"item_topic\">Last Update</div>";
	print "<div class=\"item_content\">";

	$last_content_id = $message["lastupdate_content_id"];
	$last_content_topic = $message["lastupdate_content_topic"];
	$i = 0;
	while ($last_content_id[$i]) {
	(strlen($last_content_topic[$i]) > 19)  ? $last_content_topic[$i] = substr ($last_content_topic[$i],0,16)."..." : "" ;
		print  "<a href=\"show_content.php?contentid=".$last_content_id[$i]."\" >".$last_content_topic[$i]."</a><br>" ;
		$i++;
	}
	($i==0) ? print "No entrys":"";
	print "</div>";
}

#########################Function GET_SEARCH_FORM#########################
function get_search_form ($authoruser_id) {
	print "			<div class='item_topic'>Search</div>
			<div class='item_content' style='text-align:center; margin:0px; padding:0px; width:100%;'>
				  <form name='form1' method='get' action='show_search.php' style='margin:0px;  '>
					<input name='tsearch' type='text' id='tsearch' size='15'>
					<br>
					<input name='scoperadio' type='radio' value='local' checked>Local
					<input name='scoperadio' type='radio' value='global'> Global
					<br>
						<input name='checktopic' type='checkbox' disabled id='checktopic' value='yes' checked>Topic
						<input name='checkmsg' type='checkbox' id='checkmsg' value='yes'>Content<br>
						<input name='checkcomment' type='checkbox' id='checkcomment' value='yes'>
						Comment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<br><input type='hidden' name='page' value='1'>
							<input type='hidden' name='userid' value='".$authoruser_id."'>
						  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='submit' value='Search'>
				  </form>
			</div>
";
}

#########################Function LOGIN_FUNC#########################
function login_func() {
		global $client;
		global $passkey;
		
	if ((isset($_POST['tusername']))&&(isset($_POST['tpassword']))&&($_POST['tusername'] != "")&&($_POST['tpassword'] != "")) {
		$params["username"] = $_POST['tusername'];
		$params["password"] = $_POST['tpassword'];
		$params["passkey"] = $passkey;
		
	#Call service check
		$message = $client->call('user_login', $params);
		$success = $message["success"];
		$error_msg = $message["error_message"];
		$user_id = $message["user_id"];
		$user_domain = $message["url"];
			
		if ($success == "no") {
			$_SESSION['ss_Access'] = "error";															#username mismatch with password
			$_SESSION['ss_Access_Error'] = $error_msg;
			return $login = "no";
		} else  if ($success=="yes") {
			if ($_POST['cremember'] == "remember") {
				$password = md5($_POST['tpassword']);
				setcookie ("username",$_POST['tusername'],time()+60*60*24*30*12*10);
				setcookie ("password",$password,time()+60*60*24*30*12*10);
				setcookie ("user_id",$user_id,time()+60*60*24*30*12*10);
				setcookie ("user_domain",$user_domain,time()+60*60*24*30*12*10);
				$_SESSION['ss_Access'] = "valid";
			} else {
				$_SESSION['ss_Access'] = "valid";														#Username And password match can access
				$password = md5($_POST['tpassword']);
				setcookie ("username",$_POST['tusername']);
				setcookie ("password",$password);
				setcookie ("user_id",$user_id);
				setcookie ("user_domain",$user_domain);
			}
				return $login = "yes";
		}
	} else {
		$_SESSION['ss_Access'] = "not complete";												#not insert both
		return $login = "no";
	}
}

#########################Function DELETE_COOKIE#########################
function delete_cookie_func() {
	setcookie ("username",false,false);
	setcookie ("password",false,false);
	setcookie ("user_id",false,false);
	setcookie ("user_domain",false,false);
	session_destroy();
}

#########################Function USER_AUTHEN#########################
function user_authen() {
	global $client;
	global $passkey;

	if ((isset($_COOKIE["user_id"]))&&(isset($_COOKIE["username"]))&&(isset($_COOKIE["password"]))) {
		$params["user_id"] = $_COOKIE["user_id"];
		$params["username"] = $_COOKIE["username"];
		$params["hash_password"] = $_COOKIE["password"];
		$params["passkey"] = "$passkey";

		#Call service check
		$message = $client->call('user_authenticate', $params);
		$success = $message["success"];
		$error_msg = $message["error_message"];

		if ($success =="yes") { 
			return $success;
		} else {
			return $error_message;
		}
	} else {
		return "กรุณาทำการ login เพื่อแก้ไข Blog";
	}
}

#########################Function CONVERT_TIME#########################
function convert_time($time) {
	$month_name = array("","มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");
	list($date,$time) = explode(" ",$time);
	list($year,$month,$day) = explode("-",$date);
	list($hour,$min,$sec) = explode(":",$time);
	$month = (int)$month;
	return $day." ".$month_name[$month]." ".$year." เวลา ".$hour.":".$min.":".$sec;
}

#########################Function ADD_RESERVE#########################
function Add_Reserve () {
	print "<div class=\"status\" style=\"margin-bottom:px; margin-top:10px; clear:both; \">Copyright 2003 - 2006 soi13.com.,ALL RIGHT RESERVED</div>";
}


?>