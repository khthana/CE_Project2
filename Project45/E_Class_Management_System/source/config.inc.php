<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?php
	$hostname = "localhost";
	$username = "learnig";
	$password = "";
	$dbname = "e_learning";
	// connect to database
	$con = mysql_connect($hostname,$username,$password);
	if(!$con)
		die("ไม่สามารถติดต่อกับ Mysql ได้");
	
	mysql_select_db($dbname,$con)
		or die("ไม่สามารถเลือกใช้งานฐานข้อมูลได้");
//  fn check user
 function ChkUser($user)
 {
 	global  $con;
	$sql = "SELECT USERNAME FROM member WHERE USERNAME = '$user' " ;

	$result = mysql_query($sql,$con);
	if(!$result)
	 	die("ไม่สามารถ select data ได้");	
		
	$rs = mysql_fetch_row($result);
	if(empty($rs))
		return false;
	else 
		return true;	
 }
 // fn work into webboard
 function add_data($data,$table) {
 	$sql = "INSERT INTO $table VALUES(";
	list($key,$value) = each($data);
	$sql = $sql." '$value' ";
	while(list($key,$value) = each($data))
		$sql = $sql.",'$value' ";
	$sql = $sql.")";
	return $sql;
 }
 function get_discuss($table,$field,$cid,$begin,$end) {
 	$query = "SELECT postid,title,poster,date FROM $table WHERE CID = '$cid' ORDER BY $field desc";
	return $query;
 }
 function check_num_discuss() {
	$query = "SELECT * FROM wquestion ";	
	return $query;
}
function check_data($table,$value) {
 	$query = "SELECT * FROM $table WHERE postid = '$value' ";
	return $query;
 }
 function data($table,$value) {
 	$query = "SELECT postid,title,poster,email,date,mesg FROM $table WHERE postid ='$value' ";
	return $query;
 }
 function get_ans($value) {
 	$query = "SELECT * FROM wanswer WHERE postid='$value' ORDER BY ansid asc";
	return $query;
 }
 function data_row($query,$choice) {
 	global	$con;
	$str = "";
	$result = mysql_query($query,$con);
	if(strcmp($choice,"get_discuss") == 0) {
		$field = mysql_num_fields($result);
		while($row = mysql_fetch_array($result))
			$str = $str.discuss_body($row,$field);
			mysql_free_result($result);
	}
	else if(strcmp($choice,"get_topic") == 0) {
		$field = mysql_num_fields($result);
		while($row = mysql_fetch_array($result)) {
			$data = discuss_topic($row,$field);
			$str = $str.template($data);
		}
		mysql_free_result($result);
	}
	else if(strcmp($choice,"get_ans") == 0) {
		$field = mysql_num_fields($result);
		while($row = mysql_fetch_array($result)) {
			$data = reply_discuss($row,$field);
			$str = $str.template($data);
		}
		mysql_free_result($result);
	}
	else if(strcmp($choice,"check_data") == 0)  
		$str = mysql_num_rows($result);
	else if(strcmp($choice,"add_data") == 0)
		$str = mysql_affected_rows($con);
	return $str;
 }
 //fn work into  News
	function user_auth($uname,$passwd) {
		$query = "SELECT  *  FROM  member  WHERE  USERNAME= '$uname' AND PASSWORD ='$passwd' AND STATUS = 'teacher' ";
		return $query;
	}
	function action($str,$query) {
		global $con;
		$result = mysql_query($query,$con);
		if($result) {
			if(ereg("get_row",$str))
				$data = mysql_num_rows($result);
			else 	if(ereg("get_result",$str))
				$data = mysql_result($result,0,0);
			else 	if(ereg("affected_row",$str))
				$data = mysql_affected_rows($db);			
			else 	if(ereg("get_data",$str))
				$data = $result;
			return $data;
		}
	}
  	function  headline() {
		global $con;
		$sql = "SELECT  id,headline,dateout ,date FROM  news ORDER BY id DESC  ";
		$query = mysql_query($sql,$con);
		return $query;
	}
	function detail($id) {
		global $con;
		$sql ="SELECT * FROM news WHERE id = '$id' ";
		$query = mysql_query($sql,$con);
		return $query;
	}
	function datethai($date) {
	 $day=substr("$date",6,2);
	 $month=substr("$date",4,2);
	 $month=(int)$month-1;
	 $year=substr("$date",0,4);
	 $year=$year+543;
	 $thaimonth=array("  มกราคม  ","  กุมภาพันธ์  ","  มีนาคม  ","  เมษายน  ","  พฤษภาคม  ","  มิถุนายน  ","  กรกฎาคม  ","  สิงหาคม  ","  กันยายน  ","  ตุลาคม  ","  พฤศจิกายน  ","  ธันวาคม  ");
	 $month=$thaimonth[$month];
	 return (int)$day."".$month."".$year;
	}
function GenPwd( )
{	
	$txt="123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	srand((double)microtime()*1000000);
	for($i=0;$i<7;$i++)
			$num.=$txt[rand()%strlen($txt)];
	return $num;
}
 function Closed() {
 	global $con;
 	mysql_close($con);
 }
?>
</body>
</html>
