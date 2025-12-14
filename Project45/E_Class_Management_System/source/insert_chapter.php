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
	function insert_chapter($CID,$Chapter,$Link)
	{								connect_db();
									$sql="INSERT INTO chapters (CID,Chapter,Link) VALUES ('$CID','$Chapter','$Link')";
									$result=mysql_query($sql);
									if(!$result)
												{
														mysql_close();
														echo"<center>";
														echo "ไม่สามารถสร้าง เนื้อหาได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
														echo"</center>";
														exit;
												}
									else
									{
									echo "<center>ทำการเพิ่มบทเรียนเรียบร้อยแล้วครับ</center>";
									mysql_close();
									}

	}

	function insert_document($CID,$Chapter,$Subject,$HTML,$Document)
	{
									connect_db();
									$sql="INSERT INTO documents (CID,Chapter,Subject,Html,Document) VALUES ('$CID','$Chapter','$Subject','$HTML','$Document')"	;
									$result=mysql_query($sql);
									if(!$result)
												{
														mysql_close();
														echo"<center>";
														echo "ไม่สามารถสร้าง เนื้อหาได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
														echo"</center>";
														exit;
												}
									else
									{
									echo"<center><font class='text' color='#FF0000' class=normal >การบันทึกข้อมูลเอกสารเนื้อหาของบทเรียนเรียบร้อยแล้วครับ</font></center>";
									mysql_close();								
									}
	}
	function insert_fileupload($CID,$Chapter,$Word,$Powerpoint,$PDF,$Flash,$Video)
	{
									connect_db();
									$sql="INSERT INTO fileuploads (CID,Chapter,Word, Powerpoint, PDF, Flash, Video) VALUES ('$CID','$Chapter','$Word','$Powerpoint','$PDF','$Flash','$Video')"	;
									$result=mysql_query($sql);
									if(!$result)
											{
												mysql_close();
												echo"<center>";
												echo "ไม่สามารถสร้าง เนื้อหาได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
												echo"</center>";
												exit;
											}
									 else
									 {
									 echo"<center><font class='text' color='#FF0000' class=normal >ทำการเพิ่มไฟล์เรียนเรียบร้อยแล้วครับ</font></center>";
									 mysql_close();
									 }
	}
	function update_document($CID,$Chapter,$Subject,$HTML,$Document){
									connect_db();
									$sql="UPDATE documents SET Html=$HTML,Document= '$Document' WHERE CID=$CID and Chapter='$Chapter' and Subject='$Subject'";
									$result=mysql_query($sql);
									if(!$result)
									{
											mysql_close();
											echo"<center>";
											echo "ไม่สามารถแก้ไข เนื้อหาได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
											exit;
									}
								else	
								{
								echo"<center><font class='text' color='#FF0000' >การบันทึกข้อมูลเนื้อหาของบทเรียนเรียบร้อยแล้วครับ</font></center>";
								mysql_close();
								}
	}
	
