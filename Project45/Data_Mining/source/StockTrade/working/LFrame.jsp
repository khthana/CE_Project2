<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style>
<!--
a{text-decoration:none}
//-->
</style>
<SCRIPT language=JavaScript>
var rate = 20; // Increase amount(The degree of the transmutation)
var obj; // The object which event occured in
var act = 0; // Flag during the action
var elmH = 0; // Hue
var elmS = 128; // Saturation
var elmV = 255; // Value
var clrOrg; // A color before the change
var TimerID; // Timer ID
if (navigator.appName.indexOf("Microsoft",0) != -1 && parseInt(navigator.appVersion) >= 4) {
Browser = true;
} else {
Browser = false;
}
if (Browser) {
document.onmouseover = doRainbowAnchor;
document.onmouseout = stopRainbowAnchor;
}
function doRainbow()
{
if (Browser && act != 1) {
act = 1;
obj = event.srcElement;
clrOrg = obj.style.color;
TimerID = setInterval("ChangeColor()",100);
}
}
function stopRainbow()
{
if (Browser && act != 0) {
obj.style.color = clrOrg;
clearInterval(TimerID);
act = 0;
}
}
function doRainbowAnchor()
{
if (Browser && act != 1) {
obj = event.srcElement;
while (obj.tagName != 'A' && obj.tagName != 'BODY') {
obj = obj.parentElement;
if (obj.tagName == 'A' || obj.tagName == 'BODY')
break;
}
if (obj.tagName == 'A' && obj.href != '') {
act = 1;
clrOrg = obj.style.color;
TimerID = setInterval("ChangeColor()",100);
}
}
}
function stopRainbowAnchor()
{
if (Browser && act != 0) {
if (obj.tagName == 'A') {
obj.style.color = clrOrg;
clearInterval(TimerID);
act = 0;
}
}
}
function ChangeColor()
{
obj.style.color = makeColor();
}
function makeColor()
{
if (elmS == 0) {
elmR = elmV; elmG = elmV; elmB = elmV;
}
else {
t1 = elmV;
t2 = (255 - elmS) * elmV / 255;
t3 = elmH % 60;
t3 = (t1 - t2) * t3 / 60;
if (elmH < 60) {
elmR = t1; elmB = t2; elmG = t2 + t3;
}
else if (elmH < 120) {
elmG = t1; elmB = t2; elmR = t1 - t3;
}
else if (elmH < 180) {
elmG = t1; elmR = t2; elmB = t2 + t3;
}
else if (elmH < 240) {
elmB = t1; elmR = t2; elmG = t1 - t3;
}
else if (elmH < 300) {
elmB = t1; elmG = t2; elmR = t2 + t3;
}
else if (elmH < 360) {
elmR = t1; elmG = t2; elmB = t1 - t3;
}
else {
elmR = 0; elmG = 0; elmB = 0;
}
}
elmR = Math.floor(elmR);
elmG = Math.floor(elmG);
elmB = Math.floor(elmB);
clrRGB = '#' + elmR.toString(16) + elmG.toString(16) + elmB.toString(16);
elmH = elmH + rate;
if (elmH >= 360)
elmH = 0;
return clrRGB;
}
</SCRIPT>  

</head>

<body>
<table width="158" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center" bordercolor="#4279DE" >
  <form name="loginForm" method="post" action="http://161.246.6.39:8080/class/CheckLogin.jsp" target="mainFrame" onSubmit="return validateField();">
    <input type="hidden" name="txtSecureKey" value="NONE">
    <tr> 
      <td colspan="4" height="42"><img src="PIC/login.gif" alt="Enter" width="162" height="35"></td>
    </tr>
    <tr> 
      <td width="73"><img src="PIC/username.gif" width="64" height="13"></td>
      <td colspan="3"> <input type="text" name="txtLogin" size="11" class=""> 
      </td>
    </tr>
    <tr> 
      <td width="73"><img src="PIC/password.gif" width="60" height="13"></td>
      <td colspan="3"> <input type="password" name="txtPassword" size="11" class=""> 
      </td>
    </tr>
    <tr> 
      <td width="73">&nbsp;</td>
      <td width="41">&nbsp;</td>
      <td width="26">&nbsp;</td>
      <td width="22"><input name="imageGO" type="image" src="PIC/go2.gif" alt="Login" width="21" height="17" border="0"></td>
    </tr>
  </form>
</table>
<table width="160" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr > 
    <td width="23"><img src="PIC/bullet_green.gif" width="14" height="10"></td>
    <td width="96"><font size="2" color="#737373"><a href="Registration.jsp" target="mainFrame">สมัครสมาชิก</a></font></td>
    <td width="38"></td>
  </tr>
</table>
</body>
</html>
