<?php
$DB = new DB;
function add_line($msg) {
	global $DB,$webSite;
	$flag = true;
	if (empty($msg)) {
		$report = msg_blank;
		$flag = false;
	}

	if ($flag) :
		$rec = @file($webSite['pathMsg']);
		for($i=0;$i<count($rec) & $i < ($webSite['limitMsg']-1);$i++) {
			$dat.= $rec[$i];
		}
		$time = time();
		$msg = $_SESSION['user']."|X|".htmlspecialchars($msg)."|X|".$time."\n";
		$messages = $msg.$dat;
		$fp = fopen($webSite['pathMsg'],'w');
		if(flock($fp,2)) {
			fputs($fp,$messages);
			flock($fp,3);
		}
		fclose($fp);
		$name = $_SESSION['user'];
		$expire = time()+$webSite['limitTime'];
		$DB->conn();
		$sql = "replace into useronline (name,expire) values ('$name',$expire)";
		$result = $DB->query($sql);
		$DB->closeconn();

		$report = msg_sent;
	endif;

	return $report;
}

function refresh() {
	global $webSite;
	$rec = @file($webSite['pathMsg']);
	$rec = array_reverse($rec);
	$style = "msg_style1";
	foreach ($rec as $msg) {
		$split = explode('|X|',$msg);
		$says = "<div class='".$style."' style='padding-bottom: 5px'>";
		$says.= "<b>".$split[0]."</b> Says : ";
		$says.= $split[1];
		$says.= "</div>";
		$messages.= ascii_unicode_thai(stripslashes($says));
		$style = ($style == 'msg_style1') ? "msg_style2" : "msg_style1";
	}
	return $messages;
}

function chk_login($name) {
	global $DB,$webSite;
	$flag = true;
	if(empty($name)) {
		$msg = 'กรุณากรอกชื่อก่อนครับ';
		$flag = false;
	}

	$DB->conn();
	$sql = "select count(1) from useronline where name = '".trim($name)."' limit 1";
	$num = $DB->query_first_cell($sql);
	
	if($num >= 1) {
		$msg = 'ชื่อนี้มีผู้ใช้งานอยู่ในระบบครับ';
		$flag = false;
	}
	
	if($flag) {
		$expire = time()+$webSite['limitTime']; // ให้ล๊อกอิน 5 นาที
		$sql = "insert into useronline (name,expire) values ('".trim($name)."',$expire)";
		$result = $DB->query($sql);
		$user = trim($name);
		$_SESSION['user'] = $user;
		$msg = '1';
	}

	$DB->closeconn();
	return ascii_unicode_thai($msg);
}

function useronline() {
	global $DB;
	$DB->conn();
	$DB->query("delete from useronline where expire < ".time());

	$sql = "select * from useronline order by name asc";
	$result = $DB->query($sql);
	while($row = $DB->fetch_array($result,$sql)) :
		$userall.= ascii_unicode_thai($row['name'])."<br />";
	endwhile;
	$DB->closeconn();
	return $userall;
}

function logout() {
	global $DB;
	$DB->conn();
	$DB->query("delete from useronline where name = '".$_SESSION['user']."'");
	$DB->closeconn();
	unset($_SESSION['user']);
	return true;
}
?> 