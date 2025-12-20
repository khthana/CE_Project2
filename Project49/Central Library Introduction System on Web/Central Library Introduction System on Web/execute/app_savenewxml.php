<?php
/*
ทำงานต่อจาก app_addnewdata.php เพื่อสร้างไฟล์ xml ใหม่จากฟอร์ม

code php นี้ประกอบด้วยการทำงานสองส่วน 
คือส่วนแรก ทำการเปิดไฟล์เก่า เขียน xml code ตามที่ได้จากฟอร์มและเซฟเป็นชื่อ $fileurl
และส่วนที่สองคือเปิดไฟล์ xxx_link.xml เพื่อเพิ่ม link
*/
session_start();

include("app_header.php");




if (isset($_SESSION["valid_user"])) { 
/********************ตรวจสอบ session ว่ามี user** แล้วจึงทำต่อ*******************/






echo "<table width='580' border='0' cellspacing='10' cellpadding='5'>";
echo "<tr><td height='200' align='center' valign='middle'>";

///////////////////////value ที่มาจาก form /////////////////////////

$tempnamefile = $_POST['fileurl'];
//เก็บชื่อไฟล์ใหม่ที่เก็บข้อมูลจากฟอร์มเมื่อกี้ เช่น service_22012007160831 เพื่อเอาไปใช้เป็นชื่อไฟล์และชื่อรูปด้วย
$file = $tempnamefile.".xml";
//สร้างชื่อไฟล์ xml เป็น service_22012007160831.xml

$libraryinfo_type = $_POST['mylibtype'];
//เก็บประเภทหมวดหมู่เป็นภาษาอังกฤษ เช่น faculty library

$filename = $_POST['filename'];
//เก็บชื่อหมวดหมู่ ภาษาไทย ไว้ส่งต่อ เช่น แนะนำห้องสมุดคณะ

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

//ตัวแปรสำหรับจัดการรูปภาพ ต่างจาก app_genxmlafteredit.php เพราะมีแต่รูปใหม่ ไม่มีรูปเก่าให้ลบ//

//$src = $_POST['SRC'];
$atl = $_POST['ATL'];
//$width = $_POST['WIDTH'];
//$height = $_POST['HEIGHT'];

$pic_name = $_FILES["newpicfile"]["name"];
$pic_type = $_FILES["newpicfile"]["type"];
$pic_size = $_FILES["newpicfile"]["size"];
$pic_errorcode = $_FILES["newpicfile"]["error"];
$pic_temp = $_FILES["newpicfile"]["tmp_name"];


///// กำหนด meaning //////
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

/////////////////val สำหรับเก็บค่า att ที่แปรผันได้สำหรับไฟล์ xml ////////////////////////////////////

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
	global $picturedata;
	global $atl;
	global $pic_name, $pic_type, $pic_size, $pic_errorcode, $pic_temp;
	global $tempnamefile;
	
	$unknowW = "";
	$unknowH = "";
	
	//หา file type ว่า dot อะไร จะเอามาสร้างชื่อไฟล์ให้ใหม่
	if ($pic_type == "image/gif") {$lastname = "gif";}
	if ($pic_type == "image/jpeg") {$lastname = "jpeg";}
	if (($pic_type == "image/jpg")||($pic_type == "image/pjpeg")) {$lastname = "jpg";}

//----------เซฟไฟล์รูปภาพ------------
if (!$pic_temp)
{
	setPictureData($atl, "", $unknowW, $unknowH);
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
    	echo "บันทึกรูปภาพประกอบ เรียบร้อย <br />";
		echo "Upload: " . $pic_name . "<br />";
    	echo "Type: " . $pic_type . "<br />";
    	echo "Size: " . ($pic_size / 1024) . " Kb<br />";
   	 	echo "Temp file: " . $pic_temp . "<br />"; 
	
		$new_filename = $tempnamefile.".$lastname";
	
		$new_fileuri = "images/".$new_filename;
	
		if (file_exists($new_fileuri))
      	{
      		echo "file already exists !!! ";
      	}
    	else
      	{
      		move_uploaded_file($pic_temp,$new_fileuri);
      		echo "<p>Stored in: " . $new_fileuri ."</p>";
      	}
		
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


function toDataString()
{
	global $headxml, $rootxml,$picturedata, $descriptiontag, $infodata, $closeroot;
	
	$textdata = "$headxml"."$rootxml"."$picturedata"."$descriptiontag"."$infodata"."$closeroot";
	return $textdata;
}


/////////////////////////edit file/////////////////////////////////////////////////////


setInfoData("$libraryinfo_type");
managePicture();

$data = toDataString();

if (!($fp = fopen($file, "w"))) {
   die("could not open file");
}

fwrite($fp, $data);
fclose($fp);

echo "<p>edit file สำเร็จ</p>";

echo "<p><strong>เอกสารหัวข้อ :</strong> $TITLE <br />";
echo "<strong>ชื่อไฟล์ :</strong> $file <br />"; 
echo "<strong>หมวดหมู่ :</strong> $libraryinfo_type <br/></p>";

echo "<p><a href='".$file."' target='_blank'>Click to Preview new file</a></p>";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////============== open xml link file (xxx_link.xml) for add <subject> element ===============/////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////

function setFileLink($value) 
{
	$mylink;
	
	if($value == "service")
	{
		$mylink = "service_link.xml";
	}
	if($value == "search")
	{
		$mylink = "search_link.xml";
	}
	if($value == "office library")
	{
		$mylink = "office_link.xml";
	}
	if($value == "future library")
	{
		$mylink = "future_link.xml";
	}
	if($value == "faculty library")
	{
		$mylink = "library_link.xml";
	}
	
	return $mylink;
}

//////////////////////////////////////////////////

$depth = array();


$filelink = setFileLink($libraryinfo_type);  //file name ที่ต้องการเปิดอ่าน

///////////////////////////

$tempData = "";   ///// เก็บ xml code ทั้งหมด เพื่อนำมาเขียนในไฟล์ใหม่ /////

$headdata ='<?xml version="1.0" encoding="UTF-8"?>
<?DOCTYPE service SYSTEM "link.dtd" ?>
<?xml-stylesheet type="text/xsl" href="link.xsl" ?>
';
			 
$rootelement = '<menulink type="'.$libraryinfo_type.'" title="'.$filename.'">';

$lastelement = "	<subject>
		<name>$TITLE</name>
		<link>$file</link>
	</subject>
</menulink>";



function writeTempData($data)
{
	global $tempData;
	
	$tempData = $tempData.$data;
}

function joinstring()
{
	global $headdata, $tempData;
	
	$lastkeep = $headdata.$tempData;
	
	return $lastkeep;
}

//////////////////////////////////////////////////

function startElement($parser, $name, $attrs) 
{
   global $depth;
   global $rootelement, $headdata, $tempData;
   
   $temp ;
   
   for ($i = 0; $i < $depth[$parser]; $i++) {
       echo "  ";
   }

  if ( $name == "MENULINK" )
  {
   	$temp = $rootelement;
	writeTempData($temp);
  }
   if ( $name == "SUBJECT" )
  {
   	$temp = "<subject>";
	writeTempData($temp);
  }
  if ( $name == "NAME" )
  {
   	$temp = "<name>";
	writeTempData($temp);
  }
  if ( $name == "LINK" )
  {
	$temp = "<link>";
	writeTempData($temp);
  }
   
   $depth[$parser]++;
}

function endElement($parser, $name) 
{
   global $depth, $lastelement;
   
   $temp;

  if ( $name == "MENULINK" )
  {
   	writeTempData($lastelement);
  }
   if ( $name == "SUBJECT" )
  {
   	$temp = "</subject>";
	writeTempData($temp);
  }
  if ( $name == "NAME" )
  {
   	$temp = "</name>";
	writeTempData($temp);
  }
  if ( $name == "LINK" )
  {
   	$temp = "</link>";
	writeTempData($temp);
  }
   
   $depth[$parser]--;
}

function characterData($parser, $data) 
{

	writeTempData($data);;

}

/////////////////////////open $filelink	to parser//////////////////////////////

$xml_parser = xml_parser_create();
xml_set_element_handler($xml_parser, "startElement", "endElement");
xml_set_character_data_handler($xml_parser, "characterData");

if (!($fp = fopen($filelink, "r"))) {
   die("could not open XML input");
}

while ($data = fread($fp, 4096)) {
   if (!xml_parse($xml_parser, $data, feof($fp))) {
       die(sprintf("XML error: %s at line %d",
                   xml_error_string(xml_get_error_code($xml_parser)),
                   xml_get_current_line_number($xml_parser)));
   }
}

xml_parser_free($xml_parser);

///////////////////////เก็บ xml code ไว้ในตัวแปร ///////////////////////////////////

$completedata = joinstring();
echo "<p>ดำเนินการ เพิ่ม link ลงใน ".$filelink." เรียบร้อย</p>";

//////////////////////เขียนตัวแปรลงไฟล์////////////////////////////////////////////

	
	if (!($fp = fopen($filelink, "w"))) { die("could not open XML file");}

	fwrite($fp, $completedata);
	fclose($fp);

////////////////////////

echo "</td></tr>";
echo "</table>";


}
else ///////ไม่มี session จะไม่ทำงาน //////// 
{echo "<a href='app_index.php' target='_top'>คุณยังไม่ได้ login กรุณา login ก่อน</a>";}




echo "</body></html>";
?> 