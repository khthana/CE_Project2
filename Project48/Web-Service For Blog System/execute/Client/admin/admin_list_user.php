<?php
	include ("admin_header.php");

	if ($_GET['action']=='delete_user') {
		$error_msg = Call_Service_Delete_user() ;
		if ($error_msg == "") {
			$file_path="../user/".$_GET['username'];
			unlink ("../user/".$_GET['username']."/index.html");
			rmdir($file_path);

			print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=admin_list_user.php?page=".$_GET["page"]."\"> \n";
			exit();
		} #End delete entry success
	}

	#Get Header for Html
	Get_Header();

	#Get Start <body>
	if (Get_Header_End()) {

	#Username or Password Invalid
	($error_msg!="") ? print  "<div style='background-color:#FFFF99; color:#FF0000; text-align:center; font-size:14px;'>º‘¥æ≈“¥ : ".$error_msg."</div>" : ""; 

	#Main Content
	$Service_message = Call_Service_List_User();
	Get_List_User($Service_message);
	
	} #End Authentication Condition
	#Get Tailer HTML
	Get_Tailer();

############################Function Call_Service_List_User()############################
function Call_Service_List_User() {
	#Call Service for list user
	global $client;
	global $passkey;
		
	$params["user_id"] = $_SESSION['admin_id'];
	$params["username"] = $_SESSION['admin_name'];
	$params["password"] = $_SESSION['admin_password'];
	$params["page"] = $_GET['page'];
	$params["passkey"] = $passkey;

	$message = $client->call('obtain_userlist', $params);

	return $message;
}

############################Function Get_List_User()############################
function Get_List_User($message) {

	#List message form Service
	$success = $message["success"];
	$total_user = $message["total_user"];
	$total_page = $message["total_page"];
	$user_id = $message["user_id"];
	$username = $message["username"];

	if($success=='yes') {
		$EntryPerCol = count($message["user_id"])/2;
		$time = getdate();
		
		#Print First table
		print "<div class='left'>
				<table width='95%'  border='0' cellspacing='0' cellpadding='0'>
					<tr style='font-weight:bold; font-size:14px;'>
						<td width='10%' align='center'>ID</td>
						<td width='75%' align='left'>User Name</td>
						<td width='10%'>&nbsp;</td>
					</tr>
					<tr>
						<td colspan=3><hr width=\"100%\" size=\"1\" noshade></td>
					</tr>";

		for ($i=0 ; $i<$EntryPerCol ; $i++) {
			print "<tr>
						<td align='center'>".$user_id[$i]."</td>
						<td align='left'><a href='admin_show_user.php?userid=".$user_id[$i]."&month=".$time[mon]."&year=".$time[year]."&username=".$username[$i]."'>".$username[$i]."</a></td>
						<td><a href='admin_list_user.php?deluserid=".$user_id[$i]."&page=".$_GET["page"]."&username=".$username[$i]."&action=delete_user'>
								<img src=\"../images/delete.gif\" width=\"13\" height=\"14\" border=\"0\"></a></td>
					</tr>
					<tr>
						<td colspan=3><hr width=\"100%\" size=\"1\" noshade></td>
					</tr>";
		} #loop for left table
		print "</table></div>";

		#Print Second table
		print "<div class='right'>
				<table width='95%'  border='0' cellspacing='0' cellpadding='0'>
					<tr style='font-weight:bold; font-size:14px;'>
						<td width='10%' align='center'>ID</td>
						<td width='75%' align='left'>User Name</td>
						<td width='10%'>&nbsp;</td>
					</tr>
					<tr>
						<td colspan=3><hr width=\"100%\" size=\"1\" noshade></td>
					</tr>";

		for (; $i<count($message["user_id"]) ; $i++) {
			print "<tr>
						<td align='center'>".$user_id[$i]."</td>
						<td align='left'><a href='admin_show_user.php?userid=".$user_id[$i]."&month=".$time[mon]."&year=".$time[year]."&username=".$username[$i]."'>".$username[$i]."</a></td>
						<td><a href='admin_list_user.php?deluserid=".$user_id[$i]."&page=".$_GET["page"]."&username=".$username[$i]."&action=delete_user'>
								<img src=\"../images/delete.gif\" width=\"13\" height=\"14\" border=\"0\"></a></td>
					</tr>
					<tr>
						<td colspan=3><hr width=\"100%\" size=\"1\" noshade></td>
					</tr>";
		} #loop for left table
		print "</table></div>";

		#Print Summary & Page
		print "<br><div class='summary'><strong>Total User:  </strong>".$total_user."         <strong>Page : <strong>";
		$page_start = $_GET['page'] - 5;
		($page_start<=1) ? $page_start = 1 : print "<a href='admin_list_user.php?page=".($page_start-1)."'><< </a>";

		$page_end = $page_start + 11;
		($page_end >$total_page) ? $page_end = $total_page : "";
						
		for ($i=$page_start; $i<=$page_end ; $i++) {
			($i==$_GET['page']) ? print " ".$i : print "<a href='admin_list_user.php?page=".$i."'> ".$i."</a>";
		} #end summary page loop
		($page_end >= $total_page) ? "" : print "<a href='admin_list_user.php?page=".($page_end+1)."'> >></a>";
		print "</div><br>";
		
	} else {
		print "<div style='background-color:#FFFF99; color:#FF0000; text-align:center; font-size:14px;'>º‘¥æ≈“¥ : ".$message["error_message"]."</div>";
	} # End Success Service_message
}

############################Function Call_Service_Delete_User()############################
function Call_Service_Delete_User() {
	#Call Service for delete user
	global $client;
	global $passkey;
		
	$params["user_id"] = $_SESSION['admin_id'];
	$params["username"] = $_SESSION['admin_name'];
	$params["hash_password"] = $_SESSION['admin_password'];
	$params["deleted_userid"] = $_GET['deluserid'];
	$params["passkey"] = $passkey;

	$message = $client->call('delete_user', $params);
	print "succ : ".$message["success"];

	return $message["error_message"];
}
?>