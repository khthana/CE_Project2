<html>
<head>
<title>admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body >
<?php
	require('./libraries/grab_globals.lib.php'); 
	if($submit == "Delete")  {
		$num =  count($name);
		if($num == 0) {
			include("./ChKErr.inc.php");
			ShowErr("กรุณาคลิกชื่อก่อน delete");
		}
		if ($namehidden  == "courses") {
			include("./AdminDelete.php");
			include("./config.inc.php");
			for($i = 0;$i < $num ; $i++) {
				$TID = GetTID($con,$name[$i]) ;
				//echo $TID."<br>";
				delcourse($TID,$name[$i]);
				//if($i == $num-1) exit();
			}
		}
		else if($namehidden == "member") {
			include("./config.inc.php");
			for($i = 0;$i < $num ; $i++) {
				DeletePicture($namehidden,$name[$i],$con) ;
				DeleteMember($namehidden,$name[$i],$con);
			}
			
		}
		echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= AdminTable.php?Choice=$namehidden&Choice1=$status\">";
	}  else
	if($submit == "Update") {
	  	$num = count($name);
		if($num == 0) {
			include("./ChKErr.inc.php");
			ShowErr("กรุณาคลิกชื่อก่อน Update");
		}
		else {
			include("./config.inc.php");
			for($i = 0;$i < $num ; $i++) {
				$result [] = ShowTeacher($name[$i],$con);
			}
			include("./UpdateAdmin.php");
			//UpdateManual($result,$num);
		}
	}
	
	function Member($con,$status) {
	    	$result = ShowData1("member",$status,$con) ;
			if(!$result)
				echo "ไม่สามารถเลือกข้อมูลได้";
			
			echo "<font face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">";
			echo  "<form action=\"admin.php?status=$status\" method=\"get\" name=\"admin\">";
			echo "<table width = 92% border = 1 cellpadding=0 cellspacing=0 class = text bordercolor= white align=center>";
			echo "<tr bgcolor=8397C4 bordercolor=8397C4 ><th class = header width=40%> Name	</th><th class=header width=30%>Educate</th><th class=header>Level</th></tr>";
		
				while(	$row  =  mysql_fetch_object($result)) {
						echo  "<tr bordercolor=8397C4 >";
						echo  "<td class=text>&nbsp;&nbsp;&nbsp;";
						echo 	"<input name=\"name[ ]\" type=\"checkbox\" value=\"$row->ID\">&nbsp;&nbsp;&nbsp;".stripslashes($row->FULLNAME)."&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".stripslashes($row->LASTNAME)."</td>";
						echo 	"<td class=text align=center>".stripslashes($row->EDUCATE)."</td>";
						echo  "<td class=text align=center>";
						if($status == "student")  echo  "	-	</td></tr>";
						else echo  "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".stripslashes($row->LEVEL)."</td></tr>";

				}
						echo "<tr><td colspan=3 bordercolor = white>";
						if ($status == "student") echo "<input name=\"update\" type=\"submit\" value=\"Update\" disabled>";
						else  echo "<input name=\"submit\" type=\"submit\" value=\"Update\">";
						echo "&nbsp;&nbsp;&nbsp;<input name=\"submit\" type=\"submit\" value=\"Delete\">&nbsp; ";
						echo "&nbsp;<input name=\"reset\" type=\"reset\" value=\"Clear\"><input name=\"namehidden\" type=\"hidden\" value=\"member\"></td></tr>";
						if($status == "student")  echo "<tr><td colspan=3><font color=6666FF>คลิกเลือกชื่อก่อนกด delete</font></td></tr>";
						else	echo "<tr><td colspan=3><font color=6666FF>คลิกเลือกชื่อก่อนกด update หรือ delete</font></td></tr>";
						echo "</form>";
					//mysql_free_result($result);
	}

	function  Courses($con) {
			$result = ShowData("courses","Department",$con);
			
			if(!$result)
				echo "ไม่สามารถเลือกข้อมูลได้";
			
			echo "<font face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">";
			echo  "<form action=\"admin.php\" method=\"post\" name=\"admin\">";
			echo "<table width = 100% border = 1 cellpadding=0 cellspacing=0 class = text bordercolor= white align=center>";
			echo "<tr bgcolor=8397C4 bordercolor=8397C4 ><th class = header width=20%> Faculty	</th><th class=header width = 20%>Department</th><th class=header width=10%>Code</th><th class=header width=22%>Course Name</th><th class=header width=8%> Student</th><th class=header>Teacher</th></tr>";
			$num = mysql_num_rows($result);
			if ($num == 0) 	echo "<tr><td colspan=5><font color=0000FF>ยังไม่มีการเปิดวิชาเรียน</font></td></tr>";
			else {
				while(	$row  =  mysql_fetch_object($result)) {
						echo  "<tr bordercolor=8397C4 >";
						echo  "<td class=text>&nbsp;&nbsp;";
						echo 	"<input name=\"name[ ]\" type=\"checkbox\" value=\"$row->ID\">&nbsp;&nbsp;".stripslashes($row->Faculty)."</td>";
						echo  "<td class=text>";
						echo  "&nbsp;&nbsp;".stripslashes($row->Department)."</td>";
						echo "<td class=text align=center>".stripslashes($row->ID)."</td>";
						echo 	"<td class=text>&nbsp;&nbsp;".stripslashes($row->Name)."</td>";
						$result1 = StudentCount($row->ID,$con);
						$num = mysql_fetch_array($result1);
						echo  "<td class=text align=center>".$num[0]."</td>";
						$result2 = ShowTeacher($row->TID,$con);
						$num1 = mysql_fetch_object($result2);
						echo  "<td class=text >&nbsp;&nbsp;$num1->FULLNAME&nbsp;&nbsp;&nbsp;$num1->LASTNAME</td></tr>";
						mysql_free_result($result1);
						mysql_free_result($result2);
				}
			}
						echo "<tr><td colspan=5 bordercolor = white><input name=\"submit\" type=\"submit\" value=\"Delete\">&nbsp; ";
						echo "&nbsp;<input name=\"reset\" type=\"reset\" value=\"Clear\"><input name=\"namehidden\" type=\"hidden\" value=\"courses\"></td></tr>";
						echo "<tr><td colspan=5><font color=6666FF>คลิกเลือกชื่อก่อนกด delete</font></td></tr>";
						echo "</form>";
						mysql_free_result($result);
	}
 ?>
