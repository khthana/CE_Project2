<html>
<head>
<title>PHP - Ultimate Webboard 2.00</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>

<style type="text/css">
<!-- 
BODY {font-family:;font-size="10"}
A:link {text-decoration: none; color: blue }
A:visited {text-decoration: none; color: blue }
A:hover {text-decoration: none; color: darkorange }
A:active {text-decoration: none; color: blue }
p, div, td, ul li, ol li { font-family:  MS Sans Serif, Microsoft Sans Serif;  font-size: 10pt }
-->
</style>

<body  bgcolor=#FFFFE0>
	<table border=0 width=100%>
	<tr><td align=left valign=center>
	<font size=2 face="Arial,MS Sans Serif">
    <font size=5 color=blue><b>PHP - Ultimate Webboard <font color=red>2.00</font></b></font>
	</td>
	<td align=right><img src="../webboard/img/arrow.gif"> 
	<a href="../webboard/webboard.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">แสดงคำถาม</a> |
	<a href="../webboard/addmember.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">สมัครสมาชิกใหม่</a>
	</td></tr>
	</table>
	<br>

	<center>
	<font size=3 color=#9400D3><b>เชิญตั้งคำถามของคุณได้ที่นี่ครับ</b></font>
	<br>

	<form method=post action="post.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>" name="webForm" onsubmit="return check()" ENCTYPE="multipart/form-data">
	<table border=1 bordercolor=#1E90FF bgcolor=E0FFFF cellpadding=2 cellspacing=0>
	<tr>
	  <td align=center>คำถาม</td>
	  <td><input type=text name="QTitle" size=50 maxlength=100></td></tr>
	<tr>
	  <td align=center valign=top>รายละเอียด</td>
	  <td><textarea rows="7" cols="50" name="QNote"></textarea></td></tr>
	<tr>
	  <td align=center>โดย</td>
	  <td><input type=text name="QName" size=50 maxlength=50></td></tr>
	<tr><td align=center colspan=2>
	<a href="javascript:setsmile(':smile:')"><img src="pic/smile.gif" border=0></a>
	<a href="javascript:setsmile(':sad:')"><img src="pic/frown.gif" border=0></a>
	<a href="javascript:setsmile(':red:')"><img src="pic/redface.gif" border=0></a>
	<a href="javascript:setsmile(':big:')"><img src="pic/biggrin.gif" border=0></a>
	<a href="javascript:setsmile(':ent:')"><img src="pic/blue.gif" border=0></a>
	<a href="javascript:setsmile(':shy:')"><img src="pic/shy.gif" border=0></a>
	<a href="javascript:setsmile(':sleepy:')"><img src="pic/sleepy.gif" border=0></a>
	<a href="javascript:setsmile(':sun:')"><img src="pic/sunglasses.gif" border=0></a>
	<a href="javascript:setsmile(':sg:')"><img src="pic/supergrin.gif" border=0></a>
	<a href="javascript:setsmile(':embarass:')"><img src="pic/embarass.gif" 	border=0></a>
	<a href="javascript:setsmile(':dead:')"><img src="pic/dead.gif" border=0></a>
	<a href="javascript:setsmile(':cool:')"><img src="pic/cool.gif" border=0></a>
	<a href="javascript:setsmile(':clown:')"><img src="pic/clown.gif" border=0></a>
	<a href="javascript:setsmile(':pukey:')"><img src="pic/pukey.gif" border=0></a><br>
	<a href="javascript:setsmile(':eek:')"><img src="pic/eek.gif" border=0></a>
	<a href="javascript:setsmile(':roll:')"><img src="pic/sarcblink.gif" border=0></a>
	<a href="javascript:setsmile(':smoke:')"><img src="pic/smokin.gif" border=0></a>
	<a href="javascript:setsmile(':angry:')"><img src="pic/reallymad.gif" border=0></a>
	<a href="javascript:setsmile(':confused:')"><img src="pic/confused.gif" 	border=0></a>
	<a href="javascript:setsmile(':cry:')"><img src="pic/crying.gif" border=0></a>
	<a href="javascript:setsmile(':lol:')"><img src="pic/lol.gif" border=0></a>
	<a href="javascript:setsmile(':yawn:')"><img src="pic/yawn.gif" border=0></a>
	<a href="javascript:setsmile(':devil:')"><img src="pic/devil.gif" border=0></a>
	<a href="javascript:setsmile(':tongue:')"><img src="pic/tongue.gif" border=0></a>
	<a href="javascript:setsmile(':alien:')"><img src="pic/aysmile.gif" border=0></a>
	<a href="javascript:setsmile(':tasty:')"><img src="pic/tasty.gif" border=0></a>
	<a href="javascript:setsmile(':crazy:')"><img src="pic/grazy.gif" border=0></a><br>
	<FONT color=blue>คลิกที่รูป เพื่อแทรกรูปลงในข้อความ</FONT> </td>
	</tr>
	<tr><td align=center colspan=2>
		<table border=0>
		<tr><td align=center>		<br>		<font>		  เลือกรูป
		    <input type="file" name="QPic">
		</td>
		  </tr>
		</table>
	</td></tr>
	</table>
	<br>
	<input type=submit value="ส่งคำถาม">

    <input type=reset value="ยกเลิก">
	</form>

	<font size=2 face="MS Sans Serif">
	[ <a href="../webboard/webboard.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">แสดงคำถาม</a> | 
	<a href="../webboard/addmember.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">สมัครสมาชิก</a> ]
	<font>

	<hr color=1E90FF width=600>
<font size=1 face="MS Sans Serif">
	<b>Copy<font color=FF1493>LEFT</font> and Powered By : <a href=mailto:sansak@engineer.com>Sansak</a></b>
</font>

</center>


<script language="JavaScript">
<!--
function check()
{
      var v1 = document.webForm.QTitle.value;
      var v2 = document.webForm.QNote.value;
      var v3 = document.webForm.QName.value;
        if ( v1.length==0)
           {
           alert("กรณาป้อนคำถาม");
           document.webForm.QTitle.focus();           
           return false;
           }
        else if (v2.length==0)
           {
           alert("กรุณาป้อนรายละเอียด");
           document.webForm.QNote.focus();           
		   return false;
           }
        else if (v3.length==0)
           {
           alert("กรุณาป้อนชื่อผู้ถาม");
           document.webForm.QName.focus();           
		   return false;
           }
        else
           return true;
}

function setsmile(what)
{
	document.webForm.QNote.value = document.webForm.elements.QNote.value+" "+what;
	document.webForm.QNote.focus();
}

//-->
</script>
</body>
</html>
