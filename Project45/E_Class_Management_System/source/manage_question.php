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
		<?php
	require('./libraries/grab_globals.lib.php');
	include('./connectDB.php');		
	function delquestion($ID){
									connect_db();
									$sql="DELETE FROM questionlib WHERE ID=$ID"	;
									$result=mysql_query($sql);
									if(!$result)
									{
											echo"<center>";
											echo "ไม่สามารถลบ วิชาได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
											echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= questionlib.php?ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
									}
									mysql_close();
	}
	
	function delquiz($ID){
									connect_db();
									$sql="DELETE FROM questions WHERE ID=$ID"	;
									$result=mysql_query($sql);
									if(!$result)
									{
											echo"<center>";
											echo "ไม่สามารถลบ วิชาได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
											echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= quiz.php?ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
									}
									mysql_close();
	}
	
	function insert_quiz($CID,$Question,$Pass){
									connect_db();
									$sql="INSERT INTO questions(CID,Question,Pass) VALUES ('$CID','$Question','$Pass')";
									$result=mysql_query($sql);
									if(!$result)
									{
											echo"<center>";
											echo "ไม่สามารถ insert ได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
											//echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= quiz.php?ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
									}
									mysql_close();
	}
	//----------------------------------------------------------------------body program--------------------------------------------------------------------------//
	if(($question&&$del_question))
	{  
		for($i=0;$i < count($question);$i++)
		 {
	    	delquestion($question[$i]);
		  }
	   echo"<center><font class='text' color='#FF0000'>ได้ทำการลบคำถามที่คุณเลือกเรียบร้อยแล้ว</font></center>";
	   echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= questionlib.php?ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
	 } 
	 elseif(($question&&$select_question))
	{  
		for($i=0;$i < count($question);$i++)
		 {
	    	//delquestion($question[$i]);
			echo $question[$i]."<br>";
		  }
	   echo"<center><font class='text' color='#FF0000'>สร้างแบบทดสอบจากคำถามที่คุณเลือกเรียบร้อยแล้ว</font></center>";
	   echo "<meta http-equiv=\"REFRESH\" content=\"3;URL=quiz.php?ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
	 } 
	 else
	 {
	  echo"<center><font class='text' color='#FF0000'>ไม่สามารถทำการลบคำถามได้</font></center>";
	   echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= questionlib.php?ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
	 }
	 
	?>
	<!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
