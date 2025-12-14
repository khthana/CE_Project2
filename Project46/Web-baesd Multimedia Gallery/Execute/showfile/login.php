<html> 
<head> 
<title> Login to use owner file</title> 
</head> 
<?
//----------------------------Header for link----------------------------
if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
        die ("You can't access this file directly...");
}

require_once("mainfile.php");
$module_name = basename(dirname(__FILE__));
get_lang($module_name);
 include("header.php");
 OpenTable();
 //-----------------------------------------------------------------------------
		$ok=$_POST[ok];
		$ok=$_POST[ok];
		$id=$_GET[id];
		if($id==null){
			$id=$_POST[id2];
		}
		$user=$_POST[user];
		$pass=$_POST[pass];
		$dbServer = "localhost"; 
		$dbDatabase = "nuke"; 
		$dbUser = "root"; 
		$dbPass = ""; 
		$bool=0;
		//echo $id;
if($ok!=null){
		$sConn = mysql_connect($dbServer, $dbUser, $dbPass) 
		or die("Couldn't connect to database server"); 


		$dConn = mysql_select_db($dbDatabase, $sConn) 
		or die("Couldn't connect to database $dbDatabase"); 
            $pass=MD5($pass);
			//echo $pass;
			$sql="SELECT count(*) AS num FROM nuke_users WHERE username='".$user."' AND user_password='".$pass."';";
			$result=mysql_query($sql);
			$bool=mysql_result($result,0,"num");
			
}

if(!$bool){			
			
?>
<body bgcolor="#FFFFFF">
<form enctype="multipart/form-data" name="frmUploadFile" action="../nuke/modules.php?name=showfile&&file=login" target="_self" method="post">
<table border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" width="100%">
<tr> 
<td width="100%" bgcolor="#FF9900" height="40" colspan="2"> 
<p style="margin-left: 10"><b><font face="Verdana" size="2" color="#FFFFFF"> 
Login</font></b></td>
</tr> 
<tr> 
<td width="100%" bgcolor="#FFE3BB" colspan="2"> 

<p style="margin-left: 10; margin-right: 10"><font face="Verdana" size="2"> 

</td>

</tr> 

<tr> 
<td width="15%" bgcolor="#FFD3BB"> 
<p style="margin-left: 10"><font face="Verdana" size="2"> 
username:</font></td> 
<td width="85%" bgcolor="#FFD3BB"> 
<input type="text" name="user" size="20" maxlength="50"></td>
</tr> 


<!-- original file -->
<tr> 
<td width="15%" bgcolor="#FFF3BB"> 
<p style="margin-left: 10"><font face="Verdana" size="2">password:</font></td> 
<td width="85%" bgcolor="#FFF3BB"> 
<font face="Verdana" size="2"> 
<input type="password" name="pass" size="20"> <br>&nbsp;&nbsp;</font>
<input type="hidden" name="id2" value="<?echo $id;?>"/>
<input type="submit" value="ok"name="ok"></td>
</tr>

</table> 
</form>
</body> 
<?
}
else if($bool){
    session_register("user");
   echo "<center><a href =\"../nuke/modules.php?name=showfile&&file=showprivate \">show private</a>&nbsp;&nbsp;";
   echo "<a href =\"../nuke/modules.php?name=showfile&&file=showowner\">show owner</a></center>";
}
CloseTable();
 include("footer.php");
?>
</html>

