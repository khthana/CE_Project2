<?php
	session_start();
	include ("user_conf.php");

	#Submit avatar pic
	if ($_POST['chavatar']) {
		$ch_message = change_avatar();
	} else if ($_GET['action']==delavatar) {
		delete_avatar();
	}

	#Edit Profile Case
	if ($_POST['task'] =='profileedit') {

		#Check password
		if (($_POST['trepassword'] != "")||($_POST['tnewpassword'] != "")) {
			if (($_POST['trepassword'] == $_POST['tnewpassword'])&&($_POST['toldpassword']!= "")){
				$new_password = $_POST['tnewpassword'];
				$_SESSION['ss_RePassword_Valid'] = "";
				$password = md5($_POST['toldpassword']);
				$new_password_valid = true;
				$_SESSION['ss_OldPassword_Msg'] = "";

			} else {
				if ($_POST['trepassword'] != $_POST['tnewpassword']) {
					$_SESSION['ss_RePassword_Valid'] = "repass mismatch";
				}
				if ($_POST['toldpassword'] == "") {
					$_SESSION['ss_OldPassword_Msg'] = "หากต้องการเปลี่ยน password กรุณาใส่ password เดิมด้วย";
				}
				$new_password_valid = false;
			}
		} else {
			$new_password = "";
			$new_password_valid = true;
			$password = $_COOKIE[password];
			$_SESSION['ss_OldPassword_Msg'] = "";
			$_SESSION['ss_RePassword_Valid'] ="";
		}

		if ($new_password_valid) {
			$_SESSION['ss_Title'] = str_replace("\"", "&#34;", str_replace("'", "&#39;", rtrim(trim($_POST['ttitle']))));
			$_SESSION['ss_Alias'] =  str_replace("\"", "&#34;", str_replace("'", "&#39;", rtrim(trim($_POST['tcomname']))));
			$_SESSION['ss_email'] = $_POST['tmail'];
			$_SESSION['ss_entrypp'] = $_POST['entrypp'];

			#call service
			$params = "";
			$params["user_id"] = $_COOKIE[user_id];
			$params["username"] = $_COOKIE[username];
			$params["hash_password"] = $password;
			$params["newpassword"] = $new_password;
			$params["alias_name"] = $_SESSION['ss_Alias'];
			$params["blog_title"] = $_SESSION['ss_Title'];
			$params["email"] = $_POST['tmail'];
			$params["layout"] = "";
			$params["item_seq"] = "";
			$params["topic_per_page"] = $_POST['entrypp'];
			$params["passkey"] = $passkey;

			$editprof_message = $client->call('edit_userprofile', $params);

			if ($editprof_message["success" ] == 'yes') { 
				$call_obtain_userprofile = true;
				if ($new_password != "") {
					$password = md5($new_password );
					setcookie ("password",$password,time()+60*60*24*30*12*10);
					print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_profile.php?userid=".$_GET['userid']."\"> \n";
					echo "";
					exit();
				}
			} else {
				$_SESSION['ss_NewPassword_Msg'] = $editprof_message["error_message"];
				$edit_error_message = $editprof_message["password_error_message"];
				$_SESSION['ss_Title_Msg']  = $editprof_message["title_error_message"];
				$_SESSION['ss_Alias_Msg']  = $editprof_message["alias_error_message"];
				$_SESSION['ss_email_Msg'] = $editprof_message["email_error_message"];

				$call_obtain_userprofile = false;
				$write_profile_form = true;
			}
		} else {
			$call_obtain_userprofile = false;
			$write_profile_form = true;
		}
	} else {
		$call_obtain_userprofile = true;
	}

	#Logout Case	
	if ($_GET['action']=="logout") {
		delete_cookie_func();
		$_SESSION['ss_Access'] = "";							#username mismatch with password
		$_SESSION['ss_Access_Error'] = "";

		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_blog.php?userid=".$_GET['userid']."\"> \n";
		echo "";
		exit();
	}
	
	#Login check
	$login = login_func();
	if ($login == "yes") {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_blog.php?userid=".$_GET['userid']."\"> \n";
		echo "";
		exit();
	}

	#Get template & item variable
	$message = get_layout ($_GET[userid]);
	$layout = $message[layout];
	$item_seq = $message[item_seq];
	$title = $message["blog_title"];
	
	#Stat header & javascript
	get_header($title);

	#JavaScript for check form
	print "<script language=\"javascript\" type=\"text/javascript\">
				function CheckAvatarForm() {
					if ((document.avatarForm.urlavatar.value)||(document.avatarForm.uploadavatar.value)) { 
						return true;
					} else {
						alert('กรุณาไฟล์ที่ต้องการเปลี่ยน Avatar ด้วย');
						return false;
					}
				}

				function LinkDeleteAvatar() {
					var url_fin = '?userid=".$_GET[userid]."&action=delavatar';
					window.location.href= 'control_profile.php'+url_fin;
				}
				</script>
				";

	#Get login form
	get_login_form($title,"control_profile.php","userid=".$_GET[userid],"",$_GET[userid],false);

	#Menu Side
	print "<div class='item' style='float:left;'>
				<div class='item_topic'>Menu</div>
				<div class='item_content' style='font-size:12px;'>
					<strong >Profile</strong><br>
					<a href='control_setting.php?userid=".$_COOKIE['user_id']." ' >Setting</a><br>
					Template<br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_layout.php?userid=".$_COOKIE['user_id']." ' >- Layout</a><br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_theme.php?userid=".$_COOKIE['user_id']." ' >- Theme</a><br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_color.php?userid=".$_COOKIE['user_id']." ' >- Color&Style</a><br>			  </div>
			</div>";

	#Check login Status
	$authen = user_authen();
	if (($_GET['userid']==$_COOKIE['user_id'])&&($authen=="yes")) {

	#Call service
	if ($call_obtain_userprofile) {
		$params = "";
		$params["user_id"] = $_COOKIE[user_id];
		$params["username"] = $_COOKIE[username];
		$params["hash_password"] = $_COOKIE[password];
		$params["passkey"] = $passkey;

		$prof_message = $client->call('obtain_userprofile', $params);
		$_SESSION['ss_Title'] = ($prof_message["blog_title"]);
		$_SESSION['ss_Alias'] = ($prof_message["alias_name"]);
		$_SESSION['ss_email'] = $prof_message["email"];
		$_SESSION['ss_entrypp'] = $prof_message["topic_per_page"];

		$_SESSION['ss_NewPassword_Msg'] = "";
		$_SESSION['ss_Title_Msg'] = "";
		$_SESSION['ss_Alias_Msg']  = "";
		$_SESSION['ss_email_Msg']  = "";
		$_SESSION['ss_OldPassword_Msg'] = "";
		$_SESSION['ss_RePassword_Valid'] ="";

		($prof_message["success"] == 'yes') ? $write_profile_form = true : $write_profile_form = false ;
	}

	if ($write_profile_form) { 

		#Body header
		print "
			<div class='center' style='width:600px; margin-left:10px; float:left; '>";

		($edit_error_message) ? print "<div class='center_topic1' style='text-align:center;'>".$edit_error_message."</div>" : "";

		print "	<div class='center_topic1'>Profile</div>
			  <div class='center_content' style='font-size:12px; '>
			  ";
		
		#Body content Password
		print "
					<div class='center_topic2' style='text-align:left '>Password</div>";

		($_SESSION['ss_NewPassword_Msg'] != "") ? print "*".$_SESSION['ss_NewPassword_Msg'] : "";
		($_SESSION['ss_OldPassword_Msg'] != "") ? print "*".$_SESSION['ss_OldPassword_Msg'] : "";

		print "	<form name='profileForm' method='post' action='control_profile.php?userid=".$_COOKIE['user_id']."'>
					  <table width='570' border='0' cellspacing='0' cellpadding='0'>
						<tr>
						  <td width='116'><strong>Password :</strong>";
		print "		 </td>
						  <td colspan='2'><input name='toldpassword' type='password' size='30' maxlength='20'>
				";

		print "		</td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td colspan='2'>Passwordเดิมที่ใช้ในการ sign in</td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td colspan='2'>&nbsp;</td>
						</tr>
						<tr>
						  <td><strong>New Password :</strong></td>
						  <td colspan='2'><input name='tnewpassword' type='password' size='30' maxlength='20'>
				";

		print"			</td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td colspan='2'>&nbsp;ใช้ในการ Sign in โดยต้องเป็น 0-9, a-z, A-Z เท่านั้นขนาด 5-20 ตัวอักษร</td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td colspan='2'>&nbsp;</td>
						</tr>
						<tr>
						  <td><strong>Re-Password :</strong></td>
						  <td colspan='2'><input name='trepassword' type='password' size='30' maxlength='20'>
				";
		($_SESSION['ss_RePassword_Valid'] == "repass mismatch") ? print"*กรุณาใส่ Password ให้ตรงกันด้วย" : "" ;
				
		print "		</td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td colspan='2'>กันความผิดพลาดนะคะ</td>
						</tr>
					  </table>
				";

		#Body content Title & alias
		print "<br><div class='center_topic2' style='text-align:left '>Title & Comment Name </div>
				<table width='570' border='0' cellspacing='0' cellpadding='0'>
						<tr>
						  <td width='116'><strong>Title name  :</strong></td>
						  <td colspan='2'><input name='ttitle' type='text' size='50' maxlength='100'";

		($_SESSION['ss_Title']) ? print "value = \"" . $_SESSION['ss_Title']. "\">" : print ">" ;
		($_SESSION['ss_Title_Msg']  != "") ? print "*".$_SESSION['ss_Title_Msg']  : "";
		
		print "			</td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td colspan='2'>ชื่อTitle ของBlog ของเรา</td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td colspan='2'>&nbsp;</td>
						</tr>
						<tr>
						  <td><strong>Comment name :</strong></td>
						  <td colspan='2'><input name='tcomname' type='text' size='30' maxlength='20'";
		
		($_SESSION['ss_Alias']) ? print "value = \"" . $_SESSION['ss_Alias'] . "\">" : print ">" ;
		($_SESSION['ss_Alias_Msg']   != "") ? print "*".$_SESSION['ss_Alias_Msg']   : "";
		
		print "			</td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td colspan='2'>เป็นชื่อที่จะใช้เวลาไป Comment ใน Blog ของคนอื่น</td>
						</tr>
				  </table>
				";

		#Email form
		print "<br>
					<div class='center_topic2' style='text-align:left '>E-mail</div>
					  <table width='570' border='0' cellspacing='0' cellpadding='0'>
						<tr>
						  <td width='116'><strong>E-mail :</strong></td>
						  <td colspan='2'><input name='tmail' type='text' size='20' maxlength='50'";

		($_SESSION['ss_email']) ? print "value = '" . $_SESSION['ss_email'] . "'>" : print ">" ;
		($_SESSION['ss_email_Msg'] != "") ? print "*".$_SESSION['ss_email_Msg'] : "";

		print "			</td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td colspan='2'>E-mail ที่ใช้สำหรับการติดต่อ</td>
						</tr>
				  </table>
				";


		#Body content Entry
		print "<br>
					<div class='center_topic2' style='text-align:left '>Entry</div>
					  <table width='570' border='0' cellspacing='0' cellpadding='0'>
						<tr>
						  <td width='116'><strong>Entry/page :</strong></td>
						  <td colspan='2'><input name='entrypp' type='text' size='10' maxlength='2'";
		
		($_SESSION['ss_entrypp']) ? print "value = '" . $_SESSION['ss_entrypp'] . "'>" : print ">" ;
		($_SESSION['ss_entrypp_Msg'] != "") ? print "*".$_SESSION['ss_entrypp_Msg'] : "";

		print "		</td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td colspan='2'>จำนวน Entry ที่จะแสดงในหน้าแรก (กำหนดได้ไม่เกิน  10 Entry)</td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td width='273'>&nbsp;</td>
						  <td width='181'>&nbsp;</td>
						</tr>
					</table>";

		print "	<table width='570' border='0' cellspacing='0' cellpadding='0'>
						 <tr>
						  <td>&nbsp;</td>
						  <td width='273'><input type='hidden' name='task' value='profileedit'></td>
						  <td width='181'><input name='chprofile' type='submit' id='chentry' value='Submit'></td>
						</tr>
					  </table>
				</form>
				";
				
		#Body content avatar pic 
		 print"<br><div class='center_topic2' style='text-align:left '>Avatar picture </div>
				<form name='avatarForm' method='post' action='' enctype='multipart/form-data'
				onSubmit=\"return CheckAvatarForm()\">
			  <table width='570' border='0' cellspacing='0' cellpadding='0'>
				<tr>
				  <td width='174' rowspan='4' align='center'>
					<div style='margin:10px;'><img src='avatar_pic.php?userid=".$_GET['userid']."' width='100px' height='100px' border='0'></div>";
			
			#insert avatar pic
		 print"  </td> 
				  <td width='113'><strong>จากURL : http://</strong></td>
				  <td colspan='2'><input name='urlavatar' type='text' id='urlavatar2' value='' size='30' maxlength='300'></td>
				</tr>
				<tr>
				  <td>&nbsp;</td>
				  <td colspan='2'>&nbsp;</td>
				</tr>
				<tr>
				  <td><strong>จากเครื่องของคุณ : </strong></td>
				  <td colspan='2'><input name='uploadavatar' type='file'>";

			#browse bt
		 print"  </td>
				</tr>
				<tr>
				  <td>&nbsp;</td>
				  <td colspan='2'>* รูปประจำตัวมีขนาด 100x100 px และขนาดไฟล์ไม่เกิน 30K</td>
				</tr>
				<tr>
				  <td align='center'>รูปประจำตัวคุณขณะนี้</td>
				  <td>&nbsp;</td>
				  <td width='103'><input name='chavatar' type='submit' id='delavatar' value='Change avatar'></td>
				  <td width='180'><input type='button' name='delavatar' value='Delete avatar' onClick=\"LinkDeleteAvatar()\"></td>
				</tr>
				<tr>";

				($ch_message) ? print "<td>*Error : ".$ch_message."</td>" : print "<td>&nbsp;</td>";

	print "	  <td>&nbsp;</td>
				  <td colspan='2'>&nbsp;</td>
				</tr>
			  </table>
			  </form>";
	print"	</div>";
	
	}	else {
		print "
			<div class='center' style='width:600px; margin-left:10px; float:left; '>
				<div class='center_topic1'>Profile</div>
			  <div class='center_content' style='font-size:16px; color:#FF0000; '>Warning : ". $prof_message["error_message" ] .$ch_message;
	}

	} else {
		if ($authen=="yes") {
			Print "<br><div style=\"text-align:center;\">กรุณาทำการ login เพื่อแก้ไข Blog</div><br><br>";
		} else {
			print "<br><div style=\"text-align:center;\">".$authen."</div><br><br>";
		}
	}
	Add_Reserve ();
	print "</div>
