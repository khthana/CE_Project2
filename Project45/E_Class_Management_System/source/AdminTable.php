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
	<table border=0  cellpadding="10" cellspacing="0" width="100%">
  <tr> 
    <td width="17%" height="100" valign="top"> 
      <?php
		  	require('./libraries/grab_globals.lib.php'); 	
			include("./config.inc.php");
			$con1 = $con;
			echo "<font face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">";
			echo "<table width = 100% border = 0 cellpadding=0 cellspacing=1 class = text bgcolor=000000>";
			echo "<tr  bgcolor=8397C4><th class = header>Data View</th></tr>";
			echo "<tr bgcolor=CCCCCC><td >&nbsp;&nbsp;&nbsp; - <a href=AdminTable.php?Choice=member>Member</a> </td></tr>";
			echo "<tr bgcolor=CCCCCC><td>&nbsp;&nbsp;&nbsp; - <a href=AdminTable.php?Choice=courses>Courses</a> </td></tr>";
			echo "<tr bgcolor=CCCCCC><td>&nbsp;&nbsp;&nbsp; - <a href=AdminTable.php?Choice=update>AutoUpdate</a> </td></tr>";
			echo "<tr bgcolor=CCCCCC><td>&nbsp;&nbsp;&nbsp; - <a href=AdminTable.php?Choice=news>NewsDelete</a> </td></tr>";
			echo "</table>";
			echo "</font>";
			Closed();
	?>
      <br><br><br><br> 
      <?php
		 if($Choice == "member") {
		 	echo "<font face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">";
			echo "<table width = 100% border = 0 cellpadding=0 cellspacing=1 class = text bgcolor=black>";
			echo "<tr  bgcolor=8397C4><th class = header> Member </th></tr>";
			echo "<tr bgcolor=CCCCCC><td >&nbsp;&nbsp;&nbsp; - <a href=AdminTable.php?Choice1=student&Choice=member> Student</a> </td></tr>";
			echo "<tr bgcolor=CCCCCC><td>&nbsp;&nbsp;&nbsp; - <a href=AdminTable.php?Choice1=teacher&Choice=member> Teacher</a> </td></tr>";
			echo "</table>";
			echo "</font>";
			//Closed();	
		 }
	?>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
    <td width="83%" valign="top"> 
      <?php  
			if	($Choice == "courses" )  {
				include("./admin.php");
				Courses($con1); 
			}
			else //if($Choce == "member") {
							if($Choice1 == "student" )	{
								include("./admin.php");
								Member($con1,"student");
							} else
							if($Choice1 == "teacher" ){
								include("./admin.php");
								Member($con1,"teacher");
							} 
				//}
			else if ($Choice == "update") {
				include("./UpdateLevel.php");
			}
			else if($Choice == "news") {
				include("./NewsDelete.php");
				NewsShow();
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