//----------------------------------------------- End function go to work space-------------------------------------------------------//	
	$path="./Teacher/$TID/Courses/$ID";
	if($Word||$Powerpoint||$PDF||$Flash||$Video||$Picture||$Picture_up||$Picture_down)//ทำการ Copy ไฟล์ไปเก็บไว้ใน Floder ที่สร้างไว้
	{
	  		if($Word=="none")
				$Word="";
			if($Powerpoint=="none")
				$Powerpoint="";
			if($PDF=="none")
				$PDF="";
			if($Flash=="none")
				$Flash="";
			if($Video=="none")
				$Video="";
			if($Picture=="none")
				$Picture="";
			if($Picture_up=="none")
				$Picture_up="";
			if($Picture_down=="none")
				$Picture_down="";
				
	  		if(!empty($Word))
	    	{
				copy($Word,"$path/$Word_name") or die("ไม่สามารถ Copy ได้");
				$Word="$path/$Word_name";
			}
			if(!empty($Powerpoint))
			{
				copy($Powerpoint,"$path/$Powerpoint_name") or die("ไม่สามารถ Copy ได้");
				$Powerpoint="$path/$Powerpoint_name";
			}
			if(!empty($PDF))
			{
				copy($PDF,"$path/$PDF_name") or die("ไม่สามารถ Copy ได้");
				$PDF="$path/$PDF_name";
			}
			if(!empty($Flash))
			{
				copy($Flash,"$path/$Flash_name") or die("ไม่สามารถ Copy ได้");
				$Flash="$path/$Flash_name";
			}
			if(!empty($Video) )
			{
				copy($Video,"$path/$Video_name") or die("ไม่สามารถ Copy ได้");
				$Video="$path/$Video_name";
			}
			if(!empty($Picture))
			{
				copy($Picture,"$path/picture/$Picture_name") or die("ไม่สามารถ Copy ได้");
				$Picture="$path/picture/$Picture_name";
				$Document=$Document."<img src=\"$Picture\" height=\"$Height\" width=\"$Width\" align=\"$list\">";
			}
			if(!empty($Picture_up))
			{
				copy($Picture_up,"$path/picture/$Picture_up_name") or die("ไม่สามารถ Copy ได้");
				//echo $Picture_up;
				$Picture_up="$path/picture/$Picture_up_name";
				$Document=$Document."<img src=\"$Picture_up\" height=\"$Height_up\" width=\"$Width_up\" align=\"$list_up\">";
			}
			if(!empty($Picture_down))
			{
				copy($Picture_down,"$path/picture/$Picture_down_name") or die("ไม่สามารถ Copy ได้");
				$Picture_down="$path/picture/$Picture_down_name";
				$Document=$Document."<img src=\"$Picture_down\" height=\"$Height_down\" width=\"$Width_down\" align=\"$list_down\">";
			}
	}
	if($ID&&$Chapter&&$Subject&&$TID&&$add_chapter)//เพิ่มเนื้อหาเพิ่มบทเรียน
	{
			$Chapter=addslashes($Chapter);
			$Sucject=addslashes($Subject);
			$Document=addslashes($Document);
			$Word=addslashes($Word);
			$Powerpoint=addslashes($Powerpoint);
			$PDF=addslashes($PDF);
			$Flash=addslashes($Flash);
			$Video=addslashes($Video);
			$Link=addslashes($Link);
			insert_chapter($ID,$Chapter,$Link);
			insert_document($ID,$Chapter,$Subject,$HTML,$Document);
					
			if($Word||$Powerpoint||$PDF||$Flash||$Video)
			insert_fileupload($ID,$Chapter,$Word,$Powerpoint,$PDF,$Flash,$Video);  
			echo "<meta http-equiv=\"REFRESH\" content=\"3;URL=course_content.php?TID=$TID&ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
	}
	elseif($ID&&$Chapter&&$TID&&$add_file)//เพิ่มไฟล์ในเนื้อหาของบทเรียน
		{
			$Chapter=addslashes($Chapter);
			$Document=addslashes($Document);
			$Word=addslashes($Word);
			$Powerpoint=addslashes($Powerpoint);
			$PDF=addslashes($PDF);
			$Flash=addslashes($Flash);
			$Video=addslashes($Video);
			$Link=addslashes($Link);
			insert_fileupload($ID,$Chapter,$Word,$Powerpoint,$PDF,$Flash,$Video,$Link);  
			echo "<meta http-equiv=\"REFRESH\" content=\"3;URL=show_file_upload.php?TID=$TID&ID=$ID&Chapter=$Chapter\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
			}		
	elseif($Document&&$Chang)// edit  document
			{
			$Chapter=addslashes($Chapter);
			$Sucject=addslashes($Subject);
			$Document=addslashes($Document);
			if($HTML==NULL)$HTML=0;
			update_document($ID,$Chapter,$Subject,$HTML,$Document);  
			echo "<meta http-equiv=\"REFRESH\" content=\"3;URL=show_subject.php?TID=$TID&ID=$ID&Chapter=$Chapter\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
			}		
	elseif($add_document)
			{
			$Chapter=addslashes($Chapter);
			$Sucject=addslashes($Subject);
			$Document=addslashes($Document);
						insert_document($ID,$Chapter,$Subject,$HTML,$Document);
						echo "<meta http-equiv=\"REFRESH\" content=\"3;URL=show_subject.php?TID=$TID&ID=$ID&Chapter=$Chapter\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
		}
	else
		{
			if($add_chapter)//ถ้าเพิ่มเนื้อหาเพิ่มบทเรียนแล้วกรอกมาไม่ครบ
			{
			echo"<center><font class='text' color='#FF0000' >กรุณากรอกค่าในช่องที่มีเครื่องหมาย * ให้ครบด้วยครับ</font></center>";
			echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= insert_chapter_form.php?TID=$TID&ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
			}
			if($add_file)//ถ้าเพิ่มไฟล์แล้วไม่ใส่บท
			{
			echo"<center><font class='text' color='#FF0000' >กรุณากรอกค่าในช่องที่มีเครื่องหมาย * ให้ครบด้วยครับ</font></center>";
			echo "<meta http-equiv=\"REFRESH\" content=\"3;URL=upload_file_form.php?TID=$TID&ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
			}
		}
?>
	<!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
