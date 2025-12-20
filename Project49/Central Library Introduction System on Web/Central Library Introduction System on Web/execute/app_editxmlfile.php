<?php
session_start();

include("app_header.php");




if (isset($_SESSION["valid_user"])) { 
/********************ตรวจสอบ session ว่ามี user** แล้วจึงทำต่อ*******************/





$file = $_POST['mylink'];

$libtype = $_POST['libtype1'];
//รับค่า type ของเอกสารมาเก็บไว้

$depth = array();
$tempname;

function startElement($parser, $name, $attrs) 
{
   global $depth;
   global $tempname;
   
   for ($i = 0; $i < $depth[$parser]; $i++) {
       echo "  ";
   }

  /////////////////// <title> and <engtitle> element //////////////////
  if ( $name == "TITLE" )
  {
   echo "<tr><td align='left' valign='top' width='120' >";
   if (count($attrs)) {
       foreach ($attrs as $k => $v) {
           if ($k == "MEANING") 
		   {echo "$v </td><td align='left' valign='top' >
		   		  <input name='$name' type='text' size='50' readonly='true' class='textbox' value='";}
       }
   }
  }
  if ( $name == "ENGTITLE" )
  {
   echo "<tr><td align='left' valign='top' width='120' >";
   if (count($attrs)) {
       foreach ($attrs as $k => $v) {
           if ($k == "MEANING") 
		   {echo "$v </td><td align='left' valign='top' >
		   		  <input name='$name' type='text' size='50' class='textbox' value='";}
       }
   }
  }
  /////////////////// <picture> element and child node//////////////////
  if ( $name == "PICTURE" )
  {
  	echo "<tr><td colspan='2' align='left' height='10' ></td></tr>";
  }
  if ( $name == "SRC" )
  {
   echo "<tr><td align='left' valign='top' width='120' >";
   if (count($attrs)) {
       foreach ($attrs as $k => $v) {
           if ($k == "MEANING") 
		   {echo "$v (เดิม) </td><td align='left' valign='top' >
		   		  <input name='$name' type='text' size='50' readonly='true' class='textbox' value='";}
       }
   }
  }
  if ( $name == "ATL" )
  {
   echo "<tr><td align='left' valign='top' width='120' >";
   if (count($attrs)) {
       foreach ($attrs as $k => $v) {
           if ($k == "MEANING") 
		   {echo "$v </td><td align='left' valign='top' >
		   		  <input name='$name' type='text' size='50' class='textbox' value='";}
       }
   }
  }
   if ( $name == "WIDTH" || $name == "HEIGHT" )
  {
   echo "<tr><td colspan='2' align='left' height='2' >";
   echo "<input type='hidden' name='$name' value='";
  }
  /////////////////// <description> element //////////////////
  if ( $name == "DESCRIPTION" )
  {
   echo "<tr><td align='left' valign='top' width='120' >";
   if (count($attrs)) {
       foreach ($attrs as $k => $v) {
           if ($k == "MEANING") 
		   {echo "$v </td><td align='left' valign='top' ><textarea name='$name' cols='50' rows='5' class='textbox'>";}
       }
   }
  }
  /////////////////// <info> element //////////////////
  if ( $name == "INFO" )
  {
   echo "<tr><td align='left' valign='top' width='120' >";
   if (count($attrs)) {
       
	   $about;
	   
	   foreach ($attrs as $k => $v) {
           if ($k == "ABOUT") 
		   {
		   	 $about = $v;
			 echo "<input type='hidden' name='infoabout' id='infoabout'  value='$v' />";
		   }
		   if ($k == "MEANING") 
		   { echo "$v </td><td align='left' valign='top' >";
		   	 echo "<input type='hidden' name='infomeaning' id='infomeaning'  value='$v' />";
		     echo "<textarea name='$about' cols='50' rows='5' class='textbox'>";}
       }
   }
  }
   
   $tempname = "$name";
   
   $depth[$parser]++;
}

function endElement($parser, $name) 
{
   global $depth;

  if ( $name == "TITLE" || $name == "ENGTITLE" || $name == "ATL" || $name == "WIDTH" || $name == "HEIGHT")
  {
  	echo "' /></td></tr>";
  }
  if ( $name == "DESCRIPTION" || $name == "INFO" )
  {
  	echo "</textarea></td></tr>";
  }
  if ( $name == "SRC" )
  {
  	echo "' /></td></tr>";
	echo "<tr><td align='left' valign='top' width='120' >เปลี่ยนเป็นรูปใหม่</td><td align='left' valign='top' >";
	echo "<input type='file' name='newpicfile' id='newpicfile' size='40' class='textbox' /><br />";
	echo "<span class='orangefont'>** รูปไม่ควรเกิน 500x300 พิกเซลและขนาดไม่เกิน 300 Kb <br />
		  และต้องเป็นชนิด JPEG หรือ GIF เท่านั้น</span></td></tr>";
  }
  if ( $name == "PICTURE" )
  {
  	echo "<tr><td colspan='2' align='left' height='10' ></td></tr>";
  }
   
   $depth[$parser]--;
}

function characterData($parser, $data) 
{

    global $tempname;
    if ( $tempname == "TITLE" || $tempname == "ENGTITLE" || 
		 $tempname == "SRC" || $tempname == "ATL" || 
		 $name == "WIDTH" || $name == "HEIGHT" || 
		 $tempname == "DESCRIPTION" || $tempname == "INFO" )
  	{
		echo "$data";
  	}
}


//////////////////////////

echo "<form action='app_genxmlafteredit.php' method='post' target='_self' name='form1' id='form1' enctype='multipart/form-data' >
		<table width='580' border='0' cellspacing='10' cellpadding='5'>";
echo "<tr><td colspan='2' align='left' class='headline' >
		ท่านกำลังแก้ไขข้อมูล เรื่อง <font color='#DE4B11'>$nametitle</font>
	  </td></tr>";
echo "<tr><td colspan='2' align='left' >
		<span class='orangefont'>** ในการแก้ไขข้อมูล สามารถแทรก code html ลงใน textbox เพื่อควบคุมการแสดงผลได้ </span><br />
		<span class='lightfont'>* เอกสารนี้ใช้ UTF-8 encoding</span>
	  </td></tr>";
echo "<tr><td colspan='2' align='left' >&nbsp;";
echo "<input type='hidden' name='filename' id='filename' value='$nametitle' />";	 
echo "<input type='hidden' name='fileurl' id='fileurl' value='$file' />";
echo "<input type='hidden' name='mylibtype' id='mylibtype'  value='$libtype' />";	   
echo "</td></tr>";

/////////////////////////	  

$xml_parser = xml_parser_create();
xml_set_element_handler($xml_parser, "startElement", "endElement");
xml_set_character_data_handler($xml_parser, "characterData");

if (!($fp = fopen($file, "r"))) {
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

echo "<tr><td colspan='2' align='center' >
		<input type='submit' name='SAVE' class='button' value='Submit >>' />
	  </td></tr>";
echo "</table></form>";






}
else ///////ไม่มี session จะไม่ทำงาน //////// 
{echo "<a href='app_index.php' target='_top'>คุณยังไม่ได้ login กรุณา login ก่อน</a>";}




echo "</body></html>";
?> 