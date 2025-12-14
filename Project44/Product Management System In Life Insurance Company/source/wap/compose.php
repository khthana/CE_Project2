<? header("Content-Type: text/vnd.wap.wml");
     echo"<?xml version=\"1.0\"?>\n";
     echo"<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD 
WML 1.3//EN\" \"http://www.wapforum.org/DTD/wml13.dtd\">\n";
?>
<wml>
<card id="compose" title="Compose" newcontext="true">
<p align ="left">
<?
	include("phpFunctionDB.php");
	compose($sender,$to,$topic,$message);	
?>
<br/>
<a href="mail.php?Anick=<?echo "$sender"?>">Mail Box</a><br/>
</p>
</card>
</wml>
