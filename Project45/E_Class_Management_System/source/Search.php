<!--<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body >-->
<?php
	require('./libraries/grab_globals.lib.php');
	function	search($SearchName,$select) {
	if($select == "default" || !$SearchName ) {
		include("./ChkErr.inc.php");
		ShowErr("กรุณาเลือกหัวข้อค้นหาและกรอกข้อมูลก่อนค้นหา");
	}
	if($select == "CourseName") {
		$sql = "SELECT  courses.ID,courses.Faculty,courses.Department,courses.Name,member.FULLNAME,  ";
		$sql .= "member.LASTNAME  FROM courses,member ";
		$sql .= "WHERE courses.Name like '$SearchName%' AND courses.TID = member.ID ";	
		$result = query($sql);
	}
	else if($select == "Teacher") {
		$sql = "SELECT  courses.ID,courses.Faculty,courses.Department,courses.Name,member.FULLNAME, ";
		$sql .= "member.LASTNAME  FROM courses,member ";
		$sql .= "WHERE  member.STATUS= 'teacher' AND member.FULLNAME like '$SearchName%' ";	
		$sql .= "AND  courses.TID = member.ID ";
		$result = query($sql);
	}
	else if($select == "Faculty") {
		//echo "faculty";
		$sql = "SELECT  courses.ID,courses.Faculty,courses.Department,courses.Name,member.FULLNAME, ";
		$sql .= "member.LASTNAME  FROM courses,member ";
		$sql .= "WHERE  courses.Faculty like '$SearchName%' AND  courses.TID = member.ID ";
		$result = query($sql);
	}
	else if($select == "Department") {
		//echo  "department";
		$sql = "SELECT  courses.ID,courses.Faculty,courses.Department,courses.Name,member.FULLNAME, ";
		$sql .= "member.LASTNAME  FROM courses,member ";
		$sql .= "WHERE  courses.Department like '$SearchName%' AND  courses.TID = member.ID ";
		$result = query($sql);
	}
	
	if(!$result)
		echo "ไม่สามารถเลือกข้อมูลได้";
	echo "<font face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">";
	echo "<table width = 96% border = 1 cellpadding=0 cellspacing=0 class = text bordercolor= white align=center>";
	$num = mysql_num_rows($result);
	if ($num == 0) {	
		echo "<tr><td align=center class=normal><font color=0000FF><b>ไม่มีข้อมูลที่ท่านต้องการค้นหา</b></font></td></tr>"; 

	}
	else {	
		echo "<tr bgcolor=8397C4 bordercolor=8397C4 ><th class = header width=23%> Faculty	</th><th class=header width = 23%>Department</th><th class=header width=10%>Code</th><th class=header width=20%>Course Name</th><th class= header>Teacher</th></tr>";
			
			while(	$row  =  mysql_fetch_object($result)) {
					echo  "<tr bordercolor=8397C4 >";
					echo  "<td class=text align=center>".stripslashes($row->Faculty)."</td>";
					echo  "<td class=text align=center>".stripslashes($row->Department)."</td>";
					echo "<td class=text align=center>".stripslashes($row->ID)."</td>";
					echo 	"<td class=text align=center>".stripslashes($row->Name)."</td>";
					echo  "<td class=text align=center>$row->FULLNAME&nbsp;&nbsp;&nbsp;$row->LASTNAME</td></tr>";
				}
		echo "</table>";
		echo "</font>";
		mysql_free_result($result);
		}
	}
	function query($sql) {
		include("./config.inc.php");
		$query = mysql_query($sql,$con);
		return $query;
	}
?>

<!--</body>
</html>-->
