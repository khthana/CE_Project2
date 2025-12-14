<?php
	session_start();
	include "domain_conf.php";
	
	#Logout case
	if ($_GET['action']=="logout") {
		setcookie ("username",false,false);
		setcookie ("password",false,false);
		setcookie ("user_id",false,false);
		setcookie ("user_domain",false,false);
		$_SESSION['ss_Access'] = "";							#username mismatch with password
		$_SESSION['ss_Access_Error'] = "";
		session_destroy();

		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=index.php\"> \n";
		exit();
	}
	
	#Get_header
	Get_Domain_Header();

	#Get_tailer_header
	Get_Domain_Header_End();

	print "<center><body>
			<div class='header'><img src='images/domain_header.jpg' width='770' height='110'></div>";
	
	#Get Menu Tab
	Get_Menu();

	#Get Search Content
	print "<div class='content'>";
	
	Get_Index_Content();

	print "</div>";

	print "<div><img src='images/domain_tailer.jpg'></div>
			</body></center>
			</html>";

###############################Function Get_Index_Content###############################
function Get_Index_Content() {
 
 #Banner add
	print "<div align='center' style='margin-bottom:5px;'><img src='images/domain_banner.jpg' width='540px' height='55px'></div>";

	#Body Content Intro & Tip Header
	print "<table width='95%'  border='0' cellspacing='0' cellpadding='0'>
      <tr>
        <td><img src='images/domain_introduction.jpg' width='250' height='24' style='margin-bottom:5px;'></td>
        <td>&nbsp;</td>
        <td><img src='images/domain_tip_of_the_day.jpg' width='250' height='24' style='margin-bottom:5px;'></td>
      </tr>
      <tr>";

	#Introduction
	print "<td width='48%'>";
	Get_Introduction();
	print "</td>";

    print "<td width='4%'>&nbsp;</td>";
       
	#Tip of the day
	print "<td width='48%' valign='top'>";
	Get_Tip();
	print "</td>";

	#Body Content Last up & Popular Header
	print "</tr>
      <tr>
        <td><img src='images/domain_last_update.jpg' width='250' height='24' style='margin-bottom:5px;'></td>
        <td>&nbsp;</td>
        <td><img src='images/domain_popular.jpg' width='250' height='24' style='margin-bottom:5px;'></td>
      </tr>
      <tr valign='top'>";

	#Last update
	print "<td width='48%'>";
	Get_Last_Update();
	print "</td>";

    print "<td width='4%'>&nbsp;</td>";

	#Popular
    print "<td width='48%'>";
	Get_Popular();
	print "</td>";
      
	print "</tr>
    </table>";
}

###############################Function Get_Introduction###############################
function Get_Introduction() {
	print "<div style='text-align:left;'><strong>ยินดีต้อนรับสู่ Soi13.com Blog</strong><br>
			 &nbsp;&nbsp;&nbsp;&nbsp;Soi13.com Blog เป็นส่วนหนึ่งของเครือข่าย Regisblog Service คุณสามารถใช้ account ของ regisblog.com เพื่อใช้บริการใน blog ของเราได้ทันที และหากคุณยังไม่มี blog เป็นของตัวเอง สามารถสมัครสมาชิกกับเราได้
			<a href=\"javascript:displayWindow('regis_form.php',545,525)\">ที่นี่</a></div><br>";
}

###############################Function Get_Tip###############################
function Get_Tip() {
	print "<table width='95%'  border='0' cellspacing='0' cellpadding='0' margin='0'>
			  <tr style='text-align:left;'>
				<td><img src='images/domain_tip_1.jpg' width='48' height='48'></td>
				<td>";
	$rand_num = rand(0,2);
	switch ($rand_num) {
		case 0 :
			 print " &nbsp;&nbsp;&nbsp;&nbsp;คุณสามารถไปยังหน้า Home ของตัวคุณเองได้โดยการ Click ที่ชื่อ Login ของคุณที่แถบ Status Bar ใต้ Header และสามารถทำการ Login และ Logout ได้จากแถบนี้ ";
			 break;
		case 1 :
			 print " &nbsp;&nbsp;&nbsp;&nbsp;คุณสามารถไปยังหน้า Home ของเจ้าของBlogที่คุณดูอยู่ได้ ้โดยการ Click ที่ชื่อของเจ้าของ Blog ใน Item Menu ด้านข้างๆในหัวข้อของ Profile";
			 break;
		default :
			 print " &nbsp;&nbsp;&nbsp;&nbsp; การเพิ่มรายชื่อใน Favourite นั้น สามารถดู User ID ได้จาก URL ที่หน้า Home ของเจ้าของ Blog ที่คุณต้องการเพิ่มรายชื่อโดย User ID คือหมายเลขที่ต่อจาดตัวแปร userid ";
	}
	print "	</td>
			  </tr>
			</table>";
}

