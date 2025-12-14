<?
//session_start();
//echo"t1=$SESSION[membername]<br>";
//echo"t2=$SESSION[pwd_s]";

//if($SESSION[membername] == $namecode){
///		if(($SESSION[membername]) && ($SESSION[pwd_s])){
//			header("Location: editpost.php?codeedit=$code");
//			exit;
//		}
//}
include ("md5.js");
$rn=rand();
?>
<html>
<head>
<title>Login เพื่อแก้ไขประกาศ</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="20%">&nbsp;</td>
    <td height="51" width="53%"><img src="images/logo_big.gif" width="467" height="54"></td>
    <td height="51" width="15%" align="center" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href="../index.html">หน้าแรก</a></b></font></td>
    <td height="51" width="12%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ </a></b></font></td>
  </tr>
</table>
<hr color=1E90FF>

<!--------------------------------------------------------------------------------------------------------------------
<table width="50%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  	 <FORM name=login_form   onsubmit="return hash(this,'test.php')"      action="test.php" 
            method=post autocomplete="off">
</table>  -->
<form name="weblogin"  method="post"  action="editpost.php" onsubmit="return check()"  autocomplete="off">
<table width="35%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolor="#FF0099">
  <tr> 
    <td height="30" bgcolor="#FFCCCC"> 
      <div align="center"><b><font face="MS Sans Serif" size="3">Login เจ้าของประกาศ</font></b></div>
    </td>
  </tr>
  <tr valign="top" bgcolor="#CCFFFF"> 
    <td height="45"> 
      <table width="100%" border="0" cellspacing="3" cellpadding="2">
        <tr>
          <td width="31%"> 
            <div align="right"><font face="MS Sans Serif" size="1">Username</font></div>
          </td>
          <td width="69%"> 
            <input type="text" name="name" size="15" maxlength="20">
          </td>
        </tr>
        <tr>
          <td width="31%"> 
            <div align="right"><font face="MS Sans Serif" size="1">Password</font></div>
          </td>
          <td width="69%"> 
            <input type="password" name="pwd" size="15" maxlength="20">
          </td>
        </tr>
      </table>
      
    </td>
  </tr>
  <tr valign="bottom"> 
      <td height="35" bgcolor="#FFCCCC" valign="middle"> 
        <div align="center"> 
          <input type="submit" name="Submit" value="Login">
	<!--	<input type="hidden" name="namecode1" value="<?echo $namecode ?>">-->
		<INPUT type=hidden value=<?echo "$rn" ?>  name=challenge>
		
		<input type="hidden" name="codeedit" value="<?echo $code ?>">
        <input type="reset" name="Submit2" value="ยกเลิก">
      </div>
    </td>
  </tr>
</table>

</form>
  <hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF" size=2>Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>
<script language="JavaScript">
<!--
function check()
{
	  var v1 = document.weblogin.name.value;
      var v2 = document.weblogin.pwd.value;
   
	  
        if ( v1.length==0)
           {
           alert("กรุณาป้อน Username");
           document.weblogin.name.focus();           
           return false;
           }
        else if (v2.length==0)
           {
           alert("กรุณาป้อน Password");
           document.weblogin.pwd.focus();           
		   return false;
           }
        else
           return hash(weblogin,'editpost.php');
}
//-->
</script>

</body>
</html>
