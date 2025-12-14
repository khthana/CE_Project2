<?
if(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }

if(isset($_GET['task']) AND $_GET['task'] == "addsmilie") {
$server_array = explode("/", $_SERVER['PHP_SELF']);
$server_info = implode("/", $server_array);
$prefix = str_replace("richtext.php", "images/smilies", "http://".$_SERVER['HTTP_HOST'].$server_info);
echo "
<html>
<head>
<title>Insert Smilie</title>
<style type='text/css'>
body { margin: 15px; }
</style>
<script language='JavaScript'>
<!--
function addtheSmilie(imageURL) {
self.parent.addSmilie(imageURL, 'contents');
window.close();
}
// -->
</script>
<script language=\"JavaScript\" type=\"text/javascript\" src=\"richtext.js\"></script>
</head>
<body>
<table cellpadding='0' cellspacing='0' width='100%' height='100%'>
<tr>
<td align='center' valign='center'>
";


// READ FROM SMILIES DIRECTORY
$dirname="images/smilies";
$dh = @opendir($dirname) or die("Error: Failed to open smilies directory.");

$filelist = array();
$c = 0;
while(!(($file = @readdir($dh)) === false)) {
if(!is_dir("$dirname/$file")) {
if(eregi("gif|jpeg|pjpeg|png", $file, $array)) {
$filelist[$c] = $file;
$c++;
}}}
closedir($dh);

sort($filelist);
$total = count($filelist);
$c = 0;
while($c < $total) {
echo "
<a href='#' onClick=\"addtheSmilie('$prefix/$filelist[$c]')\"><img src='images/smilies/$filelist[$c]' border='0' style='margin: 5px;'></a>";
$c++;
}

echo "
</td></tr></table>
</body>
</html>
";
exit();
}
##############################################END SMILIE##################################################
/*
$cut_string = substr($_POST['contents'],0,-34);
$entry_info[contents] = str_replace("&amp;", "&", str_replace("&gt;", ">", str_replace("&lt;", "<", stripslashes($cut_string))));

$new = str_replace("<p style=\"margin: 0px;\"></p>","",$entry_info[contents]);
$cut_error = trim(rtrim(substr($_POST['contents'],-32)));
if ($cut_error=="<p style=\"margin: 0px;\"></p>") {$content = "true"; }
else {$content = "false";}

echo "
		Content : ".$entry_info[contents]."<br>
		Content (no replace) : ".$_POST['contents']."<br>
		Test1 : ".$content."<br>
		Test2 : ".trim(rtrim(substr($_POST['contents'],-32)))."<br>
		Position : ".$new."<br>
		Title : ".$_POST['title_entry']."<br>
		Category : ".$_POST['cat_entry']."<br>
		Permission : ".$_POST['permission']."<br>
		Allow Comment : ".$_POST['comment_allow']."<br>
		Recommend : ";
		($_POST['crecommend'] != 'yes') ? print "no": print $_POST['crecommend'];
*/
##############################################BEGIN PAGE##################################################
echo "<script language='JavaScript'>
<!-- 
function preloader() {
bold_d = new Image(); 
bold_d.src = 'images/bold_d.gif';
italic_d = new Image(); 
italic_d.src = 'images/italic_d.gif';
underline_d = new Image(); 
underline_d.src = 'images/underline_d.gif';
left_just_d = new Image(); 
left_just_d.src = 'images/left_just_d.gif';
centre_d = new Image(); 
centre_d.src = 'images/centre_d.gif';
right_just_d = new Image(); 
right_just_d.src = 'images/right_just_d.gif';
justifyfull_d = new Image(); 
justifyfull_d.src = 'images/justifyfull_d.gif';
hr_d = new Image(); 
hr_d.src = 'images/hr_d.gif';
numbered_list_d = new Image(); 
numbered_list_d.src = 'images/numbered_list_d.gif';
list_d = new Image(); 
list_d.src = 'images/list_d.gif';
outdent_d = new Image(); 
outdent_d.src = 'images/outdent_d.gif';
indent_d = new Image(); 
indent_d.src = 'images/indent_d.gif';
textcolor_d = new Image(); 
textcolor_d.src = 'images/textcolor_d.gif';
bgcolor_d = new Image(); 
bgcolor_d.src = 'images/bgcolor_d.gif';
hyperlink_d = new Image(); 
hyperlink_d.src = 'images/hyperlink_d.gif';
image_d = new Image(); 
image_d.src = 'images/image_d.gif';
eraser_d = new Image(); 
eraser_d.src = 'images/eraser_d.gif';
smilie_d = new Image(); 
smilie_d.src = 'images/eraser_d.gif';
}

// -->
</script>

<form name='info' action='' method='POST' onsubmit='return submitForm();'>