###############################Function Get_Last_Update###############################
function Get_Last_Update() {
	
	global $passkey;
	global $client;

	$params["passkey"] = $passkey;
	$message = $client->call('obtain_lastupdateblog', $params);
		
	$success = $message["success"];

	if ($success == 'yes') {
	 
	print "<table width='95%'  border='0' cellspacing='0' cellpadding='0'>";
	print "<tr style='font-weight:bold;'><td align='left' width='85%'>Topic</td>";
	print "<td align='right' width='15%'>Time</td></tr>";
	print "<tr><td colspan='2'><hr width='100%' size='1' noshade></td></tr>";
	
	$list_topic = $message["topic"];
	$list_url = $message["url"];
	$list_time = $message["submit_datetime"];
	$i = 0;
	
	while ($list_url[$i]) {

		(strlen($list_topic[$i]) > 40)  ? $list_topic[$i] = substr ($list_topic[$i],0,37)."..." : "" ;
		print "<tr><td align='left'><a href='".$list_url[$i]."'>".$list_topic[$i]." </a><br>";

		$temp1=  explode(" ",$list_time[$i]);
		$temp2 =  explode(":",$temp1[1]);
		$list_time[$i] = $temp2[0].":".$temp2[1];
		print "</td><td align='right'>".$list_time[$i]."</td></tr>";
		print "<tr><td colspan='2'><hr width='100%' size='1' noshade></td></tr>";
		$i++;
	}
	print "</table>";
	
	} else if ($message["error_message"]) {
		print "<div class='error_msg'>ขออภัยเกิดเหตุผิดพลาดเนื่องจาก :".$message["error_message"]."</div>";
	} else {
		print "<div class='error_msg'>ขออภัยเกิดเหตุผิดพลาดเนื่องจาก : ไม่สามารถติดต่อ Service ได้</div>";
	}
}

###############################Function Get_Popular###############################
function Get_Popular() {

	global $passkey;
	global $client;

	$params["passkey"] = $passkey;
	$message = $client->call('obtain_popularblog', $params);
		
	$success = $message["success"];

	if ($success == 'yes') {
	 
	print "<table width='95%'  border='0' cellspacing='0' cellpadding='0'>";
	print "<tr style='font-weight:bold;'><td align='left' width='80%'>Topic</td>";
	print "<td align='right' width='20%'>Hits</td></tr>";
	print "<tr><td colspan='2'><hr width='100%' size='1' noshade></td></tr>";
	
	$list_topic = $message["title"];
	$list_url = $message["url"];
	$list_hits = $message["hits"];
	$i = 0;
	
	while ($list_url[$i]) {

		(strlen($list_topic[$i]) > 40)  ? $list_topic[$i] = substr ($list_topic[$i],0,37)."..." : "" ;
		print "<tr><td align='left'><a href='".$list_url[$i]."'>".$list_topic[$i]." </a><br>";

		print "</td><td align='right'>".$list_hits[$i]."</td></tr>";
		print "<tr><td colspan='2'><hr width='100%' size='1' noshade></td></tr>";
		$i++;
	}
	print "</table>";
	
	} else if ($message["error_message"]) {
		print "<div class='error_msg'>ขออภัยเกิดเหตุผิดพลาดเนื่องจาก :".$message["error_message"]."</div>";
	} else {
		print "<div class='error_msg'>ขออภัยเกิดเหตุผิดพลาดเนื่องจาก : ไม่สามารถติดต่อ Service ได้</div>";
	}

}

?>