<?php 
	require('./libraries/grab_globals.lib.php');
	include("./connectDB.php");
	session_start(); 
?>
<html>
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ต</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body >
<?php
//-------------------------------------------------------------------------Function ----------------------------------------------------------------//
function insert_date($TID,$Date,$Detail){
	connect_db();
	$sql="INSERT INTO date (TID,Day,Detail) VALUES ($TID,$Date,'$Detail')";
	$result=mysql_query($sql);
	if($result)
	{
	echo "Insert Complete";
	mysql_close();
	}
	else
	{
	mysql_close();
	exit;
	}
}

function deldate($TID,$ID){
									connect_db();
									$sql="delete  from date where ID=$ID and TID=$TID"	;
									$result=mysql_query($sql);
									if(!$result)
									{
											echo"<center>";
											echo "ไม่สามารถลบ เหตุการณ์ได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
											mysql_close();
									}
									else
									{
									mysql_close();
									exit;
									}
	}

//--------------------------------------------------------------------- Body Program -------------------------------------------------------------//
if($insert)
	 insert_date($SESSION[id],date("Ymd",strtotime($CurrentDate)),$houre.":".$min.$Detail);
	if(($del&&$Delete))
	{  
		for($i=0;$i < count($del);$i++)
	    	deldate($SESSION[id],$del[$i]);
	}
?>
</body>
</html>
