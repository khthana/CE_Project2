<?php
	session_start();
	include ("user_conf.php");
	include ("theme_var.php");

	#Select theme case
	($_POST['radiotheme']) ? $ser_message = submit_theme_form ($_POST['radiotheme']) : "";

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
	get_login_form($title,"control_template_theme.php","userid=".$_COOKIE[user_id],"",$_GET['userid'],false);

	#Menu Side
	print "<div class='item' style='float:left;'>
				<div class='item_topic'>Menu</div>
				<div class='item_content' style='font-size:12px;'>
					<a href='control_profile.php?userid=".$_COOKIE['user_id']." ' >Profile</a><br>
					<a href='control_setting.php?userid=".$_COOKIE['user_id']."' >Setting</a><br>
					Template<br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_layout.php?userid=".$_COOKIE['user_id']." ' >- Layout</a><br>
					<strong >&nbsp;&nbsp;&nbsp;- Theme</strong><br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_color.php?userid=".$_COOKIE['user_id']." ' >- Color&Style</a><br>
			  </div>
			</div>";

	#Check login Status
	$authen = user_authen();
	if (($_GET['userid']==$_COOKIE['user_id'])&&($authen=="yes")) {
		print "<div class='center' style='width:600px; margin-left:10px; float:left;'>
					<div class='center_topic1'>Template</div>
					<div class='center_content' style='font-size:12px;'>";
		print "<div class='center_topic2' style='text-align:left'>&nbsp;&nbsp;Theme</div><br>";

		get_theme_form ($ser_message);

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

#########################Function GET_THEME_FORM##########################
function get_theme_form ($ser_message) {
	if (!$ser_message['error_message']) {
		print "
		<form name='layoutForm' method='post' action='' OnChange='selectArchive(this)' align='center'>
			<table width='570' border='0' cellspacing='0' cellpadding='0' align='center'>
				<tr align='center' valign='middle'>
					<td width='250'><img src='images/theme1.jpg' width='200' height='135'><br></td>
                    <td width='70'>&nbsp;</td>
                    <td width='250'><img src='images/theme2.jpg' width='200' height='135'><br></td>
				</tr>
                <tr align='center' valign='middle'>
                    <td><input name='radiotheme' type='radio' value='1' ";
		
		($theme == 1) ? print "checked>&nbsp;แบบที่ 1 </td>" : print ">&nbsp;Bamboo Peace </td>" ;
                        
        print "    <td>&nbsp;</td>
                    <td><input name='radiotheme' type='radio' value='2'";
		
		($theme == 2) ? print "checked>&nbsp;แบบที่ 2 </td>" : print ">&nbsp;Vigorous </td>" ;

        print "    <td>&nbsp;</td>
				</tr>
				<tr>
                      <td>&nbsp;</td>
				</tr>
				<tr align='center' valign='middle'>
                    <td colspan='3'><img src='images/theme3.jpg' width='200' height='135' border='0'><br></td>
                </tr>
				<tr align='center' valign='middle'>
                    <td colspan='3'><input name='radiotheme' type='radio' value='3'";

        ($theme == 3) ? print "checked>&nbsp;แบบที่ 3 </td>" : print ">&nbsp;Butterfly </td>" ;
        
		print "</tr>
				<tr align='right' valign='middle'>
                      <td><br></td>
                      <td>&nbsp;</td>
                      <td><br></td>
                      <td><input type='hidden' name='old_layout' value=''></td>
                      <td><br><input type='submit' name='Submittheme' value='Submit'></td>
                </tr>
            </table>
       </form>";
	} else {
		print "<div class='center_content' style='font-size:16px; color:#FF0000; '>Warning : ".$ser_message ;
	}
}

#########################Function GET_THEME_FORM##########################
function submit_theme_form ($theme) {
	($theme == 1) ? $err_message = get_theme_1 () : "";
	($theme == 2) ? $err_message = get_theme_2 () : "";
	($theme == 3) ? $err_message = get_theme_3 () : "";

	return $err_message;
}