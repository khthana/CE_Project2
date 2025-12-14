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
		include("./connectDB.php");
	function delcourse($TID,$ID){
									//delete course from table and floder
									connect_db();
									$sql="delete  from courses where ID='$ID'"	;
									$result=mysql_query($sql);
									if(!$result)
									{
											echo"<center>";
											echo "ไม่สามารถลบ วิชาได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
									}
									else
									{
										$dir=opendir("./Teacher/$TID/Courses/$ID");
										$count=0;
										while($file=readdir($dir))
										 {		
										 		//echo "$file<br>";
												if($count >=2)
												{
												if(strstr($file,"."))
												unlink("./Teacher/$TID/Courses/$ID/$file");
												else
												{
													$dir1=opendir("./Teacher/$TID/Courses/$ID/$file");
													$count1=0;
													while($file1=readdir($dir1))
										 				{
													//echo $file1."<br>";			
										 			if($count1>=2)
																{
															if(strstr($file1,"."))
																unlink("./Teacher/$TID/Courses/$ID/$file/$file1");
															else
																rmdir("./Teacher/$TID/Courses/$ID/$file/$file1");
																}
															$count1+=1;
										  					}
															closedir($dir1);
															rmdir("./Teacher/$TID/Courses/$ID/$file");
														}
												}
												$count +=1;
										  }
									closedir($dir);
									rmdir("./Teacher/$TID/Courses/$ID");
									}
									//delete chapter from table chapter
									$sql="delete  from chapters where CID=$ID"	;
									$result=mysql_query($sql);
									if(!$result)
									{
											echo"<center>";
											echo "ไม่สามารถลบ บทเรียนได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
									}
									//delete document from table documents
									$sql="delete  from documents where CID=$ID"	;
									$result=mysql_query($sql);
									if(!$result)
									{
											echo"<center>";
											echo "ไม่สามารถลบ บทเรียนได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
									}
									//delete fileupload from table fileuploads
									$sql="delete  from fileuploads where CID=$ID"	;
									$result=mysql_query($sql);
									if(!$result)
									{
											echo"<center>";
											echo "ไม่สามารถลบ บทเรียนได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
									}
									//delete chapter in learn table
									$sql="delete from learn where CID=$ID";
									mysql_query($sql);
									//delete chapter in homework table
									$sql="delete from homwork where CID=$ID";
									mysql_query($sql);
									//drop tquestion table for each course
									$sql="DROP TABLE `questionTF".$ID."`";
									mysql_query($sql);
									$sql="DROP TABLE `questionCH".$ID."`";
									mysql_query($sql);
									//drop rating table for each course
									$sql="DROP TABLE `Rating".$ID."`";
									mysql_query($sql);
									mysql_close();
	}
	//----------------------------------------------------------------------body program--------------------------------------------------------------------------//
	if(($course&&$delete))
	{  
		for($i=0;$i < count($course);$i++)
		 {
		  	$c_id="00".strval($course[$i])	;
			delcourse($TID,$c_id);
		  }
	   echo"<center><font class='text' color='#FF0000'>ได้ทำการลบวิชาที่คุณเลือกเรียบร้อยแล้ว</font></center>";
	   echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= FrmTea.php\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
	 } 
	 else
	 {
	  echo"<center><font class='text' color='#FF0000'>ไม่สามารถทำการลบวิชาได้</font></center>";
	   echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= FrmTea.php\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
	 }
	?>
	<!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
