<?php
/*
/////////// ไฟล์นี้สำหรับสร้างฟอร์ม เพื่อนำไปเขียน code XML //////////////
////////// โดยรับประเภทหมวดหมู่ของเอกสารมาจาก app_mainadd.html ////
*/
session_start();

include("app_header.php");

$file = $_POST['file']; //xxx_link.xml
$libtype = $_POST['libtype']; //ประเภทหมวดหมู่เอกสาร
$nametitle = $_POST['submit'];


$vservice = "service";
$vsearch = "search";
$voffice = "office library";
$vfuture = "future library";
$vfaculty = "faculty library";

///////////////// MAIN /////////////////////////////////////////////////
if (isset($_SESSION["valid_user"])) { 
?>

<form action='app_savenewxml.php' method='post' target='_self' name='form' id='form' enctype='multipart/form-data' onSubmit='check()' >
<table width='580' border='0' cellspacing='10' cellpadding='5'>
		
<?php
echo "<tr><td colspan='2' align='left' class='headline' >
		ท่านกำลังสร้างเอกสาร ในหมวดของ <font color='#DE4B11'>$nametitle</font>
	  </td></tr>";
echo "<tr><td colspan='2' align='left' >
		<span class='orangefont'>** ในการแก้ไขข้อมูล สามารถแทรก code html ลงใน textbox เพื่อควบคุมการแสดงผลได้ </span><br />
		<span class='lightfont'>* เอกสารนี้ใช้ UTF-8 encoding</span>
	  </td></tr>";
echo "<tr><td colspan='2' align='left' >&nbsp;";

echo "<input type='hidden' name='filename' id='filename' value='".$nametitle."' />";
//เพื่อเก็บชื่อหมวดหมู่ ภาษาไทย ไว้ส่งต่อ เช่น แนะนำห้องสมุดคณะ

echo "<input type='hidden' name='mylibtype' id='mylibtype'  value='".$libtype."' />";	
//เก็บประเภทหมวดหมู่เป็นภาษาอังกฤษ เช่น faculty library
 
echo "</td></tr>";

////////////////////////////////////// SET TITEL ENGTITLE MEANING ATT val ////////////////////////////////////////
$title_meaning;
$engtitle_meaning;

if($libtype == $vfaculty)
{	
	$title_meaning = "หัวข้อ/ประเด็นยุทธศาสตร์ **";
	$engtitle_meaning = "หัวข้อย่อย(ถ้ามี)";
}
else
{	
	$title_meaning = "หัวข้อภาษาไทย **";
	$engtitle_meaning = "หัวข้อภาษาอังกฤษ";
}

//////////////////////////////////////////////////////////////////////////////////////////////////

echo "<tr>";
echo "<td align='left' valign='top' width='120' >".$title_meaning."</td>";
echo "<td align='left' valign='top' >";
echo "<input name='TITLE' type='text' size='50' class='textbox' /> **";
echo "</td></tr>";

echo "<tr>";
echo "<td align='left' valign='top' width='120' >".$engtitle_meaning."</td>";
echo "<td align='left' valign='top' >";
echo "<input name='ENGTITLE' type='text' size='50' class='textbox' />";
echo "</td></tr>";

/////////////////// <picture> element and child node//////////////////

echo "<tr><td colspan='2' align='left' height='10' ></td></tr>";

echo "<tr>";
echo "<td align='left' valign='top' width='120' >คำอธิบายรูป</td>";
echo "<td align='left' valign='top' >";
echo "<input name='ATL' type='text' size='50' class='textbox' />";
echo "</td></tr>";

echo "<tr>";
echo "<td align='left' valign='top' width='120' >รูปภาพประกอบ</td>";
echo "<td align='left' valign='top' >";
echo "<input type='file' name='newpicfile' id='newpicfile' size='40' class='textbox' /><br />";
echo "<span class='orangefont'>** รูปไม่ควรเกิน 500x300 พิกเซลและขนาดไม่เกิน 300 Kb <br />
	  และต้องเป็นชนิด JPEG หรือ GIF เท่านั้น</span>";
echo "</td></tr>";

/////////////////// <description> element and child node//////////////////

echo "<tr>";
echo "<td align='left' valign='top' width='120' >คำอธิบายโดยย่อ</td>";
echo "<td align='left' valign='top' >";
echo "<textarea name='DESCRIPTION' cols='50' rows='5' class='textbox'></textarea>";
echo "</td></tr>";

/////////////////// <info> element and child node//////////////////

if($libtype == "$vservice")
{
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >รายละเอียดการบริการ</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='detail' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
	
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >ระเบียบการใช้บริการ</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='rule' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
	
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >เวลาให้บริการ</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='time' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
	
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >สถานที่ให้บริการ</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='place' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
	
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >Link ที่เกี่ยวข้อง</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='link' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
}
if($libtype == "$vsearch")
{
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >รายละเอียดการบริการ</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='detail' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
	
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >สถานที่ให้บริการ</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='place' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
	
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >Link ที่เกี่ยวข้อง</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='link' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
}
if($libtype == "$voffice")
{
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >ภาระงานที่รับผิดชอบ</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='work' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
}
if($libtype == "$vfuture")
{
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >นโยบาย / วัตถุประสงค์</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='goal' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
	
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >แนวทางการพัฒนาโดยภาพรวม</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='plan' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
	
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >ตัวชี้วัด</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='KPI' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
	
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >กลยุทธ์การดำเนินงาน (โครงการ)</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='process' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
}
if($libtype == "$vfaculty")
{
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >ติดต่อห้องสมุด</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='contact' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
	
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >เวลาให้บริการ</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='time' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
	
	echo "<tr>";
	echo "<td align='left' valign='top' width='120' >Link ที่เกี่ยวข้อง</td>";
	echo "<td align='left' valign='top' >";
	echo "<textarea name='link' cols='50' rows='5' class='textbox'></textarea>";
	echo "</td></tr>";
}

///////////////////// รับค่าวันเวลา เพื่อกำหนดชื่อไฟล์ที่จะเซฟ /////////////////////////////////

$datetime = date("dmYHis");
echo "<input type='hidden' name='forpostfix' id='forpostfix' value='".$datetime."' />";

//////////////////////////////////////////////////////////////////////////////////
?>

<tr><td colspan='2' align='center' >

<input type='hidden' name='fileurl' id='fileurl' value='' />

<input type='submit' name='SAVE' class='button' value='Submit >>' />
</td></tr>

</table>
</form>

<?php 
}
else {echo "<a href='app_index.php' target='_top'>คุณยังไม่ได้ login กรุณา login ก่อน</a>";}
?>

