<?php
	session_start();
	include ("user_conf.php");

	#Submit CSS case
	if ($_POST['CSSSubmit']) { $ser_message = submit_css_form(); }

	#Add Header Image
	else if ($_POST['addheadpic']) {$ser_message = change_header_img();}

	#Add Background Image
	else if ($_POST['addbgpic']) {$ser_message = change_bg_img();}

	#Delete Header Image
	else  if ($_GET['action']=="delheader") {$ser_message = delete_header_img();}

	#Delete Background Image
	else  if ($_GET['action']=="delbg") {$ser_message = delete_bg_img();}

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

	#JavaScript for color picker
	print "<SCRIPT language=Javascript src=\"colorpicker.js\"></SCRIPT>";
	print "<script language=\"javascript\" type=\"text/javascript\">
				var cp = new ColorPicker('window'); // Popup window\n";
	
	#JavaScript for check form
	print "function CheckHeaderForm() {
					if ((document.PicHeaderForm.header_img_url.value)||(document.PicHeaderForm.header_img_file.value)) { 
						return true;
					} else {
						alert('กรุณาไฟล์ที่ต้องการเปลี่ยน Header ด้วย');
						return false;
					}
				}

				function CheckBgForm() {
					if ((document.PicBackgroundForm.bg_img_file.value)||(document.PicBackgroundForm.bg_img_url.value)) { 
						return true;
					} else {
						alert('กรุณาไฟล์ที่ต้องการเปลี่ยน Background ด้วย');
						return false;
					}
				}

				function LinkDeleteHeader() {
					var url_fin = '?userid=".$_GET[userid]."&action=delheader';
					window.location.href= 'control_template_color.php'+url_fin;
				}

				function LinkDeleteBg() {
					var url_fin = '?userid=".$_GET[userid]."&action=delbg';
					window.location.href= 'control_template_color.php'+url_fin;
				}
			</script>";


	#Get login form
	get_login_form($title,"control_template_color.php","userid=".$_COOKIE[user_id],"",$_GET['userid'],false);

	#Menu Side
	print "<div class='item' style='float:left;'>
				<div class='item_topic'>Menu</div>
				<div class='item_content' style='font-size:12px;'>
					<a href='control_profile.php?userid=".$_COOKIE['user_id']." ' >Profile</a><br>
					<a href='control_setting.php?userid=".$_COOKIE['user_id']."' >Setting</a><br>
					Template<br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_layout.php?userid=".$_COOKIE['user_id']." ' >- Layout</a><br>
					&nbsp;&nbsp;&nbsp;<a href='control_template_theme.php?userid=".$_COOKIE['user_id']." ' >- Theme</a><br>
					<strong >&nbsp;&nbsp;&nbsp;- Color&Style</strong><br>
			  </div>
			</div>";

	#Check login Status
	$authen = user_authen();
	if (($_GET['userid']==$_COOKIE['user_id'])&&($authen=="yes")) {
		print "<div class='center' style='width:600px; margin-left:10px; float:left;'>
					<div class='center_topic1'>Template</div>
					<div class='center_content' style='font-size:12px;'>";
		print "<div class='center_topic2' style='text-align:left'>&nbsp;&nbsp;Color & Style</div>";

		get_color_form ($ser_message);
		print "</div>";

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

#########################Function GET_COLOR_FORM##########################
function get_color_form ($ser_message) {
	if (!$ser_message['error_message']) {

	global $client;
	global $passkey;

	$params["user_id"] = $_GET[userid];
	$params["passkey"] = $passkey;

	$css_message = $client->call('obtain_usercss', $params);

	if ($css_message["success" ] == 'yes') {
		$body_bg_color = $css_message["body_bg_color"] ;
		$body_border_style = $css_message["body_border_style"] ;
		$body_border_color = $css_message["body_border_color"] ;
		$body_bg_image = $css_message["$body_bg_image"];
		$header_bg_color = $css_message["header_bg_color"] ;
		$header_bg_image = $css_message["header_bg_image"];
		$header_font_color =$css_message["header_font_color"] ;
		$status_bg_color = $css_message["status_bg_color"] ;
		$status_font_color = $css_message["status_font_color"] ;
		$item_bg_color = $css_message["item_bg_color"] ;
		$item_topic_bg_color = $css_message["item_topic_bg_color"] ;
		$item_topic_font_color =$css_message["item_topic_font_color"] ;
		$item_link_color = $css_message["item_link_color"] ;
		$item_link_hover =$css_message["item_link_hover"] ;
		$content_bg_color = $css_message["content_bg_color"] ;
		$content_comment_font_color = $css_message["content_comment_font_color"] ;
		$content_blog_color = $css_message["content_blog_color"] ;
		$content_comment_bg_color = $css_message["content_comment_bg_color"] ;
		$comment_font_color = $css_message["comment_font_color"] ;
		$comment_bg_color = $css_message["comment_bg_color"] ;
		$comment_topic_font_color = $css_message["comment_topic_font_color"] ;
		$comment_topic_bg_color = $css_message["comment_topic_bg_color"] ;
		
		print " 
		<div class='comment' style='float:right; width:380px; margin-right:0px; margin-left:0px;'>
            <form name='templateForm' method='post' action=''>";
		
		#1. สี หรือ ภาพของHeader
		print"	<div class='comment_content'>
				<div class='center_topic2' style='text-align:left;'>&nbsp;&nbsp;1.&nbsp;สี หรือ ภาพของHeader </div>
					สีของพื้น &nbsp;:&nbsp;
					<input name='header_col' type='text' id='header_col' size='10' maxlength='7' value='".$header_bg_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].header_col,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>&nbsp;&nbsp;&nbsp;
				</div><br>";

		#2. สีตัวอักษรของ header
		print"<div class='comment_content'>
			<div class='center_topic2' style='text-align:left;'>&nbsp;&nbsp;2.&nbsp;สีตัวอักษรของ header</div>
					 สีตัวอักษร &nbsp;:&nbsp;
                    <input name='header_font' type='text' id='header_font' size='10' maxlength='7' value='".$header_font_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].header_font,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
			</div><br>";

		#3. แถบ login &amp; logout
		 print" <div class='comment_content'>
			<div class='center_topic2' style='text-align:left;'>&nbsp;&nbsp;3.&nbsp;แถบ login &amp; logout </div>	  
					สีพื้นหลัง :
                    <input name='status_bg' type='text' id='status_bg' size='10' maxlength='7' value = '".$status_bg_color."' >
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].status_bg,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;สี font :&nbsp;
					<input name='status_font' type='text' id='status_font' size='10' maxlength='7' value = '".$status_font_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].status_font,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
		  </div><br>";

		#4. Background (พื้นหลัง)
		 print" <div class='comment_content'>
					<div class='center_topic2' style='text-align:left;'>&nbsp;&nbsp;4.&nbsp;Background (พื้นหลัง)</div>  
					สีของพื้นหลัง &nbsp;:&nbsp;
					<input name='body_col' type='text' id='body_col' size='10' maxlength='7' value ='".$body_bg_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].body_col,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
					&nbsp;&nbsp;&nbsp
				  </div><br>";

		#5. เส้นขอบ
		print"  <div class='comment_content'>
				<div class='center_topic2' style='text-align:left; '>&nbsp;&nbsp;5.&nbsp;เส้นขอบ</div>
					สีเส้นขอบ :
                    <input name='border_col' type='text' id='border_col' size='10' maxlength='7' value='".$body_border_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].border_col,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
				    รูปแบบของขอบ :
			        <select name='selectborderstyle' id='selectborderstyle' style='width:120px '>";
		print"		  <option value='dashed'";($body_border_style == "dashed") ? 
						print "selected>Dashed</option>" : print ">Dashed</option>";
		print"		  <option value='dotted'";($body_border_style == "dotted") ?
						print "selected>Dotted</option>" : print ">Dotted</option>";
		print"		  <option value='double'";($body_border_style == "double") ?
						print "selected>Double</option>" : print ">Double</option>";
		print"		  <option value='groove'";($body_border_style == "groove") ? 
						print "selected>Groove</option>" : print ">Groove</option>";
		print"		  <option value='none'";($body_border_style == "none") ? 
						print "selected>ไม่แสดง</option>" : print ">ไม่แสดง</option>";
		print"	</select>
		  </div><br>";

		#6. Link
		 print " <div class='comment_content'>
				<div class='center_topic2' style='text-align:left;'>&nbsp;&nbsp;6.&nbsp;Link</div>
					สีของ link :&nbsp;
                    <input name='link_col' type='text' id='link_col' size='10' maxlength='7' value = '".$item_link_color."' >
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].link_col,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
					&nbsp;สีlinkเมื่อfocus :&nbsp;
					<input name='hover_col' type='text' id='hover_col' size='10' maxlength='7' value = '".$item_link_hover."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].hover_col,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
					&nbsp;&nbsp; </div><br>";

		#7. Menu
		print " <div class='comment_content'>
				<div class='center_topic2' style='text-align:left;'>&nbsp;&nbsp;7.&nbsp;Menu</div>
					สีพื้นหลัง :
					<input name='menu_bg' type='text' id='menu_bg' size='10' maxlength='7' value='".$item_bg_color."' >
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].menu_bg,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
					&nbsp;</div><br>";
		
		#8. หัวข้อหลัก
		 print" <div class='comment_content'>
				<div class='center_topic2' style='text-align:left;'>&nbsp;&nbsp;8.&nbsp;หัวข้อหลัก</div>
					สีพื้นหลัง :
                    <input name='topic_bg' type='text' id='topic_bg' size='10' maxlength='7' value='".$item_topic_bg_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].topic_bg,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;สี font :&nbsp;
					<input name='topic_font' type='text' id='topic_font' size='10' maxlength='7' value='".$item_topic_font_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].topic_font,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
		  </div><br>";

		#9. หัวข้อรอง
		 print" <div class='comment_content'>
				<div class='center_topic2' style='text-align:left;'>&nbsp;&nbsp;9.&nbsp;หัวข้อรอง</div>
					สีพื้นหลัง :
                    <input name='topic_tail_bg' type='text' id='topic_tail_bg' size='10' maxlength='7' value='".$content_comment_bg_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].topic_tail_bg,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;สี font :&nbsp;
					<input name='topic_tail_font' type='text' id='topic_tail_font' size='10' maxlength='7' value='".$content_comment_font_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].topic_tail_font,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
		  </div><br>";

		#10. ส่วนของ Content 
		print"  <div class='comment_content'>
				<div class='center_topic2' style='text-align:left;'>&nbsp;10.&nbsp;ส่วนของ Content </div>
				  	สีพื้นหลัง :
                    <input name='content_bg' type='text' id='content_bg' size='10' maxlength='7' value='".$content_bg_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].content_bg,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;สี font :
					<input name='content_font' type='text' id='content_font' size='10' maxlength='7' value='".$content_blog_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].content_font,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
				</div><br>";

		#11.  หัวข้อใน Comment
		print"  <div class='comment_content'>
				<div class='center_topic2' style='text-align:left;'>&nbsp;11.&nbsp;หัวข้อใน Comment </div>
				  	สีพื้นหลัง :
                    <input name='topic_comment_bg' type='text' id='topic_comment_bg' size='10' maxlength='7' value='".$comment_topic_bg_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].topic_comment_bg,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;สี font :&nbsp;
					<input name='topic_comment_font' type='text' id='topic_comment_font' size='10' maxlength='7' value='".$comment_topic_font_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].topic_comment_font,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
				</div><br>";

		#12. ส่วนของ Comment
		print"  <div class='comment_content'>
				<div class='center_topic2' style='text-align:left;'>&nbsp;12.&nbsp;ส่วนของ Comment </div>
				 	สีพื้นหลัง :
                    <input name='comment_bg' type='text' id='comment_bg' size='10' maxlength='7' value='".$comment_bg_color."' >
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].comment_bg,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;สี font :&nbsp;
					<input name='comment_font' type='text' id='comment_font' size='10' maxlength='7' value='".$comment_font_color."'>
					<a HREF=\"#\" onClick=\"cp.select(document.forms[0].comment_font,'pick');return false;\" name='pick' id='pick'>
					<img src='images/color_buffer.jpg' width='15' height='15' border='0'></a>
				</div><br>";

		print"  <div style='text-align:left '>*ในกรณีที่ไม่ต้องการให้มีสีใส่ค่าว่า 'none' <br>และรหัสสีต้องขึ้นต้นด้วย #แล้วตามด้วยตัวเลขหรืออักษร A-F <br></div>
					<div style='text-align:right '><input type='submit' name='CSSSubmit' value='Submit'></div>
            </form>";

		print "</div>";

		print "<img src='images/sample.jpg' style='margin-top:8px;'>";

		print "<div class='comment' style='float:right; width:380px; margin-right:0px; margin-left:0px;'>";

		#13. ภาพของHeader
		print" <div class='comment_content'>
				<form name='PicHeaderForm' method='post' action='' enctype='multipart/form-data' 
					onSubmit=\"return CheckHeaderForm()\">
				<div class='center_topic2' style='text-align:left;'>&nbsp;13.&nbsp;ภาพของHeader</div>
				  	ภาพจากเครื่อง : <input name='header_img_file' type='file' style='margin:3px;'><br>
					ภาพจากURL : http://<input name='header_img_url' type='text' size='25' maxlength='200' style='margin:3px;'><br>
				<div style='text-align:right;'>*ภาพของ Header มีขนาด 770x110 px และขนาดของ File ไม่เกิน 60K <br>
					<input name='addheadpic' type='submit' value='Change Picture'>
					<input name='delheadpic' type='button' value='Delete Picture' onClick=\"LinkDeleteHeader()\">
				</div>
				</div></form>";

		#14. ภาพของBackground (พื้นหลัง)
		print "<div class='comment_content'>
				<form name='PicBackgroundForm' method='post' action='' enctype='multipart/form-data' 
					onSubmit=\"return CheckBgForm()\">
				<div class='center_topic2' style='text-align:left;'>&nbsp;14.&nbsp;ภาพของBackground (พื้นหลัง)</div>
					ภาพจากเครื่อง : <input name='bg_img_file' type='file' style='margin:3px;'><br>
					ภาพจากURL : http://<input name='bg_img_url' type='text' size='25' maxlength='200' style='margin:3px;'><br>
				<div style='text-align:right;'>*ภาพของ Background มีขนาดของ File ไม่เกิน 60K<br>
					<input name='addbgpic' type='submit' value='Change Picture'>
					<input name='delbgpic' type='button' value='Delete Picture' onClick=\"LinkDeleteBg()\">
				</div>
				</div></form>";

		print"</div>";

	} else {
		print "<div class='center_content' style='font-size:16px; color:#FF0000; '>Warning : ".$css_message["error_message"] ;
	}
	} else {
		print "<div class='center_content' style='font-size:16px; color:#FF0000; '>Warning : ".$ser_message ;
	}
}

