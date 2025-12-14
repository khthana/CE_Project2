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
	function insertcourse($FacultyName,$DepartmentName,$Name,$Target,$description,$CourseConID,$CourseConName,$TextBook,$GradeDetail,$Refer,$Weboard,$TID){
		switch ($FacultyName)
		{
		case "วิทยาศาสตร์":$ID="001"; break;
		case "วิศวกรรมศาสตร์":$ID="002"; break;
		case "สถาปัตยกรรมศาสตร์":$ID="003"; break;
		case "เทคโนโลยีสารสนเทศ":$ID="004";break;										
		case "คุรุศาสตร์อุตสาหกรรม":$ID="005";break;
		default:$ID="000";break;
		}								
									connect_db();
									$sql="select max(ID) from courses where Faculty='$FacultyName'";
									$result=mysql_query($sql);
									if(!$result)
									{
											echo "ไม่สามารถ query ได้";		
									}
									else 
									{
											$MAX=mysql_fetch_row($result);
											if($MAX[0]==0)
												{
													$MAX[0]="0000";
													$ID.=$MAX[0];
												}
											 else
											 	$ID="00".strval(($MAX[0]+1));
									}
									$sql="INSERT INTO courses (ID,Faculty,Department, Name, Target,Description,CourseConID,CourseConName,TextBook, GradeDetail, Refer, TID) VALUES ('$ID','$FacultyName','$DepartmentName','$Name','$Target','$description','$CourseConID','$CourseConName','$TextBook','$GradeDetail','$Refer','$TID')"	;
									$result=mysql_query($sql);
									if(!$result)
									{
											mysql_close();
											echo"<center>";
											echo "ไม่สามารถสร้าง วิชาได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
									}		
									$sql_1="select ID from courses where Faculty='$FacultyName' and Department='$DepartmentName'
													and Name='$Name' and Target='$Target' and Description='$description'";
									$result_1=mysql_query($sql_1);
									$row=mysql_fetch_row($result_1);
									mkdir("./Teacher/$TID/Courses/$row[0]",0755); 
									mkdir("./Teacher/$TID/Courses/$row[0]/picture",0755); 
									//mkdir("./Techer/$TID/Courses/$row[0]/builder"); 
									//Create True Fault Question Table
									$sql_2="CREATE TABLE `questionTF".$row[0]."`(`ID` INT (3) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT, `CID` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `Question` TEXT NOT NULL, `Answer` TEXT NOT NULL, `Correct_answer` VARCHAR (80) NOT NULL, PRIMARY KEY(`ID`), INDEX(`CID`))";
									mysql_query($sql_2);
									//Create Choise Question Table
									$sql_2="CREATE TABLE `questionCH".$row[0]."`(`ID` INT (3) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT, `CID` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `Question` TEXT NOT NULL, `Answer` TEXT NOT NULL, `Correct_answer` VARCHAR (80) NOT NULL, PRIMARY KEY(`ID`), INDEX(`CID`))";
									mysql_query($sql_2);
									//Create Rating Table For  Each Course
									$sql_2="CREATE TABLE `Rating".$row[0]."`(`ID` INT (5) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT, `ask1` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `ask2` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `ask3` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `ask4` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `ask5` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `ask6` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `ask7` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `ask8` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `ask9` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `ask10` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `total` INT (3) UNSIGNED DEFAULT '0' NOT NULL, `day` CHAR (2)  NOT NULL, `mount` VARCHAR (20) NOT NULL, `year` VARCHAR (10) NOT NULL,  PRIMARY KEY(`ID`))";
									mysql_query($sql_2);
									mysql_close();
	}

	if($FacultyName&&$DepartmentName&&$CourseName&&$Target&&$Description)
	{
			$FacultyName=addslashes($FacultyName);
			$DepartmentName=addslashes($DepartmentName);
			$CourseName=addslashes($CourseName);
			$Target=addslashes($Target);
			$Description=addslashes($Description);
			$CourseConID=addslashes($CourseConID);
			$CourseConName=addslashes($CourseConName);
			$TextBook=addslashes($TextBook);
			$GradeDetail=addslashes($GradeDetail);
			$Refer=addslashes($Refer);
			insertcourse($FacultyName,$DepartmentName,$CourseName,$Target,$Description,$CourseConID,$CourseConName,$TextBook,$GradeDetail,$Refer,'',$TID);  
			echo"<center><font class='text' color='#FF0000' >การบันทึกข้อมูลวิชาที่เปิดสอนเรียบร้อยแล้วครับ</font></center>";
			echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= FrmTea.php\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
			}
	else if($FacultyName) // When Update FacultyName
		{
		echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= insert_form.php?TID=$TID&FacultyName=$FacultyName\">";// ให้มัน refresh หน้ากลับไปยัง insert_form.php and send  $FacultyName to control DepartMent
		}	
	else
		{
			echo"<center><font class='text' color='#FF0000' >กรุณากรอกข้อความในช่องที่มีเครื่องหมาย * ให้ครบทุกช่องด้วยครับ</font></center>";
			echo "<meta http-equiv=\"REFRESH\" content=\"3;URL= insert_form.php?TID=$TID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
		}	
?>
<!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
