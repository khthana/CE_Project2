<html>
<head>
<title>user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="../nissan/nissan.css" type="text/css" media="screen">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="../nissan/nissan.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	color: #990000;
	font-weight: bold;
}
.style3 {
	color: #666666;
}
.style4 {color: #666666}
.style6 {color: #666666; font-weight: bold; }
.style7 {color: #333333}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body>
<?php
				require("config.php");
				$tbname = "users";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql="INSERT INTO `users` ( `YOS` , `USER_NAME` , `SERNAME` , `PASSWORD` , `POSITION` , `POSITION_USER` , `LEVEL_USER`) 
						VALUES ('$d1', '$d2', '$d3', '$d4', '$d9', '$d5', '$d6')";
				$dbquery = mysql_db_query($dbname,$sql);
				echo "เก็บข้อมูลคุณ $d2 เรียบร้อย";
	 			mysql_close();
?>
<meta http-equiv="refresh" content="0;URL=index2.php?data=add_user&username=<?=$username;?>&pwd=<?=$pwd;?>">
</body>
</html>
