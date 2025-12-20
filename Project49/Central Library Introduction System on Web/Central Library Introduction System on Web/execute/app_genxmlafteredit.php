<?php

session_start();

include("app_header.php");




if (isset($_SESSION["valid_user"])) { 
/********************ตรวจสอบ session ว่ามี user** แล้วจึงทำต่อ*******************/





/*
php นี้ทำงานโดยรับค่าการแก้ไขจากฟอร์มใน app_editxmlfile.php 

โดยทำการเปิดไฟล์เก่า ตาม $fileurl เพื่อเก็บข้อมูลที่แก้ไขแล้ว
และจัดการเกี่ยวกับรูปภาพประกอบ
*/

$file = $_POST['fileurl'];


//----------เตรียมชื่อรูปภาพให้เป็นชื่อเดียวกับไฟล์-------------//
$nameforpic = chop($file,".xml");
//-------------------------------------------------//


$libraryinfo_type = $_POST['mylibtype'];
$filename = $_POST['filename'];

$TITLE = $_POST['TITLE'];
$ENGTITLE = $_POST['ENGTITLE'];
$DESCRIPTION = $_POST['DESCRIPTION'];

//----ตัวแปรในส่วนของ Info att about -----//
$detail  = $_POST['detail'];
$rule = $_POST['rule'];
$time = $_POST['time'];
$place = $_POST['place'];
$link = $_POST['link'];
$contact = $_POST['contact'];
$work = $_POST['work'];
$goal = $_POST['goal'];
$process = $_POST['process'];
$KPI = $_POST['KPI'];
$plan = $_POST['plan'];

//ตัวแปรสำหรับจัดการรูปภาพ ที่รับมาจาก app_editxmlfile.php //
$src = $_POST['SRC'];
$atl = $_POST['ATL'];
$width = $_POST['WIDTH'];
$height = $_POST['HEIGHT'];

$pic_name = $_FILES["newpicfile"]["name"];
$pic_type = $_FILES["newpicfile"]["type"];
$pic_size = $_FILES["newpicfile"]["size"];
$pic_errorcode = $_FILES["newpicfile"]["error"];
$pic_temp = $_FILES["newpicfile"]["tmp_name"];


///// val สำหรับเก็บค่า att ที่แปรผันได้สำหรับไฟล์ xml /////
$titlemeaning;
$engtitlemeaning;

	if($libraryinfo_type == "future library")
	{
		$titlemeaning = "หัวข้อ/ประเด็นยุทธศาสตร์";
		$engtitlemeaning = "หัวข้อย่อย (ถ้ามี)";
	}
	else {
		$titlemeaning = "หัวข้อภาษาไทย";
		$engtitlemeaning = "หัวข้อภาษาอังกฤษ";
	}
	
//////////////////////////////////////////////////

$infodata;
$picturedata;

$filelink; 
//เก็บชื่อไฟล์ xxx_link.xml เพื่อเปิดมาเพิ่ม <subject> element


////////////////////////////

$vservice = "service";
$vsearch = "search";
$voffice = "office library";
$vfuture = "future library";
$vfaculty = "faculty library";

///////////////////////////

$headxml = '<?xml version="1.0" encoding="UTF-8"?>
<?DOCTYPE service SYSTEM "libraryinfo.dtd" ?>

<?xml-stylesheet type="text/xsl" href="libraryinfo.xsl" ?>';

$rootxml = '
<libraryinfo type="'.$libraryinfo_type.'" engname="'.$ENGTITLE.'" thainame="'.$TITLE.'">

	<title meaning="'.$titlemeaning.'">'.$TITLE.'</title>
	<engtitle meaning="'.$engtitlemeaning.'">'.$ENGTITLE.'</engtitle>
	';	
	
$descriptiontag = '<description meaning="คำอธิบายโดยย่อ"><![CDATA['.$DESCRIPTION.']]></description>';

$closeroot = '</libraryinfo>';
	
/////////////////////////


function setInfoData($value)
{
	global $infodata;
	global $detail, $rule, $time, $place, $link, $contact, $work, $goal, $process, $KPI, $plan;
	
	global $vservice, $vsearch, $voffice, $vfuture, $vfaculty;
	
	if($value == "$vservice")
	{
		$infodata = '<info about="detail" meaning="รายละเอียดการบริการ"><![CDATA['.$detail.']]></info>
					<info about="rule" meaning="ระเบียบการใช้บริการ"><![CDATA['.$rule.']]></info>
					<info about="time" meaning="เวลาให้บริการ"><![CDATA['.$time.']]></info>
					<info about="place" meaning="สถานที่ให้บริการ"><![CDATA['.$place.']]></info>
		 			<info about="link" meaning="Link ที่เกี่ยวข้อง"><![CDATA['.$link.']]></info>
					';
	}
	if($value == "$vsearch")
	{
		$infodata = '<info about="detail" meaning="รายละเอียดการบริการ"><![CDATA['.$detail.']]></info>
					<info about="place" meaning="สถานที่ให้บริการ"><![CDATA['.$place.']]></info>
		 			<info about="link" meaning="Link ที่เกี่ยวข้อง"><![CDATA['.$link.']]></info>
					';
	}
	if($value == "$voffice")
	{
		$infodata = '<info about="work" meaning="ภาระงานที่รับผิดชอบ"><![CDATA['.$work.']]></info>';
	}
	if($value == "$vfuture")
	{
		$infodata = '<info about="goal" meaning="นโยบาย / วัตถุประสงค์"><![CDATA['.$goal.']]></info>
					<info about="plan" meaning="แนวทางการพัฒนาโดยภาพรวม"><![CDATA['.$plan.']]></info>
					<info about="KPI" meaning="ตัวชี้วัด"><![CDATA['.$KPI.']]></info>
					<info about="process" meaning="กลยุทธ์การดำเนินงาน (โครงการ)"><![CDATA['.$process.']]></info>
					';
	}
	if($value == "$vfaculty")
	{
		$infodata = '<info about="contact" meaning="ติดต่อห้องสมุด"><![CDATA['.$contact.']]></info>
					<info about="time" meaning="เวลาให้บริการ"><![CDATA['.$time.']]></info>
		 			<info about="link" meaning="Link ที่เกี่ยวข้อง"><![CDATA['.$link.']]></info>
					';
	}
}

function managePicture()
{
	global $picturedata,$nameforpic;
	global $src, $atl;
	global $pic_name, $pic_type, $pic_size, $pic_errorcode, $pic_temp;
	
	//หา file type ว่า dot อะไร จะเอามาสร้างชื่อไฟล์ให้ใหม่
	if ($pic_type == "image/gif") {$lastname = "gif";}
	if ($pic_type == "image/jpeg") {$lastname = "jpeg";}
	if (($pic_type == "image/jpg")||($pic_type == "image/pjpeg")) {$lastname = "jpg";}

//----------เซฟไฟล์รูปภาพ------------
if (!$pic_temp)
{
	setPictureData($atl, $src, $width, $height);
	//ถ้าไม่ใส่รูปใหม่ ให้เก็บรูปเก่า
}
else
{
  if (($pic_type == "image/gif") || ($pic_type == "image/jpeg")	|| 
      ($pic_type == "image/jpg") ||($pic_type == "image/pjpeg") && ($pic_size < 300000))
  {
 	 if ($pic_errorcode > 0)
     {
    	switch ($pic_errorcode)
      {
      
      	case 1: echo 'File exceeded maximum server upload size';
      	break;
      
      	case 2: echo 'File exceeded maximum file size';
      	break;
      
      	case 3: echo 'File only partially uploaded';
      	break;
      
      	case 4: echo 'No file uploaded';
      	break;
      }
     }
 	 else
     {
    	echo "<p>แก้ไขรูปภาพ สำเร็จ !!!</p>";
		
		echo "Upload: " . $pic_name . "<br />";
    	echo "Type: " . $pic_type . "<br />";
    	echo "Size: " . ($pic_size / 1024) . " Kb<br />";
   	 	echo "Temp file: " . $pic_temp . "<br />"; 
	
		//ตั้งชื่อรูปเหมือนชื่อไฟล์ XML
		$new_filename = $nameforpic.".$lastname";
	
		$new_fileuri = "images/".$new_filename;
		
		deleteOldPic($src);
	
		if (file_exists($new_fileuri))
      	{
      		//echo "file already exists !!! ";
			deleteOldPic($new_fileuri);
			move_uploaded_file($pic_temp,$new_fileuri);
      		echo "New Picture is Stored in: " . $new_fileuri;
      	}
    	else
      	{
      		move_uploaded_file($pic_temp,$new_fileuri);
      		echo "New Picture is Stored in: " . $new_fileuri;
      	}
		
		$unknowW = "";
		$unknowH = "";
		
		setPictureData($atl, $new_fileuri, $unknowW, $unknowH);				
     }
  }
  else
  {
  	echo "Invalid file";
  }
}
//----------เซฟเรียบร้อย-------------
}


function setPictureData($picATL, $picSRC, $picW, $picH )
{
	global $picturedata;
	
	$picturedata = '<picture meaning="รูปภาพประกอบ">
						<atl meaning="คำอธิบายรูป">'.$picATL.'</atl>
						<src meaning="แหล่งของรูป">'.$picSRC.'</src>
						<linkto meaning="ลิงค์ไปยัง" />
						<width>'.$picW.'</width>
						<height>'.$picH.'</height>
					</picture>';
}

function deleteOldPic($src)
{
	if($src != '')
	{
		if (!unlink($src))
  		{
 		 echo "Error deleting $src";
 	 	}
		else
  		{
		echo "<p>Delete Old Picture complete !!!!</p>";
  		}
	}
}
////////////////////////////////////////////////////////////////////////

function toDataString()
{
	global $headxml, $rootxml,$picturedata, $descriptiontag, $infodata, $closeroot;
	
	$textdata = "$headxml"."$rootxml"."$picturedata"."$descriptiontag"."$infodata"."$closeroot";
	return $textdata;
}

/////////////////////////edit file


setInfoData("$libraryinfo_type");
managePicture();

$data = toDataString();

if (!($fp = fopen($file, "w"))) {
   die("could not open XML file");
}

fwrite($fp, $data);
fclose($fp);

echo "<table width='580' border='0' cellspacing='10' cellpadding='5'>";
echo "<tr><td height='200' align='center' valign='middle'>";

echo "<p>edit file สำเร็จ</p>";

echo "<p><strong>เอกสารหัวข้อ :</strong> $TITLE <br />";
echo "<strong>ชื่อไฟล์ :</strong> $fileurl <br />"; 
echo "<strong>หมวดหมู่ :</strong> $libraryinfo_type <br/></p>";

echo "<p><a href='".$fileurl."' target='_blank'>Click to Preview update file</a></p>";

echo "</td></tr>";


echo "</table>";



}
else ///////ไม่มี session จะไม่ทำงาน //////// 
{echo "<a href='app_index.php' target='_top'>คุณยังไม่ได้ login กรุณา login ก่อน</a>";}




echo "</body></html>";
?> 