</body></center>
</html>";

#########################Function CHANGE_AVATAR##########################
function change_avatar() {

	global $passkey;
	global $client;

	if ($_POST['urlavatar']) {
		$mode = "url";
		$url = $_POST['urlavatar'];
		$enc_image = "";
	} else if ($_FILES["uploadavatar"]){
		$mode = "file";
		$url = "";

		move_uploaded_file($_FILES['uploadavatar']['tmp_name'],"latest.img");
		$instr = fopen("latest.img","rb");
		$image = addslashes(fread($instr,filesize("latest.img")));
		$enc_image = base64_encode($image);
	}

	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];

	$params["mode"] = $mode;														//$mode = file,url
	$params["url"] = $url;
	$params["type"] = "avatar";														//$type = avatar,bg,header
	$params["enc_image"] = $enc_image;
	$params["passkey"] = $passkey;

	$message = $client->call('submit_image', $params);

	if ($message["success"]=='yes') {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_profile.php?userid=".$_GET['userid']."\"> \n";
		echo " ";
		exit();
	}

	return $message['error_message'];
}

#########################Function DELETE_AVATAR##########################
function delete_avatar() {
	global $passkey;
	global $client;

	$params["type"] = "avatar";														//$type = avatar,bg,header
	$params["user_id"] = $_COOKIE['user_id'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;

	$message = $client->call('delete_image', $params);

	if ($message["success"]=='yes') {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_profile.php?userid=".$_GET['userid']."\"> \n";
		echo "";
		exit();
	}

	return $message['error_message'];

}
