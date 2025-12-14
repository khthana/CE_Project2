<?php
	session_start();
	include "domain_conf.php";

	if ($_GET['tsearch']!="") {
		$service_message = Get_Search_Service();
	} else { 
		$service_message['error_message'] = "No result";
	}

	#Get HTML Header
	Get_Domain_Header();
	Get_Domain_Header_End();

	print "<center><body>
			<div class='header'><img src='images/domain_header.jpg' width='770' height='110'></div>";
	
	#Get Menu Tab
	Get_Menu();

	#Get Search Content
	print "<div class='content'>
			 <div class='topic'>Search Result </div><br>";
	
	($service_message['error_message']) ? print $service_message['error_message'] : Get_Search_Content($service_message);

	print "</div>";

	print "<div><img src='images/domain_tailer.jpg'></div>
			</body></center>
			</html>";

###############################Function Get_Search_Content###############################
function Get_Search_content($message) {

	$content_url = $message["url"];
	$topic = $message["topic"];
	$submit = $message["submit_datetime"];
	$totalpage = $message["total_page"];
	$i = 0;

	print "<div style='text-align:left;'><table width='95%'  border='0' cellspacing='0' cellpadding='0'>
			  <tr style='font-weight:bolder; font-size:14px; align='center'>
				<td width='67%'>Topic</td>
				<td width='17%'>Time</td>
			  </tr> 
			  <tr>
				<td colspan='2'><hr width='100%' size='1' noshade color='#333333'></td>
			  </tr>";

	#Each Search Content
	while ($content_url[$i]) {
		print "
			  <tr>
				<td> <a href='".$content_url[$i]."'>".$topic[$i]."</a> </td>
				<td align='center'> ".convert_time($submit[$i])."</td>
			  </tr>
			  <tr>
				<td colspan='2'><hr width='100%' size='1' noshade color='#003366'></td>
			  </tr>";
		$i++;
	}

	#print End table;
	print "</table></div><br>";

	if ($i == "0") { print "No Result"; } else {
	
	#print page index
	$url_get = "&tsearch=".$_GET['tsearch']."&scoperadio=".$_GET['scoperadio']."&checkmsg=".$_GET['checkmsg']."&checkcomment=".$_GET['checkcomment']."";
	print "<div class='page'>page : ";
	for ($i=1; $i<=$totalpage; $i++) {
		($i == $_GET[page]) ? print " ".$i : print " <a href='search.php?page=".$i.$url_get."'>".$i."</a>";
	}
	print "</div>";
	
	}
}

###############################Function Get_Search_Servicer###############################
function Get_Search_Service() {
	global $client;
	global $passkey;


	$params["keyword"] = $_GET['tsearch'];
	$params["page"] = $_GET['page'];
	$params["scope"] = $_GET['scoperadio'];

	($_GET['checktopic']!="") ? $topic = 'yes' : $topic = 'no' ;
	$params["option"]["topic"] = 'yes';

	($_GET['checkmsg']!="") ? $msg = 'yes' : $msg = 'no' ;
	$params["option"]["message"] = $msg;

	($_GET['checkcomment']!="") ? $comment = 'yes' : $comment = 'no' ;
	$params["option"]["comment"] = $comment;

	$params["passkey"] = $passkey;

	$message = $client->call('search_blog', $params);

	return $message;
}
?>
