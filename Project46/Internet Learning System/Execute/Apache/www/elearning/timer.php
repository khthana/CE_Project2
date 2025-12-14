<?php
session_start();
?>
<html>
<head>
<title>แบบทดสอบ</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<link rel='stylesheet' type='text/css' href='style.css' />

<!--
<script language="JavaScript">
function openwin(url,win_name,features) 
{ 
  window.open(url,win_name,features);
}
</script>
-->

<SCRIPT LANGUAGE="JavaScript">
var ms = 0;
var sed = 0;
var se = 0;
var state = 0;
/*
function startstop() {
if (state == 0) {
state = 1;
then = new Date();
then.setTime(then.getTime() - ms);
} else {
state = 0;
now = new Date();
ms = now.getTime() - then.getTime();
document.stpw.time.value = ms;
   }
}
function swreset() {
state = 0;
ms = 0;
document.stpw.time.value = ms;
}
function display() {
setTimeout("display();", 50);
if (state == 1)  {now = new Date();
ms = now.getTime() - then.getTime();
document.stpw.time.value = ms;
   }
}
*/
function counter() 
{
/*	
	if (state == 0) 
	{
*/
		state = 1;
		then = new Date();
		then.setTime(then.getTime() - ms);
/*
	} else {
		state = 0;
		now = new Date();
		ms = now.getTime() - then.getTime();
		document.stpw.time.value = ms;
	}
*/
}
function distime()
{

	setTimeout("distime();", 50);
	if (state == 1)  
	{
		now = new Date();
		ms = now.getTime() - then.getTime();
		sed = ms%1000;
		se = (ms-sed)/1000;
		document.stpw.time.value = se;
	}
}
function autopopupdel3() 
{ 
//	window.open("index.php","elearning","toolbar=yes,scrollbars=yes,resizable=no,width=800,height=600");
//	window.open("index.php","elearning","toolbar=yes,scrollbars=yes,resizable=no,full");
//	setTimeout("self.close();",1000);
	distime();
	counter();
}
</SCRIPT>

</head>

<!--
<body onLoad="display()" onLoad="setTimeout('self.close()',5000)"
onLoad="JavaScript:openwin('index.php','WindowName','toolbar=yes,scrollbars=yes,resizable=no,width=800,height=600')">
-->

<body onLoad="autopopupdel3()">

<!--
<a href="JavaScript:openwin('index.php','WindowName','toolbar=yes,scrollbars=yes,resizable=no,width=800,height=600')">Open Window</a>
-->

<?php
/*
	global $time;
	$time = 1;
	$_SESSION['time'] = $time;
*/
	if(isset($_COOKIE["authen"]))
	{
?>

<FORM NAME="stpw">
  <div align="center" class="warning">Timer: 
    <INPUT Name="time" TYPE="text" size="5">
วินาที  </div>
</FORM>
<?php
	}
?>

</BODY>
</HTML>
