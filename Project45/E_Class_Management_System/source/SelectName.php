<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body  >
<?php
require('./libraries/grab_globals.lib.php');
 function SelectName($con,$name,$file) {
		$sql = "SELECT ID,Name FROM  courses WHERE Department = '$name' ";
		$result = mysql_query($sql,$con);
		echo "<b class = title>รายวิชา สาขา $name</b> ";		
		echo "<font face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">" ;
		echo "<table width = 70% border = 0 cellpadding=0 cellspacing=0 class = text >";
		echo "<tr bgcolor = 8397C4>";
		echo "<th width = 15% class = header> รหัสวิชา </th><th width = 50% class = header> ชื่อวิชา </th> ";
		echo "<tr>";
		while($rows = mysql_fetch_object($result)) {
			$ID = $rows->ID;
			echo "<tr bgcolor = DDDDDD><td width = 15% align=center>".$rows->ID."</td>";
			echo "<td>"."&nbsp;&nbsp;&nbsp;"."<a href = $file?CID=$ID&name=$name>".$rows->Name."</td></tr>";
		}
		
		echo "</table>";
		echo "</font>";
		//Closed();
	
}
?>
</body>
</html>
