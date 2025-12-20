<?php
session_start();

include("app_header.php");




if (isset($_SESSION["valid_user"])) { 
/********************ตรวจสอบ session ว่ามี user** แล้วจึงทำต่อ*******************/






$file = $_POST['file'];
$libtype = $_POST['libtype'];

$depth = array();

function startElement($parser, $name, $attrs) 
{
   global $depth;
   
   for ($i = 0; $i < $depth[$parser]; $i++) {
       echo "  ";
   }
   if ($name == "SUBJECT")
   {
   		echo "<tr><td align='center'><form action='app_editxmlfile.php' method='post' target='_self' >";
   }
   if ($name == "NAME")
   {
   		echo "<input type='submit' name='nametitle' id='nametitle' class='button' value='";
   }
   if ($name == "LINK")
   {
   		echo "<input type='hidden' name='mylink' id='mylink' value='";
   }
      
   $depth[$parser]++;
}

function endElement($parser, $name) 
{
   global $depth, $libtype;
   
   if ($name == "SUBJECT")
   {
   		echo "<input type='hidden' name='libtype1' id='libtype1' value='$libtype' />";
		echo "</form></td></tr>";
   }
   if ($name == "NAME")
   {
   		echo "' />";
   }
   if ($name == "LINK")
   {
   		echo "' />";
   }
   $depth[$parser]--;
}

function characterData($parser, $data) 
{
   echo "$data";
}


echo "<table width='580' border='0' cellspacing='10' cellpadding='0'>
	<tr><td align='center'>
		<p>&nbsp;</p>
		<strong>โปรดเลือกหัวข้อเอกสารที่ต้องการแก้ไข</strong>
		<p>&nbsp;</p>
	</td></tr>";


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

echo "</table>";



}
else ///////ไม่มี session จะไม่ทำงาน //////// 
{echo "<a href='app_index.php' target='_top'>คุณยังไม่ได้ login กรุณา login ก่อน</a>";}




echo "</body></html>";

?> 