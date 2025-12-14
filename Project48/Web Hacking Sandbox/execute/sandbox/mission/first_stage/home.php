<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>:: Welcome to mission :: Stage1</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:#00ff00;
        }
.style1 {font-size: 18px}
.style2 {font-size: 18}
-->
</style>
<script language="JavaScript">
function echeck(str) {

		var at="'"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at) ==0){
		   alert("ไม่อณุญาตให้ใช้เครื่องหมายพิเศษ (')")
		   return false
		}
	
 return true					
	}

function ValidateForm(){
	var Pass=document.form.Pwd
	var username=document.form.user
	if ((Pass.value==null)||(Pass.value=="")){
		alert("กรุณากรอก Password")
		Pass.focus()
		return false
	}
	if (echeck(Pass.value)==false){
		Pass.value=""
		Pass.focus()
		return false
	}
		
		
		if ((username.value==null)||(username.value=="")){
		alert("กรุณากรอก Username")
		username.focus()
		return false
	}
	else if ((username.value!="")&&(Pass.value!=""))
{
return true;
}
	return true
 }
	
</script>
</head>
<body bgcolor="#000000" class="style0">
<table width="95%" height="95%" border="0" align="center">
  <tr> 
    <td height="22">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="22">&nbsp;</td>
    <td height="22"><form action="sqlcheck.php" method="post" name="form"  onSubmit="return ValidateForm()">
        <div align="center"><span class="style0"><font color="#00FF00">UserName</font></span><br>
          <input name="user" type="text" value="sandbox" size="20" maxlength="20">
          <br>
          <br>
          <span class="style0"><font color="#00FF00">Password</font></span><br>
          <input name="Pwd" type="password" size="20" maxlength="20">
          <br>
          <br>
          <input type="submit" name="Submit" value="Submit">
        </div>
      </form></td>
    <td height="22">&nbsp;</td>
  </tr>
  <tr> 
    <td height="22">&nbsp;</td>
    <td height="22" class="style0"><div align="center"> :: Web Hacking Sandbox 
         ::</div></td>
    <td height="22">&nbsp;</td>
  </tr>
  <tr> 
    <td height="140" colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" class="style0 style1"><p class="style2"><font color="#00FF00">*ใช้ความรู้ทั้งหมดที่มีในการปฏิบัติภาระกิจ </font></p>
    <p><span class="style2"><font color="#00FF00">เป้าหมายของภาระกิจ เพื่อปลอมตนเป็น ผู้ดูแลระบบของเว็บนี้ให้ได้ <a href="missiondetail.php" target="_blank">รายละเอียดภาระกิจ</a> </font><font color="#00FF00"></font></span></p></td>
  </tr>
</table>
</body>
</html>
