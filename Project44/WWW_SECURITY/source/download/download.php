<?
//----------------------------------------------- log file
	if (getenv(HTTP_X_FORWARDED_FOR)){ 
		$ip=getenv(HTTP_X_FORWARDED_FOR); 
		} 
		else { 
		$ip=getenv(REMOTE_ADDR); 
		} 


	$ip = $ip." [".gethostbyaddr($ip)."]  --- ".$HTTP_SERVER_VARS["PHP_SELF"]."  ".date('[d M Y H:i]')." @ ".$HTTP_SESSION_VARS["uid"]." \r\n";

	$FILE = fopen("../phplog2.txt","a");
	fputs($FILE,$ip);
	fclose($FILE);
//-----------------------------------------------

if(isset($HTTP_GET_VARS["link_small"]))
{
	$link_small=$HTTP_GET_VARS["link_small"];
	if(isset($HTTP_GET_VARS["t11"]) and ($HTTP_GET_VARS["t11"]=="111")) 
		$link_small = "http://isag.ce.kmitl.ac.th/file/project_pdf/".$link_small;
	header("location:$link_small") ; 
}
?>
<HTML>
<head></head>
<script language="JavaScript"> 
<!--x
function auto_close(delai)
{
	setTimeout("self.close()",delai);
}
-->
</script>
<body>
<script>auto_close(1000);</script>
</body>
</HTML>

