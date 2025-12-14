<html>
<head>
<title>ตรวจสอบ username</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<script language="JavaScript">
	function CheckBlank() {
		if(document.chk.user.value==''){
			alert('กรุณากรอก username ก่อน');
			document.chk.user.focus();
			return false;
		 }
	}
</script>
<body>
<table width="780" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="392"><form name="chk" method="post" action="ChkUser.php">
        <table width="179" height="80" border="0" align="center" cellpadding="1" cellspacing="1" bordercolor="#000000" bgcolor="#000000">
          <tr> 
            <td width="175" bgcolor="#66BBFF" class="header"><div align="center"><strong>กรอก 
                username</strong></div></td>
          </tr>
          <td bgcolor="#FFFFFF" class="header"><div align="center"> 
              <table width="100%" border="0">
                <!-- bordercolor="#FFFFFF" bgcolor="#FFFFFF">-->
                <tr> 
                  <td class="text" > <div align="center"> 
                      <input name="user" type="text" id="user" size="15">
                    </div></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFFFFF" bordercolor="#FFFFFF"><div align="center"> 
                      <input name="check" type="image" id="check" src="Picture/check.gif" align="middle" width="50" height="16" border="0" onClick="return CheckBlank()">
                        &nbsp; 
                        <input name="imageField2" type="image" src="Picture/cancle.gif" align="middle" width="45" height="16" border="0" onClick="return reset()";

 ">
                      </div></td>
                </tr>
                <tr> 
                  <td bgcolor="#FFFFFF" bordercolor="#FFFFFF"> <div align="center"></div></td>
                </tr>
              </table>
            </div></td>
          </tr>
        </table>
      </form></td>
    <td width="388">&nbsp;</td>
  </tr>
</table>

</body>
</html>
