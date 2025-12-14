<? header("Content-Type: text/vnd.wap.wml");
     echo"<?xml version=\"1.0\"?>\n";
     echo"<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD 
WML 1.3//EN\" \"http://www.wapforum.org/DTD/wml13.dtd\">\n";
?>
<wml>
<card id="checkpwd" title="Insurance system" newcontext="true"> 
<p align="center" > 
<?
include("phpFunctionDB.php");	
if( Login($Anick,$Apwd,$Id))
	{
	echo"Username: $Anick  <br/>";
	echo"ID : $Id <br/> ";
	echo"<a href=\"menu.wml?Anick=$Anick\">GO TO MAIN MENU --> </a><br/>";
	}
else 
	{
	echo"Username and Password  are Wrong <br/>";
	echo"<a href=\"login.wml\">GO TO LOGIN AGAIN </a><br/>"	;
	}
?>
</p>
</card>
</wml>