#########################Function GET_THEME_FORM##########################
function submit_css_form () {
	global $client;
	global $passkey;

	$params["user_id"] = $_COOKIE[user_id];
	$params["username"] = $_COOKIE[username];
	$params["hash_password"] = $_COOKIE[password];
	
	#BODY
	$params["body_bg_color"] = $_POST['body_col'] ;
	$params["body_border_style"] = $_POST['selectborderstyle'];
	$params["body_border_color"] = $_POST['border_col'];

	#HEADER
	$params["header_bg_color"] =$_POST['header_col'];
	$params["header_font_color"] = $_POST['header_font'];

	#STATUS
	$params["status_bg_color"] = $_POST['status_bg'];
	$params["status_font_color"] = $_POST['status_font'];

	#ITEM_MENU
	$params["item_bg_color"] = $_POST['menu_bg'];
	$params["item_topic_bg_color"] = $_POST['topic_bg'];
	$params["item_topic_font_color"] =$_POST['topic_font'];
	$params["item_link_color"] = $_POST['link_col'];
	$params["item_link_hover"] =$_POST['hover_col'];

	#CONTENT
	$params["content_bg_color"] = $_POST['content_bg'];
	$params["content_comment_font_color"] = $_POST['topic_tail_font'];
	$params["content_blog_color"] = $_POST['content_font'];
	$params["content_comment_bg_color"] = $_POST['topic_tail_bg'];

	#COMMENT
	$params["comment_font_color"] = $_POST['comment_font'];
	$params["comment_bg_color"] = $_POST['comment_bg'];
	$params["comment_topic_font_color"] = $_POST['topic_comment_font'];
	$params["comment_topic_bg_color"] = $_POST['topic_comment_bg'];

	$params["passkey"] = $passkey;

	$message = $client->call('edit_usercss', $params);

#	$body_bg_image = "none";													
#	$header_bg_image = "url(images/user_header.jpg)";				

	return $message["error_message"];
}

