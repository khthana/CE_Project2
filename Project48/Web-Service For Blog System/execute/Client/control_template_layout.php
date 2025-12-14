<?php
	session_start();
	include ("user_conf.php");

	#select layout case
	($_POST['radiolayout']) ? $ser_message = submit_layout_form ($_POST['radiolayout'],$old_layout) : "";

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
	get_login_form($title,"control_template_layout.php","userid=".$_COOKIE[user_id],"",$_GET['userid'],false);

	#Menu Side
	print "<div class='item' style='float:left;'>
				<div class='item_topic'>Menu</div>
				<div class='item_content' style='font-size:12px;'>
					<a href='control_profile.php?userid=".$_COOKIE['user_id']." ' >Profile</a><br>
					<a href='control_setting.php?userid=".$_COOKIE['user_id']."' >Setting</a><br>
					Template<br><strong >
					&nbsp;&nbsp;&nbsp;- Layout</strong><br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_theme.php?userid=".$_COOKIE['user_id']." ' >- Theme</a><br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_color.php?userid=".$_COOKIE['user_id']." ' >- Color&Style</a><br>
			  </div>
			</div>";

	#Check login Status
	$authen = user_authen();
	if(($_GET['userid']==$_COOKIE['user_id'])&&($authen=="yes")) {
		print "<div class='center' style='width:600px; margin-left:10px; float:left;'>
					<div class='center_topic1'>Template</div>
					<div class='center_content' style='font-size:12px;'>
						<div class='center_topic2' style='text-align:left'>&nbsp;&nbsp;Layout</div><br>";

		get_layout_form ($ser_message);

		} else {
			if ($authen !="yes") {
			print "<br><div style=\"text-align:center;\">".$authen."</div><br><br>";
		} else {
			Print "<br><div style=\"text-align:center;\">กรุณาทำการ login เพื่อแก้ไข Blog</div><br><br>";
		}
	}
	Add_Reserve ();
	print "</div>
		</div>
	</body></center>
</html>";

#########################Function GET_LAYOUT_FORM##########################
function get_layout_form ($ser_message) {
	global $client;
	global $passkey;

	$params["user_id"] = $_COOKIE[user_id];
	$params["username"] = $_COOKIE[username];
	$params["hash_password"] = $_COOKIE[password];
	$params["passkey"] = $passkey;

	$message = $client->call('obtain_userprofile', $params);

	if (($message["success"] = 'yes') || (!$ser_message)) { 
		$layout = $message["layout"];
		$_SESSION['item_seq'] = $message["item_seq"];
		print "
		<form name='layoutForm' method='post' action='' >
			<table width='570' border='0' cellspacing='0' cellpadding='0' align='center'>
				<tr align='center' valign='middle'>
					<td width='175'><img src='images/layout1.jpg' width='126' height='126'><br></td>
                    <td width='20'>&nbsp;</td>
                    <td width='180'><img src='images/layout2.jpg' width='126' height='126'><br></td>
                    <td width='20'>&nbsp;</td>
                    <td width='175'><img src='images/layout3.jpg' width='126' height='126'><br></td>
                </tr>
                <tr align='center' valign='middle'>
                    <td><input name='radiolayout' type='radio' value='1' ";
		
		($layout == 1) ? print "checked>&nbsp;แบบที่ 1 </td>" : print ">&nbsp;แบบที่ 1 </td>" ;
                        
        print "    <td>&nbsp;</td>
                    <td><input name='radiolayout' type='radio' value='2'";
		
		($layout == 2) ? print "checked>&nbsp;แบบที่ 2 </td>" : print ">&nbsp;แบบที่ 2 </td>" ;

        print "    <td>&nbsp;</td>
                    <td><input name='radiolayout' type='radio' value='3'";

        ($layout == 3) ? print "checked>&nbsp;แบบที่ 3 </td>" : print ">&nbsp;แบบที่ 3 </td>" ;
        
		print "</tr>
				<tr align='right' valign='middle'>
                      <td><br></td>
                      <td>&nbsp;</td>
                      <td><br></td>
                      <td><input type='hidden' name='old_layout' value='".$layout."'></td>
                      <td><br><input type='submit' name='Submitlayout' value='Submit'></td>
                    </tr>";

        print "</table>
       </form>";
	} else {
		print "<div class='center_content' style='font-size:16px; color:#FF0000; '>Warning : ". $message["error_message" ].$ser_message ;
	}
}

#########################Function SUBMIT_LAYOUT_FORM##########################
function submit_layout_form ($layout,$old_layout) {
	
	if (($old_layout == 3)&&($layout!= 3)) {
	$j = 0;
		for ($i=0 ; $i<20; $i++) {
			if (($_SESSION['item_seq'][$i] == " ")||($i>=10)) {
				$_SESSION['item_seq'][$i] = $_SESSION['item_seq'][$j+10];
				$j++;
			}
		}
	} else {
		$_SESSION['item_seq'] = "";
	}
	global $client;
	global $passkey;

	$params = "";
	$params["user_id"] = $_COOKIE[user_id];
	$params["username"] = $_COOKIE[username];
	$params["hash_password"] = $_COOKIE[password];
	$params["newpassword"] = "";
	$params["alias_name"] = "";
	$params["blog_title"] = "";
	$params["email"] = "";
	$params["layout"] = $layout;
	$params["item_seq"] = $_SESSION['item_seq'];
	$params["topic_per_page"] = "";
	$params["passkey"] = $passkey;

	$editprof_message = $client->call('edit_userprofile', $params);
	return $message["error_message" ] ;
}
#profile,category,archive,favourite, , , , , , ,recommend,links,last_update, , , , , ,
?>