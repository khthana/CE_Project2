<html>
<head>
<title>Select Course</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body >
<table width="100%" border="0" cellspacing="0" cellpadding="8">
  <tr> 
    <td width="38%" valign="top" > 
      <?php
	  require('./libraries/grab_globals.lib.php');
	include("./config.inc.php");
	$con1 = $con;
	$sql = "SELECT DISTINCT Faculty FROM courses ";
	$result1 = mysql_query($sql,$con);
	if(!$result1)
		die("ไม่สามารถเลือกข้อมูลได้");
	echo "<font face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">";
	echo "<table width = 80% border = 0 cellpadding=0 cellspacing=0 class = text>";
	echo "<tr><th class = title> คณะสาขาที่เปิดสอน	</th></tr>";

	$num = mysql_num_rows($result1);
	
	for($i=0;$i<$num;$i++)
	{
		$row = mysql_fetch_object($result1);
		echo "<tr bgcolor = 8397C4><td class = header>&nbsp;<b> ".$row->Faculty."<b></td></tr>";
		$tmp = $row->Faculty;
		$sql = "SELECT  * FROM courses   WHERE  Faculty ='$tmp' GROUP BY Department   ";
		
		$result2 = mysql_query($sql,$con);
		while($row = mysql_fetch_object($result2)) {
				$tmp =  stripslashes($row->Department);
				echo "<tr bgcolor = DDDDDD><td>"."&nbsp;&nbsp;&nbsp;"."  -  "."<a href = SelectCourse.php?name=$tmp >".$tmp."</a>"."</td></tr>";
		}		
	}

	echo "</table>";
	echo "</font>";
	Closed();
?>
    </td>
    <td width="62%"  valign="top"> 
      <?php 
			// urldecode()  ถอดตัวแปรจาก url
			//	$tmp = urldecode($name); 
				if($name =='')  echo $name = "&nbsp; ";
				else  { 
								include("./SelectName.php");
								SelectName($con1,$name,"SelectCourse.php");
							}
		?>
    </td>
  </tr>
  <tr> 
    <td colspan="2" valign="top" align=center> 
      <?php
			//urldecode()  ถอดตัวแปรจาก url
			//$conn = urldecode($conn); 
				if($CID=='')  echo $CID = "&nbsp; ";
				else  { 
								include("./ShowCourse.php");
								ShowCourse($con1,$CID);
							}
		?>
    </td>
  </tr>
</table>


</body>
</html>
