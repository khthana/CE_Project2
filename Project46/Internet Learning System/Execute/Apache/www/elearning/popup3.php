<?php
session_start();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">

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
		document.stpw.time.value = ms;
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

</HEAD>

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
			$len = 2;
			$pass = '';
			$lchar = 0;
			$char = 0;

			while($pass=='' || $pass==0)
			{
				 for($i = 0; $i < $len; $i++)
				{
					$char = rand(48, 57);
					$pass .= chr($char);
				}
			}
			print $pass;
?>

<FORM NAME="stpw">
Time:
<INPUT TYPE="text" Name="time">

<INPUT TYPE="BUTTON" Name="ssbutton" VALUE="Start/Stop" onClick="startstop()">
<INPUT TYPE="BUTTON" NAME="reset" VALUE="Reset" onClick="swreset()">

</FORM>

</BODY>
</HTML>
