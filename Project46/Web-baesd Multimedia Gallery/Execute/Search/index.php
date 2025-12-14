<?
if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
        die ("You can't access this file directly...");
}

require_once("mainfile.php");
$module_name = basename(dirname(__FILE__));
get_lang($module_name);
 include("header.php");
   OpenTable();
   	
	?>
<html> 
<head> 
<title>Search a File </title> 
</head> 
<center>
<body bgcolor="#FFFFFF">
<form enctype="multipart/form-data" name="frmUploadFile" action="../nuke/modules.php?name=Search&&file=searchmanage" method="post">
<table border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" width="100%">
<tr> 

</tr> 
<tr>
<td width="15%" bgcolor="#CDB38B"> 
<br>
<p style="margin-left: 10"><font face="Verdana" size="2"> 
Search:</font></td>
<td width="100%" bgcolor="#CDB38B"> 
<br>
<input type="text" name="filesearch" size="20" maxlength="100"> 
<font face="Verdana" size="1">&nbsp;<input height="3" type="submit" value="Search " name="cmdSubmit">
</td>
</tr>
<tr> 
<td width="100%" bgcolor="#CDB38B" height="4" colspan="2"> 
<p style="margin-left: 10"><b><font face="Verdana" size="2" color="#000000"> 
</font></b></td>
</tr> 
<tr>

</tr>
<tr>

</tr>
</table> 

</form>
	
</center>
</body> 
</html>
<?
	CloseTable();
 include("footer.php");
	?>
	