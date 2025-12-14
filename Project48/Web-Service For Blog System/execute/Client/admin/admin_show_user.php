<?php
	include ("admin_header.php");

	if ($_GET['action']=='delete_entry'){
		$error_msg = Call_Service_Delete_Entry();
		if (error_msg == "") {
			$time = getdate();
			print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=admin_show_user.php?userid=".$_GET["userid"]."&month=".$time[mon]."&year=".$time[year]."\"> \n";
			exit();
		} #End delete entry success
	} #End Action Condition 

	#Get Header for Html
	Get_Header();

	#Java Script for Drop-Down List
	print "
			<script language=\"JavaScript\" type=\"text/JavaScript\">
			function selectArchive(dateobj) {
				var arc_date_int = dateobj.selectedIndex;
				var arc_date = dateobj.options[arc_date_int].value;
				var posspace = arc_date%2000;
				if (posspace) {
					arc_year = posspace+2000 ;
					arc_month = (arc_date - arc_year)/10000 ;
					var url_fin = '?userid=".$_GET[userid]."&month='+arc_month+'&year='+arc_year;
					window.location.href= 'admin_show_user.php'+url_fin;
				} else {
					alert('กรุณาเลือกให้ถูกต้อง');
				}
			}
			</script>";

	#Get Start <body>
	if (Get_Header_End()) {

	#Username or Password Invalid
	($error_msg) ? print "<div style='background-color:#FFFF99; color:#FF0000; text-align:center; font-size:14px;'>ผิดพลาด : ".$error_msg."</div>" : ""; 

	#Main Content
	$Service_message = Call_Service_User_Detail();
	Get_User_Detail($Service_message);

	} #End Authentication Condition
	#Get Tailer HTML
	Get_Tailer();

############################Function Call_Service_User_Detail()############################
function Call_Service_User_Detail() {
	#Call Service for list user
	global $client;
	global $passkey;
			
	$params["author_userid"] = $_GET['userid'];
	$params["username"] = $_SESSION['admin_name'];
	$params["hash_password"] = $_SESSION['admin_password'];
	$params["month"] = $_GET['month'];
	$params["year"] = $_GET['year'];
	$params["passkey"] = $passkey;
			
	#Call service check
	$message = $client->call('obtain_showarchive', $params);

//	$success = $message_archive["success"];
//	$error_msg = $message_archive["error_message"];
//
//	$edit_blog_contentid = $message_archive["content_id"];
//	$edit_blog_topic = $message_archive["topic"];

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

############################Function Get_User_Detail()############################
function Get_User_Detail($message) {
	if($message["success"]=='yes') {
		$EntryPerCol = count($message["content_id"])/2;
		$month_name = array("","มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");
		$month_year = $month_name[$_GET[month]]." ".$_GET[year];
		
		#header content
		print 	"<div class=\"topic\">รายการ Entry : ".$_GET['username']." ในช่วงเดือน ".$month_year." </div>";

		#Print First table
		print "<div class='left'>
				<table width='95%'  border='0' cellspacing='0' cellpadding='0'>
					<tr style='font-weight:bold; font-size:14px;'>
						<td width='85%' align='left'>Topic</td>
						<td width='10%'>&nbsp;</td>
					</tr>
					<tr>
						<td colspan=3><hr width=\"100%\" size=\"1\" noshade></td>
					</tr>";

		for ($i=0 ; $i<$EntryPerCol ; $i++) {
			print "<tr>
						<td align='left'><a href='admin_user_content.php?contentid=".$message["content_id"][$i]."&userid=".$_GET['userid']."'>".$message["topic"][$i]."</a></td>
						<td><a href='admin_show_user.php?contentid=".$message["content_id"][$i]."&userid=".$_GET['userid']."&action=delete_entry&month=".$_GET[month]."&year=".$_GET[year]."'>
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
						<td width='85%' align='left'>Topic</td>
						<td width='10%'>&nbsp;</td>
					</tr>
					<tr>
						<td colspan=3><hr width=\"100%\" size=\"1\" noshade></td>
					</tr>";

		for (; $i<count($message["content_id"]) ; $i++) {
			print "<tr>
						<td align='left'><a href='admin_user_content.php?contentid=".$message["content_id"][$i]."&userid=".$_GET['userid']."'>".$message["topic"][$i]."</a></td>
						<td><a href='admin_show_user.php?contentid=".$message["content_id"][$i]."&userid=".$_GET['userid']."&action=delete_entry&month=".$_GET[month]."&year=".$_GET[year]."'>
								<img src=\"../images/delete.gif\" width=\"13\" height=\"14\" border=\"0\"></a></td>
					</tr>
					<tr>
						<td colspan=3><hr width=\"100%\" size=\"1\" noshade></td>
					</tr>";
		} #loop for left table
		print "</table></div>";

		#Print Summary & Page
		print "<br><div class='summary'>
				<form name=\"archive_user_form\" method=\"post\" action=\"\" style=\"margin:0px;\" >
					<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" >
					<tr align=\"right\" valign=\"middle\">
						<td width=\"15%\">&nbsp;</td>
						<td width=\"80%\"><strong>Month & Year</strong>";
		
		$archive_message = get_layout($_GET[userid]);
		$list_month = $archive_message["archive_month"];
		$list_year = $archive_message["archive_year"];
		$i = 0;
		
		#Drop down list month
		print "<select name=\"archive_date_select\" size=\"1\"  style=\"width:150px;\" OnChange=\"selectArchive(this)\">
				 <option value=\"none\">select month and year</option>";

		while ($list_month[$i]) {
			print  "<option value=\"".$list_month[$i].$list_year[$i]."\">".$month_name[$list_month[$i]]." ".$list_year[$i]."</option>";
			$i++;
		}
		($i==0) ? print "<option value=\"none\">none</option>\" >":"";
		
		print "		</select></td>
					</tr>
				</table></form></div><br>";
		
	} else {
		print "<div style='background-color:#FFFF99; color:#FF0000; text-align:center; font-size:14px;'>ผิดพลาด : ".$message["error_message"]."</div>";
	} # End Success Service_message
}

?>