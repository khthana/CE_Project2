<?
include "nusoap.php";
include "../config.inc.php";

################################ CHECK_PASSKEY ##########################################

function check_passkey($passkey){

global $db_username, $db_password;

$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$mNow = getdate();
$xNow = $mNow['year']."-".$mNow['mon']."-".$mNow['mday'];
$strSQL = "SELECT TO_DAYS('$xNow') - TO_DAYS(valid_date) AS validday_left,domain_id FROM domain WHERE domain_passkey = '$passkey'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);
$row = mysql_fetch_array($result);

if($num >0){
	if($row["validday_left"] <= 7){
		$message["success"] = "yes";
		$message["domain_id"] = $row["domain_id"];
	} else {
		$message["success"] = "no";
		$message["error_message"] = "Domain name นี้ไม่ได้ชำระเงินเกิน 7 วัน";
	}
}else{
	$message["success"] = "no";
	$message["error_message"] = "Critial Error : passkey ผิดพลาด";
} // end if num > 0

mysql_close($link);
return $message;

} // end function check_passkey

#######################################################################################

$server = new soap_server;

$server->register('service_register');
$server->register('user_register');
$server->register('user_login');
$server->register('user_authenticate');
$server->register('user_forgotpass');
$server->register('obtain_authoruserid_by_contentid');
$server->register('obtain_randomblog');
$server->register('obtain_popularblog');
$server->register('obtain_lastupdateblog');
$server->register('obtain_showcontent');
$server->register('obtain_layout');
$server->register('obtain_showblog');
$server->register('obtain_showarchive');
$server->register('obtain_showcategory');
$server->register('obtain_userprofile');
$server->register('obtain_usercss');
$server->register('obtain_image');
$server->register('obtain_userlist');
$server->register('submit_content');
$server->register('submit_category');
$server->register('submit_favourite');
$server->register('submit_link');
$server->register('submit_comment');
$server->register('submit_image');
$server->register('edit_content');
$server->register('edit_category');
$server->register('edit_favourite');
$server->register('edit_link');
$server->register('edit_userprofile');
$server->register('edit_usercss');
$server->register('delete_content');
$server->register('delete_category');
$server->register('delete_favourite');
$server->register('delete_link');
$server->register('delete_comment');
$server->register('delete_image');
$server->register('delete_user');
$server->register('search_blog');

############################## SERVICE_REGISTER #########################################

function service_register($user,$password) {

// Prevent SQL Injection
$user = addslashes($user);
$password = addslashes($password);

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM domain WHERE admin_username = '$user' AND admin_password = MD5('$password')";

$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num > 0){	// if there is domain which admin_username , admin_password match input
	$message["success"] = "yes";
	$message["passkey"] = $row["domain_passkey"];
}else{
	$message["success"] = "no";
	$message["error_message"] = "Username / Password ของ domain name ผิดพลาด";
} // end if there is domain which admin_username , admin_password match input

mysql_close($link);

return $message;

}

################################ USER_REGISTER #########################################

