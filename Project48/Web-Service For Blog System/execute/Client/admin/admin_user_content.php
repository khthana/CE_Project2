<?php
	include ("admin_header.php");

	if($_GET['action']=='delete_comment') {
		$error_msg = Call_Service_Delete_Comment();
		if ($error_msg == "") {
			$time = getdate();
			print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=admin_user_content.php?userid=".$_GET["userid"]."&username=".$_GET['username']."&contentid=".$_GET['contentid']."\"> \n";
			exit();
		} #End delete entry success
	} #End action delete comment condition
	else if ($_GET['action']=='delete_entry'){
		$error_msg = Call_Service_Delete_Entry();
		if ($error_msg == "") {
			$time = getdate();
			print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=admin_show_user.php?userid=".$_GET["userid"]."&username=".$_GET['username']."&month=".$time[mon]."&year=".$time[year]."\"> \n";
			exit();
		} #End delete entry success
	} #End Action Condition
	
	#Get Header for Html
	Get_Header();

	#JavaScript for change color
	print "<script language=\"javascript\" type=\"text/javascript\">
			function Background(hexNumber)
				 { document.bgColor=hexNumber }
			</script>";
	
	#Get Start <body>
	if (Get_Header_End()) {
	
	#Username or Password Invalid
	($error_msg) ? print "<div style='background-color:#FFFF99; color:#FF0000; text-align:center; font-size:14px;'>¼Ô´¾ÅÒ´ : ".$error_msg."</div>" : ""; 

	#Main Content
	$Service_message = Call_Service_Entry_Detail();
	Get_Entry_Detail($Service_message);

	} #End Authentication Condition
	#Get Tailer HTML
	Get_Tailer();

############################Function Call_Service_Entry_Detail()############################
function Call_Service_Entry_Detail() {
	#Call Service for list user
	global $passkey;
	global $client;

	$params["userid"] = $_SESSION['admin_id'];
	$params["username"] = $_SESSION['admin_name'];
	$params["hash_password"] = $_SESSION['admin_password'];
	$params["content_id"] = $_GET['contentid'];
	$params["passkey"] = $passkey;
		
	#Call service check
	$message = $client->call('obtain_showcontent', $params);

	
	return $message;
}

############################Function Call_Service_Delete_Entry()############################
function Call_Service_Delete_Entry() {
	global $client;
	global $passkey;

	$params["author_userid"] = $_GET['userid'];	
	$params["content_id"] = $_GET['contentid'];
	$params["username"] = $_SESSION['admin_name'];
	$params["hash_password"] = $_SESSION['admin_password'];
	$params["passkey"] = $passkey;
			
	#Call service check
	$message_del = $client->call('delete_content', $params);
	return $error_msg = $message_del["error_message"];
}

############################Function Call_Service_Delete_Comment()############################
function Call_Service_Delete_Comment() {
	global $client;
	global $passkey;

	$params["author_userid"] = $_GET['userid'];
	$params["content_id"] = $_GET['contentid'];
	$params["comment_id"] = $_GET['commentid'];
	$params["username"] = $_SESSION['admin_name'];
	$params["hash_password"] = $_SESSION['admin_password'];
	$params["passkey"] = $passkey;
			
	#Call service check
	$message_del = $client->call('delete_comment', $params);
	return $error_msg = $message_del["error_message"];
}

