<?php
	session_start();
	include ("user_conf.php");
	include ("theme_var.php");

	#Select setting case
	if ($_POST['seq_Submit2']) { $ser_message = submit_setting_form (); }



	#Add Favourite case
	else if ($_POST['favour_id_add']) { $ser_message = add_Favourite(); }

	#Edit Favourite case
	else if ($_POST['favour_new_id_edit']) { $ser_message = edit_Favourite(); }

	#Wanna Edit Favourite case
	else if ($_GET['action'] == "editfavor") { $favoredit = true; } 

	#Delete Favourite case
	else if ($_GET['action'] == "delfavor") { $ser_message = delete_Favourite(); }



	#Add links case
	else if ($_POST['links_url_add']) { $ser_message = add_Links(); }

	#Edit links case
	else if ($_POST['links_new_name_edit']) { $ser_message = edit_Links() ; }

	#Wanna Edit links case
	else if ($_GET['action'] == "editlinks") { $linksedit = true; }

	#Delete links case
	else if ($_GET['action'] == "dellinks") { $ser_message = delete_Links(); }

	else { 
		$favoredit = false ;
		$linksedit = false ;
	}

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
	print	" <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"
				\"http://www.w3.org/TR/html4/loose.dtd\">
				<html>
				<head>
				<title>".$title."</title>
				<script language=\"javascript\" type=\"text/javascript\" src=toolbox.js></script>
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

				function handle_submit()
				{
					var SelectList = \"\";
					for(var i=0;i<document.menuForm.select_left.length;i++){
						SelectList += document.menuForm.select_left.options[i].value+ \",\";
					}
					if (SelectList.length > 0) {
						document.menuForm.SelectedItem_left.value = SelectList.substring(0, SelectList.length-1);
					}
					
					SelectList = \"\";
					for(i=0;i<document.menuForm.select_right.length;i++){
						SelectList += document.menuForm.select_right.options[i].value+ \",\";
					}
					if (SelectList.length > 0) {
						document.menuForm.SelectedItem_right.value = SelectList.substring(0, SelectList.length-1);
					}
				}

				function FavouriteEditCheck ()
				{
					if (document.FavourEditForm.favour_new_id_edit.value) { 
						return true;
					} else { 
						alert ('กรุณาใส่ Userid ใหม่ที่ต้องการเปลี่ยนแปลงด้วย');
						return false;
					}
				}

				function FavouriteAddCheck ()
				{
					if (document.FavourAddForm.favour_id_add.value) { 
						return true;
					} else { 
						alert ('กรุณาใส่ Userid ใหม่ที่ต้องการเพิ่มด้วย');
						return false;
					}
				}

				function LinksAddCheck ()
				{
					if ((document.LinksAddForm.links_name_add.value)&&(document.LinksAddForm.links_url_add.value)) { 
						return true;
					} else { 
						alert ('กรุณาใส่ข้อมูลที่ต้องการเพิ่มให้ครบด้วย');
						return false;
					}
				}

				function LinksEditCheck()
				{
					if ((document.LinksAddForm.links_new_name_edit.value)&&(document.LinksAddForm.links_url_edit.value)) { 
						return true;
					} else { 
						alert ('กรุณาใส่ข้อมูลที่ต้องการแก้ไขให้ครบด้วย');
						return false;
					}
				}

				</script>";

	#Get login form
	get_login_form($title,"control_setting.php","userid=".$_COOKIE[user_id],"",$_GET['userid'],false);

	#Menu Side
	print "<div class='item' style='float:left;'>
				<div class='item_topic'>Menu</div>
				<div class='item_content' style='font-size:12px;'>
					<a href='control_profile.php?userid=".$_COOKIE['user_id']." ' >Profile</a><br>
					<strong>Setting</strong><br>
					Template<br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_layout.php?userid=".$_COOKIE['user_id']." ' >- Layout</a><br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_theme.php?userid=".$_COOKIE['user_id']." ' >- Theme</a><br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_color.php?userid=".$_COOKIE['user_id']." ' >- Color&Style</a><br>
			  </div>
			</div>";

	#Check login Status
	$authen = user_authen();
	if (($_GET['userid']==$_COOKIE['user_id'])&&($authen=="yes")) {
		print "<div class='center' style='width:600px; margin-left:10px; float:left;'>
					<div class='center_topic1'>Setting</div>
					<div class='center_content' style='font-size:12px;'>";
						
		print "<div class='center_topic2' style='text-align:left'>Manage Menu</div><br>";
		get_item_menu_form ($ser_message);

		#function call service obtain_layout
		$layout_message = call_obtain_layout();

		print "<div class='center_topic2' style='text-align:left'>Manage Favourite</div><br>";
		get_favourite_form ($ser_message,$layout_message,$favoredit);

		print "<div class='center_topic2' style='text-align:left'>Manage Links</div><br>";
		get_links_form ($ser_message,$layout_message,$linksedit);

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

#########################Function GET_ITEM_MENU_FORM##########################
function get_item_menu_form ($ser_message) {
	global $client;
	global $passkey;

	$params["user_id"] = $_COOKIE[user_id];
	$params["username"] = $_COOKIE[username];
	$params["hash_password"] = $_COOKIE[password];
	$params["passkey"] = $passkey;

	$message = $client->call('obtain_userprofile', $params);

	if (($message["success"] = 'yes') || (!$ser_message['error_message'])) { 
		$item_seq = $message["item_seq"];
		$layout = $message["layout"];
		$item = Array("archive","profile","category","favourite","recommend","links","last_update","search");
		$item_pos = Array(true,true,true,true,true,true,true,true);
		
		print "
			<form name='menuForm' method='post' onSubmit =\"return handle_submit()\" >
			<table width='520' border='0' cellspacing='0' cellpadding='0' align='center'>
			<tr>
				<td><div class='comment_topic' style='text-align: center; padding:3px; margin:2px;'>";
	
	#menu layout
		(($layout == 1)||($layout == 3)) ? print "Menu ที่แสดงด้านซ้าย" : print "Menu ที่แสดงด้านขวา" ;
		print " </div></td>
			<td>&nbsp;</td>
			<td><div class='comment_topic' style='text-align: center; padding:3px; margin:2px;'>Menu ที่ไม่ได้แสดง</div></td>
			<td>&nbsp;</td>
			<td>";
		($layout == 3) ? print "<div class='comment_topic' style='text-align: center; padding:3px; margin:2px;'>Menu ที่แสดงด้านขวา</div>" : print "&nbsp;";

		print "</td>
		</tr>
		<tr align='center'>
			<td rowspan='9'>
				<select name='select_left' size='9' id='select43' style='width:130px; ' onDblClick=\"moveSelectedOptions(this.form['select_left'],this.form['select_hide'],false)\">";

		#print item left list
		for ($i=0 ;$i<10; $i++) {
			if ($item_seq[$i]=="archive")		{ print "<option value='archive'>Archive</option>";		$item_pos[0] =false;}
			if ($item_seq[$i]=="profile")			{ print "<option value='profile'>Profile</option>";			$item_pos[1] =false;}
			if ($item_seq[$i]=="category")		{ print "<option value='category'>Category</option>";		$item_pos[2] =false;}
			if ($item_seq[$i]=="favourite")		{ print "<option value='favourite'>Favourite</option>";		$item_pos[3] =false;}
			if ($item_seq[$i]=="recommend") { print "<option value='recommend'>Recommend</option>";	$item_pos[4] =false;}
			if ($item_seq[$i]=="links")			{ print "<option value='links'>Links</option>";			$item_pos[5] =false;}
			if ($item_seq[$i]=="last_update") { print "<option value='last_update'>Last update</option>";	$item_pos[6] =false;}
			if ($item_seq[$i]=="search")			{ print "<option value='search'>Search</option>";	$item_pos[7] =false;}
		}

		print"	</select>
			</td>
			<td>&nbsp;</td>
			<td rowspan='9'><select name='select_hide' size='9' id='select41' style='width:130px; ' >";

		#print item hide list
		if (($layout == 1)||($layout == 2)) {
			if ($item_pos[0])	 { print "<option value='archive'>Archive</option>";}
			if ($item_pos[1])	 { print "<option value='profile'>Profile</option>";	}
			if ($item_pos[2])	 { print "<option value='category'>Category</option>";	}
			if ($item_pos[3]) { print "<option value='favourite'>Favourite</option>";	}
			if ($item_pos[4]) { print "<option value='recommend'>Recommend</option>";}
			if ($item_pos[5])	 { print "<option value='links'>Links</option>";}
			if ($item_pos[6]) { print "<option value='last_update'>Last update</option>";}
			if ($item_pos[7]) { print "<option value='search'>Search</option>";}
		} else {
			unset($sel_l3);
			for ($i=10 ;$i<20; $i++) {
				if ($item_seq[$i]=="archive")		{$item_pos[0] =false;}
				if ($item_seq[$i]=="profile")			{$item_pos[1] =false;}
				if ($item_seq[$i]=="category")		{$item_pos[2] =false;}
				if ($item_seq[$i]=="favourite")		{$item_pos[3] =false;}
				if ($item_seq[$i]=="recommend") {$item_pos[4] =false;}
				if ($item_seq[$i]=="links")			{$item_pos[5] =false;}
				if ($item_seq[$i]=="last_update") {$item_pos[6] =false;}
				if ($item_seq[$i]=="search")			{$item_pos[7] =false;}
			}
			if ($item_pos[0])	 { print "<option value='archive'>Archive</option>";}
			if ($item_pos[1])	 { print "<option value='profile'>Profile</option>";	}
			if ($item_pos[2])	 { print "<option value='category'>Category</option>";	}
			if ($item_pos[3]) { print "<option value='favourite'>Favourite</option>";	}
			if ($item_pos[4]) { print "<option value='recommend'>Recommend</option>";}
			if ($item_pos[5])	 { print "<option value='links'>Links</option>";}
			if ($item_pos[6]) { print "<option value='last_update'>Last update</option>";}
			if ($item_pos[7]) { print "<option value='search'>Search</option>";}
			
			print"</select>	
				</td>
				<td>&nbsp;</td>
				<td rowspan='9'><select name='select_right' size='9' id='select42' style='width:130px; ' onDblClick=\"moveSelectedOptions(this.form['select_right'],this.form['select_hide'],false)\">";
			for ($i=10 ;$i<20; $i++) {
				if ($item_seq[$i]=="archive")		{ print "<option value='archive'>Archive</option>\n";}
				if ($item_seq[$i]=="profile")			{ print "<option value='profile'>Profile</option>\n";	}
				if ($item_seq[$i]=="category")		{ print "<option value='category'>Category</option>\n";}
				if ($item_seq[$i]=="favourite")		{ print "<option value='favourite'>Favourite</option>\n";}
				if ($item_seq[$i]=="recommend") { print "<option value='recommend'>Recommend</option>\n";}
				if ($item_seq[$i]=="links")			{ print "<option value='links'>Links</option>\n";	}
				if ($item_seq[$i]=="last_update") { print "<option value='last_update'>Last update</option>\n";}
				if ($item_seq[$i]=="search")			{ print "<option value='search'>Search</option>\n";}
			}

		}

		print"	</select>
			</td>
		</tr>
		<tr align='center'>
			<td><input name='up_left' type='button' id='up_left' value='Up' onClick=\"moveOptionUp(this.form['select_left'])\"></td>
			<td>";
			
		($layout == 3) ? print "<input name='up_right' type='button' id='up_right' value='Up' onClick=\"moveOptionUp(this.form['select_right'])\">" : "&nbsp;";

		print "</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr align='center'>
			<td><input name='mv_show_left' type='button' id='mv_show_left3' value='<<' onClick=\"moveSelectedOptions(document.forms[0]['select_hide'],document.forms[0]['select_left'],false); return false;\">
			</td>
			<td>";
			
		($layout == 3) ? print "<input name='mv_show_right' type='button' id='mv_show_right2' value='>>' onClick=\"moveSelectedOptions(document.forms[0]['select_hide'],document.forms[0]['select_right'],false);return false;\">" : "&nbsp;";

		print "
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr align='center'>
			<td><input name='mv_hide_left' type='button' id='mv_hide_left4' value='>>' onClick=\"moveSelectedOptions(document.forms[0]['select_left'],document.forms[0]['select_hide'],false);return false;\">
			</td>
			<td>";
			
		($layout == 3) ? print "<input name='mv_hide_right' type='button' id='mv_hide_right2' value='<<'  onClick=\"moveSelectedOptions(document.forms[0]['select_right'],document.forms[0]['select_hide'],false);return false;\" >" : "&nbsp;";

		print "
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr align='center'>
			<td><input name='down_left' type='button' id='down_left' value='Down' onClick=\"moveOptionDown(this.form['select_left'])\"></td>
			<td>";
			
		($layout == 3) ? print "<input name='down_right' type='button' id='down_right' value='Down' onClick=\"moveOptionDown(this.form['select_right'])\">" : "&nbsp;";

		print "</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input type='hidden' name='Layout_value' value='".$layout."'></td>
			<td><input type='hidden' name='SelectedItem_right' value=''></td>
			<td><input type='hidden' name='SelectedItem_left' value=''></td>
			<td align='right'><input name='seq_Submit2' type='submit' id='seq_Submit2' value='Submit'></td>
		</tr>
	</table>
	</form><br>";
	} else {
		print "<div class='center_content' style='font-size:16px; color:#FF0000; '>Warning : ".$ser_message.$message["error_message"] ;
	}
}

#########################Function SUBMIT_SETTING_FORM##########################
function submit_setting_form () {

	$item_buffer = explode(",",$_POST['SelectedItem_left']);
	for ($i=0; $i<20; $i++){
		($item_buffer[$i]) ? $item_seq[$i] = $item_buffer[$i] : $item_seq[$i] = " " ;
	}

	if ($_POST['Layout_value'] == 3) {
		unset($item_buffer);
		$item_buffer = explode(",",$_POST['SelectedItem_right']);
		for ($i=0; $i<sizeof($item_buffer); $i++){
			($item_buffer[$i]) ? $item_seq[$i+10] = $item_buffer[$i] : "" ;
		}
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
	$params["layout"] = "";
	$params["item_seq"] = $item_seq;
	$params["topic_per_page"] = "";
	$params["passkey"] = $passkey;

	$editprof_message = $client->call('edit_userprofile', $params);
	if ($message["success"] == 'yes') { print "SUCC:".$message["success"]; }
	return $message["error_message" ] ;
}

#########################Function CALL_OBTAIN_LAYOUT##########################
function call_obtain_layout() {
	global $client;
	global $passkey;
		
	$params["author_userid"] = $_COOKIE['user_id'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$recv_message = $client->call('obtain_layout', $params);

	return $recv_message;
}

#########################Function ADD_FAVOURITE##########################
function add_Favourite() {
	global $client;
	global $passkey;
		
	$params["favourite_userid"] = $_POST['favour_id_add'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;
	
	#Call service check
	$recv_message = $client->call('submit_favourite', $params);

	return $message["error_message"];
}

#########################Function GET_FAVOURITE_FORM##########################
function get_favourite_form ($ser_message,$layout_message,$favoredit) {
	if (($message["success"] = 'yes') || (!$layout_message['error_message'])) { 

		$list_favouritename = $layout_message["favourite_content_blog_title"];
		$list_favouriteid = $layout_message["favourite_user_id"];

		print "<form name='FavourEditForm' method='post' action='' onSubmit =\"return FavouriteEditCheck ()\">
				  <table width='570' border='0' cellspacing='0' cellpadding='0'>
                    <tr style='font-weight:bold; '>
                      <td width='168'>Name</td>
                      <td colspan='2'>Userid</td>
                      <td width='50' align='center'>Edit</td>
                      <td width='50' align='center'>Delete</td>
                    </tr>
                    <tr>
                      <td colspan='5'><hr width='100%' size='1' noshade></td>
                    </tr>";

		#Print each favourite 
		$i = 0;
		while ($list_favouritename[$i]) {
		   if (($favoredit)&&($i==$_GET['favourid'])) {
			    print "<tr>
                      <td>".$list_favouritename[$i]."</td>
                      <td colspan='2'>
						  <input name='favour_new_id_edit' type='text' size='10' maxlength='10' value='".$list_favouriteid[$i]."'>
						  <input type='hidden' name='favour_old_id_edit' value='".$list_favouriteid[$i]."'>
					  </td>
                      <td colspan='2' align='center'>
						  <input name='favour_edit_bt' type='submit' value='Edit'>
					  </td>
                    </tr>
                    <tr>
                      <td colspan='5'><hr width='100%' size='1' noshade></td>
                    </tr>";
		   } else {
				print "<tr>
                      <td>".$list_favouritename[$i]."</td>
                      <td colspan='2'>".$list_favouriteid[$i]."</td>
                      <td align='center'>
							<a href='control_setting.php?userid=".$_GET['userid']."&favourid=".$i."&action=editfavor'>
							<img src='images/edit.gif' width='16' height='16' border='0'></a></td>
                      <td align='center'>
							<a href='control_setting.php?userid=".$_GET['userid']."&favourid=".$list_favouriteid[$i]."&action=delfavor'>
							<img src='images/delete.gif' width='13' height='14'  border='0'></a></td>
                    </tr>
                    <tr>
                      <td colspan='5'><hr width='100%' size='1' noshade></td>
                    </tr>";
		   }
					  $i++;
		}
		print "</form></table><br>";

		#Print Add favourite
		print "<form name='FavourAddForm' method='post' action='' onSubmit =\"return FavouriteAddCheck()\">
					User ID : 
					<input name='favour_id_add' type='text' size='10' maxlength='10'>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						  
					<input name='favour_add_bt' type='submit' value='Add'>
 				</form>
                  <br>";
	} else {
		print "<div class='center_content' style='font-size:16px; color:#FF0000; '>Warning : ".$ser_message.$message["error_message"] ;
	}
}

#########################Function EDIT_FAVOURITE##########################
function edit_Favourite() {
	global $client;
	global $passkey;

	$params["new_favourite_userid"] = $_POST['favour_new_id_edit'];
	$params["old_favourite_userid"] = $_POST['favour_old_id_edit'];
	$params["user_id"] = $_COOKIE['user_id'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$recv_message = $client->call('edit_favourite', $params);
	
	if ($recv_message["success"] == 'yes') {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_setting.php?userid=".$_GET['userid']."\"> \n";
		exit();
	} else {
		return $recv_message["error_message"];
	}
}

#########################Function DELETE_FAVOURITE##########################
function delete_Favourite() {
	global $client;
	global $passkey;
		
	$params["favourite_id"] = $_GET['favourid'];
	$params["user_id"] = $_COOKIE['user_id'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$recv_message = $client->call('delete_favourite', $params);
	
	if ($recv_message["success"] == 'yes') {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_setting.php?userid=".$_GET['userid']."\"> \n";
		exit();
	} else {
		return $message;
	}
}

#########################Function ADD_LINKS##########################
function add_Links() {
	global $client;
	global $passkey;
		
	$params["link_url"] = str_replace("\"", "&#34;", str_replace("'", "&#39;", rtrim(trim($_POST['links_url_add']))));
	$params["link_name"] = str_replace("\"", "&#34;", str_replace("'", "&#39;", rtrim(trim($_POST['links_name_add']))));
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;
	
	#Call service check
	$message = $client->call('submit_link', $params);

	return $message["error_message"];
}

#########################Function GET_LINKS_FORM##########################
function get_links_form ($ser_message,$layout_message,$linksedit) {
	if (($message["success"] = 'yes') || (!$layout_message['error_message'])) { 

		$list_linksname = $layout_message["links_name"];
		$list_linksurl = $layout_message["links_url"];

		print "<form name='LinksEditForm' method='post' action='' onSubmit =\"return LinksEditCheck()\"> 
				  <table width='570' border='0' cellspacing='0' cellpadding='0'>
                    <tr style='font-weight:bold; '>
                      <td width='168'>Name</td>
                      <td colspan='2'>Link</td>
                      <td width='50' align='center'>Edit</td>
                      <td width='50' align='center'>Delete</td>
                    </tr>
                    <tr>
                      <td colspan='5'><hr width='100%' size='1' noshade></td>
                    </tr>";

		#Print each links 
           $i = 0;
		while ($list_linksname[$i]) {
		   if (($linksedit)&&($i==$_GET['linksid'])) {
			   $url_edit = substr($list_linksurl[$i],7,strlen($list_linksurl[$i])-7);
			   print "<tr>
                      <td>
						  <input name='links_new_name_edit' type='text' size='20' maxlength='30' value='".$list_linksname[$i]."'>
						  <input type='hidden' name='links_old_name_edit' value='".$list_linksname[$i]."'>
					  </td>
                      <td colspan='2'>
						  <input name='links_url_edit' type='text' size='50' maxlength='200' value='".$url_edit."'>
					  </td>
                      <td colspan='2' align='center'>
						  <input name='links_edit_bt' type='submit' value='Edit'>
					  </td>
                    </tr>
					<tr>
                      <td colspan='5'><hr width='100%' size='1' noshade></td>
                    </tr>";
		   } else {
				print "<tr>
                      <td>".$list_linksname[$i]."</td>
                      <td colspan='2'>".$list_linksurl[$i]."</td>
                      <td align='center'>
						  <a href='control_setting.php?userid=".$_GET['userid']."&linksid=".$i."&action=editlinks'>
						  <img src='images/edit.gif' width='16' height='16'  border='0'></a>
					  </td>
                      <td align='center'>
						  <a href='control_setting.php?userid=".$_GET['userid']."&linksid=".$list_linksname[$i]."&action=dellinks'>
						  <img src='images/delete.gif' width='13' height='14'  border='0'></a>
					  </td>
                    </tr>
					<tr>
                      <td colspan='5'><hr width='100%' size='1' noshade></td>
                    </tr>";
		   }
					  $i++;
		}			
		print"	</form></table><br>";
		
		#print add links 
           print"<form name='LinksAddForm' method='post' action='' onSubmit =\"return LinksAddCheck()\">
				<table width='570' border='0' cellspacing='0' cellpadding='0'>
					<tr>
                      <td>Name : </td>
                      <td colspan='2'>URL : </td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>
						  <input name='links_name_add' type='text' size='20' maxlength='30'>
					  </td>
                      <td colspan='2'>
						  http:// <input name='links_url_add' type='text' size='30' maxlength='200'>
					  </td>
                      <td colspan='2' align='center'>
						  <input name='links_add_bt' type='submit'  value='Add'>
					  </td>
                    </tr>
                  </table>
				</form>
                  <br>";
	} else {
		print "<div class='center_content' style='font-size:16px; color:#FF0000; '>Warning : ".$ser_message.$message["error_message"] ;
	}
}

#########################Function EDIT_LINKS##########################
function edit_links() {
	global $client;
	global $passkey;

	$params["new_link_name"] = str_replace("\"", "&#34;", str_replace("'", "&#39;", rtrim(trim($_POST['links_new_name_edit']))));
	$params["new_link_url"] = str_replace("\"", "&#34;", str_replace("'", "&#39;", rtrim(trim($_POST['links_url_edit']))));
	$params["old_link_name"] = str_replace("\"", "&#34;", str_replace("'", "&#39;", rtrim(trim($_POST['links_old_name_edit']))));
	$params["user_id"] = $_COOKIE['user_id'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$recv_message = $client->call('edit_link', $params);
	
	if ($recv_message["success"] == 'yes') {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_setting.php?userid=".$_GET['userid']."\"> \n";
		exit();
	} else {
		return $recv_message["error_message"];
	}
}

#########################Function DELETE_FAVOURITE##########################
function delete_Links() {
	global $client;
	global $passkey;
		
	$params["link_name"] = $_GET['linksid'];
	$params["user_id"] = $_COOKIE['user_id'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$recv_message = $client->call('delete_link', $params);
	
	if ($recv_message["success"] == 'yes') {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_setting.php?userid=".$_GET['userid']."\"> \n";
		exit();
	} else {
		return $message;
	}
}