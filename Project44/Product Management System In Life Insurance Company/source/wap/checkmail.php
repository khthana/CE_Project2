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
	{	echo"Username: $Anick  <br/>";
		echo"ID : $Id <br/> ";
		//echo"<anchor>";
		echo"<a href=\"mail.php?Anick=$Anick\">GO TO MAILBOX --> </a><br/>"	;
		//echo"<go href=\"mail.php?Anick=$Anick\">;
		//echo"<setvar name = \"Anick\" value=\"$Anick\"/>";
		//echo"</go>";
		//echo"</anchor><br/>";
	}
else 
	{
	echo"Username and Password  are Wrong <br/>";
	echo"<a href=\"menu.php\">GO TO MENU AGAIN </a><br/>"	;
	}
?>
</p>
</card>
</wml>