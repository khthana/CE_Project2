<?php 
	require('./libraries/grab_globals.lib.php');
	session_start(); 
?>
<html>
<head>
<title>login </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<body>
<?php
	include("./config.inc.php");
	include("./ChkErr.inc.php");

	while (list($key, $value) = each($HTTP_POST_VARS)) {
    		$$key = $value;
	}
/*
	while (list($key, $value) = each($HTTP_GET_VARS)) {
   		$$key = '';
	}*/
	CheckSpace($user,"USERNAME");
	CheckSpace($pwd,"PASSWORD");
	$tmp = decode("northboy");

	if($user == "northboy" && $pwd ==  $tmp[0])  {
		echo "<meta http-equiv=\"REFRESH\" content=\"0;URL=AdminTable.php\">";
		exit;
	}	
	$sql1 = "SELECT  *  FROM member WHERE  USERNAME = '$user'  " ;
	$result = mysql_query($sql1,$con);
	 if(mysql_num_rows($result)==0) {
		mysql_close();
		ShowErr("Username ไม่ถูกต้อง กรุณา login ใหม่ ");
 	}
	$row =  mysql_fetch_object($result); 
	$row2 = decode($row->PASSWORD);	
 
	if($pwd == $row2[0] ) {
		session_register("SESSION");
		$SESSION["id"] = $row->ID;
		$SESSION["name"] = $row->FULLNAME." ".$row->LASTNAME;
		//$SESSION["lastname"] = $row->LASTNAME;
		//$SESSION["username"] = $row->USERNAME;
		$SESSION["email"] = $row->EMAIL;
		$SESSION["icq"] = $row->ICQ;
		$SESSION["picture"] = $row->PICTURE;
//		$SESSION[""] = $row->PASSWORD;
	}
	else {
	Closed();
	ShowErr("Password ไม่ถูกต้อง กรุณา Login ใหม่");
	}

	if($row->STATUS == "student" ){
		Closed();
		$SESSION["status"] = "นักเรียน" ;
		echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= FrmStu.php\">";
	}
	else if($row->STATUS == "teacher" ){
		$SESSION["status"] = "อาจารย์" ;
		Closed();
		echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= FrmTea.php\">";
	}
?>
</body>
</html>
<?php
	function decode($value){
		global $con;
		global $random;
		$sql="select md5('$value')";
		$result1= mysql_query($sql,$con);
	    $row1 =mysql_fetch_array($result1);
		$result2 = $row1[0].$random;
		$sql = "select md5('$result2')" ;
		$result3 = mysql_query($sql,$con);
		$row2 =mysql_fetch_array($result3);
		return $row2;
	}
?>