</body> 
</html>
<?php 
		function ShowData($table,$name,$con) {
			global $con;
			$sql  =  "SELECT  *	FROM 	$table  ORDER BY $name ASC ";
			$query = mysql_query($sql,$con);
			return $query;
		}
		function ShowTeacher($TID,$con) {
			global $con;
			$sql = "SELECT * FROM member WHERE ID = '$TID' " ;
			$query = mysql_query($sql,$con);
			return $query;
		}
		function StudentCount($index,$con) {
			global $con;
			$sql = "SELECT COUNT(*) FROM regist WHERE CID = '$index' " ;
			$query = mysql_query($sql,$con);
			return $query;			
		}
		function ShowData1($table,$status,$con) {
			global $con;
			$sql  =  "SELECT  *	FROM 	$table  WHERE STATUS = '$status' ORDER BY  FULLNAME  DESC";
			$query = mysql_query($sql,$con);
			return $query;
		}
		function GetTID($con,$id) {
			global $con;
			//echo "ID :$id<br>";
			$sql = "SELECT TID FROM courses WHERE ID='$id' ";
			$query = mysql_query($sql,$con);
			$row = mysql_fetch_row($query);
			//mysql_free_result($query);
			return $row[0];
		}
		function DeletePicture($table,$ID,$con){
			global $con;
			$sql = "SELECT PICTURE FROM $table WHERE ID='$ID' ";
			$query = mysql_query($sql,$con);
			$row = mysql_fetch_row($query);
			$pic_array = explode("/",$row[0]);
			//echo "$pic_array[1]<br>$pic_array[2]";
			if($pic_array[1] == "Pic_Regis") {
				$dir = opendir("./Pic_Regis");
				while($file=readdir($dir))	 {
					if(strstr($file,$pic_array[2])) 
						unlink("./Pic_Regis/$file"); 
				}
				closedir();
			}
			else exit;	
		}
		function DeleteMember($table,$ID,$con) {
			global $con;
			$sql = "SELECT SID FROM regist WHERE SID='$ID' ";
			$query = mysql_query($sql,$con);
			if($query) {
				$sql = "DELETE FROM regist WHERE SID = '$ID' ";
				$query = mysql_query($sql,$con);
			}
			$sql = "DELETE FROM $table WHERE ID = '$ID ' ";
			$query = mysql_query($sql,$con);
	}
		
?>