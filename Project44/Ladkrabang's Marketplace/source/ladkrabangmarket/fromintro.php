<?
session_start();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> ให้คำแนะนำติชม </TITLE>
<link rel="stylesheet" type="text/css" href="style.css">	
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<!-- // ฟอร์มรับข้อมูลของคำตอบ -->
<form method=post action="introduce.php?username=<?echo $name ?> " name="webForm" onsubmit="return check()"> 
  <table  width="45%" border=1 bordercolor=#FF8C00 bgcolor=#FFDEAD cellpadding=2 cellspacing=0 align="center">
    <tr bgcolor=000000>
      <td align=center> <font size=3 color=FFCC33 bgcolor=000000>เชิญให้คำแนะนำติชมครับ</font></td>
    </tr>
<tr><td><table border=0>
<tr>
            <td align=right valign=top width="45">ข้อความ</td>
            <td width="273"> 
              <textarea name="detail" cols=40 rows= 5></textarea>
            </td>
</tr>
<tr>
            <td align=right width="45">โดย</td>
            <td width="273">
<input size=30 type=text name="sender" maxlength=50></td>
</tr>
<tr>
            <td align=right width="45">Email</td>
            <td width="273">
<input size=30 type=text name="email" maxlength=50></td>
</tr>
</table>

</td></tr>
<tr>


  <td align=center>
  <a href="javascript:setsmile(':smile:')"><img src="pics/smile.gif" border=0></a>
	<a href="javascript:setsmile(':sad:')"><img src="pics/frown.gif" border=0></a>
	<a href="javascript:setsmile(':red:')"><img src="pics/redface.gif" border=0></a>
	<a href="javascript:setsmile(':big:')"><img src="pics/biggrin.gif" border=0></a>
	<a href="javascript:setsmile(':ent:')"><img src="pics/blue.gif" border=0></a>
	<a href="javascript:setsmile(':shy:')"><img src="pics/shy.gif" border=0></a>
	<a href="javascript:setsmile(':sleepy:')"><img src="pics/sleepy.gif" border=0></a>
	<a href="javascript:setsmile(':sun:')"><img src="pics/sunglasses.gif" border=0></a>
	<a href="javascript:setsmile(':sg:')"><img src="pics/supergrin.gif" border=0></a>
	<a href="javascript:setsmile(':embarass:')"><img src="pics/embarass.gif" 	border=0></a>
	<a href="javascript:setsmile(':dead:')"><img src="pics/dead.gif" border=0></a>
	<a href="javascript:setsmile(':cool:')"><img src="pics/cool.gif" border=0></a>
	<a href="javascript:setsmile(':clown:')"><img src="pics/clown.gif" border=0></a>
	<a href="javascript:setsmile(':pukey:')"><img src="pics/pukey.gif" border=0></a><br>
	<a href="javascript:setsmile(':eek:')"><img src="pics/eek.gif" border=0></a>
	<a href="javascript:setsmile(':roll:')"><img src="pics/sarcblink.gif" border=0></a>
	<a href="javascript:setsmile(':smoke:')"><img src="pics/smokin.gif" border=0></a>
	<a href="javascript:setsmile(':angry:')"><img src="pics/reallymad.gif" border=0></a>
	<a href="javascript:setsmile(':confused:')"><img src="pics/confused.gif" 	border=0></a>
	<a href="javascript:setsmile(':cry:')"><img src="pics/crying.gif" border=0></a>
	<a href="javascript:setsmile(':lol:')"><img src="pics/lol.gif" border=0></a>
	<a href="javascript:setsmile(':yawn:')"><img src="pics/yawn.gif" border=0></a>
	<a href="javascript:setsmile(':devil:')"><img src="pics/devil.gif" border=0></a>
	<a href="javascript:setsmile(':tongue:')"><img src="pics/tongue.gif" border=0></a>
	<a href="javascript:setsmile(':alien:')"><img src="pics/aysmile.gif" border=0></a>
	<a href="javascript:setsmile(':tasty:')"><img src="pics/tasty.gif" border=0></a>
	<a href="javascript:setsmile(':crazy:')"><img src="pics/grazy.gif" border=0></a><br>
	<font color=blue>คลิกที่รูป เพื่อแทรกรูปลงในข้อความ</font>
  </td>
</tr>
</table>
  <div align="center"><br>
    <input type=submit value="Post message" name="submit">
    <input type=reset value="Clear" name="reset">
  </div>
</form>

<?
$membername=$name;
include("showintro.php");
?>
<script language="JavaScript">
<!--
function check()
{
      var v1 = document.webForm.detail.value;
      var v2 = document.webForm.sender.value;
        if ( v1.length==0)
           {
           alert("กรุณาป้อนรายละเอียด");
           document.webForm.detail.focus();           
           return false;
           }
        else if (v2.length==0)
           {
           alert("กรุณาป้อนชื่อ");
           document.webForm.sender.focus();           
		   return false;
           }
        else
           return true;
}

function setsmile(what)
{
	document.webForm.detail.value = document.webForm.elements.detail.value+" "+what;
	document.webForm.detail.focus();
}
//-->
</script>

</BODY>
</HTML>