function user_register($username,$alias,$title,$password,$email,$passkey){

// Prevent SQL Injection
$username = addslashes($username);
$alias = addslashes($alias);
$title = addslashes($title);
$password = addslashes($password);
$email = addslashes($email);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$error_message = $recv_message["error_message"];
$domain_id = $recv_message["domain_id"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check Username
if(!eregi("^[a-z][a-z0-9\_]*[a-z0-9\_]*$",$username)) {
	$success = "no";
	$username_error_message = "อักขระของ Username ผิดพลาด (username ต้องขึ้นต้นด้วยตัวอักษร และประกอบด้วย ตัวอักษร/ตัวเลข/_ เท่านั้น)";
} // end if username is incorrect

if((strlen($username) < 3) || (strlen($username) > 20)){
	$success = "no";
	$username_error_message = "Username ต้องมีขนาด 3-20 ตัวอักษร";
} // end if username length is invalid

$strSQL = "SELECT * FROM user WHERE username = '$username'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);
if($num >0){
	$success = "no";
	$username_error_message = "Username นี้มีผู้ใช้อยู่แล้ว";
} // end if username is exist

// Check Alias Name
if($alias == ""){
	$alias = $username;
} // if user doesn't input alias name , their alias name is their username

if(strlen($alias) > 100){
	$success = "no";
	$alias_error_message = "Comment name ต้องมีขนาดไม่เกิน 100 ตัวอักษร";
} // end if alias length is invalid

// Check Blog Title
if($title == ""){
	$title = $username." Blog";
} // default title for user that doesn't input their title

if(strlen($title) > 200){
	$success = "no";
	$title_error_message = "Blog Title ต้องมีขนาดไม่เกิน 200 ตัวอักษร";
} // end if title length is invalid

// Check Password
if(!eregi("^[a-z0-9]*[a-z0-9]*$",$password)) {
	$success = "no";
	$password_error_message = "อักขระของ password ผิดพลาด (password ต้องประกอบด้วย ตัวอักษร/ตัวเลข/_ เท่านั้น)";
} // end if password is incorrect

if((strlen($password) < 5) || (strlen($password) > 20)){
	$success = "no";
	$password_error_message = "Password ต้องมีขนาด 5-20 ตัวอักษร";
} // end if password length is invalid

// Check Email
if(strlen($email) > 100){
	$success = "no";
	$email_error_message = "Email ต้องมีขนาดไม่เกิน 100 ตัวอักษร";
} // end if email length is invalid

if(!eregi("^[a-z][a-z0-9\_]*@[a-z0-9\_\-]*(\.[a-z][a-z0-9\_\-]*)+$",$email)){
	$success = "no";
	$email_error_message = "รูปแบบของ Email ผิดพลาด";
} // end if email is incorrect

if($email == ""){
	$success = "no";
	$email_error_message = "กรุณากรอก Email Address ด้วย";
}

$strSQL = "SELECT * FROM user WHERE email ='$email'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);
if($num > 0){
	$success = "no";
	$email_error_message = "Email นี้มีผู้ใช้งานแล้ว";
} // end if email is exist

// Check user number allow in domain
$strSQL = "SELECT * FROM domain WHERE domain_id = '$domain_id'";
$result = mysql_query($strSQL);
$row_domain = mysql_fetch_array($result);

$strSQL = "SELECT COUNT(*) FROM user WHERE domain_id = '$domain_id'";
$result = mysql_query($strSQL);
$row_number = mysql_fetch_array($result);

if(($row_domain["service_type"] == "limited")&&($row_domain["no_user"] <= $row_number[0])){
	$success = "no";
	$error_message = "Domain นี้มีผู้ใช้งานเต็มจำนวนที่อนุญาตแล้ว";
}

// Insert Data to DB
if($success == "yes"){				// insert into db only success is "yes"

	$mNow = getdate();
	$regis_date = $mNow['year']."-".$mNow['mon']."-".$mNow['mday'];

	$strSQL = "INSERT INTO user (user_id,username,password,alias_name,blog_title,email,regis_date,domain_id) VALUES ('','$username',MD5('$password'),'$alias','$title','$email','$regis_date','$domain_id')";
	$result = mysql_query($strSQL);

	if(!$result){
		$success = "no";
		$error_message = "Critical Error : ไม่สามารถป้อนข้อมูลลงฐานข้อมูล ได้";
	} // end if not result

	$strSQL = "SELECT user_id FROM user WHERE username = '$username'";
	$result = mysql_query($strSQL);
	$row = mysql_fetch_array($result);

	$user_id = $row["user_id"];

	$strSQL = "INSERT INTO user_css (user_id) VALUES ('$user_id')";
	$result = mysql_query($strSQL);

} // end if success = yes

if($success == "yes"){
	$message["success"] = $success;
	$message["user_id"] = $user_id;
} else {
	$message["success"] = $success;
	$message["username_error_message"] = $username_error_message;
	$message["alias_error_message"] = $alias_error_message;
	$message["title_error_message"] = $title_error_message;
	$message["password_error_message"] = $password_error_message;
	$message["email_error_message"] = $email_error_message;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function user_register

################################ USER_LOGIN ############################################

function user_login($username,$password,$passkey){

// Prevent SQL Injection
$username = addslashes($username);
$password = addslashes($password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE username = '$username' AND password = MD5('$password')";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);
$row =mysql_fetch_array($result);

if($num < 1){
	$success = "no";
	$error_message = "username หรือ password ผิดพลาด";
} else {
	$user_id = $row["user_id"];
	$strSQL = "SELECT * FROM domain WHERE domain_id = '$row[domain_id]'";
	$result = mysql_query($strSQL);
	$row = mysql_fetch_array($result);
	$url = "http://".$row["domain_name"]."/show_blog.php?userid=".$user_id;
} // end if num < 1

if($success == "yes"){
	$message["success"] = $success;
	$message["user_id"] = $user_id;
	$message["url"] = $url;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function user_login

################################ USER_AUTHENTICATE ############################################

function user_authenticate($user_id,$username,$hash_password,$passkey){

// Prevent SQL Injection
$user_id = addslashes($user_id);
$username = addslashes($username);
$password = addslashes($password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE user_id = '$user_id' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);
$row =mysql_fetch_array($result);

if($num < 1){
	$success = "no";
	$error_message = "username หรือ password ผิดพลาด";
} // end if num < 1

if($success == "yes"){
	$message["success"] = $success;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function user_authenticate

############################### USER_FORGOTPASS###########################################

function user_forgotpass($username,$email,$passkey){

// Prevent SQL Injection
$username = addslashes($username);
$email = addslashes($email);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM user WHERE username = '$username' AND email = '$email'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num < 1){ // if user and email is not belonging
	$message["success"] = "no";
	$message["error_message"] = "Username และ Email ไม่ถูกต้อง";
} else {

	settype($template, "string");
	$template = "1234567890abcdefghijklmnopqrstuvwxyz";
	for ($i = 0; $i <= 11; $i++) {
		$n = rand(0, strlen($template) - 1);
		$recovery_code .= $template[$n];
	}

	$strSQL = "DELETE FROM password_recovery WHERE user_id = '$row[user_id]'";
	$result = mysql_query($strSQL);

	$strSQL = "INSERT INTO password_recovery(user_id,recovery_code) VALUES('$row[user_id]','$recovery_code')";
	$result = mysql_query($strSQL);

	if(!$result){
		$message["success"] = "no";
		$message["error_message"] = "ไม่สามารถป้อนข้อมูลลงฐานข้อมูลได้";
	}

	$sendto = $row["email"];
	$subject = "Email สำหรับ Reset Password จาก Regisblog Service";
	$msg = "จากที่คุณได้ทำการร้องขอเพื่อ Reset Password ของคุณที่ website ในเครือ Regisblog\n กรุณา click ที่ link ด้านล่าง หรือ copy link ดังกล่าวไปเปิดใน web browser เพื่อทำการ Reset Password ต่อไป\n http://www.regisblog.com/service/resetpass.php?code=$recovery_code \n\n ขอบพระคุณที่เลือกใช้บริการ Blog จาก website ในเครือ Regisblog \n Regisblog Service";
	$headers = 'Return-Path: service@regisblog.com'."\r\n".'From: service@regisblog.com' . "\r\n" .'Reply-To: service@regisblog.com' . "\r\n".'X-Mailer: PHP/' . phpversion();

	if(!mail($sendto,$subject,$msg,$headers)){
		$strSQL = "DELETE FROM password_recovery WHERE user_id = '$row[user_id]'";
		$result = mysql_query($strSQL);

		$message["success"] = "no";
		$message["error_message"] = "ไม่สามารถส่ง Email ได้ กรุณา Reset Password ใหม่ภายหลัง";
	}

} // end if user and email is not belonging

mysql_close($link);

return $message;

} // end function user_forgotpass

########################## OBTAIN_USERID_BY_CONTENTID ######################################

function obtain_authoruserid_by_contentid($content_id,$passkey){

// Prevent SQL Injection
$content_id = addslashes($content_id);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM blog_content WHERE content_id ='$content_id'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);

if($num < 1){
	$message["error_message"] = "Content ID ผิดพลาด";
	$message["success"] = "no";
} else if(!$result){
	$message["error_message"] = "ไม่สามารถติดต่อกับ Database ได้";
	$message["success"] = "no";
} else {
	$row = mysql_fetch_array($result);
	$message["author_userid"] = $row["author_user_id"];
}

return $message;

mysql_close($link);

} // end function obtain_authoruserid_by_contentid

############################### OBTAIN_RANDOMBLOG ###########################################

function obtain_randomblog($passkey){

// Prevent SQL Injection
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Obtain Other Blog
$strSQL = "SELECT * FROM user, domain WHERE user.domain_id = domain.domain_id AND user.domain_id = '$recv_message[domain_id]' ORDER BY RAND( ) LIMIT 0 , 10";
$result = mysql_query($strSQL);
if(!$result){
	$success = "no";
	$error_message = "ไม่สามารถติดต่อกับฐานข้อมูลได้";
}else{
	$success = "yes";

	$i = -1;
	while($row = mysql_fetch_array($result)){
		$i++;
		$title[$i] = stripslashes($row["blog_title"]);
		$url[$i] = "http://".$row["domain_name"]."/show_blog.php?userid=".$row["user_id"];
	}
}

if($success == "yes"){
	$message["success"] = $success;
	$message["title"] = $title;
	$message["url"] = $url;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function obtain_randomblog

############################### OBTAIN_POPULARBLOG #########################################

function obtain_popularblog($passkey){

// Prevent SQL Injection
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check Privacy type
$strSQL = "SELECT * FROM domain WHERE domain_id = '$domain_id'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);

if($row["privacy"] == "public"){
	$strSQL = "SELECT author_user_id,blog_title,domain_name,SUM(hits) AS total_hits FROM blog_content,user,domain WHERE blog_content.author_user_id = user.user_id AND user.domain_id = domain.domain_id AND privacy='public' GROUP BY author_user_id ORDER BY total_hits DESC LIMIT 0 , 10";
}else if($row["privacy"] == "private"){
	$strSQL = "SELECT author_user_id,blog_title,domain_name,SUM(hits) AS total_hits FROM blog_content,user,domain WHERE blog_content.author_user_id = user.user_id AND user.domain_id = domain.domain_id AND user.domain_id = '$domain_id'  GROUP BY author_user_id ORDER BY total_hits DESC LIMIT 0 , 10";
}else{
	$sucess = "no";
	$error_message = "invalid privacy type";
}

$result = mysql_query($strSQL);

if(!$result){
	$success = "no";
	$error_message = "can't connect to database";
}

$i = -1;
while($row = mysql_fetch_array($result)){
	$i++;
		$title[$i] = stripslashes($row["blog_title"]);
		$url[$i] = "http://".$row["domain_name"]."/show_blog.php?userid=".$row["author_user_id"];
		$hits[$i] = $row["total_hits"];
}

if($success == "yes"){
	$message["success"] = $success;
	$message["title"] = $title;
	$message["url"] = $url;
	$message["hits"] = $hits;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function obtain_popularblog

############################ OBTAIN_LASTUPDATEBLOG #########################################

function obtain_lastupdateblog($passkey){

// Prevent SQL Injection
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$error_message = $recv_message["error_message"];
$domain_id = $recv_message["domain_id"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check Privacy type
$strSQL = "SELECT * FROM domain WHERE domain_id = '$domain_id'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);

if($row["privacy"] == "public"){
	$strSQL = "SELECT * FROM blog_content,user,domain  WHERE blog_content.author_user_id = user.user_id AND user.domain_id = domain.domain_id AND privacy='public' AND is_show='show' ORDER BY submit_year DESC , submit_month DESC , submit_day DESC , submit_time DESC LIMIT 0 , 10";
}else if($row["privacy"] == "private"){
	$strSQL = "SELECT * FROM blog_content,user,domain  WHERE blog_content.author_user_id = user.user_id AND user.domain_id = domain.domain_id AND user.domain_id = '$domain_id' AND is_show='show' ORDER BY submit_year DESC , submit_month DESC , submit_day DESC , submit_time DESC LIMIT 0 , 10";
}else{
	$sucess = "no";
	$error_message = "invalid privacy type";
}

$result = mysql_query($strSQL);

if(!$result){
	$success = "no";
	$error_message = "can't connect to database";
}

$i = -1;
while($row = mysql_fetch_array($result)){
	$i++;
		$topic[$i] = stripslashes($row["topic"]);
		$url[$i] = "http://".$row["domain_name"]."/show_content.php?contentid=".$row["content_id"];
		$submit_datetime[$i] = $row["submit_year"]."-".$row["submit_month"]."-".$row["submit_day"]." ".$row["submit_time"];
}

if($success == "yes"){
	$message["success"] = $success;
	$message["topic"] = $topic;
	$message["url"] = $url;
	$message["submit_datetime"] = $submit_datetime;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function obtain_lastupdateblog

############################ OBTAIN_SHOWCONTENT #########################################

function obtain_showcontent($userid,$username,$hash_password,$content_id,$passkey){

// Prevent SQL Injection
$userid = addslashes($userid);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$content_id = addslashes($content_id);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$error_message = $recv_message["error_message"];
$domain_id = $recv_message["domain_id"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Fetch content
$strSQL = "SELECT * FROM blog_content WHERE content_id = '$content_id'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

$strSQLauth = "SELECT * FROM user WHERE user_id = '$userid' AND username = '$username' AND password = '$hash_password'";
$resultauth = mysql_query($strSQLauth);
$numauth = mysql_num_rows($resultauth);

if(!$result){ // if can't fetch from db
	$error_message = "Critical Error : ไม่สามารถเรียกข้อมูลจาก database ได้";
	$success = "no";
} else if($num < 1){
	$error_message = "ไม่พบ Content ID นี้";
	$success = "no";
} else if(($numauth == 0)&&($userid)){
	$error_message = "ข้อมูลใน Cookie ผิดพลาด กรุณา Logout แล้ว Login อีกครั้ง";
	$success = "no";
} else if(($row["is_show"] == "hide")&&($row["author_user_id"] != $userid)){
	$error_message = "Blog Content นี้ไม่สามารถแสดงผลได้";
	$success = "no";
} else {

	// UPDATE hits
	$strSQL = "UPDATE blog_content SET hits = hits+1 WHERE content_id = '$content_id'";
	$result = mysql_query($strSQL);

	$strSQL2 = "SELECT * FROM user WHERE user_id = '$row[author_user_id]'";
	$result2 = mysql_query($strSQL2);
	$row2 = mysql_fetch_array($result2);

	if($row2["domain_id"] != $domain_id){	// if domain that try to open page is difference from author's domain
		$error_message = "Blog Content นี้เป็นของ domain อื่น";
		$success = "no";
	} else {
		$content_topic = stripslashes($row["topic"]);
		$content_message = stripslashes($row["message"]);
		$content_post_datetime = $row["submit_year"]."-".$row["submit_month"]."-".$row["submit_day"]." ".$row["submit_time"];
		$content_hits = $row["hits"];
		$is_show = $row["is_show"];
		$is_recommend = $row["is_recommend"];
		$category_id = $row["category_id"];

		$strSQL3 = "SELECT * FROM blog_comment,user,domain WHERE commentor_user_id = user_id AND user.domain_id = domain.domain_id AND content_id = '$row[content_id]' ORDER BY comment_id DESC";
		$result3 = mysql_query($strSQL3);
		$num3 = mysql_num_rows($result3);

		if(!$result3){ // if can't fetch from db
			$error_message = "Critical Error : ไม่สามารถเรียกข้อมูลจาก database ได้";
			$success = "no";
		} else {

			if($row["comment_option"] == "allow-show"){ // if this content can comment
		
				$total_comment = $num3;
				$comment_option = "allow-show";

				$i = -1;
				while($row3 = mysql_fetch_array($result3)){
					$i++;
					$comment_id[$i] = $row3["comment_id"];
					$comment[$i] = stripslashes($row3["comment"]);
					$comment_datetime[$i] = $row3["comment_datetime"];
					$commentor_name[$i] = stripslashes($row3["alias_name"]);
					$commentor_id[$i] = $row3["commentor_user_id"];
					$commentor_url[$i] = "http://".$row3["domain_name"]."/show_blog.php?userid=".$row3["commentor_user_id"];
				} // end while

			} else if($row["comment_option"] == "allow-hide"){

				$total_comment = $num3;
				$comment_option = "allow-hide";

				if($row["author_user_id"] == $userid){ // if this page is belong to the viewer

					$i = -1;
					while($row3 = mysql_fetch_array($result3)){
						$i++;
						$comment_id[$i] = $row3["comment_id"];
						$comment[$i] = stripslashes($row3["comment"]);
						$comment_datetime[$i] = $row3["comment_datetime"];
						$commentor_name[$i] = stripslashes($row3["alias_name"]);
						$commentor_id[$i] = $row3["commentor_user_id"];
						$commentor_url[$i] = "http://".$row3["domain_name"]."/show_blog.php?userid=".$row3["commentor_user_id"];
					} // end while

				} 

			} else if($row["comment_option"] == "notallow"){

				$comment_option = "notallow";

			} // end if this content can comment

		} // end if can't fetch from db

	} // end if domain that try to open page is difference from author's domain

} // end if can't fetch from db

if($success == "yes"){
	$message["success"] = $success;
	$message["content_topic"] = $content_topic;
	$message["content_message"] = $content_message;
	$message["content_post_datetime"] = $content_post_datetime;
	$message["content_hits"] = $content_hits;
	$message["is_show"] = $is_show;
	$message["is_recommend"] = $is_recommend;
	$message["category_id"] = $category_id;
	$message["total_comment"] = $total_comment;
	$message["comment_option"] = $comment_option;
	$message["comment_id"] = $comment_id;
	$message["comment"] = $comment;
	$message["comment_datetime"] = $comment_datetime;
	$message["commentor_name"] = $commentor_name;
	$message["commentor_id"] = $commentor_id;
	$message["commentor_url"] = $commentor_url;

} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function obtain_showcontent

########################## OBTAIN_SHOWARCHIVE ######################################

function obtain_showarchive($author_userid,$username,$hash_password,$month,$year,$passkey){

// Prevent SQL Injection
$author_userid = addslashes($author_userid);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$month = addslashes($month);
$year = addslashes($year);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success= $recv_message["success"];
$error_message = $recv_message["error_message"];
$domain_id = $recv_message["domain_id"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

if(($username == "") && ($password == "")){
	$user = "user";
} else {
	$strSQL = "SELECT * FROM user WHERE username = '$username' AND password = '$hash_password'";
	$result = mysql_query($strSQL);
	$num = mysql_num_rows($result);
	$row = mysql_fetch_array($result);
	if($num < 1){
		$success = "no";
		$error_message = "๊Username / Password ผิดพลาด";
	} else if($row["user_id"] == $author_userid){
		$user = "admin";
	} else {
		$user = "user";
	}
}

// Check Domain
$strSQL = "SELECT domain_id FROM user WHERE user_id = '$author_userid'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);

if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
	$success = "no";
	$error_message = "Blog นี้เป็นของ domain อื่น";
} else {

	if($user == "user"){
		$strSQL = "SELECT * FROM blog_content WHERE author_user_id = '$author_userid' AND submit_month = '$month' AND submit_year = '$year' AND is_show = 'show' ORDER BY content_id DESC";
	} else if($user == "admin"){
		$strSQL = "SELECT * FROM blog_content WHERE author_user_id = '$author_userid' AND submit_month = '$month' AND submit_year = '$year' ORDER BY content_id DESC";
	}
	$result = mysql_query($strSQL);

	if(!$result){
		$success = "no";
		$error_message = "Critical Error : ไม่สามารถเรียกข้อมูลจาก database ได้";
	} else {

		$i = -1;
		while($row = mysql_fetch_array($result)){
		$i++;
		$content_id[$i] = $row["content_id"];
		$topic[$i] = stripslashes($row["topic"]);

		} // end while

	} // end if there is no result

} // end if userid's domain is not match with domain id from passkey

if($success == "yes"){
	$message["success"] = $success;
	$message["content_id"] = $content_id;
	$message["topic"] = $topic;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function obtain_showarchive

########################## OBTAIN_SHOWCATEGORY ######################################

function obtain_showcategory($author_userid,$username,$hash_password,$category_id,$page,$passkey){

$per_page = 20;
$start = ($page-1)*$per_page;

// Prevent SQL Injection
$author_userid = addslashes($author_userid);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$category_id = addslashes($category_id);
$page = addslashes($page);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$error_message = $recv_message["error_message"];
$domain_id = $recv_message["domain_id"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

if(($username == "") && ($password == "")){
	$user = "user";
} else {
	$strSQL = "SELECT * FROM user WHERE username = '$username' AND password = '$hash_password'";
	$result = mysql_query($strSQL);
	$num = mysql_num_rows($result);
	$row = mysql_fetch_array($result);
	if($num < 1){
		$success = "no";
		$error_message = "๊Username / Password ผิดพลาด";
	} else if($row["user_id"] == $author_userid){
		$user = "admin";
	} else {
		$user = "user";
	}
}

// Check Domain
$strSQL = "SELECT domain_id FROM user WHERE user_id = '$author_userid'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);

if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
	$success = "no";
	$error_message = "Blog นี้เป็นของ domain อื่น";
} else {

	$strSQL = "SELECT * FROM blog_category WHERE category_id = '$category_id' AND category_user_id = '$author_userid'";
	$result = mysql_query($strSQL);
	$row = mysql_fetch_array($result);
	$category_name = $row["category_name"];

	if($user == "user"){
		$strSQL = "SELECT COUNT(*) FROM blog_content WHERE author_user_id = '$author_userid' AND category_id = '$category_id' AND is_show = 'show' ORDER BY content_id DESC";
	} else if($user == "admin"){
		$strSQL = "SELECT COUNT(*) FROM blog_content WHERE author_user_id = '$author_userid' AND category_id = '$category_id' ORDER BY content_id DESC";
	}
	$result = mysql_query($strSQL);
	$num = mysql_fetch_array($result);

	$total_page = ceil($num[0]/$per_page);

	if($user == "user"){
		$strSQL = "SELECT * FROM blog_content WHERE author_user_id = '$author_userid' AND category_id = '$category_id' AND is_show = 'show' ORDER BY content_id DESC LIMIT $start,$per_page";
	} else if($user == "admin"){
		$strSQL = "SELECT * FROM blog_content WHERE author_user_id = '$author_userid' AND category_id = '$category_id' ORDER BY content_id DESC LIMIT $start,$per_page";
	}
	$result = mysql_query($strSQL);

	if(!$result){
		$success = "no";
		$error_message = "Critical Error : ไม่สามารถเรียกข้อมูลจาก database ได้";
	} else {

		$i = -1;
		while($row = mysql_fetch_array($result)){
		$i++;
		$content_id[$i] = $row["content_id"];
		$topic[$i] = stripslashes($row["topic"]);

		} // end while

	} // end if there is no result

} // end if userid's domain is not match with domain id from passkey

if($success == "yes"){
	$message["success"] = $success;
	$message["category_name"] = $category_name;
	$message["total_page"] = $total_page;
	$message["content_id"] = $content_id;
	$message["topic"] = $topic;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function obtain_showcategory

########################## OBTAIN_SHOWBLOG ######################################

function obtain_showblog($author_userid,$username,$hash_password,$passkey){

// Prevent SQL Injection
$author_userid = addslashes($author_userid);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$error_message = $recv_message["error_message"];
$domain_id = $recv_message["domain_id"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

if(($username == "") && ($password == "")){
	$user = "user";
} else {
	$strSQL = "SELECT * FROM user WHERE username = '$username' AND password = '$hash_password'";
	$result = mysql_query($strSQL);
	$num = mysql_num_rows($result);
	$row = mysql_fetch_array($result);
	if($num < 1){
		$success = "no";
		$error_message = "๊Username / Password ผิดพลาด";
	} else if($row["user_id"] == $author_userid){
		$user = "admin";
	} else {
		$user = "user";
	}
}

$strSQL = "SELECT * FROM user WHERE user_id = '$author_userid'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);
$row_template = mysql_fetch_array($result);

if($num < 1){
	$success = "no";
	$error_message = "ไม่พบ User ID นี้";
} else if($row_template["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
	$success = "no";
	$error_message = "Blog นี้เป็นของ domain อื่น";
} else {

	$per_page = $row_template["topic_per_page"];

	if($user == "user"){
		$strSQL = "SELECT * FROM blog_content WHERE author_user_id = '$author_userid' AND is_show = 'show' ORDER BY content_id DESC LIMIT 0,$per_page";
	} else if($user == "admin"){
		$strSQL = "SELECT * FROM blog_content WHERE author_user_id = '$author_userid' ORDER BY content_id DESC LIMIT 0,$per_page";
	}

	$result = mysql_query($strSQL);
	$num = mysql_num_rows($result);

	$i = -1;
	while($row = mysql_fetch_array($result)){
		$i++;
		$content_id[$i] = $row["content_id"];
		$topic[$i] = stripslashes($row["topic"]);
		$msg[$i] = stripslashes($row["message"]);
		$submit_datetime[$i] = $row["submit_year"]."-".$row["submit_month"]."-".$row["submit_day"]." ".$row["submit_time"];

		$strSQL2 = "SELECT COUNT(*) FROM blog_comment WHERE content_id = '$row[content_id]'";
		$result2 = mysql_query($strSQL2);
		$num2 = mysql_fetch_array($result2);
		$total_comment[$i] = $num2[0];
		$hits[$i] = $row["hits"];

	} // end while

} // end if userid's domain is not match with domain id from passkey

if($success == "yes"){
	$message["success"] = $success;
	$message["content_id"] = $content_id;
	$message["topic"] = $topic;
	$message["message"] = $msg;
	$message["submit_datetime"] = $submit_datetime;
	$message["total_comment"] = $total_comment;
	$message["hits"] = $hits;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function obtain_showblog

############################ OBTAIN_LAYOUT #########################################

function obtain_layout($author_userid,$passkey){

// Prevent SQL Injection
$author_userid = addslashes($author_userid);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM user WHERE user_id = '$author_userid'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);
$row = mysql_fetch_array($result);

if($num < 1){
	$success = "no";
	$error_message = "User ID ผิดพลาด";
} else if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
	$success = "no";
	$error_message = "Blog นี้เป็นของ domain อื่น";
} else {

	if(!$result){
		$error_message = "Critical Error : ไม่สามารถติดต่อกับ Database ได้";
		$success = "no";
	} else {
		$layout = $row["layout"];
		$item_seq = explode(",",$row["item_seq"]);
		$blog_title = stripslashes($row["blog_title"]);

	// Profile Menu
		
		$profile_name = stripslashes($row["alias_name"]);

	// Archive Menu

		$strSQL = "SELECT submit_year,submit_month FROM blog_content WHERE author_user_id ='$author_userid' GROUP BY submit_year, submit_month ORDER BY submit_year DESC , submit_month DESC";
		$result = mysql_query($strSQL);
		
		
		$i=-1;
		while($row = mysql_fetch_array($result)){
			$i++;
			$archive_month[$i] = $row["submit_month"];
			$archive_year[$i] = $row["submit_year"];
		} // end while
		
	// Category Menu

		$strSQL = "SELECT * FROM blog_category WHERE category_user_id = '$author_userid' ORDER BY category_name";
		$result = mysql_query($strSQL);
		
		$i = -1;
		while($row =mysql_fetch_array($result)){
			$i++;
			$category_id[$i] = $row["category_id"];
			$category_name[$i] = $row["category_name"];
		} // end while

	// Last Update Menu

		$strSQL = "SELECT * FROM blog_content WHERE author_user_id = '$author_userid' AND is_show='show' ORDER BY submit_year DESC, submit_month DESC, submit_day DESC, submit_time DESC LIMIT 0,5";
		$result = mysql_query($strSQL);

		$i = -1;
		while($row = mysql_fetch_array($result)){
			$i++;
			$lastupdate_content_id[$i] = $row["content_id"];
			$lastupdate_content_topic[$i] = stripslashes($row["topic"]);
		} // end while

	// Recommend Menu

		$strSQL = "SELECT * FROM blog_content WHERE author_user_id = '$author_userid' AND is_recommend = 'yes' AND is_show = 'show' ORDER BY submit_year DESC, submit_month DESC, submit_day DESC, submit_time DESC LIMIT 0,10";
		$result = mysql_query($strSQL);

		$i = -1;
		while($row = mysql_fetch_array($result)){
			$i++;
			$recommend_content_id[$i] = $row["content_id"];
			$recommend_content_topic[$i] = stripslashes($row["topic"]);
		} // end while

	// Links Menu
		
		$strSQL = "SELECT * FROM links WHERE user_id = '$author_userid'";
		$result = mysql_query($strSQL);

		$i = -1;
		while($row = mysql_fetch_array($result)){
			$i++;
			$links_url[$i] = "http://".$row["url"];
			$links_name[$i] = stripslashes($row["name"]);
		} // end while

	// Favourite Menu

		$strSQL = "SELECT * FROM favourite,user,domain WHERE fav_user_id = user.user_id AND user.domain_id = domain.domain_id AND favourite.user_id = '$author_userid'";
		$result = mysql_query($strSQL);

		$i = -1;
		while($row = mysql_fetch_array($result)){
			$i++;
			$favourite_content_url[$i] = "http://".$row["domain_name"]."/show_blog.php?userid=".$row["fav_user_id"];
			$favourite_user_id[$i] = $row["fav_user_id"];
			$favourite_content_blog_title[$i] = stripslashes($row["blog_title"]);
		} // end while

	} // end if result

} // end if userid's domain is not match with domain id from passkey

if($success == "yes"){
	$message["success"] = $success;
	$message["layout"] = $layout;
	$message["item_seq"] = $item_seq;
	$message["blog_title"] = $blog_title;
	$message["profile_name"] = $profile_name;
	$message["archive_month"] = $archive_month;
	$message["archive_year"] = $archive_year;
	$message["category_id"] = $category_id;
	$message["category_name"] = $category_name;
	$message["lastupdate_content_id"] = $lastupdate_content_id;
	$message["lastupdate_content_topic"] = $lastupdate_content_topic;
	$message["recommend_content_id"] = $recommend_content_id;
	$message["recommend_content_topic"] = $recommend_content_topic;
	$message["links_url"] = $links_url;
	$message["links_name"] = $links_name;
	$message["favourite_content_url"] = $favourite_content_url;
	$message["favourite_user_id"] = $favourite_user_id;
	$message["favourite_content_blog_title"] = $favourite_content_blog_title;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function obtain_layout

############################### OBTAIN_USERPROFILE ############################################

function obtain_userprofile($user_id,$username,$hash_password,$passkey){

// Prevent SQL Injection
$user_id = addslashes($user_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;

$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE user_id = '$user_id' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num < 1){ // if user is invalid
	$success = "no";
	$error_message = "Username/Password ผิดพลาด";
} else if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
	$success = "no";
	$error_message = "Blog นี้เป็นของ Domain อื่น";
} else {
	$alias_name = stripslashes($row["alias_name"]);
	$blog_title = stripslashes($row["blog_title"]);
	$email = $row["email"];
	$layout = $row["layout"];
	$item_seq = explode(",",$row["item_seq"]);
	$topic_per_page = $row["topic_per_page"];
} // end if user is invalid

if($success == "no"){
	$message["success"] = $success;
	$message["error_message"] = $error_message;
} else {
	$message["success" ] = $success;
	$message["alias_name"] = $alias_name;
	$message["blog_title"] = $blog_title;
	$message["email"] = $email;
	$message["layout"] = $layout;
	$message["item_seq"] = $item_seq;
	$message["topic_per_page"] = $topic_per_page;
} // end if success = no

mysql_close($link);

return $message;

} // end function obtain_userprofile

############################### OBTAIN_USERCSS ############################################

function obtain_usercss($user_id,$passkey){

// Prevent SQL Injection
$user_id = addslashes($user_id);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM user WHERE user_id = '$user_id'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);
$row = mysql_fetch_array($result);

if($num < 1){
	$success = "no";
	$error_message = "User ID ผิดพลาด";
} else if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
	$success = "no";
	$error_message = "Blog นี้เป็นของ Domain อื่น";
} else {

	$strSQL = "SELECT * FROM user_css WHERE user_id = '$user_id'";
	$result = mysql_query($strSQL);
	$row = mysql_fetch_array($result);

	$body_bg_color = $row["body_bg_color"];
	$body_bg_image = $row["body_bg_image"];
	$body_border_style = $row["body_border_style"];
	$body_border_color = $row["body_border_color"];
	$header_bg_color = $row["header_bg_color"];
	$header_bg_image = $row["header_bg_image"];
	$header_font_color = $row["header_font_color"];
	$status_bg_color = $row["status_bg_color"];
	$status_font_color = $row["status_font_color"];
	$item_bg_color = $row["item_bg_color"];
	$item_topic_bg_color = $row["item_topic_bg_color"];
	$item_topic_font_color = $row["item_topic_font_color"];
	$item_link_color = $row["item_link_color"];
	$item_link_hover = $row["item_link_hover"];
	$content_bg_color = $row["content_bg_color"];
	$content_comment_font_color = $row["content_comment_font_color"];
	$content_blog_color = $row["content_blog_color"];
	$content_comment_bg_color = $row["content_comment_bg_color"];
	$comment_font_color = $row["comment_font_color"];
	$comment_bg_color = $row["comment_bg_color"];
	$comment_topic_font_color = $row["comment_topic_font_color"];
	$comment_topic_bg_color = $row["comment_topic_bg_color"];

}

if($success == "no"){
	$message["success"] = $success;
	$message["error_message"] = $error_message;
} else {
	$message["success" ] = $success;
	$message["body_bg_color"] = $body_bg_color;
	$message["body_bg_image"] = $body_bg_image;
	$message["body_border_style"] = $body_border_style;
	$message["body_border_color"] = $body_border_color;
	$message["header_bg_color"] = $header_bg_color;
	$message["header_bg_image"] = $header_bg_image;
	$message["header_font_color"] = $header_font_color;
	$message["status_bg_color"] = $status_bg_color;
	$message["status_font_color"] = $status_font_color;
	$message["item_bg_color"] = $item_bg_color;
	$message["item_topic_bg_color"] = $item_topic_bg_color;
	$message["item_topic_font_color"] = $item_topic_font_color;
	$message["item_link_color"] = $item_link_color;
	$message["item_link_hover"] = $item_link_hover;
	$message["content_bg_color"] = $content_bg_color;
	$message["content_comment_font_color"] = $content_comment_font_color;
	$message["content_blog_color"] = $content_blog_color;
	$message["content_comment_bg_color"] = $content_comment_bg_color;
	$message["comment_font_color"] = $comment_font_color;
	$message["comment_bg_color"] = $comment_bg_color;
	$message["comment_topic_font_color"] = $comment_topic_font_color;
	$message["comment_topic_bg_color"] = $comment_topic_bg_color;
} // end if success = no

mysql_close($link);

return $message;

} // end function obtain_usercss

############################### OBTAIN_IMAGE ############################################

function obtain_image($user_id,$type,$passkey){

// Prevent SQL Injection
$user_id = addslashes($user_id);
$type = addslashes($type);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

if($type == "avatar"){

	$strSQL = "SELECT user_avatar FROM user WHERE user_id = '$user_id'";
	$result = mysql_query($strSQL);
	$row = mysql_fetch_array($result);

	if($row["user_avatar"] == "no"){
		$success = "no";
		$error_message = "user นี้ไม่มี avatar";
	} else if($row["user_avatar"] == "url"){
		
		$strSQL = "SELECT image_url FROM user_image_url WHERE user_id = '$user_id' AND image_type = 'avatar'";
		$result = mysql_query($strSQL);
		$row = mysql_fetch_array($result);
		$mode = "url";
		$url = "http://".$row["image_url"];

	} else if($row["user_avatar"] == "file"){

		$strSQL = "SELECT image_file FROM user_image_file WHERE user_id = '$user_id' AND image_type = 'avatar'";
		$result = mysql_query($strSQL);
		$row = mysql_fetch_array($result);
		$mode = "file";
		$enc_image = base64_encode($row[0]);
	}

} else if($type == "bg"){

	$strSQL = "SELECT body_bg_image FROM user_css WHERE user_id = '$user_id'";
	$result = mysql_query($strSQL);
	$row = mysql_fetch_array($result);

	if($row["body_bg_image"] == "no"){
		$success = "no";
		$error_message = "user นี้ไม่มีรูป background";
	} else if($row["body_bg_image"] == "url"){
		
		$strSQL = "SELECT image_url FROM user_image_url WHERE user_id = '$user_id' AND image_type = 'bg'";
		$result = mysql_query($strSQL);
		$row = mysql_fetch_array($result);
		$mode = "url";
		$url = "http://".$row["image_url"];

	} else if($row["body_bg_image"] == "file"){

		$strSQL = "SELECT image_file FROM user_image_file WHERE user_id = '$user_id' AND image_type = 'bg'";
		$result = mysql_query($strSQL);
		$row = mysql_fetch_array($result);
		$mode = "file";
		$enc_image = base64_encode($row[0]);
	}

} else if($type == "header"){

	$strSQL = "SELECT header_bg_image FROM user_css WHERE user_id = '$user_id'";
	$result = mysql_query($strSQL);
	$row = mysql_fetch_array($result);

	if($row["header_bg_image"] == "no"){
		$success = "no";
		$error_message = "user นี้ไม่มีรูป header";
	} else if($row["header_bg_image"] == "url"){
		
		$strSQL = "SELECT image_url FROM user_image_url WHERE user_id = '$user_id' AND image_type = 'header'";
		$result = mysql_query($strSQL);
		$row = mysql_fetch_array($result);
		$mode = "url";
		$url = "http://".$row["image_url"];

	} else if($row["header_bg_image"] == "file"){

		$strSQL = "SELECT image_file FROM user_image_file WHERE user_id = '$user_id' AND image_type = 'header'";
		$result = mysql_query($strSQL);
		$row = mysql_fetch_array($result);
		$mode = "file";
		$enc_image = base64_encode($row[0]);
	}

} else {
	$success = "no";
	$error_message = "type ผิดพลาด";
} // end if type

if($success == "yes"){
	$message["success"] = $success;
	$message["mode"] = $mode;
	$message["url"] = $url;
	$message["enc_image"] = $enc_image;
} else {
	$message["success" ] = $success;
	$message["error_message"] = $error_message;
} // end if success = no

mysql_close($link);

return $message;

} // end function obtain_image

############################### OBTAIN_USERLIST ############################################

function obtain_userlist($user_id,$username,$hash_password,$page,$passkey){

$per_page = 100;
$start = ($page-1)*$per_page;

// Prevent SQL Injection
$user_id = addslashes($user_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$page = addslashes($page);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE user_id = '$user_id' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);
$row = mysql_fetch_array($result);

if($num < 1){
	$success = "no";
	$error_message = "Username / Password ผิดพลาด";
} else {

	// Check Domain
	if($row["domain_id"] != $domain_id){
		$success = "no";
		$error_message = "Blog นี้เป็นของ Domain อื่น";
	} else {

		$strSQL = "SELECT * FROM user WHERE domain_id = '$domain_id' ORDER BY user_id";
		$result = mysql_query($strSQL);
		$total_user = mysql_num_rows($result);
		$total_page = ceil($total_user/$per_page);

		$strSQL = "SELECT * FROM user WHERE domain_id = '$domain_id' ORDER BY user_id LIMIT $start,$per_page";
		$result = mysql_query($strSQL);
		$i = -1;
		while($row = mysql_fetch_array($result)){
			$i++;
			$array_user_id[$i] = $row["user_id"];
			$array_username[$i] = $row["username"];
		}

	}

} // end if num < 1

if($success == "yes"){
	$message["success"] = $success;
	$message["total_user"] = $total_user;
	$message["total_page"] = $total_page;
	$message["user_id"] = $array_user_id;
	$message["username"] = $array_username;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function obtain_userlist

############################### SUBMIT_COMMENT ############################################

function submit_comment($content_id,$comment,$ip,$username,$hash_password,$passkey){

// Prevent SQL Injection
$content_id = addslashes($content_id);
$comment = addslashes($comment);
$ip = addslashes($ip);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check Domain
$strSQL = "SELECT domain_id FROM blog_content,user WHERE blog_content.author_user_id = user.user_id AND blog_content.content_id = '$content_id'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);

if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
	$message["success"] = "no";
	$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
} else {

	// Check User
	$strSQL = "SELECT * FROM user WHERE username = '$username' AND password = '$hash_password'";
	$result = mysql_query($strSQL);
	$num = mysql_num_rows($result);

	if($num < 1){ // if user incorrect
		$message["success"] = "no";
		$message["error_message"] = "Username / Password ผิดพลาด";
	} else {

		$strSQL2 = "SELECT * FROM blog_content WHERE content_id = '$content_id'";
		$result2 = mysql_query($strSQL2);
		$row2 = mysql_fetch_array($result2);

		if($row2["comment_option"] == "notallow"){ // if this content can't comment

			$message["success"] = "no";
			$message["error_message"] = "Content นี้ไม่อนุญาตให้มีการ comment";

		} else {

			$row = mysql_fetch_array($result);

			$strSQL2 = "SELECT MAX(comment_id) FROM blog_comment WHERE content_id = '$content_id'";
			$result2 = mysql_query($strSQL2);
			$row2 = mysql_fetch_array($result2);
			$row2[0]++;

			$mNow = getdate();
			$xNow = $mNow['year']."-".$mNow['mon']."-".$mNow['mday']." ".$mNow['hours'].":".$mNow['minutes'].":".$mNow['seconds'];
		
			$strSQL = "INSERT INTO blog_comment (content_id,comment_id,comment,comment_datetime,commentor_ip,commentor_user_id) VALUES ('$content_id','$row2[0]','$comment','$xNow','$ip','$row[user_id]')";
			$result = mysql_query($strSQL);
		
			if(!$result){ // if data can't insert into db

				$message["error_message"] = "Critical Error : Can't Insert data into db";
				$message["success"] = "no";

			} // end if data can't insert into db

		} // if this content can't comment

	} // end if user incorrect

} // end if userid's domain is not match with domain id from passkey

mysql_close($link);

return $message;

} // end function submit_comment

############################### SUBMIT_CONTENT ############################################

function submit_content($topic,$msg,$category_id,$ip,$is_show,$is_recommend,$comment_option,$username,$hash_password,$passkey){

// Prevent SQL Injection

$topic = addslashes($topic);
$msg = addslashes($msg);
$category_id = addslashes($category_id);
$ip = addslashes($ip);
$is_show = addslashes($is_show);
$is_recommend = addslashes($is_recommend);
$comment_option = addslashes($comment_option);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM user WHERE username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

	if($num > 0){ // if user is valid

		// Check Domain
		if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
			$message["success"] = "no";
			$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
		} else {

			$mNow = getdate();
			$day = $mNow['mday'];
			$month = $mNow['mon'];
			$year = $mNow['year'];
			$time = $mNow['hours'].":".$mNow['minutes'].":".$mNow['seconds'];

			$strSQL = "INSERT INTO blog_content (topic,message,category_id,submit_day,submit_month,submit_year,submit_time,author_ip,is_show,is_recommend,comment_option,author_user_id) VALUES ('$topic','$msg','$category_id','$day','$month','$year','$time','$ip','$is_show','$is_recommend','$comment_option','$row[user_id]')";
			$result = mysql_query($strSQL);

			if(!$result){
				$message["success"] = "no";
				$message["error_message"] = "Critical Error : ไม่สามารถป้อนข้อมูลลงฐานข้อมูลได้";
			}

		} // end if userid's domain is not match with domain id from passkey

	} else {

		$message["success"] = "no";
		$message["error_message"] = "Username / Password ผิดพลาด";

	} // end if user is valid

mysql_close($link);

return $message;

} // end function submit_content

############################### SUBMIT_CATEGORY ############################################

function submit_category($category_name,$username,$hash_password,$passkey){

// Prevent SQL Injection
$author_userid = addslashes($author_userid);
$category_name = addslashes($category_name);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

	if($num < 1){ // if user incorrect
		$message["error_message"] = "Username / Password ผิดพลาด";
		$message["success"] = "no";
	} else {
		
		// Check Domain
		if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
			$message["success"] = "no";
			$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
		} else {

			$strSQL2 = "SELECT MAX(category_id) FROM blog_category WHERE category_user_id = '$row[user_id]'";
			$result2 = mysql_query($strSQL2);
			$row2 = mysql_fetch_array($result2);

			$num = $row2[0]+1;

			$strSQL = "INSERT INTO blog_category(category_id,category_user_id,category_name) VALUES('$num','$row[user_id]','$category_name')";
			$result = mysql_query($strSQL);
			
			if(!$result){ // if data can't insert into db

				$message["error_message"] = "Critical Error : Can't Insert data into db";
				$message["success"] = "no";

			} // end if data can't insert into db

		} // end if userid's domain is not match with domain id from passkey

	} // end if user incorrect

mysql_close($link);

return $message;

} // end function submit_category

############################### SUBMIT_FAVOURITE ############################################

function submit_favourite($favourite_userid,$username,$hash_password,$passkey){

// Prevent SQL Injection
$favourite_userid = addslashes($favourite_userid);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

	if($num < 1){ // if user incorrect
		$message["error_message"] = "Username / Password ผิดพลาด";
		$message["success"] = "no";
	} else {

			// Check Favourite userid
			$strSQL = "SELECT * FROM user WHERE user_id = '$favourite_userid'";
			$result = mysql_query($strSQL);
			$num = mysql_num_rows($result);

			if($num > 0){ // if num > 0

				$strSQL = "INSERT INTO favourite(user_id,fav_user_id) VALUES('$row[user_id]','$favourite_userid')";
				$result = mysql_query($strSQL);

				if(!$result){ // if data can't insert into db
					$message["error_message"] = "Critical Error : Can't Insert data into db";
					$message["success"] = "no";
				} // end if data can't insert into db

			} else {
				$message["success"] = "no";
				$message["error_message"] = "Userid ที่ต้องการใส่เป็น favourite id ไม่ถูกต้อง";
			} // end if num > 0
		
	} // end if user incorrect

mysql_close($link);

return $message;

} // end function submit_favourite

############################### SUBMIT_LINK ############################################

function submit_link($link_url,$link_name,$username,$hash_password,$passkey){

// Prevent SQL Injection
$link_url = addslashes($link_url);
$link_name = addslashes($link_name);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

	if($num < 1){ // if user incorrect
		$message["error_message"] = "Username / Password ผิดพลาด";
		$message["success"] = "no";
	} else {

		// Check Domain
		if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
			$message["success"] = "no";
			$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
		} else {

			$strSQL = "INSERT INTO links(user_id,name,url) VALUES('$row[user_id]','$link_name','$link_url')";
			$result = mysql_query($strSQL);
			
			if(!$result){ // if data can't insert into db
				$message["error_message"] = "Critical Error : Can't Insert data into db";
				$message["success"] = "no";
			} // end if data can't insert into db

		} // end if userid's domain is not match with domain id from passkey

	} // end if user incorrect

mysql_close($link);

return $message;

} // end function submit_link

############################### SUBMIT_IMAGE ############################################

function submit_image($username,$hash_password,$mode,$url,$type,$enc_image,$passkey){

// Prevent SQL Injection
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$mode = addslashes($mode);
$url = addslashes($url);
$type = addslashes($type);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

	if($num < 1){ // if user incorrect
		$success = "no";
		$error_message = "Username / Password ผิดพลาด";
	} else {

		// Check Domain
		if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
			$success = "no";
			$error_message = "Blog นี้เป็นของ domain อื่น";
		} else {

			$dec_image = base64_decode($enc_image);

			$size = strlen($dec_image);
			if((($size < 30720)&&($type == "avatar"))||(($size < 61440)&&(($type == "bg")||($type == "header")))){

				$strSQL = "DELETE FROM user_image_url WHERE user_id = '$row[user_id]' AND image_type = '$type'";
				$result = mysql_query($strSQL);

				$strSQL = "DELETE FROM user_image_file WHERE user_id = '$row[user_id]' AND image_type = '$type'";
				$result = mysql_query($strSQL);

				if($mode == "file"){
					$strSQL = "INSERT INTO user_image_file(user_id,image_type,image_file) VALUES ('$row[user_id]','$type','$dec_image')";
					$result = mysql_query($strSQL);
				} else if($mode == "url"){
					$strSQL = "INSERT INTO user_image_url(user_id,image_type,image_url) VALUES ('$row[user_id]','$type','$url')";
					$result = mysql_query($strSQL);
				}

				if($type == "avatar"){
					$strSQL2 = "UPDATE user SET user_avatar = '$mode' WHERE user_id = '$row[user_id]'";
					$result2 = mysql_query($strSQL2);
				} else if($type == "bg"){
					$strSQL2 = "UPDATE user_css SET body_bg_image = '$mode' WHERE user_id = '$row[user_id]'";
					$result2 = mysql_query($strSQL2);
				} else if($type == "header"){
					$strSQL2 = "UPDATE user_css SET header_bg_image = '$mode' WHERE user_id = '$row[user_id]'";
					$result2 = mysql_query($strSQL2);
				}

				if((!$result)||(!$result2)){
					$success = "no";
					$error_message = "ไม่สามารถป้อนข้อมูลลงฐานข้อมูลได้";
				} // end if no result

			} else {
				$success = "no";
				$error_message = "File Size ใหญ่เกินไป";
			}

		} // end if userid's domain is not match with domain id from passkey

	} // end if user incorrect

if($success == "yes"){
	$message["success"] = $success;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
} // end if success = no

mysql_close($link);

return $message;

} // end function submit_image

############################### EDIT_CONTENT ############################################

function edit_content($author_userid,$content_id,$topic,$msg,$category_id,$ip,$is_show,$is_recommend,$comment_option,$username,$hash_password,$passkey){

// Prevent SQL Injection
$author_userid = addslashes($author_userid);
$content_id = addslashes($content_id);
$topic = addslashes($topic);
$msg = addslashes($msg);
$category_id = addslashes($category_id);
$ip = addslashes($ip);
$is_show = addslashes($is_show);
$is_recommend = addslashes($is_recommend);
$comment_option = addslashes($comment_option);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE user_id = '$author_userid' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num < 1){ // if user incorrect
	$message["error_message"] = "Username / Password ผิดพลาด";
	$message["success"] = "no";
} else {

	// Check Domain
	if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		$strSQL = "UPDATE blog_content SET topic = '$topic', message = '$msg' , category_id = '$category_id' , author_ip = '$ip' , is_show = '$is_show' , is_recommend = '$is_recommend' , comment_option = '$comment_option' , author_user_id = '$author_userid' WHERE content_id = '$content_id'";
		$result = mysql_query($strSQL);
		
		if(!$result){ // if data can't edit
			$message["error_message"] = "Critical Error : Can't Edit data into db";
			$message["success"] = "no";
		} // end if data can't insert into db

	} // end // if userid's domain is not match with domain id from passkey

} // end if user incorrect

mysql_close($link);

return $message;

} // end function edit_content

############################### EDIT_CATEGORY ############################################

function edit_category($author_userid,$category_id,$category_name,$username,$hash_password,$passkey){

// Prevent SQL Injection
$author_userid = addslashes($author_userid);
$category_id = addslashes($category_id);
$category_name = addslashes($category_name);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE user_id = '$author_userid' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($strSQL);
$num = mysql_num_rows($result);

if($num < 1){ // if user incorrect
	$message["error_message"] = "Username / Password ผิดพลาด";
	$message["success"] = "no";
} else {

	// Check Domain
	if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		$strSQL = "UPDATE blog_category SET category_name = '$category_name' WHERE category_id = '$category_id' AND category_user_id = '$author_userid'";
		$result = mysql_query($strSQL);
		
		if(!$result){ // if data can't insert into db
			$message["error_message"] = "Critical Error : Can't Insert data into db";
			$message["success"] = "no";
		} // end if data can't insert into db

	} // end if userid's domain is not match with domain id from passkey

} // end if user incorrect

mysql_close($link);

return $message;

} // end function edit_category

############################### EDIT_FAVOURITE ############################################

function edit_favourite($new_favourite_userid,$old_favourite_userid,$user_id,$username,$hash_password,$passkey){

// Prevent SQL Injection
$new_favourite_userid = addslashes($new_favourite_userid);
$old_favourite_userid = addslashes($old_favourite_userid);
$user_id = addslashes($user_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User

$strSQL = "SELECT * FROM user WHERE user_id = '$user_id' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);

if($num < 1){ // if user incorrect
	$message["error_message"] = "Username / Password ผิดพลาด";
	$message["success"] = "no";
} else {

	// Check Domain
	if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		// Check Favourite userid
		$strSQL = "SELECT * FROM user WHERE user_id = '$new_favourite_userid'";
		$result = mysql_query($strSQL);
		$row = mysql_fetch_array($result);
		$num = mysql_num_rows($result);

		if($num > 0){ // if num > 0

			$strSQL = "UPDATE favourite SET fav_user_id = '$new_favourite_userid' WHERE user_id = '$user_id' AND fav_user_id = '$old_favourite_userid'";
			$result = mysql_query($strSQL);
			
			if(!$result){ // if data can't insert into db
				$message["success"] = "no";
				$message["error_message"] = "Critical Error : Can't Insert data into db";
			} // end if data can't insert into db

		} else {
			$message["success"] = "no";
			$message["error_message"] = "Userid ที่ต้องการใส่เป็น favourite id ไม่ถูกต้อง";
		} // end if num > 0

	} // end if userid's domain is not match with domain id from passkey

} // end if user incorrect

mysql_close($link);

return $message;

} // end function edit_favourite

############################### EDIT_LINK ############################################

function edit_link($new_link_name,$new_link_url,$old_link_name,$user_id,$username,$hash_password,$passkey){

// Prevent SQL Injection
$new_link_name = addslashes($new_link_name);
$new_link_url = addslashes($new_link_url);
$old_link_name = addslashes($old_link_name);
$user_id = addslashes($user_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE user_id = '$user_id' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num < 1){ // if user incorrect
	$message["error_message"] = "Username / Password ผิดพลาด";
	$message["success"] = "no";
} else {

	// Check Domain
	if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		$strSQL = "UPDATE links SET name = '$new_link_name', url = '$new_link_url' WHERE user_id = '$user_id' AND name = '$old_link_name'";
		$result = mysql_query($strSQL);
		
		if(!$result){ // if data can't insert into db
			$message["error_message"] = "Critical Error : Can't Insert data into db";
			$message["success"] = "no";
		} // end if data can't insert into db

	} // end if userid's domain is not match with domain id from passkey

} // end if user incorrect

mysql_close($link);

return $message;

} // end function edit_link

############################### EDIT_USERPROFILE ############################################

function edit_userprofile($user_id,$username,$hash_password,$newpassword,$alias_name,$blog_title,$email,$layout,$item_seq,$topic_per_page,$passkey){

// Prevent SQL Injection
$user_id = addslashes($user_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$newpassword = addslashes($newpassword);
$alias_name = addslashes($alias_name);
$blog_title = addslashes($blog_title);
$email = addslashes($email);
$layout = addslashes($layout);
$topic_per_page = addslashes($topic_per_page);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success= $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE user_id = '$user_id' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num < 1){ // if user is invalid
	$success = "no";
	$error_message = "Username/Password ผิดพลาด";
} else {

	// Check Domain
	if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		// Check Alias
		if(strlen($alias) > 100){
			$success = "no";
			$alias_error_message = "Comment name ต้องมีขนาดไม่เกิน 100 ตัวอักษร";
		} // end if alias length is invalid

		// Check title
		if(strlen($title) > 200){
			$success = "no";
			$title_error_message = "Blog Title ต้องมีขนาดไม่เกิน 200 ตัวอักษร";
		} // end if title length is invalid

		// Check password
		if($newpassword != ""){

			if(!eregi("^[a-z][a-z0-9\_]*[a-z0-9\_]*$",$newpassword)) {
				$success = "no";
				$password_error_message = "อักขระของ password ผิดพลาด (password ต้องประกอบด้วย ตัวอักษร/ตัวเลข/_ เท่านั้น)";
			} // end if password is incorrect

			if((strlen($newpassword) < 5) || (strlen($newpassword) > 20)){
				$success = "no";
				$password_error_message = "Password ต้องมีขนาด 5-20 ตัวอักษร";
			} // end if password length is invalid

		}

		// Check Email
		if($email != ""){

			if(strlen($email) > 100){
				$success = "no";
				$email_error_message = "Email ต้องมีขนาดไม่เกิน 100 ตัวอักษร";
			} // end if email length is invalid

			if(!eregi("^[a-z][a-z0-9\_]*@[a-z0-9\_\-]*(\.[a-z][a-z0-9\_\-]*)+$",$email)){
				$success = "no";
				$email_error_message = "รูปแบบของ Email ผิดพลาด";
			} // end if email is incorrect

			$strSQL2 = "SELECT * FROM user WHERE email ='$email' AND user_id <> '$user_id' ";
			$result2 = mysql_query($strSQL2);
			$num2 = mysql_num_rows($result2);
			if($num2 > 0){
				$success = "no";
				$email_error_message = "Email นี้มีผู้ใช้งานแล้ว";
			} // end if email is exist

		}

		if($success == "yes"){

			$strSQL = "UPDATE user SET ";

			if($newpassword != ""){
				$strSQL = $strSQL."password = MD5('$newpassword') ";
			}

			if($alias_name != ""){
				if(strlen($strSQL) > 16) {
					$strSQL = $strSQL.",";
				}
				$strSQL = $strSQL."alias_name = '$alias_name' ";
			}

			if($blog_title != ""){
				if(strlen($strSQL) > 16) {
					$strSQL = $strSQL.", ";
				}
				$strSQL = $strSQL."blog_title = '$blog_title' ";
			}

			if($email != ""){
				if(strlen($strSQL) > 16) {
					$strSQL = $strSQL.", ";
				}
				$strSQL = $strSQL."email = '$email' ";
			}

			if($layout != ""){
				if(strlen($strSQL) > 16) {
					$strSQL = $strSQL.", ";
				}
				$strSQL = $strSQL."layout = '$layout' ";
			}

			if($item_seq != ""){
				if(strlen($strSQL) > 16) {
					$strSQL = $strSQL.", ";
				}
				$combine_item_seq = implode(",",$item_seq);
				$combine_item_seq = addslashes($combine_item_seq);
				$strSQL = $strSQL."item_seq = '$combine_item_seq' ";
			}

			if($topic_per_page != ""){
				if(strlen($strSQL) > 16) {
					$strSQL = $strSQL.", ";
				}
				$strSQL = $strSQL."topic_per_page = '$topic_per_page' ";
			}

			$strSQL = $strSQL."WHERE user_id = '$user_id' ";
			$result = mysql_query($strSQL);

			if(!$result){
				$success = "no";
				$error_message = "Critical Error : ไม่สามารถป้อนข้อมูลลงฐานข้อมูลได้";
			}

		} // end if success = yes

	} // end if userid's domain is not match with domain id from passkey

} // end if user is invalid

if($success == "yes"){
	$message["success"] = $success;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
	$message["password_error_message"] = $password_error_message;
	$message["title_error_message"] = $title_error_message;
	$message["alias_error_message"] = $alias_error_message;
	$message["email_error_message"] = $email_error_message;
} // end if success = yes

mysql_close($link);

return $message;

} // end function edit_userprofile

############################### EDIT_USERCSS ############################################

function edit_usercss($user_id,$username,$hash_password,$body_bg_color,$body_border_style,$body_border_color,$header_bg_color,$header_font_color,$status_bg_color,$status_font_color,$item_bg_color,$item_topic_bg_color,$item_topic_font_color,$item_link_color,$item_link_hover,$content_bg_color,$content_comment_font_color,$content_blog_color,$content_comment_bg_color,$comment_font_color,$comment_bg_color,$comment_topic_font_color,$comment_topic_bg_color,$passkey){

// Prevent SQL Injection
$user_id = addslashes($user_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$body_bg_color = addslashes($body_bg_color);
$body_border_style = addslashes($body_border_style);
$body_border_color = addslashes($body_border_color);
$header_bg_color = addslashes($header_bg_color);
$header_font_color = addslashes($header_font_color);
$status_bg_color = addslashes($status_bg_color);
$status_font_color = addslashes($status_font_color);
$item_bg_color = addslashes($item_bg_color);
$item_topic_bg_color = addslashes($item_topic_bg_color);
$item_topic_font_color = addslashes($item_topic_font_color);
$item_link_color = addslashes($item_link_color);
$item_link_hover = addslashes($item_link_hover);
$content_bg_color = addslashes($content_bg_color);
$content_comment_font_color = addslashes($content_comment_font_color);
$content_blog_color = addslashes($content_blog_color);
$content_comment_bg_color = addslashes($content_comment_bg_color);
$comment_font_color = addslashes($comment_font_color);
$comment_bg_color = addslashes($comment_bg_color);
$comment_topic_font_color = addslashes($comment_topic_font_color);
$comment_topic_bg_color = addslashes($comment_topic_bg_color);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE user_id = '$user_id' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num < 1){ // if user is invalid
	$success = "no";
	$error_message = "Username/Password ผิดพลาด";
} else {

	// Check Domain
	if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		$strSQL = "UPDATE user_css SET ";

		$temp = array("body_bg_color","body_border_style","body_border_color","header_bg_color","header_font_color","status_bg_color","status_font_color","item_bg_color","item_topic_bg_color","item_topic_font_color","item_link_color","item_link_hover","content_bg_color","content_comment_font_color","content_blog_color","content_comment_bg_color","comment_font_color","comment_bg_color","comment_topic_font_color","comment_topic_bg_color");

		for($i=0;$i<sizeof($temp);$i++){

			if(${$temp[$i]} != ""){
				
				if(strlen($strSQL) > 20){
					$strSQL = $strSQL.", ";
				}

				$strSQL = $strSQL.$temp[$i]." = '".${$temp[$i]}."' ";

			} // end if not null

		} // end for i

		$strSQL = $strSQL."WHERE user_id = '$user_id' ";
		$result = mysql_query($strSQL);

		if(!$result){
			$success = "no";
			$error_message = "Critical Error : ไม่สามารถป้อนข้อมูลลงฐานข้อมูลได้";
		}

	} // end if userid's domain is not match with domain id from passkey

} // end if user is invalid

if($success == "no"){
	$message["success"] = $success;
	$message["error_message"] = $error_message;
} else if($success == "yes"){
	$message["success"] = $success;
} // end if success = no

mysql_close($link);

return $message;

} // end function edit_usercss

############################### DELETE_CONTENT ############################################

function delete_content($author_userid,$content_id,$username,$hash_password,$passkey){

// Prevent SQL Injection
$author_userid = addslashes($author_userid);
$content_id = addslashes($content_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM user WHERE user_id = '$author_userid' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

$strSQL2 = "SELECT * FROM domain WHERE domain_id = '$domain_id'";
$result2 = mysql_query($strSQL2);
$row2 = mysql_fetch_array($result2);

$strSQL2 = "SELECT * FROM user WHERE user_id = '$row2[admin_user_id]' AND username = '$username' AND password = '$hash_password'";
$result2 = mysql_query($strSQL2);
$num2 = mysql_num_rows($result2);

$num = $num + $num2;

if($num > 0){ // if user is valid

	// Check Domain
	if(($row["domain_id"] != $domain_id) && ($row2["domain_id"] != $domain_id)){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		$strSQL = "DELETE FROM blog_content WHERE content_id = '$content_id' AND author_user_id = '$author_userid'";
		$result = mysql_query($strSQL);

		if(!$result){ // if data can't delete from db

			$message["success"] = "no";
			$message["error_message"] = "Critical Error : ไม่สามารถลบข้อมูลจากฐานข้อมูลได้";

		} else {

			$strSQL = "DELETE FROM blog_comment WHERE content_id = '$content_id'";
			$result = mysql_query($strSQL);
		
		} // end if data can't delete from db

	} // end if userid's domain is not match with domain id from passkey

} else {
	$message["success"] = "no";
	$message["error_message"] = "Username / Password ผิดพลาด";
} // end if user is valid

mysql_close($link);

return $message;

} // end function delete_content

############################### DELETE_CATEGORY ############################################

function delete_category($author_userid,$category_id,$username,$hash_password,$passkey){

// Prevent SQL Injection
$author_userid = addslashes($author_userid);
$category_id = addslashes($category_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM user WHERE user_id = '$author_userid' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num > 0){ // if user is valid

	if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		$strSQL = "UPDATE blog_content SET category_id = '0' WHERE author_user_id = '$author_userid' AND category_id = '$category_id'";
		$result = mysql_query($strSQL);

		$strSQL = "DELETE FROM blog_category WHERE category_id = '$category_id' AND category_user_id = '$author_userid'";
		$result = mysql_query($strSQL);

		if(!$result){ // if data can't delete from db

			$message["success"] = "no";
			$message["error_message"] = "Critical Error : ไม่สามารถลบข้อมูลจากฐานข้อมูลได้";

		} // end if data can't delete from db

	} // end if userid's domain is not match with domain id from passkey

} else {
	$message["success"] = "no";
	$message["error_message"] = "Username / Password ผิดพลาด";
} // end if user is valid

mysql_close($link);

return $message;

} // end function delete_content

############################### DELETE_FAVOURITE ############################################

function delete_favourite($favourite_userid,$user_id,$username,$hash_password,$passkey){

// Prevent SQL Injection
$favourite_id = addslashes($favourite_id);
$user_id = addslashes($user_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM user WHERE user_id = '$user_id' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num > 0){ // if user is valid

	if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		$strSQL = "DELETE FROM favourite WHERE user_id = '$user_id' AND fav_user_id = '$favourite_userid'";
		$result = mysql_query($strSQL);

		if(!$result){ // if data can't delete from db

			$message["success"] = "no";
			$message["error_message"] = "Critical Error : ไม่สามารถลบข้อมูลจากฐานข้อมูลได้";

		} // end if data can't delete from db

	} // end if userid's domain is not match with domain id from passkey

} else {
	$message["success"] = "no";
	$message["error_message"] = "Username / Password ผิดพลาด";
} // end if user is valid

mysql_close($link);

return $message;

} // end function delete_favourite

############################### DELETE_LINK ############################################

function delete_link($link_name,$link_url,$user_id,$username,$hash_password,$passkey){

// Prevent SQL Injection
$link_name = addslashes($link_name);
$link_url = addslashes($link_url);
$user_id = addslashes($user_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM user WHERE user_id = '$user_id' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num > 0){ // if user is valid

	if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		$strSQL = "DELETE FROM links WHERE user_id = '$user_id' AND name = '$link_name' AND url = '$link_url'";
		$result = mysql_query($strSQL);

		if(!$result){ // if data can't delete from db
			$message["success"] = "no";
			$message["error_message"] = "Critical Error : ไม่สามารถลบข้อมูลจากฐานข้อมูลได้";
		} // end if data can't delete from db

	} // end if userid's domain is not match with domain id from passkey

} else {
	$message["success"] = "no";
	$message["error_message"] = "Username / Password ผิดพลาด";
} // end if user is valid

mysql_close($link);

return $message;

} // end function delete_link

############################### DELETE_COMMENT ############################################

function delete_comment($author_userid,$content_id,$comment_id,$username,$hash_password,$passkey){

// Prevent SQL Injection
$author_userid = addslashes($author_userid);
$content_id = addslashes($content_id);
$comment_id = addslashes($comment_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM user WHERE user_id = '$author_userid' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

$strSQL2 = "SELECT * FROM domain WHERE domain_id = '$domain_id'";
$result2 = mysql_query($strSQL2);
$row2 = mysql_fetch_array($result2);

$strSQL2 = "SELECT * FROM user WHERE user_id = '$row2[admin_user_id]' AND username = '$username' AND password = '$hash_password'";
$result2 = mysql_query($strSQL2);
$num2 = mysql_num_rows($result2);

$num = $num + $num2;

if($num > 0){ // if user is valid

	if(($row["domain_id"] != $domain_id)&&($row2["domain_id"] != $domain_id)){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		$strSQL = "SELECT * FROM blog_comment,blog_content WHERE blog_comment.content_id = blog_content.content_id AND comment_id = '$comment_id' AND blog_comment.content_id = '$content_id' AND author_user_id = '$author_userid'";
		$result = mysql_query($strSQL);

		if(!$result){ // if author_userid is belong to comment's content
			$message["success"] = "no";
			$message["error_message"] = "UserID ผิดพลาด";
		} else {

			$strSQL = "DELETE FROM blog_comment WHERE comment_id = '$comment_id' AND content_id = '$content_id'";
			$result = mysql_query($strSQL);

			if(!$result){ // if can't fetch data from db
				$message["success"] = "no";
				$message["error_message"] = "Critical Error : ไม่สามารถลบข้อมูลจากฐานข้อมูลได้";
			}

		} // end if author_userid is belong to comment's content

	} // end if userid's domain is not match with domain id from passkey

} else {
	$message["success"] = "no";
	$message["error_message"] = "Username / Password ผิดพลาด";
} // end if user is valid

mysql_close($link);

return $message;

} // end function delete_content

############################### DELETE_IMAGE ############################################

function delete_image($type,$user_id,$username,$hash_password,$passkey){

// Prevent SQL Injection
$type = addslashes($type);
$user_id = addslashes($user_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$message["success"] = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$message["error_message"] = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT * FROM user WHERE user_id = '$user_id' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num > 0){ // if user is valid

	if($row["domain_id"] != $domain_id){ // if userid's domain is not match with domain id from passkey
		$message["success"] = "no";
		$message["error_message"] = "Blog นี้เป็นของ domain อื่น";
	} else {

		$strSQL = "DELETE FROM user_image_file WHERE user_id = '$user_id' AND image_type = '$type'";
		$result = mysql_query($strSQL);

		$strSQL = "DELETE FROM user_image_url WHERE user_id = '$user_id' AND image_type ='$type'";
		$result = mysql_query($strSQL);

		if($type == "avatar"){
			$strSQL = "UPDATE user SET user_avatar = 'no' WHERE user_id = '$user_id'";
			$result = mysql_query($strSQL);
		} else if($type == "bg"){
			$strSQL = "UPDATE user_css SET body_bg_image = 'no' WHERE user_id = '$user_id'";
			$result = mysql_query($strSQL);
		} else if($type == "header"){
			$strSQL = "UPDATE user_css SET header_bg_image = 'no' WHERE user_id = '$user_id'";
			$result = mysql_query($strSQL);
		} else {
			$message["success"] = "no";
			$message["error_message"] = "type ผิดพลาด";
		}

		if(!$result){ // if data can't delete from db
			$message["success"] = "no";
			$message["error_message"] = "Critical Error : ไม่สามารถลบข้อมูลจากฐานข้อมูลได้";
		} // end if data can't delete from db

	} // end if userid's domain is not match with domain id from passkey

} else {
	$message["success"] = "no";
	$message["error_message"] = "Username / Password ผิดพลาด";
} // end if user is valid

mysql_close($link);

return $message;

} // end function delete_favourite

############################### DELETE_USER ############################################

function delete_user($user_id,$username,$hash_password,$deleted_userid,$passkey){

// Prevent SQL Injection
$user_id = addslashes($user_id);
$username = addslashes($username);
$hash_password = addslashes($hash_password);
$deleted_userid = addslashes($deleted_userid);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

// Check User
$strSQL = "SELECT * FROM user WHERE user_id = '$user_id' AND username = '$username' AND password = '$hash_password'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);
$row = mysql_fetch_array($result);

if($num < 1){
	$success = "no";
	$error_message = "Username / Password ผิดพลาด";
} else {
	$strSQL2 = "SELECT * FROM domain WHERE domain_id = '$domain_id'";
	$result2 = mysql_query($strSQL2);
	$row2 = mysql_fetch_array($result2);
	if($row2["admin_user_id"] != $row["user_id"]){
		$success = "no";
		$error_message = "ไม่สามารถลบ User ได้ เนื่องจากผู้ลบไม่ใช่ Admin";
	} else {
		$strSQL = "DELETE FROM user WHERE user_id = '$deleted_userid'"; 
		$result = mysql_query($strSQL);
		
		$strSQL = "DELETE FROM user_css WHERE user_id = '$deleted_userid'"; 
		$result = mysql_query($strSQL);
		
		$strSQL = "DELETE FROM blog_category WHERE category_user_id = '$deleted_userid'"; 
		$result = mysql_query($strSQL);
		
		$strSQL = "DELETE FROM blog_comment WHERE commentor_user_id = '$deleted_userid'"; 
		$result = mysql_query($strSQL);
		
		$strSQL = "DELETE FROM blog_content WHERE author_user_id = '$deleted_userid'"; 
		$result = mysql_query($strSQL);
		
		$strSQL = "DELETE FROM favourite WHERE user_id = '$deleted_userid' OR fav_user_id = '$deleted_userid'"; 
		$result = mysql_query($strSQL);
		
		$strSQL = "DELETE FROM links WHERE user_id = '$deleted_userid'"; 
		$result = mysql_query($strSQL);
		
		$strSQL = "DELETE FROM password_recovery WHERE user_id = '$deleted_userid'"; 
		$result = mysql_query($strSQL);
		
		$strSQL = "DELETE FROM user_image_file WHERE user_id = '$deleted_userid'"; 
		$result = mysql_query($strSQL);
		
		$strSQL =  "DELETE FROM user_image_url WHERE user_id = '$deleted_userid'";
		$result = mysql_query($strSQL);

	}
} // end if num < 1

if($success == "yes"){
	$message["success"] = $success;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function delete_user

############################### SEARCH_BLOG ############################################

function search_blog($keyword,$page,$scope,$option,$passkey){

$per_page = 20;
$start = ($page-1)*$per_page;

// Prevent SQL Injection
$keyword = addslashes($keyword);
$page = addslashes($page);
$scope = addslashes($scope);
$passkey = addslashes($passkey);

// Check Passkey
$recv_message = check_passkey($passkey);
$success = $recv_message["success"];
$domain_id = $recv_message["domain_id"];
$error_message = $recv_message["error_message"];

global $db_username, $db_password;
$link = mysql_connect("localhost",$db_username,$db_password);
mysql_select_db("regisblog",$link);

$strSQL = "SELECT DISTINCT blog_content.content_id FROM blog_content LEFT JOIN blog_comment ON blog_content.content_id = blog_comment.content_id WHERE (";
if($option["topic"] == "yes"){
	$strSQL = $strSQL."(topic LIKE '%$keyword%')";
	$ext = "yes";
}

if($option["message"] == "yes"){
	if($ext == "yes"){
		$strSQL = $strSQL." OR ";
	}
	$strSQL = $strSQL."(message LIKE '%$keyword%')";
}

if($option["comment"] == "yes"){
	if($ext == "yes"){
		$strSQL = $strSQL." OR ";
	}
	$strSQL = $strSQL."(comment LIKE '%$keyword%')";
}

$strSQL = $strSQL.") ORDER BY blog_content.content_id";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);

if($num > 0){

	while ($row = mysql_fetch_array($result)){
		$id_list = $id_list.$row["content_id"].",";
	}
		$id_list = substr($id_list,0,strlen($id_list)-1);

	if($scope == "local"){
		$strSQL = "SELECT * FROM blog_content, user, domain WHERE blog_content.author_user_id = user.user_id AND user.domain_id = domain.domain_id AND blog_content.content_id IN ( $id_list ) AND domain.domain_id = '$domain_id'";
	} else if($scope == "global"){
		$strSQL = "SELECT * FROM blog_content, user, domain WHERE blog_content.author_user_id = user.user_id AND user.domain_id = domain.domain_id AND blog_content.content_id IN ( $id_list ) AND domain.privacy = 'public'";
	}
	$result = mysql_query($strSQL);
	$num = mysql_num_rows($result);
	$total_page = ceil($num/$per_page);

	$strSQL = $strSQL." LIMIT $start,$per_page";
	$result = mysql_query($strSQL);

		$i=-1;
	while($row = mysql_fetch_array($result)){
		$i++;
		$url[$i] = "http://".$row["domain_name"]."/show_content.php?contentid=".$row["content_id"];
		$topic[$i] = stripslashes($row["topic"]);
		$submit_datetime[$i] = $row["submit_year"]."-".$row["submit_month"]."-".$row["submit_day"]." ".$row["submit_time"];
	}

} else {
	$total_page = 0;
}

if($success == "yes"){
	$message["success"] = $success;
	$message["url"] = $url;
	$message["topic"] = $topic;
	$message["submit_datetime"] = $submit_datetime;
	$message["total_page"] = $total_page;
} else {
	$message["success"] = $success;
	$message["error_message"] = $error_message;
}

mysql_close($link);

return $message;

} // end function search_blog

###########################################################################################

$HTTP_RAW_POST_DATA = isset($HTTP_RAW_POST_DATA) ? $HTTP_RAW_POST_DATA : '';
$server->service($HTTP_RAW_POST_DATA);

?>