############################Function Get_Entry_Detail()############################
function Get_Entry_Detail($message) {
	if($message["success"]=='yes') {

		#List Message Return
		$content_topic = $message["content_topic"];
		$content = str_replace("&amp;", "&", str_replace("&gt;", ">", str_replace("&lt;", "<", stripslashes($message["content_message"]))));
		$content_post = $message["content_post_datetime"];
		$content_hit = $message["content_hits"];
		$comment_id = $message["comment_id"];
		$comment_content = $message["comment"];
		$comment_time = $message["comment_datetime"];
		$comment_url = $message["commentor_url"];
		$comment_total = $message["total_comment"] ;
		$comment_commenter = $message["commentor_name"];

		#Print Content
		print 	"
		<form name='ContentForm' method='post' action='' style='margin:0px;'>
		<table width='95%'  border='0' cellspacing='0' cellpadding='0'>
			<tr style='background-color:#CCCCCC; padding:3px;'>
				<td colspan='2'  align='left' ><strong>&nbsp;&nbsp;&nbsp;".$content_topic."</strong></td>
				<td align='right'>
					<a href='admin_user_content.php?contentid=".$_GET['contentid']."&username=".$_GET['username']."&userid=".$_GET['userid']."&action=delete_entry'>
					<img src='../images/delete.gif' width='13' height='14' border='0'></a>
					<select  name='Bgcolor' onChange=\"Background(this.form.Bgcolor.options[this.form.Bgcolor.selectedIndex].value)\">
						 <option selectED value='#000000'>Black
						 <option value='#FFFFFF'>White
						 <option value='#0000FF'>Blue
						 <option value='#FF0000'>Red
						 <option value='#00FF00'>Green
						 <option value='#FFD700'>Gold
						 <option value='#696969'>Grey
						 <option value='#000080'>Navy
						 <option value='#461E50'>Purple
						 <option value='#B0C4DE'>Light blue
						 <option value='#FF8C00'>Orange
						 <option value='#FFFF00'>Yellow
						 <option value='#69A920'>Olive
						 <option value='#505050'>Dark grey
						 <option value='#A052FF'>Purple
						 <option value='#DCDCDC'>Light grey
						 <option value='#2BBC2B'>Emerald Green
					</select>
				</td>
			</tr>
			<tr>
				<td width='10%'>&nbsp;</td>
				<td width='60%'>".$content."</td>
				<td width='30%'>&nbsp;</td>
			 </tr>
		</table>
		</form>";

		#Print Summary
		($comment_total =="") ? $comment_total = "0" : "";
		print 	"<div class='ending'>Post : ".convert_time($content_post)." (¨Ó¹Ç¹¼ÙéªÁ : ".$content_hit." | Comment ".$comment_total." )<br></div>";
		$i =0;

		#Print Comment
		while ($comment_id[$i]) {
			$comment_content[$i] = nl2br(convert_comment($comment_content[$i]));
			print 	"<div class=\"comment\">
						<div class=\"comment\">".$comment_content[$i]."</div><br>
						<div class=\"comment_topic\"><strong>By :</strong>
						<a class=\"comment_topic\" href = \"".$comment_url[$i]."\">".$comment_commenter [$i]."</a>  at ".convert_time($comment_time[$i])."
						<a class=\"comment_topic\" href =\"admin_user_content.php?contentid=".$_GET['contentid']."&username=".$_GET['username']."&userid=".$_GET['userid']."&commentid=".$comment_id[$i]."&action=delete_comment\">
									<img src=\"../images/delete.gif\" width=\"13\" height=\"14\" border=\"0\"></a>";
			print 		" </div></div>";
			$i++;
		}

	} else {
		print "<div style='background-color:#FFFF99; color:#FF0000; text-align:center; font-size:14px;'>¼Ô´¾ÅÒ´ : ".$message["error_message"]."</div>";
	} # End Success Service_message
}

#########################Function CONVERT_COMMENT##########################
function convert_comment($comment) {
	$comment = htmlspecialchars($comment);
	$comment = str_replace(":)","<img src=\"../images/smile_1.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	$comment = str_replace(";(","<img src=\"../images/smile_2.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	$comment = str_replace("T-T","<img src=\"../images/smile_3.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	$comment = str_replace(";)","<img src=\"../images/smile_4.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	$comment = str_replace(":(","<img src=\"../images/smile_5.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	$comment = str_replace(":D","<img src=\"../images/smile_6.gif\" width=22\" height=\"22\"  border=\"0\">",$comment);
	return $comment;
}

?>