<script type="text/javascript">

/*/////////////////////สร้างชื่อไฟล์ filename แล้วมาเก็บไว้ในฟอร์ม เพื่อส่งให้ไฟล์ php เซฟเป็นชื่อนี้ .xml ///////////////////*/
function setValue()
{
	var filename;
	var prefix;
	var postfix = document.form.forpostfix.value;
	var type = document.form.mylibtype.value;
	
	if(type == "service" )
	{
		prefix = "service_";
	}
	if(type == "search" )
	{
		prefix = "search_";
	}
	if(type == "office library" )
	{
		prefix = "office_";
	}
	if(type == "future library" )
	{
		prefix = "future_";
	}
	if(type == "faculty library" )
	{
		prefix = "library_";
	}
	
	filename = prefix + postfix ;
	
	alert("This file will save as :" + filename + ".xml");
	
	document.form.fileurl.value = filename;
}

/////////////ตรวจสอบว่ากรอก หัวข้อภาษาไทยแล้วจึงให้ผ่านไปยังหน้าต่อไปได้ ////////////////
function check()
{
	setValue();
    
	var filename = document.form.fileurl.value;
	var value = document.form.TITLE.value;
 	   
        if ( value == '' )
        {
           alert("กรุณากรอก หัวข้อภาษาไทย");
		   document.form.TITLE.focus();
		   return false;
        }
		if(filename == '')
		{
		   alert("file name INVALID !!");
		   return false;
		}
        else
		{           
		   return true;
		}
}

</script>

</body>
</html>


