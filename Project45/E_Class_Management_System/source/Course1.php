<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/logo.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ท</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="style.css" >
</head>

<body leftmargin="0" topmargin="0" >
<table width="780" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <td width="100%" align="right" valign="top"><img src="./Picture/logo.jpg" width="100%" height="85" align="baseline"></td>
  </tr>
  <tr> 
    <td  valign="top"><table  width="100%" border="0" cellpadding="0" cellspacing="1"   bgcolor="#000000"  class="text">
        <tr bgcolor="#336699" class="text" valign="top"> 
          <td width = "14%" align="center"><strong><a href="index.php" class="nav">Home</a></strong></td>
          <td width = "14%" align="center"><strong><a href="Course1.php" target="_parent" class="nav">Course</a></strong></td>
          <td width = "13%" align="center"><strong><a href="Headline.php?status=all" target="_parent" class="nav">News</a></strong></td>
          <td width="14%" align="center"><strong><a href="FrmSearch.php" target="_parent" class="nav">Search</a></strong></td>
          <td width="16%" align="center"><strong><a href="MeansUse.php" target="_blank" class="nav">FAQ</a></strong></td>
          <td width = "12%" align="center"><strong><a href="about.php" class="nav">About</a></strong></td>
          <td width = "17%" align="center"><strong><a href="index.php?LogOut=yes" class="nav">Logout</a></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr valign="top">
    <td width="100%"  valign="top" height="100%"><!-- InstanceBeginEditable name="data" --> 
      <table width="100%" border="0" cellspacing="0" cellpadding="8">
        <tr> 
          <td width="38%" rowspan="2" valign="top" > 
            <?php
	require('./libraries/grab_globals.lib.php');  
	include("./config.inc.php");
	$con1 = $con;
	$sql = "SELECT DISTINCT Faculty FROM courses ";
	$result1 = mysql_query($sql,$con);
	if(!$result1)
		die("ไม่สามารถเลือกข้อมูลได้");
	echo "<font face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">";
	echo "<table width = 80% border = 0 cellpadding=0 cellspacing=0 class = text align=center>";
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
				echo "<tr bgcolor = DDDDDD><td>"."&nbsp;&nbsp;&nbsp;"."  -  "."<a href = Course1.php?name=$tmp >".$tmp."</a>"."</td></tr>";
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
								SelectName($con1,$name,"Course1.php");
							}
		?>
          </td>
        </tr>
        <tr> 
          <td > 
            <?php
			//urldecode()  ถอดตัวแปรจาก url
			//$conn = urldecode($conn); 
				if($CID=='')  echo $CID = "&nbsp; ";
				else  { 
								include("./DetailCourse.php");
								DetailCourse($con1,$CID);
							}
		?>
          </td>
        </tr>
      </table>
      <!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
