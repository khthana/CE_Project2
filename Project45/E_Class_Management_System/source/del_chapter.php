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
	function del_chapter($TID,$ID){
									connect_db();
									$sql="select  Chapter from chapters where ID=$ID";
									$result=mysql_query($sql);
									$Chapter=mysql_fetch_row($result);
									
									$del="select * from fileuploads where Chapter=$Chapter[0]";
									 $result=mysql_query($del);
									 while($row=mysql_fetch_row($result))
									 {
									   	if($row[3] !="")	
										unlink($row[3]);
										if($row[4] !="")	
										unlink($row[4]);
										if($row[5] !="")	
										unlink($row[5]);
										if($row[6] !="")	
										unlink($row[6]);
										if($row[7] !="")	
										unlink($row[7]);
									}
									$sql="delete  from chapters where ID=$ID"	;
									$result=mysql_query($sql);
									$sql="delete  from documents where Chapter=$Chapter[0]"	;
									$result=mysql_query($sql);
									$sql="delete from fileuploads where Chapter=$Chapter[0]";
									$result=mysql_query($sql);
									if(!$result)
									{		
											mysql_close();
											echo"<center>";
											echo "ไม่สามารถลบ วิชาได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
											echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= course_content.php?TID=$TID&ID=$ID&Chapter=$row[2]\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
									}
									else
									{
									echo"<center><font class='text' color='#FF0000'>ได้ทำการลบเนื้อหารายวิชาที่คุณเลือกเรียบร้อยแล้ว</font></center>";
									mysql_close();
									}
	 }
	 
	 function del_file_upload($TID,$ID){
									connect_db();
									$del="select * from fileuploads where ID=$ID";
									 $result=mysql_query($del);
									 while($row=mysql_fetch_row($result))
									 {
									 	if($row[3] !="")	
										unlink($row[3]);
										if($row[4] !="")	
										unlink($row[4]);
										if($row[5] !="")	
										unlink($row[5]);
										if($row[6] !="")	
										unlink($row[6]);
										if($row[7] !="")	
										unlink($row[7]);
									}
									$sql="DELETE FROM fileuploads WHERE ID=$ID";
									$result=mysql_query($sql);
									if(!$result)
									{
											mysql_close();
											echo"<center>";
											echo "ไม่สามารถลบไฟล์ได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
											echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= show_file_upload.php?TID=$TID&ID=$ID&Chapter=$row[2]\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
									}
									else
									{
									echo"<center><font class='text' color='#FF0000'>ได้ทำการลบไฟล์ที่คุณเลือกเรียบร้อยแล้ว</font></center>";
									mysql_close();
									}
	 }
	 
	 //-----------------------------------------------------------body program-------------------------------------------------------------------------//
	 if($course&&$delete_file)
	{
	  for( $i=0;$i< count($course);$i++)
	  	{ 
		del_file_upload($TID,$course[$i]);
		}
		echo "<meta http-equiv=\"REFRESH\" content=\"3;URL=show_file_upload.php?TID=$TID&ID=$ID&Chapter=$Chapter\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
	}
	elseif(($course&&$delete))
	{
		for( $i=0;$i< count($course);$i++)
		{
				del_chapter($TID,$course[$i]);
	   	}
		echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= course_content.php?TID=$TID&ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
	 } 
	 else
	 {
	  echo"<center><font class='text' color='#FF0000'>ไม่สามารถทำการลบเนื้อหารายวิชาได้</font></center>";
	  echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= course_content.php?TID=$TID&ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
	 }
?>
	<!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
