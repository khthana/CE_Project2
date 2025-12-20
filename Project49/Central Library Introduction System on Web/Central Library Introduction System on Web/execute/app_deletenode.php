<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php 
session_start();
?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:::ระบบจัดการเอกสารสำหรับระบบแนะนำหอสมุดกลางบนเว็บ:::</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
	margin-left: 10px;
	margin-top: 10px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>

<body>
<?php 
if (isset($_SESSION["valid_user"])) { 
?>
<table width='580' border='0' cellspacing='10' cellpadding='0'>
<tr><td align="center">
<form action="" name="inform" >
<?php
	//============รับค่าจาก app_filechoosedelete.php เพื่อเลือกไฟล์และ <subject> ที่ต้องการลบ ==============//
	
	$linkkey = $_POST['mylink'];
	$libtype = $_POST['libtype1'];
	$xxx_linkfile;
	
	if($libtype == "service"){ $xxx_linkfile = "service_link.xml"; }
	if($libtype == "search"){ $xxx_linkfile = "search_link.xml"; }
	if($libtype == "office library"){ $xxx_linkfile = "office_link.xml"; }
	if($libtype == "future library"){ $xxx_linkfile = "future_link.xml"; }
	if($libtype == "faculty library"){ $xxx_linkfile = "library_link.xml"; }
	
	echo '<p>&nbsp;</p>';
	echo '<p>';
	echo 'ชื่อไฟล์ : ';
	echo '<input name="key" id="key" type="text" class="loginbox" readonly="true" size="40" value="'.$linkkey.'"  /><br />';
	echo 'แก้ไขเมนูย่อยใน : ';
	echo '<input name="xxxlinkfile" id="xxxlinkfile" type="text" class="loginbox" readonly="true" size="35" value="'.$xxx_linkfile.'"  />';
	echo '</p>';
	
	//===============================================================================================//
?>
</form>
<script type="text/javascript">
//========== global val ===========//

var xmlDoc;
var xmldata;
var newdata;
var datatowrite;
var parent;
var isxmlhead = '<?xml version="1.0" encoding="utf-8"?>\n<?DOCTYPE service SYSTEM "link.dtd" ?>\n<?xml-stylesheet type="text/xsl" href="link.xsl" ?>\n';


//==========เปิด xxx_link.xml เพื่อลบ <subject> ที่เลือก "ลบ" ================//

var xmlfile; 
/*เก็บ xxx_link.xml ที่ต้องการไปแก้ไข*/
var delkey;  
/*เก็บ NodeValue ของ subject/link ที่จะเป็น key ว่าจะลบ <subject> ที่ มี <link>delkey</link>*/

function passKeyValue()
{
	xmlfile = document.inform.xxxlinkfile.value;
	delkey = document.inform.key.value;
}

////////////////////////////////////////// call function //////////////////////////////////////////////

//============โหลด xml ที่ชื่อ xmlfile ลงใน DOM =============================//

function loadXML()
{
	passKeyValue();

//load xml file
// code for IE
if (window.ActiveXObject)
{
	xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
	xmlDoc.async=false;
	xmlDoc.load(xmlfile);
	
}
// code for Mozilla, Firefox, Opera, etc.
else if (document.implementation && document.implementation.createDocument)
{
	xmlDoc=document.implementation.createDocument("","",null);
	xmlDoc.load(xmlfile);
	
}
else
{
	alert('Your browser cannot handle this script');
}

}

//=================== หา array index ของ <subject> เพื่อบอกว่าจะลบ node ที่เท่าไหร่ ======================//
function checkID(tagname, value)
{
	var x=xmlDoc.getElementsByTagName(tagname);
	var temp;
	var j;
	
	for (i=0;i<x.length;i++)
  	{
  		temp = x[i].childNodes[0].nodeValue;
		if (temp == value)
		{
			j = i;
		}
  	}
	return j;
}

//=================== สร้าง text ที่ใช้ DOM ที่แก้ไขแล้ว เพื่อนำไปเซฟทับลงในไฟล์ ======================//
function creatDataXML(rootelement)
{
	var j=xmlDoc.getElementsByTagName('subject');

	var roottype = rootelement.getAttribute('type');
	var roottitle = rootelement.getAttribute('title');

	xmldata = '<menulink type="' + roottype + '" title="' + roottitle + '">\n';
	newdata = '';

	for (i=0;i<j.length;i++)
  	{
		temp = '<subject>\n<name>' + j[i].firstChild.childNodes[0].nodeValue + '</name>\n' + '<link>' + j[i].lastChild.childNodes[0].nodeValue + '</link>\n' + '</subject>\n';
		newdata = newdata + temp ;
  	}
}

function toDataString()
{
	textdata = isxmlhead + xmldata + newdata + '</menulink>';
	return textdata;
}
//=======================================================================================//


/////////////////////////////////// MAIN PROGRAM /////////////////////////////////////////////////////
loadXML();

var id ;
	id = checkID("link", delkey);
var x=xmlDoc.getElementsByTagName("subject")[id];

parent = xmlDoc.getElementsByTagName("subject")[id].parentNode;


//=================ฟังก์ชั่น สำหรับจัดการ output ออกหน้าจอเพื่อบอกว่าจะลบอะไร ================//
showDelData(id);

function showDelData(i)
{
	var j=xmlDoc.getElementsByTagName("subject");
	
	document.write("<p align='center'>คุณต้องการ ลบ</p>");
	document.write("<p align='center'>");
	document.write("หัวข้อ :" + j[i].firstChild.childNodes[0].nodeValue);
	document.write("<br />");
	document.write("ชื่อไฟล์ :" + j[i].lastChild.childNodes[0].nodeValue);
	document.write("</p>");
	document.write("<p align='center'>ออกจากระบบ ใช่หรือไม่ ?</p>");
}
//================================================================================//

//___________________ลบ subject node และโหนดลูกทั้งหมดที่มี <link> เก็บค่า delkey ไว้__________________//

deleted_node = parent.removeChild(x);


//============= เรียกฟังก์ชั่น เพื่อเขียน code xml ใหม่ จาก DOM ที่ ลบโหนดแล้ว ================//
creatDataXML(parent);
datatowrite = toDataString();
//สร้างข้อมูลสำหรับเอกสาร xxx_link.xml ใหม่

</script>

<form action="app_deletexml.php" method="post" name="form" target="_self" onSubmit="setValue()">
<input name="datafromjs" id="datafromjs" type="hidden" value="" />
<input name="creatfile" id="creatfile" type="hidden" value="" />
<input name="unlinkfile" id="unlinkfile" type="hidden" value="" />
<input name="submit" type="submit" value="ตกลง" class="button" />
</form>

</td></tr></table>
<?php 
}
else {echo "<a href='app_index.php' target='_top'>คุณยังไม่ได้ login กรุณา login ก่อน</a>";}
?>

<script type="text/javascript">

/*/////////////////////นำ code xml ที่แก้ไขแล้วมาเก็บไว้ในฟอร์ม เพื่อส่งให้ไฟล์ php เซฟ code ลงในเอกสารเดิม ///////////////////*/
function setValue()
{
	document.form.datafromjs.value = datatowrite;
	document.form.creatfile.value = xmlfile;
	document.form.unlinkfile.value = delkey;
	
	alert("ทำการ Update File: " + xmlfile);
}
</script>

</body>
</html>
