<?php

if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
        die ("You can't access this file directly...");
}

require_once("mainfile.php");
$module_name = basename(dirname(__FILE__));
get_lang($module_name);
 include("header.php");
   OpenTable();
 //---------------------------------------------------

?>
<html> 
<head> 
<title> Upload a File </title> 
</head> 

<body bgcolor="#FFCCFF">
<form enctype="multipart/form-data" name="frmUploadFile" action="modules.php?name=uploadfiles&&file=infofile" method="post">
<center><table align=center border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" width="80%">
<tr> 
<td align=center width="100%" bgcolor="#FF9900" height="40" colspan="2"> 
<p style="margin-left: 10"><b><font face="Verdana" size="2" color="#FFFFFF"> 
Upload a File</font></b></td>
</tr> 
<tr> 
<td width="100%" bgcolor="#FFE3BB" colspan="2"> 
<p style="margin-left: 10; margin-right: 10"><font face="Verdana" size="2"> 
</td>

</tr> 

<tr> 
<td width="15%" bgcolor="#FFD3BB"> 
<p style="margin-left: 10"><font face="Verdana" size="2"> &nbsp;&nbsp;&nbsp;
Title:</font></td> 
<td width="85%" bgcolor="#FFD3BB"> 
<input type="text" name="strDesc" size="20" maxlength="50"></td>
</tr> 

<!--  
<tr>
<td width="15%" bgcolor="#CDB38B"> 
<p style="margin-left: 10"><font face="Verdana" size="2"> 
Album:</font></td>
<td width="85%" bgcolor="#CDB38B"> 
<input type="text" name="strDesc" size="20" maxlength="50"></td></tr>
-->

<tr> 
<td width="15%" bgcolor="#FFF3BB"> 
<p style="margin-left: 10"><font face="Verdana" size="2"> File Location:</font></td> 
<td width="85%" bgcolor="#FFF3BB"> 
<font face="Verdana" size="2"> 
<input type="file" name="fileUpload" size="20"> </font></td>
</tr>


<tr> 
<td width="15%" bgcolor="#CCFFFF"> 
<p style="margin-left: 10"><font face="Verdana" size="2"> File Thumbnail Location:</font></td> 
<td width="85%" bgcolor="#CCFFFF"> 
<font face="Verdana" size="2"> 
<input type="file" name="fileUpload1" size="20"> </font></td>
</tr>


<tr> 
<td width="15%" bgcolor="#FFFF99"> 
<p style="margin-left: 10"><font face="Verdana" size="2">Catagory File:</font></td> 
<td width="85%" bgcolor="#FFFF99"> 
<font face="Verdana" size="3"> 
<input type="radio" name="cat" size="20"value="1" checked>private<input type="radio" name="cat" size="20"value="0">public</font><br></td>
</tr>


<tr> 

<td width="15%" bgcolor="#FFD3BB"> 

<p style="margin-left: 10"><font face="Verdana" size="2"> 
Description:</font></td> 
<td width="85%" bgcolor="#FFD3BB"> 
<br><textarea  name="description" size="20" maxlength="80"rows="10"></textarea>
<br><br>

</tr>

<tr> 
<td width="15%" bgcolor="#99CC00"> 
<td width="85%" bgcolor="#99CC00"> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Upload this file" name="cmdSubmit"size="20"><br><br></td>
</tr>
</tr>

</table>
</form>
</body> 
</html>
<?
 CloseTable();
 include("footer.php");
	
?>