<div class=\"center_content\">
	Title name&nbsp;:&nbsp;<input name=\"title_entry\" type=\"text\" size=\"30\" maxlength=\"100\">
	&nbsp;&nbsp;&nbsp;&nbsp;<input name='crecommend' type='checkbox' value='yes'>&nbsp;Recommend<br><br>
	Category : 	<select  style=\"width:100px;\"name=\"cat_entry\" size=\"1\">";
	$i = 0;
	while ($add_blog_category[$i]) { 
		print "<option value=\"".$add_blog_category_id[$i]."\">".$add_blog_category[$i]."</option>";
		$i++;
	}
print "			</select>
	&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"javascript:displayWindow('manage_category.php',370,318)\">Manage Category</a>
</div>

<script language=\"JavaScript\" type=\"text/javascript\" src=\"richtext.js\"></script>
<script language=\"JavaScript\" type=\"text/javascript\">
<!--
function fill() {
var oRTE = document.getElementById('contents');
if (document.all) {
window.document.preview.contents.value = frames['contents'].document.body.innerHTML;
} else {
window.document.preview.contents.value = oRTE.contentWindow.document.body.innerHTML;
}
window.document.preview.title.value = window.document.info.title.value;
window.document.preview.month.value = window.document.info.month.options[window.document.info.month.selectedIndex].value;
window.document.preview.day.value = window.document.info.day.options[window.document.info.day.selectedIndex].value;
window.document.preview.year.value = window.document.info.year.options[window.document.info.year.selectedIndex].value;
window.document.preview.hour.value = window.document.info.hour.options[window.document.info.hour.selectedIndex].value;
window.document.preview.minute.value = window.document.info.minute.options[window.document.info.minute.selectedIndex].value;
window.document.preview.ampm.value = window.document.info.ampm.options[window.document.info.ampm.selectedIndex].value;
if(window.document.info.ec_id.options) {
 window.document.preview.ec_id.value = window.document.info.ec_id.options[window.document.info.ec_id.selectedIndex].value;
} else {
 window.document.preview.ec_id.value = window.document.info.ec_id.value;
}
if(window.document.info.comments[0]) {
 if(window.document.info.comments[0].checked) {
 window.document.preview.comments.value = '1';
 } else {
 window.document.preview.comments.value = '0';
 }
} else {
 window.document.preview.comments.value = window.document.info.comments.value;
}
if(window.document.info.trackbacks[0]) {
 if(window.document.info.trackbacks[0].checked) {
 window.document.preview.trackbacks.value = '1';
 } else {
 window.document.preview.trackbacks.value = '0';
 }
} else {
 window.document.preview.trackbacks.value = window.document.info.trackbacks.value;
}
}
function submitForm() {
var title_temp = document.info.title_entry.value;
if (title_temp) {
	updateRTE('contents');
	return true;
} else {
	alert('กรุณาใส่ข้อมูลให้ครบ');
	return false;
}
}
initRTE(\"images/\", \"\", \"\");
//-->
</script>
<script language=\"JavaScript\" type=\"text/javascript\">
<!--
writeRichText('contents', '<P style=\"margin: 0px;\">$entry_default</P>', '100%', 300, true, false);
//-->
</script>

<br>

<table cellpadding='0' cellspacing='0' class='page'>
";

echo "
</table>

<div class='center_content'><table width='100%' border='0' cellspacing='0' cellpadding='0'>
<tr>
	<td >&nbsp;สถานะ Entry (Permission)&nbsp;:&nbsp;</td>
	<td ><input name='permission' type='radio' value='show' checked>&nbsp;Show</td>
	<td ><input name='permission' type='radio' value='hide'>&nbsp;Hide</td>
</tr>
<tr>
	<td>การอนุญาตให้Comment &nbsp;:</td>
	<td colspan='2'><select name='comment_allow' size='1'  style='width:250px;'>
							<option value='allow-show'>อนุญาตให้ comment + แสดง comment</option>
							<option value='allow-hide'>อนุญาตให้ comment + ไม่แสดง comment</option>
							<option value='notallow'>ไม่อนุญาตให้ comment</option></td>
</tr>
</table></div>

<br>
<table cellpadding='0' cellspacing='0'>
<tr>
<td>
<input type='submit' name='submit' class='button' value='Add new Entry'>&nbsp;
</td>
<td>
<input type='hidden' name='task' value='doadd'>
</td>
</form>";
/*<form action='preview_entry.php?userid=".$_COOKIE['user_id']."&action=addentry' method='POST' target='_blank' name='preview'>
<td>
<input type='submit' name='submit' class='button' value='Preview Entry' onClick='fill();'>
<input type='hidden' name='contents' value=''>
</td>
</form>*/
print "</tr>
</table>

<script language=\"JavaScript\" type=\"text/javascript\">
<!--
appendEvent = function(el, evname, func) {
 if (el.attachEvent) { // IE
   el.attachEvent('on' + evname, func);
 } else if (el.addEventListener) { // Gecko / W3C
   el.addEventListener(evname, func, true);
 } else {
   el['on' + evname] = func;
 }
};
appendEvent(window, 'load', windowonload);

function windowonload() { window.document.info.title_entry.focus(); preloader(); }
//-->
</script>
";
?>