#########################Function CHANGE_HEADER_IMG##########################
function change_header_img() {
	global $passkey;
	global $client;

	if ($_POST['header_img_url']) {
		$mode = "url";
		$url = $_POST['header_img_url'];
		$enc_image = "";
	} else if ($_FILES["header_img_file"]){
		$mode = "file";
		$url = "";

		move_uploaded_file($_FILES['header_img_file']['tmp_name'],"latest.img");
		$instr = fopen("latest.img","rb");
		$image = addslashes(fread($instr,filesize("latest.img")));
		$enc_image = base64_encode($image);
	}

	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];

	$params["mode"] = $mode;														//$mode = file,url
	$params["url"] = $url;
	$params["type"] = "header";														//$type = avatar,bg,header
	$params["enc_image"] = $enc_image;
	$params["passkey"] = $passkey;

	$message = $client->call('submit_image', $params);

	if ($message["success"]=='yes') {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_template_color.php?userid=".$_GET['userid']."\"> \n";
		exit();
	}

	return $message['error_message'];
}

#########################Function CHANGE_BG_IMG##########################
function change_bg_img() {
	global $passkey;
	global $client;

	if ($_POST['bg_img_url']) {
		$mode = "url";
		$url = $_POST['bg_img_url'];
		$enc_image = "";
	} else if ($_FILES["bg_img_file"]){
		$mode = "file";
		$url = "";

		move_uploaded_file($_FILES['bg_img_file']['tmp_name'],"latest.img");
		$instr = fopen("latest.img","rb");
		$image = addslashes(fread($instr,filesize("latest.img")));
		$enc_image = base64_encode($image);
	}

	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];

	$params["mode"] = $mode;														//$mode = file,url
	$params["url"] = $url;
	$params["type"] = "bg";														//$type = avatar,bg,header
	$params["enc_image"] = $enc_image;
	$params["passkey"] = $passkey;

	$message = $client->call('submit_image', $params);

	if ($message["success"]=='yes') {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_template_color.php?userid=".$_GET['userid']."\"> \n";
		exit();
	}

	return $message['error_message'];
}

#########################Function DELETE_HEADER_IMG##########################
function delete_header_img() {
	global $passkey;
	global $client;

	$params["type"] = "header";														//$type = avatar,bg,header
	$params["user_id"] = $_COOKIE['user_id'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;

	$message = $client->call('delete_image', $params);

	if ($message["success"]=='yes') {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_template_color.php?userid=".$_GET['userid']."\">\n";
		exit();
	}

	return $message['error_message'];

}

#########################Function DELETE_BG_IMG##########################
function delete_bg_img() {
	global $passkey;
	global $client;

	$params["type"] = "bg";														//$type = avatar,bg,header
	$params["user_id"] = $_COOKIE['user_id'];
	$params["username"] = $_COOKIE['username'];
	$params["hash_password"] = $_COOKIE['password'];
	$params["passkey"] = $passkey;

	$message = $client->call('delete_image', $params);

	if ($message["success"]=='yes') {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=control_template_color.php?userid=".$_GET['userid']."\">\n";
		exit();
	}

	return $message['error_message'];

}
